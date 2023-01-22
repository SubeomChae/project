package egovframework.cbiz.service.impl;

import java.sql.ResultSet;
import java.sql.Types;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.StringUtil;

 
public class RsUtilOracle {
    /**
     * <pre>
     * ResultSet를 RsWrapper에 담아 반환한다.
     * 데이터 타입에 관계없이 String으로 만들어 RsBox에 저장한다.
     * dao 에서 다음과 같이 코딩한다.
     *
     * DAO Usage :
     * rs = stmt.executeQuery(sql);
     * getRsWrapper rsWp = RsUtil.getRsWrapper(rs);
     * </pre>
     *
     * @param rs
     * @return RsWrapper
     * @throws Exception
     */
    public static RsWrapper getRsWrapper(ResultSet rs) throws Exception {
        
        RsWrapper rsWp = new RsWrapper();
        if (rs != null && rs.next()) {
            java.sql.ResultSetMetaData rsMeta = rs.getMetaData();
            int colCnt = rsMeta.getColumnCount();
            do {
                Box box = new Box(""); 
                for(int i=1; i <= colCnt; i++) {
                    if (rs.getObject(i) != null) {
                        box.put(rsMeta.getColumnName(i).toLowerCase()
                                        , getColumnData(rs,i,rsMeta.getColumnType(i), rsMeta.getColumnName(i).toLowerCase()));
                        box.putColIndex(rsMeta.getColumnName(i).toLowerCase(), i-1);
                    } else {
                        box.put(rsMeta.getColumnName(i).toLowerCase(), "");
                        box.putColIndex(rsMeta.getColumnName(i).toLowerCase(), i-1);
                    }
                }
                rsWp.appendRs(box);
            } while(rs.next());
            rsWp.setRowCount(rs.getRow());
        }
        return rsWp;
    }
    public static String getColumnData(ResultSet rs, int colnum, int columnType) throws Exception {
        return getColumnData(rs, colnum, columnType, "");
    }

    private static String getColumnData(ResultSet rs, int colnum, int columnType, String col_nm) throws Exception {
        String rtnStr = "";
        switch (columnType) {
            case Types.CLOB:
                java.io.Reader rd = rs.getCharacterStream(colnum);
                StringBuffer sbf = new StringBuffer();
                boolean flag = false;
                char ac[] = new char[8192];
                if(rd != null) {
                    int i;
                    while((i = rd.read(ac)) != -1)
                        sbf.append(ac, 0, i);
                    rd.close();
                }
                rtnStr = sbf.toString();
            
                break;
            case java.sql.Types.BINARY:
            case java.sql.Types.VARBINARY:
            case java.sql.Types.LONGVARBINARY:
                 rtnStr = new String(rs.getBytes(colnum));
                 break;
            case java.sql.Types.DECIMAL:
                java.math.BigDecimal numeric = rs.getBigDecimal(colnum);
                rtnStr = numeric.toString();
                break;
            case java.sql.Types.DATE:
                rtnStr = StringUtil.getNumber(rs.getDate(colnum).toString() + rs.getTime(colnum).toString());
                break;
            case java.sql.Types.TIME:
                rtnStr = StringUtil.getNumber(rs.getTime(colnum).toString());
                break;
            case java.sql.Types.TIMESTAMP:
                rtnStr = StringUtil.getNumber(rs.getObject(colnum).toString());
                break;
            default:
                rtnStr = StringUtil.getSpecialCharacters(StringUtil.rtrim(rs.getObject(colnum).toString()));
                break;
        }    
        return rtnStr;
    }

    public static Box getRsBox(ResultSet rs) throws Exception {
        Box box = new Box("");
        if (rs.next()) {
            java.sql.ResultSetMetaData rsMeta = rs.getMetaData();
            int colCnt = rsMeta.getColumnCount();

            for(int i=1; i <= colCnt; i++) {
                if (rs.getObject(i) != null) {
                    box.put(rsMeta.getColumnName(i).toLowerCase()
                        , getColumnData(rs,i,rsMeta.getColumnType(i), rsMeta.getColumnName(i).toLowerCase()));
                    box.putColIndex(rsMeta.getColumnName(i).toLowerCase(), i);
                }
            }
        }

        return box;
    }

    public static Integer strToInteger(String val) {
        return StringUtil.replace(val.trim(),",","").equals("") ? null : new Integer(val.trim());
    }

    public static java.math.BigDecimal strToDecimal(String val) {
        return StringUtil.replace(val.trim(),",","").equals("") ? null : new java.math.BigDecimal(val.trim());
    }

    public static String intToString(Object obj) {
        return obj == null ? "" :  obj.toString();
    }

    public static String decimalToString(Object obj) {
        return obj == null ? "" : obj.toString();
    }
}
