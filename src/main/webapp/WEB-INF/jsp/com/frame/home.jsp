<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"			scope="request" />
<%-- <jsp:useBean id="memoWp"	class="egovframework.cbiz.RsWrapper" 	scope="request" /> --%>
<jsp:useBean id="notiWp"	class="egovframework.cbiz.RsWrapper" 	scope="request" />
<jsp:useBean id="mesgWp"	class="egovframework.cbiz.RsWrapper" 	scope="request" />
<jsp:useBean id="bokWp"		class="egovframework.cbiz.RsWrapper" 	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" 	scope="session" />
<%@ include file="/com/calendar/calendar.jsp" %>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>사내근로복지기금관리시스템</title>
<link href="/com/calendar/css/calendar.css" rel="stylesheet" type="text/css">
<style>
.divTabOn { 
	padding:0 10 0 10;
color:white;
font-weight: bold;
font-size:12px;
text-align:center;
display:table-cell;
vertical-align:middle;
height:25px;
width:100px;
background: linear-gradient(#92abd1, #3061a1);
border-radius: 3px 3px 0px 0px;
cursor:hand;
}
.divTabOff { 
	padding:0 10 0 10;
text-align:center;
font-weight: bold;
font-size:12px;
display:table-cell;
vertical-align:middle;
height:25px;
width:100px;
border:1px solid c5c5c5;
background: linear-gradient(#efefef, #ffffff);
border-radius: 3px 3px 0px 0px;
cursor:hand;
}
.divDownload { 
	display: table-cell;
	text-align:right;
vertical-align:bottom;
padding-bottom:2px;
}
</style>
<script language="javascript">
	function go_search() {
		document.main.action = "/com/rightFrame.do";
		document.main.target = "_self";
		document.main.submit();
	} 
	
	function go_menu(menu_id, default_page) {
		parent.parent.leftFrame.go_menu(menu_id.substring(0,1), default_page);
}

	function go_sign_detail(msg_no, sign_status) {
		if(sign_status == '1') {
			location.href = '/esign/sgn02001_list.do?msg_no='+msg_no;
		}else {
			location.href = '/esign/sgn03001_list.do';
		}
	}
	
	function go_calendar(cal_range) {
		if(cal_range == 'W') {
			document.main.action = '/community/fd/dia11004_list.do?popup_yn=Y';
			document.main.target = 'ifrm';
			document.main.submit();
		}else if(cal_range == 'M') {
			document.main.action = '/community/fd/dia11001_list.do?popup_yn=Y';
			document.main.target = 'ifrm';
			document.main.submit();
		}
	}
	
	function goTabpage(tabIdx) {
		var theUrl = "";
		if(tabIdx == 0) {
			$('#ApplyTable').show();
			$("#ifrm").css("height","calc(70vh - 102px)");
			$("#ifrm").attr("scrolling","yes");
			theUrl = "/budget/fd/bud22002_list.do";
		}else if(tabIdx == 1) {
			$('#ApplyTable').hide();
			$("#ifrm").css("height","calc(100vh - 75px)");
			$("#ifrm").attr("scrolling","no");
			theUrl = "/community/fd/dia11004_list.do?popup_yn=Y";
		}	
		$('#ifrm').attr('src', theUrl);
	} 
	
	$(function() {
		goTabpage(0);
	});
</script>

<div id="divListData" class="contentsRow">
<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="sys_ymd"	value="<%=rbox.get("start_ymd")%>">
<input type="hidden" name="year" 		value="<%=intYear%>">
<input type="hidden" name="month" 		value="<%=StringUtil.lpad(String.valueOf(intMonth),"0",2)%>">
<input type="hidden" name="day" 		value="<%=StringUtil.lpad(String.valueOf(intDay),"0",2)%>">
<input type="hidden" name="tab_index" 	value="1">
	<div class="row row-set">	
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR5">
			<div class="table-scrollable" style="overflow-y:auto">
				<table class="table table-bordered" style="padding-top:15px">
					<tr>
						<th colspan="2"><img src="/com/img/icon_license.gif" align="absmiddle" border="0"> <%=obox.get("empl_nm")%> 님</th>
					</tr>	
					<tr>
						<td rowspan="5" width="25%">
							<img src="/upload_data/photo/<%=StringUtil.urlEncode(obox.get("photo_file"))%>" width="100" height="130" border="0" align="absmiddle" alt="<%=obox.get("empl_nm")%> <%=obox.get("position_nm")%>" onerror="this.src='/com/img/no_photo.gif'">
						</td>
						<td width="75%" class="t-left"><%=obox.get("dept_nm")%></td>
					</tr>
					<tr>
						<td class="t-left"><%=obox.get("empl_class_nm")%>
						<%if(!obox.get("grade_nm").equals("")){%> / <%=obox.get("grade_nm")%><%}%>
						<%if(!obox.get("position_nm").equals("")){%> / <%=obox.get("position_nm")%><%}%></td>
					</tr>
					<tr>
						<td class="t-left"><%=obox.get("bojik_nm")%></td>
					</tr>
					<tr>
						<td class="t-left">사용권한 : <span style="font-weight:bold; color:#01a1db;"><%=obox.get("use_auth_nm")%></span></td>
					</tr>
					<tr>
						<td class="t-left" style="font-size:11px; color:#666666;">
							<img src="/com/img/icon_doc.gif" align="absmiddle" border="0"> <a href="javascript:go_menu('A01','/insa/ins01001_list.do')">내정보수정</a>&nbsp;&nbsp;&nbsp;
							<img src="/com/img/bu_icon02.gif" align="absmiddle" border="0"> <a href="javascript:go_menu('G10','/esign/sgn31001_list.do')">결재자위임</a>&nbsp;&nbsp;&nbsp;
							<img src="/com/img/icon_note.gif" align="absmiddle" border="0"> <a href="javascript:send_note('')">쪽지보내기</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(45vh - 20px)">
				<table class="table table-bordered">
					<tr>
						<th colspan="3">
							도착메시지 <a href="javascript:go_menu('G02','/esign/sgn02001_list.do')"><img src="/com/img/btn_more_on.gif" align="absmiddle" border="0" style="float:right"></a>
						</th>
					</tr>	
					<tr>
						<td width="55%" class="td-head">제목</td>
						<td width="15%" class="td-head">발신자</td>
						<td width="30%" class="td-head">발신일</td>
					</tr>
				<% if(mesgWp.getLength() == 0) { %>
					<tr height="25"><td colspan="3" align="center">도착한 메시지가 없습니다.</td></tr>
				<% }else {
					for(int i=0; i < mesgWp.getLength(); i++) { %> 
						<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase">
							<td class="t-left"><a href="javascript:go_sign_detail('<%=mesgWp.get("msg_no",i)%>','<%=mesgWp.get("sign_status",i)%>')"><%=mesgWp.get("subject",i)%></a></td>
							<td><%=mesgWp.get("send_empl_nm",i)%></td>
							<td><%=mesgWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
						</tr>
					<% } %>
				<% } %>
				</table>
			</div>
			<div class="table-scrollable scrollOptionY" style="height:calc(35vh - 20px)">
				<table class="table table-bordered">
					<tr height="25">
						<th colspan="3">
							최근 공지 <a href="javascript:go_menu('Y','/community/boa01001_list.do?board_type=01')"><img src="/com/img/btn_more_on.gif" align="absmiddle" border="0"  style="float:right"></a>
						</th>
					</tr>	
					<tr height="25" class="table01_title">
						<td width="65%" class="td-head">제목</td>
						<td width="15%" class="td-head">작성자</td>
						<td width="20%" class="td-head">작성일</td>
					</tr>
				<% if(notiWp.getLength() == 0) { %>
					<tr height="25"><td colspan="3" align="center">등록된 자료가 없습니다.</td></tr>
				<% }else {
					for(int i=0; i < notiWp.getLength(); i++) { %> 
					<tr height="25">
						<td class="t-left">
							<%if(DateUtil.dayDiff(notiWp.get("sys_reg_date",i),DateUtil.toString("yyyyMMdd")) <= 7) {%><img src="/com/img/ico_new_s.gif" border="0"> <%}%>
							<a href="javascript:go_menu('H01','/community/inf01002_select.do?inform_no=<%=notiWp.get("ref_pk",i)%>');"><%=StringUtil.getReplaceSpecialCharacters(notiWp.get("subject",i))%></a>
						</td>
						<td><%=notiWp.get("sys_reg_nm",i)%></td>
						<td><%=notiWp.get("sys_reg_date",i,Box.DEF_DATE_FMT)%></td>
					</tr>
					<% } %>
				<% } %>
				</table>
			</div>
		</div>
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
			<div class="portlet-body">
				<div class="contentsRow portlet-body-hr">
					<ul id="ulTab" class="nav nav-tabs">
						<li id="tabDef" class="active" onclick="goTabpage(0)"><a href="#" data-toggle="tab"><%=DateUtil.toString("yyyy")%>년 사업계획</a></li>
						<li onclick="goTabpage(1)"><a href="#" data-toggle="tab">주요일정</a></li>
					</ul>
				</div>
			</div>
			
	  		<iframe id="ifrm" name="ifrm" marginwidth="0" src="" frameborder="0" width="100%" scrolling="yes"></iframe>
	  		
			<table id="ApplyTable" class="table table-bordered table-cover">
				<tr>
					<th colspan="4">나의 신청현황</th>
				</tr>	
			<% if(bokWp.getLength() > 0) { %>
				<tr>
					<td width="40%" class="td-head">신청내용</td>
					<td width="20%" class="td-head">신청금액</td>
					<td width="20%" class="td-head">신청일자</td>
					<td width="20%" class="td-head">상태</td>
				</tr>
			<% for(int i=0; i < bokWp.getLength(); i++) { %>
				<tr>
					<td class="t-left">
						<a href="javascript:go_menu('C02','/welfare/fd/wel01001_list.do?bugt_cd=<%=bokWp.get("bugt_cd",i)%>&apply_no=<%=bokWp.get("apply_no",i)%>');"><%=StringUtil.getReplaceSpecialCharacters(bokWp.get("subject",i))%></a>
					</td>
					<td><%=bokWp.get("apply_amt",i,Box.THOUSAND_COMMA)%></td>
					<td><%=bokWp.get("apply_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td><%=bokWp.get("sign_status_nm",i)%></td>
				</tr>
			<% } %>
			<% }else { %>
				<tr><td colspan="4" align="center">등록된 자료가 없습니다.</td></tr>
			<% } %>
			</table>
		</div>
	</div>
</form>
</div>