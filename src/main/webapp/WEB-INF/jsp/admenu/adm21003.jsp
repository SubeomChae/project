<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="memoWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>기업일정/개인일정</title>

<script language="javascript">
	function goSearch() {
		document.main.action = "adm21003_list.do";
		document.main.target = "_self";
		document.main.submit();	
	}

	function goWork(day, day_of_week) {
		wdt = 400; hgt = 200;
		xPos = Math.ceil((screen.width - wdt) / 2);
		yPos = Math.ceil((screen.height - hgt) / 2);
		window.open("about:blank", "schedule", "width=" + wdt + ",height=" + hgt + ",menubar=no,toolbar=no,scrollbars=no,resizable=no,left=" + xPos + ",top=" + yPos);

		if(day.length == 1) { day = '0' + day; }
		document.main.sys_ymd.value = '<%=box.get("std_ym")%>' + day;
		document.main.day_of_week.value = day_of_week;
		document.main.action = 'adm21002_edit.do';
		document.main.target = 'schedule';
		document.main.submit();
	}
	
	function goMove(flag) {
		document.main.std_ym.value = flag == 'next' ? '<%=DateUtil.addDate(box.get("std_ym")+"01",1,"yyyyMM","M")%>' : '<%=DateUtil.addDate(box.get("std_ym")+"01",-1,"yyyyMM","M")%>';
		goSearch();
	}
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="std_ym" 		value="<%=box.get("std_ym")%>">
<input type="hidden" name="sys_ymd" 	value="">
<input type="hidden" name="day_of_week" value="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr height="30">
		<td width="50%" valign="top" style="padding-left:20px">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="effaf9">
				<tr height="34">
					<td width="100%" align="center">
						<a href="javascript:goMove('prev');"><img src="/com/img/arrow2.jpg" border="0" align="absmiddle"></a>
						<span style="font-size:14px;font-weight:bold; color:#01a1db;">&nbsp;<%=intYear%>년 <%=intMonth%>월&nbsp;
						<a href="javascript:goMove('next');"><img src="/com/img/arrow4.jpg" border="0" align="absmiddle"></a>&nbsp;&nbsp;&nbsp;월간 일정</span>
					</td>
				</tr>
				<tr>
					<td valign="top" bgcolor="ffffff">
						<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
							<tr valign="top">
								<td align="center">
									<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
										<tr>
											<td width="100%">
											  <table id="MyTable" width="100%" height="400" align="center" border="0" cellpadding="2" cellspacing="1" class="table01" style="letter-spacing:-1px"> 
												<tr>
													<td class="schedule_table_header_center_sun"><font color="#740000">일</font></td>
													<td class="schedule_table_header_center">월</td>
													<td class="schedule_table_header_center">화</td>
													<td class="schedule_table_header_center">수</td>
													<td class="schedule_table_header_center">목</td>
													<td class="schedule_table_header_center">금</td>
													<td class="schedule_table_header_center_sat"><font color="#1B1464"></font>토</td>
												</tr>
										<%  String arr[] = {"N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N","N"};
											for(int i=0; i < rsWp.getLength(); i++) {
												arr[rsWp.getInt("sys_dd",i)] = rsWp.get("holiday_yn",i) + rsWp.get("etc_remark",i);
											}
											
											int index = (dayOfWeek*-1) + 2;
											while(index <= monthLength){
												out.println("<tr align='center'>");
												for(int j=0; j <= 6; j++){
													if(index > 0 && index <= monthLength) {
														if(j == 0 ) { // 일요일 or 월간주요일정
															out.print("<td width='14.3%' class='schedule_number_red'");
														}else if(j == 6) { // 토요일
															out.print("<td width='14.3%' class='schedule_number_blue'");
														}else {
															out.print("<td width='14.3%' class='schedule_number_gray'");
														}
														String dateStr = " onmouseover=this.style.backgroundColor='#F3F0D2' onmouseout=this.style.backgroundColor=''>";
														if(uSesEnt.use_auth.startsWith("S")) {
															dateStr += "<a href=\"javascript:goWork('"+index+"','"+j+"');\">" + index + "</a><br><br>";
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
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>