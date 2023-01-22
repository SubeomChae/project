package egovframework.ubiz.util;

import egovframework.cbiz.RsWrapper;

public class anyMetaData {
	private RsWrapper MetaRsWp = null;
	private RsWrapper HeaderRsWp = null;
	private RsWrapper ColRsWp = null;
	private RsWrapper DataRsWp = null;
	
	int cntPerPage 	 = 0;
	String[] splInfo = null;
	String listNm 	 = "";
	String SplNm 	 = "";
	String SplAction = "";
	String SqlStmt 	 = "";
	
	public void setMetaRsWp(RsWrapper rsWp) {
		this.MetaRsWp = rsWp;	
		cntPerPage = rsWp.getRsBoxAt(0).getInt("page_per_cnt");
		SqlStmt = rsWp.getRsBoxAt(0).get("sql_stmt");
		splInfo = rsWp.getRsBoxAt(0).get("spl_nm").split("@");
		listNm = rsWp.getRsBoxAt(0).get("list_nm");
		if(splInfo.length > 0) { SplNm = splInfo[0]; }
		if(splInfo.length > 1) { SplAction = splInfo[1]; }
	}
	public void setHeaderRsWp(RsWrapper rsWp) { this.HeaderRsWp = rsWp;	}
	public void setColRsWp(RsWrapper rsWp) { this.ColRsWp = rsWp;}
	public void setDataRsWp(RsWrapper rsWp) { this.DataRsWp = rsWp;	}

	public void setCntPerPage(int cntPerPage) { this.cntPerPage = cntPerPage;	}
	public void setSplInfo(String[] splInfo) { this.splInfo = splInfo;	}
	public void setListNm(String listNm) { this.listNm = listNm;	}
	public void setSqlStmt(String SqlStmt) { this.SqlStmt = SqlStmt;	}
	
	public RsWrapper getMetaRsWp() { return MetaRsWp; }
	public RsWrapper getHeaderRsWp() { return HeaderRsWp; }
	public RsWrapper getColRsWp() { return ColRsWp; }
	public RsWrapper getDataRsWp() { return DataRsWp; }

	public String getCntPerPage() { return (new Integer(cntPerPage)).toString(); }
	public String[] getSplInfo() { return splInfo; }
	public String getListNm() { return listNm; } 
	public String getSplNm() { return SplNm; } 
	public String getSplAction() { return SplAction; } 
	public String getSqlStmt() { return SqlStmt; } 
}
