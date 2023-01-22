<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%@ include file="/WEB-INF/jsp/com/include/calendar.jsp" %>

<style type="text/css">
.schedule_table_header_center {height: 22px; background-color: #E8E8E8; }
.schedule_table_header_center_sun {height: 22px; background-color: #FAF2F2; }
.schedule_table_header_center_sat {height: 22px; background-color: #E7F9FF; }
</style>

<script language='javascript'>
	function goSearch() {
		var pageUrl = "dia11001_list.do?popup_yn=Y";
		document.main.action = pageUrl;
		document.main.target = "_self";
		document.main.submit();	
	}
	
	function openPlanPopup(plan_no, action_type) {
 		var theUrl = '/community/pd/' + (action_type == 'SELECT' ? 'dia11002_select.do' : 'dia11003_edit.do');
		popupOpen("about:blank", "planPopup", 500, 400); 
		
		document.main.action = theUrl + '?popup_yn=Y&plan_no='+plan_no;
		document.main.target = 'planPopup';
		document.main.submit();
	}
</script> 
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="day" 	 value="<%=box.get("day")%>">
	<div class="table-scrollable">
		<table id="calTable" class="table table-view table-bordered">
			<tr height="25" bgcolor="#000000">
				<td style="color:#ffffff; border-right:1pt solid #000000; padding-left:10px"><b><%=DateUtil.getYear()%>년 <%=DateUtil.getMonth()%>월 <%=DateUtil.getDay()%>일 <%=DateUtil.getWeekDayNm(DateUtil.toString("yyyyMMdd"))%>요일</b></td>
			</tr>	
			<tr height="28" bgcolor="f6f6f6">
			  	<td>
			  		<select name="cal_range" style="width:90px" class="bs-select form-control" onChange="if(this.value=='W') { parent.go_calendar('W'); }">
						<option value='W'>주간일정</option>
						<option value='M' selected>월간일정</option>
					</select>
					<select name="year" style="width:80px;" class='bs-select form-control' onchange="goSearch();">
						<%=DateUtil.getYearOptionTag(String.valueOf(intYear),"2011",DateUtil.getYear(),"desc","년")%>
					</select>
					<select name="month" style="width:65px;" class='bs-select form-control' onchange="goSearch();">
						<%=DateUtil.getMonthOptionTag(StringUtil.lpad(String.valueOf(intMonth), "0", 2),"월")%>
					</select>
					<select name="plan_class" style="width:85px;" class='bs-select form-control' onchange="goSearch();">
						<option value=''>전체일정</option>
						<option value='1' <%=box.get("plan_class").equals("1")?"selected":""%>>개인일정</option>
						<option value='2' <%=box.get("plan_class").equals("2")?"selected":""%>>부서일정</option>
						<option value='3' <%=box.get("plan_class").equals("3")?"selected":""%>>전사일정</option>
					</select>
					<button type="button" class="btn btn-primary btn-table" onClick="openPlanPopup('','EDIT');" >새 일정 등록</button>
					<span style="float:right">
			  			<font color="blue">●</font> 개인일정 <font color="4488dd">●</font> 부서일정 <font color="">●</font> 전사일정
			  		</span>
			  	</td>
			</tr>
			<tr height="300">
				<td class="table-in-table">
					<table class="table table-bordered">
						<tr height="20">
							<td width="14%" class="schedule_table_header_center_sun"><font color="#740000">일</font></td>
							<td width="14%" class="schedule_table_header_center">월</td>
							<td width="14%" class="schedule_table_header_center">화</td>
							<td width="14%" class="schedule_table_header_center">수</td>
							<td width="14%" class="schedule_table_header_center">목</td>
							<td width="14%" class="schedule_table_header_center">금</td>
							<td width="14%" class="schedule_table_header_center_sat"><font color="#1B1464"></font>토</td>
						</tr>
					<%  String memo_txt[] = {"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""};
						for(int i=0; i < rsWp.getLength(); i++) {
							String color = "";
							if(rsWp.get("plan_class_nm",i).startsWith("개인")) { color = "blue"; }
							if(rsWp.get("plan_class_nm",i).startsWith(uSesEnt.dept_nm)) { color = "4488dd"; }
							for(int j=rsWp.getInt("start_pos",i); j <= rsWp.getInt("end_pos",i); j++) {
								memo_txt[j] += (memo_txt[j].equals("")?"":"<br>");
								String memo = "<a href=\"javascript:openPlanPopup('"+rsWp.get("plan_no",i)+"','SELECT');\">"+rsWp.getCutStr("subject",i,20);
								if(rsWp.get("plan_class_nm",i).startsWith("공유")) { memo += StringUtil.replace(rsWp.get("plan_class_nm",i),"공유일정","")+"</a>"; }
								memo_txt[j] += "<span title='"+rsWp.get("plan_memo",i)+"' style=\"font-size:11px;font-weight:normal;color:"+color+";letter-spacing:-2px;\">" + memo + "</span>";
							}
						}
						
						int index = (dayOfWeek * -1) + 2;
						while(index <= monthLength){
							out.println("<tr height='90' align='center'>");
							for(int j=0; j <= 6; j++){
								boolean isToday = strToday.equals(DateUtil.toString("yyyyMM")+StringUtil.lpad(new Integer(index).toString(),"0",2)) ? true : false;
								if(j == 6) { // 토요일
									out.print("<td width='14%' bgcolor='"+(isToday?"yellow":"")+"' class='schedule_number_blue' valign='top'");
								}else if(j == 0) { // 일요일
									out.print("<td width='14%' bgcolor='"+(isToday?"yellow":"")+"' class='schedule_number_red'  valign='top'");
								}else {
									out.print("<td width='14%' bgcolor='"+(isToday?"yellow":"")+"' class='schedule_number_gray' valign='top'"); 
								}
		
							   if(index > 0 && index <= monthLength){
									String dateStr = " onmouseover=this.style.backgroundColor='#F3F0D2' onmouseout=this.style.backgroundColor=''>";
									dateStr += "" + String.valueOf(index) + "<br><br>";
									out.println(dateStr + "<span style=\"font-size:11px; color:#666666; font-weight:normal; letter-spacing:-2px;\">"+memo_txt[index]+"</span></td>");
								}else{
									out.println("></td>");
								}
								index++;
							}
							out.println("</tr>");
						}
					%>
					</table>
				</td>
			</tr>
		</table>
	</div>
</form>