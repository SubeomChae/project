package egovframework.cbiz.service.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import oracle.jdbc.OracleTypes;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.ExcelUtil;

@Repository("commDBDAO")
public class CommDBDAO extends EgovAbstractMapper {
    
    private static String defaultSchemaName = "";
    
    @Autowired
    private DataSource dataSource;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Connection getConnection() {
        return DataSourceUtils.getConnection(dataSource);
    }
    
    public static Hashtable htParamCache = new Hashtable();
    
	public RsWrapper execList(Box box) throws Exception {
		return execList(box.get("queryName"), box);
	}
	
	/**
	 * @param queryKey
	 * @param box
	 * @return
	 * @throws Exception
	 */
	public RsWrapper execList(String queryKey, Box box) throws Exception {
		box.put("queryName", queryKey);
		if(box.get("pageCount").isEmpty()) { box.put("pageCount", "1"); } 

        StringBuffer sb = new StringBuffer();
		RsWrapper rsWp = null;
		Connection conn = null;
        CallableStatement cstmt = null;
        ResultSet rs = null; 
        try {
            conn = getConnection();
            // 1. 파라미터 정보 조회
            RsWrapper pRsWp = getProcedureParamInfo(queryKey);
            sb.append(getProcedureCallStr(queryKey, pRsWp.getLength()));
            cstmt = conn.prepareCall(getProcedureCallStr(queryKey, pRsWp.getLength()), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            int cursorPostion = 0;
            int cursorCnt = 0;
            // 2. 프로시저에 INPUT 파라미터 정보 셋팅
            for(int i=0; i < pRsWp.getLength(); i++) {
                Box rb = pRsWp.getRsBoxAt(i);
                if(rb.get("in_out").equals("IN")) {
                    String data = box.get(rb.get("argument_name").substring(2));
                    if(!data.equals("")) {
                        sb.append("\n PARAM NAME : [" + rb.get("argument_name").toLowerCase().substring(2) + "]" ).append("   VAL : [" + data  +"]");
                    }
                    setProcedureParam(conn, cstmt, rb, data);
                }else if(rb.get("in_out").equals("OUT") && rb.get("data_type").equals("REF CURSOR")) {
                    if(cursorCnt == 0) { cursorPostion = Integer.parseInt(rb.get("position")); }
                    cursorCnt++;
                }
            }
            // 4. 프로시저에 OUTPUT 파라미터 셋팅
            if(cursorCnt > 0) { cstmt.registerOutParameter(cursorPostion,OracleTypes.CURSOR); }
            cstmt.execute();             

            // 5. 프로시저에서 데이터를 가져온다.
            if(cursorCnt > 0) {
                rs = (ResultSet)cstmt.getObject(cursorPostion);
                rsWp = RsUtilOracle.getRsWrapper(rs);     
                if(rsWp.getLength() > 0 && rsWp.getRsBoxAt(0).get("cnt").isEmpty() == false) {
                    rsWp.setRowCount(rsWp.getRsBoxAt(0).getInt("cnt"));
                }
            }
            
            return rsWp;
        }catch(Exception ex) {
            htParamCache.clear();
            ex.printStackTrace();
            throw ex;
        }finally {
            close(conn, null, cstmt, rs);
            CD.logger.debug(sb.toString());
        }
	}
	
	public Box execBox(String queryKey, Box box) throws Exception {
		RsWrapper rsWp = execList(queryKey, box);
		return (rsWp.getLength() > 0 ? rsWp.getRsBoxAt(0) : new Box(""));
	}

	public void exec(String queryKey, Box box) throws Exception {
	    execList(queryKey, box);
	}

    public RsWrapper execSQL(String sql_stmt) throws Exception {
    	Connection          conn = null;
    	PreparedStatement  	pstmt = null;
    	ResultSet           rs  = null;
    	RsWrapper           rsWp = null;
    	try {
	    	conn = getConnection();
	    	pstmt = conn.prepareStatement(sql_stmt);
	    	rs = pstmt.executeQuery();
	    	rsWp = RsUtilOracle.getRsWrapper(rs);
	    	return rsWp;
    	} catch(Exception ex) {
    		ex.printStackTrace();
    		throw ex;
    	} finally {
    		close(conn, pstmt, null, rs);
            CD.logger.debug(sql_stmt);
    	}
    }

	public Box execXls(String queryKey, Box box) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
        CallableStatement cstmt = null;
        ResultSet rs = null; 
        StringBuffer sb = new StringBuffer();
        try {
            conn = getConnection();

            // 엑셀메타정보 가져오기
            pstmt = conn.prepareStatement(" select * from SYSTB_META01 where form_no = ? order by cell_no ", java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE, java.sql.ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, box.get("excel_form_no"));
            rs = pstmt.executeQuery();
    		RsWrapper excelWp = RsUtilOracle.getRsWrapper(rs);

            // 1. 파라미터 정보 조회
            RsWrapper pRsWp = getProcedureParamInfo(queryKey);
            sb.append(getProcedureCallStr(queryKey, pRsWp.getLength()));
            cstmt = conn.prepareCall(getProcedureCallStr(queryKey, pRsWp.getLength()), ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            int cursorPostion = 0;
            int cursorCnt = 0;

            // 2. INPUT 파라미터 정보 셋팅
            for(int i=0; i < pRsWp.getLength(); i++) {
                Box rb = pRsWp.getRsBoxAt(i);
                if(rb.get("in_out").equals("IN")) {
                    String data = box.get(rb.get("argument_name").substring(2));
                    if(!data.equals("")) {
                        sb.append("\n PARAM NAME : [" + rb.get("argument_name").toLowerCase().substring(2) + "]" ).append("   VAL : [" + data  +"]");
                    }
                    setProcedureParam(conn, cstmt, rb, data);
                }else if(rb.get("in_out").equals("OUT") && rb.get("data_type").equals("REF CURSOR")) {
                    if(cursorCnt == 0) { cursorPostion = Integer.parseInt(rb.get("position")); }
                    cursorCnt++;
                }
            }
            // 4. OUTPUT 파라미터 셋팅
            if(cursorCnt > 0) { cstmt.registerOutParameter(cursorPostion,OracleTypes.CURSOR); }
            cstmt.execute();

            // 5. 데이터 추출
            rs = (ResultSet)cstmt.getObject(cursorPostion);

            // 6. 엑셀파일 생성
    		Box obox = ExcelUtil.createExcelBigSize(rs, excelWp, box.get("excel_form_no"), box.get("excel_file_nm"));
    		return obox;
        }catch(Exception ex) {
            htParamCache.clear();
            ex.printStackTrace();
            throw ex;
        }finally {
            close(conn, null, cstmt, rs);
            CD.logger.debug(sb.toString());
        }
	}
	
	public Box execSQLXls(RsWrapper excelWp, Box box) throws Exception {
    	Connection          conn = null;
    	PreparedStatement  	pstmt = null;
    	ResultSet           rs  = null;
        try {
	    	conn = getConnection();

	    	// 1. 데이터 추출
	    	pstmt = conn.prepareStatement(box.get("sql_stmt"));
	    	rs = pstmt.executeQuery();

            // 2. 엑셀파일 생성
			Box obox = ExcelUtil.createExcelBigSize(rs, excelWp, box.get("excel_form_no"), box.get("excel_file_nm"));
			return obox;
        }catch(Exception ex) {
            htParamCache.clear();
            ex.printStackTrace();
            throw ex;
        }finally {
    		close(conn, pstmt, null, rs);
            CD.logger.debug(box.get("sql_stmt"));
        }
	}
	
	private synchronized RsWrapper getProcedureParamInfo(String procedureName) throws Exception {
        if(htParamCache.get(procedureName) != null ) {
            return (RsWrapper) htParamCache.get(procedureName);
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs  = null;
        RsWrapper rsWp = null;
        try {
            conn = getConnection();
            String schemaName = propertiesService.getString("defaultDbUser").toUpperCase();
            String procName = procedureName;
            if(procedureName.indexOf(".") > 0) {
                schemaName = procedureName.split("\\.")[0].toUpperCase();
                procName = procedureName.split("\\.")[1];
            }
            pstmt = conn.prepareStatement(" select /*+ rule */ * "
                    + " from   all_arguments "
                    + " where  owner = '" +schemaName+ "' "
                    + "   and object_name = ? order by position ", java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE, java.sql.ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, procName);
            rs = pstmt.executeQuery();
            rsWp = RsUtilOracle.getRsWrapper(rs);
            htParamCache.put(procedureName, rsWp);
            return rsWp;
        }catch(Exception ex) {
            ex.printStackTrace();
            throw ex;
        }finally {
            close(conn, pstmt, null, rs);
        }
    }
	
	protected void setProcedureParam(Connection conn, CallableStatement cstmt, Box rb, String val) throws Exception {
        int parameterIndex = Integer.parseInt(rb.get("position"));
        if(rb.get("data_type").equals("VARCHAR2") || rb.get("data_type").equals("CHAR")) {
        	cstmt.setString(parameterIndex, val);         
        }else if (rb.get("data_type").equals("DATE")) {
        	if(val.equals("")) {             
        		cstmt.setNull(parameterIndex, java.sql.Types.DATE);
        	}else {
        		Date sqlDt = DateUtil.toSQLDate(DateUtil.strToDate(val));
        		cstmt.setDate(parameterIndex, sqlDt);
        	}         
        }else if(rb.get("data_type").equals("NUMBER")) {
        	if(val.equals("")) {
        		cstmt.setNull(parameterIndex, java.sql.Types.INTEGER);
        	}else {
        		cstmt.setDouble(parameterIndex, Double.parseDouble(val));
        	}         
        }else if(rb.get("data_type").equals("CLOB")) {
            cstmt.setString(parameterIndex, val);         
        }else if(rb.get("data_type").equals("REF CURSOR")) {
        }
    }

	public String getProcedureCallStr(String procedureName, int paramCnt) {
        StringBuffer sb = new StringBuffer();
        sb.append("{call ").append(procedureName).append(" (");
        for(int i=0; i < paramCnt; i++) {
            if(i > 0) {sb.append(","); }
            sb.append("? ");
        }
        sb.append(")}");
        return sb.toString();
    }
	
	protected void close(Connection conn, PreparedStatement pstmt, CallableStatement cstmt, ResultSet rs) throws Exception {
        try { if(rs    != null) {rs.close();}} catch(Exception e) {}
        try { if(pstmt != null) {pstmt.close();}} catch(Exception e) {}
        try { if(cstmt != null) {cstmt.close();}} catch(Exception e) {}
        if(conn.getAutoCommit()) {
            try { if(conn  != null) {conn.close();}} catch(Exception e) {}
        }
    }

}
