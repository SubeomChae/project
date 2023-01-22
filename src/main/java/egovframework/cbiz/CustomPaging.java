package egovframework.cbiz;

import java.text.MessageFormat;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationRenderer;

public class CustomPaging extends AbstractPaginationRenderer {

	public CustomPaging() {
		// firstPageLabel = "<a href=\"{0}\" class=\"btn_first\"><span>첫
		// 페이지</span></a> ";
		// previousPageLabel = "<a href=\"{0}\" class=\"btn_before\"><span>이전
		// 페이지</span></a> ";
		// currentPageLabel = "<li><a href=\"#;\" class=\"on\">{0}</a></li> ";
		// otherPageLabel = "<li><a href=\"{0}\">{1}</a></li> ";
		// nextPageLabel = "<a href=\"{0}\" class=\"btn_after\"><span>다음
		// 페이지</span></a> ";
		// lastPageLabel = "<a href=\"{0}\" class=\"btn_last\"><span>마지막
		// 페이지</span></a> ";
	}

	@Override
	public String renderPagination(PaginationInfo paginationInfo, String lnkUrl) {

		firstPageLabel = "";//"<a href=\"%s\" onclick=\"return goPage('%s');\"><span>첫 페이지</span></a> ";
		previousPageLabel = "<a href=\"%s\" onclick=\"return goPage('%s');\" class='pg prev'><img src='../../images/apply/paging_prev.gif' class='album' alt=''></a> ";
		currentPageLabel = "<a href=\"#;\" class=\"pg on\">%s</a> ";
		otherPageLabel = "<a href=\"%s\" onclick=\"return goPage('%s');\" class='pg'>%s</a> ";
		nextPageLabel = "<a href=\"%s\" onclick=\"return goPage('%s');\" class='pg next'><img src='../../images/apply/paging_next.gif' class='album' alt=''></a> ";
		lastPageLabel = "";//"<a href=\"%s\" onclick=\"return goPage('%s');\"><span>마지막 페이지</span></a> ";

		StringBuffer strBuff = new StringBuffer();

		int firstPageNo = paginationInfo.getFirstPageNo();
		int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
		int totalPageCount = paginationInfo.getTotalPageCount();
		int pageSize = paginationInfo.getPageSize();
		int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
		int currentPageNo = paginationInfo.getCurrentPageNo();
		int lastPageNo = paginationInfo.getLastPageNo();

		if (lnkUrl.indexOf("?") == -1)
			lnkUrl += "?1=1";

		lnkUrl += "&amp;pageCount=";

		if (firstPageNoOnPageList > pageSize) {
			strBuff.append(String.format(firstPageLabel, lnkUrl + firstPageNo, firstPageNo + ""));
			strBuff.append(String.format(previousPageLabel, lnkUrl + (firstPageNoOnPageList - 1) + "#sres",
					(firstPageNoOnPageList - 1) + ""));
		} else {
			strBuff.append(String.format(firstPageLabel, lnkUrl + (firstPageNo) + "#sres", firstPageNo + ""));
			strBuff.append(String.format(previousPageLabel, lnkUrl + (firstPageNo) + "#sres", firstPageNo + ""));
		}

		for (int i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
			if (i == currentPageNo) {
				strBuff.append(String.format(currentPageLabel, Integer.toString(i), Integer.toString(i)));
			} else {
				strBuff.append(String.format(otherPageLabel, lnkUrl + (i) + "#sres", Integer.toString(i),
						Integer.toString(i)));
			}
		}

		if (lastPageNoOnPageList < totalPageCount) {
			strBuff.append(String.format(nextPageLabel, lnkUrl + (firstPageNoOnPageList + pageSize) + "#sres",
					(firstPageNoOnPageList + pageSize) + ""));
			strBuff.append(String.format(lastPageLabel, lnkUrl + (lastPageNo) + "#sres", lastPageNo + ""));
		} else {
			strBuff.append(String.format(nextPageLabel, lnkUrl + (lastPageNo) + "#sres", lastPageNo + ""));
			strBuff.append(String.format(lastPageLabel, lnkUrl + (lastPageNo) + "#sres", lastPageNo + ""));
		}

		return strBuff.toString();
	}

}