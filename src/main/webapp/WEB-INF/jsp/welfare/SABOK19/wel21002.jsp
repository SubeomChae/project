<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<title>목적사업비집행현황 조건검색</title>
<script language='javascript'>
	function go_welfare_view(apply_no, bugt_cd) {
		wdt = 800; hgt = 450;
		xPos = Math.ceil((screen.width - wdt) / 2);
		yPos = Math.ceil((screen.height - hgt) / 2);
		window.open('wel01002_select.do?apply_no='+apply_no+'&bugt_cd='+bugt_cd+'&popup_yn=Y', 'wel01002', 'width='+wdt+',height='+hgt+',menubar=no,toolbar=no,scrollbars=yes,resizable=no,left='+xPos+',top='+yPos);
	}
</script>

<form name="main" method="post" action="">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="100%" valign="top">
			<div id="DivFrm" style="width:100%;height:620;overflow-y:auto">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<% int colspan = 5; String bugt_cd = StringUtil.substr(box.get("bugt_cd"),0,4); %>
				<tr height="25">
				<% if(bugt_cd.equals("")) { %>
					<td>구분</td>
				<% } %>
					<td>사번</td>
					<td>성명</td>
					<td>부서명</td>
					<td>직위</td>
				<% if(bugt_cd.equals("S700")) { colspan += 2; %>
					<td>신청일자</td>
					<td>신청금액</td>
				<% } %>
				<% if(bugt_cd.equals("S001")) { colspan += 5; %>	
					<td>가족관계/성명</td>
					<td>주민등록번호</td>
					<td>경조구분</td>
					<td>경조일자</td>
					<td>경조장소</td>
				<% }else if(bugt_cd.equals("S003")) { colspan += 5; %>	
					<td>가족관계/성명</td>
					<td>주민등록번호</td>
					<td>학교명</td>
					<td>학년/학기</td>
					<td>전공</td>
				<% }else if(bugt_cd.equals("S004")) { colspan += 5; %>
					<td>교육명</td>
					<td>교육일자</td>
					<td>교육기관</td>
					<td>기관연락처</td>
					<td>기관주소</td>
				<% }else if(bugt_cd.equals("S700")) { colspan += 6; %>
					<td>입사일자</td>
					<td>주민번호</td>
					<td>사원구분</td>
					<td>재직상태</td>
					<td>지급일자</td>
					<td>지급액</td>
				<% } %>
				<% if(box.get("bugt_cd").equals("")) { %>
					<td>비고</td>
				<% } %>
					<td>상태</td>
          		</tr>
		<% if(!box.get("bugt_cd").equals("") && rsWp.getLength() == 0) { %>
				<tr height="25"><td colspan="<%=colspan%>" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% }else {
		   	   for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase">
				<% if(box.get("bugt_cd").equals("")) { %>
					<td width="10%" class="t-center"><%=rsWp.get("bugt_nm",i)%></td>
				<% } %>
					<td width="6%" class="t-center"><%=rsWp.get("empl_no",i)%></td>
					<td width="7%" class="t-center"><%if(!box.get("excel_yn").equals("Y")){%><%if(!box.get("bugt_cd").equals("S007") && !box.get("bugt_cd").equals("S008")){%><a href="javascript:go_welfare_view('<%=rsWp.get("apply_no",i)%>','<%=rsWp.get("bugt_cd",i)%>');"><%}else{%><a href="javascript:go_employee_info('<%=rsWp.get("empl_no",i)%>')"><%}%><%}%><%=rsWp.get("empl_nm",i)%></a></td>
					<td width="10%" class="t-center"><%=rsWp.get("dept_nm",i)%></td>
					<td class="t-center" width="7%" ><%=rsWp.get("position_nm",i)%></td>
				<% if(!box.get("bugt_cd").equals("S007") && !box.get("bugt_cd").equals("S008")) { %>	
					<td width="7%" class="t-center"><%=rsWp.get("apply_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td width="7%" class="t-center"><%=rsWp.get("apply_amt",i,Box.THOUSAND_COMMA)%></td>
				<% } %>	
				<% if(box.get("bugt_cd").equals("S001")) { // 경조금  %>	
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("family_rel_nm",i)%>/<%=rsWp.get("family_nm",i)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("family_reside_no",i),"x")%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("cong_class_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("cong_place",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S002")) { // 의료비   %>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("family_rel_nm",i)%>/<%=rsWp.get("family_nm",i)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("family_reside_no",i),"x")%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("disease_nm",i)%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("medi_org_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("inner_start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("inner_end_ymd",i,Box.DEF_DATE_FMT)%></td>
				<% }else if(box.get("bugt_cd").equals("S003")) { // 학자금   %>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("family_rel_nm",i)%>/<%=rsWp.get("family_nm",i)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("family_reside_no",i),"x")%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("school_nm",i)%><%=rsWp.get("school_flag_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("school_year",i)%>학년 <%if(!rsWp.get("school_term",i).equals("")){%><%=rsWp.get("school_term",i)%>학기<%}%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("major_nm",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S004")) { // 자기개발비   %>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("course_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("edu_org_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("edu_org_tel",i)%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("edu_org_addr",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S005")) { // 휴양시설이용   %>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("condo_nm",i)%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
				<% }else if(box.get("bugt_cd").equals("S006")) { // 사내동호인회 지원   %>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("sub_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("event_place",i)%></td>
					<td class="t-center" style="letter-spacing:-1px"><%=rsWp.get("event_content",i,Box.MULTILINE_TEXT)%></td>
				<% }else if(box.get("bugt_cd").equals("S007") || box.get("bugt_cd").equals("S008")) { // 선물지급, 연금지급  %>
					<td class="t-center"><%=rsWp.get("entry_ymd",i, Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("reside_no",i),"x")%></td>
					<td class="t-center"><%=rsWp.get("empl_class_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("empl_status_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("pay_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("pay_amt",i,Box.THOUSAND_COMMA)%></td>
				<% }else if(box.get("bugt_cd").equals("S010")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S022")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S023")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S024")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% }else if(box.get("bugt_cd").equals("S025")) { %>
					<td class="t-center" width="7%"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center" width="*"><%=rsWp.get("etc_remark",i)%></td>
				<% } %>
				<% if(box.get("bugt_cd").equals("")) { %>
					<td width="10%" class="t-center"><%=rsWp.get("etc_remark",i)%></td>
				<% } %>
					<td width="7%" class="t-center"><%=rsWp.get("sign_status_nm",i)%></td>
				</tr>
		<% 	   }
		   } %>
			</table>
		</div>
		</td>
  	</tr>
<% if(!box.get("excel_yn").equals("Y") && rsWp.getLength() > 0) { %>	
    <tr height="30">
		<td class="t-center"><%=rsWp.getPageLine(request, 30, 10)%></td>
	</tr>
<% } %>	
</table>
</form>