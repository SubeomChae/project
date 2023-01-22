<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%@ include file="/com/calendar/calendar.jsp" %>
<!-- 월간주요일정관리 -->
<link href="/com/calendar/css/calendar.css" rel="stylesheet" type="text/css">
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch() {
		document.main.std_ym.value = document.main.std_yy.value + document.main.std_mm.value
		ajaxReplaceForm("adm21001_list.do", "#main", "#divListData");
	}

	function goWork(day, day_of_week) {
		if(day.length == 1) { day = '0' + day; }
		var sys_ymd = document.main.std_yy.value+document.main.std_mm.value+day
		var param = "sys_ymd="+sys_ymd+"&day_of_week="+day_of_week;
		ajaxReplace("adm21002_edit.do", param, "#dialog-form", function() {
			$('#dialog-form').modal('show');
		});
	}
</script> 

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="std_ym" 		value="<%=box.get("std_ym")%>">
<input type="hidden" name="sys_ymd" 	value="">
<input type="hidden" name="day_of_week" value="">
	<h1 class="page-title">월간 주요일정</h1>

	<div class="form-inline marB10">
		<div class="table-top-control">
			<div class="notice-view">
			  	<span style="color:#01a1db;">일자를 클릭</span>해서 해당 일자의 주요일정을 등록할 수있습니다.
			</div>
			
			<div class="form-inline f-right">
				<select name="std_yy" class="bs-select form-control" style="width:90px;" onchange="goSearch();">
					<%=DateUtil.getYearOptionTag(box.get("std_ym").substring(0,4),"2010",DateUtil.nextYear(),"desc","년")%>
				</select>
				<select name="std_mm" class="bs-select form-control" style="width:90px" onChange="goSearch();">
	       			<%=DateUtil.getMonthOptionTag(box.get("std_ym").substring(4),"월")%>
				</select> 
			</div>
		</div>
	</div>
</form>
<div id="divListData" class="contentsRow">	
<% } %>		

	<table class="table table-bordered order-column table-cover" style="height:calc(100vh - 100px);">
		<tr>
			<td style="background-color:#FAF2F2; font-size:18px"><font color="#740000">일</font></td>
			<th style="font-size:18px">월</th>
			<th style="font-size:18px">화</th>
			<th style="font-size:18px">수</th>
			<th style="font-size:18px">목</th>
			<th style="font-size:18px">금</th>
			<td style="background-color:#E7F9FF; font-size:18px"><font color="#1B1464">토</font></td>
		</tr>
		<%  String arr[] = {"N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N"};
				for(int i=0; i < rsWp.getLength(); i++) {
					arr[rsWp.getInt("sys_dd",i)] = rsWp.get("holiday_yn",i) + rsWp.get("etc_remark",i);
				}
				int index = (dayOfWeek*-1) + 2;
				while(index <= monthLength){
					out.println("<tr class='t-center'>");
					for(int j=0; j <= 6; j++){
						if(index > 0 && index <= monthLength) {
							if(j == 0 ) { // 일요일 or 월간주요일정
								out.print("<td width='14%' class='schedule_number_red'");
							}else if(j == 6) { // 토요일
								out.print("<td width='14%' class='schedule_number_blue'");
							}else {
								out.print("<td width='14%' class='schedule_number_gray'");
							}
							String dateStr = " onmouseover=this.style.backgroundColor='#F3F0D2' onmouseout=this.style.backgroundColor=''>";
							if(uSesEnt.use_auth.startsWith("S")) {
								dateStr += "<a href=\"javascript:goWork('"+index+"','"+j+"');\" style=font-size:16px;font-weight:bold;>" + index + "</a><br><br>";
							}else {
								dateStr += "" + index + "<br><br>";
							}
							if(!arr[index].equals("")) {
								dateStr += arr[index].substring(1);
							}else {
								dateStr += "&nbsp;";
							}
							out.println(dateStr);
							out.println("</td>");
						}else {
							out.println("<td></td>");
						}
						index++;
					}
					out.println("</tr>");
				}
		%>
	</table>
<% if(!box.get("ajax_yn").equals("Y")) { %>	
</div>
<% } %>