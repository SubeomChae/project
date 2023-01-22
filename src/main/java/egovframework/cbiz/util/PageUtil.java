package egovframework.cbiz.util;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import egovframework.cbiz.Box;
import egovframework.cbiz.RsWrapper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
 
public class PageUtil {

    public static String makePaging(Box box, RsWrapper rsWp, HttpServletRequest request) {
        return makePaging(box, rsWp, 10, 10, "COUNT", "goPage", request);
    }
    
    public static String makePaging(Box box, RsWrapper rsWp, int unitCount, HttpServletRequest request) {
        return makePaging(box, rsWp, unitCount, 10, "COUNT", "goPage", request);
    }
    
    public static String makePaging(Box box, RsWrapper rsWp, int unitCount, int pageSize, HttpServletRequest request) {
        return makePaging(box, rsWp, unitCount, pageSize, "COUNT", "goPage", request);
    }
    
    public static String makePaging(Box box, RsWrapper rsWp, int unitCount, int pageSize, String summaryDisp, HttpServletRequest request) {
        return makePaging(box, rsWp, unitCount, pageSize, summaryDisp, "goPage", request);
    }
    
    public static String makePaging(Box box, RsWrapper rsWp, int unitCount, int pageSize, String summaryDisp, String funcNm, HttpServletRequest request) {
    	if(rsWp.getLength() == 0) { return ""; }
        String firstPageLabel = "<li class=\"prev disabled\"><a href=\"%s\" title=\"처음\"  onclick=\"return "+funcNm+"('%s');\"><i class=\"fa fa-angle-double-left\"></i></a></li> ";
        String previousPageLabel = "<li><a href=\"%s\" onclick=\"return "+funcNm+"('%s');\"><i class=\"fa fa-angle-left\"></i></a></li> ";
        String currentPageLabel = "<li class=\"active\"><a href=\"javascript:;\"> %s </a></li> ";
        String otherPageLabel = "<li><a href=\"%s\" onclick=\"return "+funcNm+"('%s');\"> %s </a></li> ";
        String nextPageLabel = "<li><a href=\"%s\" onclick=\"return "+funcNm+"('%s');\"><i class=\"fa fa-angle-right\"></i></a></li> ";
        String lastPageLabel = "<li class=\"next\"><a href=\"%s\" onclick=\"return "+funcNm+"('%s');\" title=\"마지막\"><i class=\"fa fa-angle-double-right\"></i></a></li> ";

        Enumeration<String> e = request.getParameterNames();

        StringBuilder sbParam = new StringBuilder();
        while(e.hasMoreElements()) {
            String key = e.nextElement();
            if(!key.toLowerCase().equals("page_count")) {
                sbParam.append("&amp;").append(key).append("=").append(request.getParameter(key));
            }
        }
         
        String lnkUrl = "?1=1" + sbParam.toString();
        
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(Integer.parseInt(box.getNvl("page_count", "1")));
        paginationInfo.setRecordCountPerPage(unitCount);
        paginationInfo.setPageSize(pageSize);

        box.put("firstIndex", paginationInfo.getFirstRecordIndex());
        box.put("lastIndex", paginationInfo.getLastRecordIndex());
        box.put("recordCountPerPage", paginationInfo.getRecordCountPerPage());
        
        if(rsWp.size() > 0 && !rsWp.get("CNT",0).equals("")) {
            paginationInfo.setTotalRecordCount(Integer.parseInt(rsWp.get("CNT", 0)));
        }else {
            paginationInfo.setTotalRecordCount(0);
        }    
         
        StringBuffer strBuff = new StringBuffer();
        StringBuffer pageBuff = new StringBuffer();

        int firstPageNo = paginationInfo.getFirstPageNo();
        int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
        int totalPageCount = paginationInfo.getTotalPageCount();
        int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
        int currentPageNo = paginationInfo.getCurrentPageNo();
        int lastPageNo = paginationInfo.getLastPageNo();

        lnkUrl += "&amp;page_count=";

        if(firstPageNoOnPageList > pageSize) {
            strBuff.append(String.format(firstPageLabel, lnkUrl + firstPageNo, firstPageNo + ""));
            strBuff.append(String.format(previousPageLabel, lnkUrl + (firstPageNoOnPageList - 1) + "#sres", (firstPageNoOnPageList - 1) + ""));
        }else {
            strBuff.append(String.format(firstPageLabel, lnkUrl + (firstPageNo) + "#sres", firstPageNo + ""));
            strBuff.append(String.format(previousPageLabel, lnkUrl + (firstPageNo) + "#sres", firstPageNo + ""));
        }

        for(int i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
            if(i == currentPageNo) {
                strBuff.append(String.format(currentPageLabel, Integer.toString(i), Integer.toString(i)));
            }else {
                strBuff.append(String.format(otherPageLabel, lnkUrl + (i) + "#sres", Integer.toString(i), Integer.toString(i)));
            }
        }

        if(lastPageNoOnPageList < totalPageCount) {
            strBuff.append(String.format(nextPageLabel, lnkUrl + (firstPageNoOnPageList + pageSize) + "#sres", (firstPageNoOnPageList + pageSize) + ""));
            strBuff.append(String.format(lastPageLabel, lnkUrl + (lastPageNo) + "#sres", lastPageNo + ""));
        }else {
            strBuff.append(String.format(nextPageLabel, lnkUrl + (lastPageNo) + "#sres", lastPageNo + ""));
            strBuff.append(String.format(lastPageLabel, lnkUrl + (lastPageNo) + "#sres", lastPageNo + ""));
        } 

        int left_margin = 0;
        if(summaryDisp.equals("ALL")) { left_margin = -100; }
        if(summaryDisp.equals("PAGE") || summaryDisp.equals("COUNT")) { left_margin = -50; }

        pageBuff.append("<div class=\"col-md-12 col-xs-12 col-sm-12 t-center padB10\">");
        pageBuff.append("   <ul class=\"pagination input-inline\" style=\"margin-left:"+left_margin+"px\">");
        pageBuff.append(strBuff);
        pageBuff.append("   </ul>");
        if(!summaryDisp.equals("")) {
            pageBuff.append("	<div class=\"input-group input-inline marL10\">");
            pageBuff.append("		<div class=\"help-inline\">");
            if(summaryDisp.equals("PAGE") || summaryDisp.equals("ALL")) {
                pageBuff.append("( " + FormatUtil.insertComma(String.valueOf(currentPageNo)) + " / " + FormatUtil.insertComma(String.valueOf(totalPageCount)) + " 페이지)");
            }
            if(summaryDisp.equals("ALL")) {
            	pageBuff.append(" / ");
            }
            if(summaryDisp.equals("COUNT") || summaryDisp.equals("ALL")) {
                pageBuff.append(" 총 " +  FormatUtil.insertComma(String.valueOf(paginationInfo.getTotalRecordCount())) + "건</div>");
            }
            pageBuff.append("	</div>");
        }
        pageBuff.append("</div>");
        
        return pageBuff.toString();
    }
	 
}
