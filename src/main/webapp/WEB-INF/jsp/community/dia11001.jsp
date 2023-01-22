<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%-- <%@ include file="/com/include/calendar.jsp" %> --%>

<!-- 월간주요일정 -->
<script language='javascript'>
	function goSearch() {
		document.main.action = "dia11001_list.do";
		document.main.target = "_self";
		document.main.submit();	
	}
	
	function goEdit(plan_no) {
		document.main.plan_no.value = plan_no;
		document.main.action = 'dia11003_edit.do';
		document.main.target = 'ifrm';
		document.main.submit();
	}
	
	function goDetail(plan_no) {
		document.main.plan_no.value = plan_no;
		document.main.action = 'dia11002_select.do';
		document.main.target = 'ifrm';
		document.main.submit();
	}
	
	function change_view_type(view_type) {
		document.getElementById("calArea").style.display = view_type == '1' ? '' : 'none';
		document.getElementById("tblArea").style.display = view_type == '2' ? '' : 'none';
	}
	
	function goWork(day, day_of_week) {
		wdt = 400; hgt = 260;
		xPos = Math.ceil((screen.width - wdt) / 2);
		yPos = Math.ceil((screen.height - hgt) / 2);
		if(day.length == 1) { day = '0' + day; }
		var pageUrl = 'dia11011_edit.do?sys_ymd=<%=DateUtil.toString("yyyyMMdd")%>';
		window.open(pageUrl, "dia11011", "width=" + wdt + ",height=" + hgt + ",menubar=no,toolbar=no,scrollbars=no,resizable=no,left=" + xPos + ",top=" + yPos);
	}
	
	$(function() {
		<% if(rsWp.getLength() > 0) { out.println("set_backColor('0'); goDetail('"+rsWp.get("plan_no",0)+"');"); } %>
	});
</script> 

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="day" 	 	value="<%=box.get("day")%>">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="plan_no" 	value="">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td valign="top" style="padding:10 10 0 10">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
	        	<tr><td height="35" class="cont_title">월간주요일정</td></tr>
			</table>
		</td>
	</tr>
	<tr height="">
		<td valign="top">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table02">
		  		<tr height="28">
		  			<td width="10%" class="table01_title">기준년월</td>
					<td width="25%" style="padding-left:5px">
						<select name="year" style="width:80px;" onchange="goSearch();">
							<%=DateUtil.getYearOptionTag(String.valueOf(intYear),"2011",DateUtil.getYear(),"desc","년")%>
						</select>
						<select name="month" style="width:50px;" onchange="goSearch();">
							<%=DateUtil.getMonthOptionTag(String.valueOf(intMonth),"월")%>
						</select>
						<a href="javascript:goSearch('N');"><img src="/com/img/icon_search.gif" border="0" align="absmiddle"></a>
					</td>
		  			<td width="10%" class="table01_title">보기형식</td>
					<td width="*" align="left" style="padding-left: 10px">
						<input type="radio" name="view_type" value="1" <%=box.get("view_type").equals("1")?"checked":""%> style="border:none" onClick="change_view_type(this.value)">달력&nbsp;
						<input type="radio" name="view_type" value="2" <%=box.get("view_type").equals("2")?"checked":""%> style="border:none" onClick="change_view_type(this.value)">표&nbsp;
					</td>
					<td width="<%=uSesEnt.use_auth.equals("SA")?"180":"100"%>" align="center" style="padding:0 5 0 5">
						<a href="javascript:goEdit('')"><img src="/com/img/icon_add_schedule.gif" border="0" align="absmiddle" alt="새일정등록"></a>
						<%if(uSesEnt.use_auth.equals("SA")){%><a href="javascript:goWork('')"><img src="/com/img/icon_add_holiday.gif" border="0" align="absmiddle" alt="공휴일등록"></a><%}%>
					</td>
		  		</tr>
			</table>
			<table width="100%" height="" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="50%" valign="top" style="padding-top:10px">
						<table id="calArea" width="100%" align="center" border="1" cellpadding="2" cellspacing="1" class="table01" style="display:<%=box.get("view_type").equals("1")?"":"none"%>"> 
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
									String memo = rsWp.getCutStr("subject",i,20);
									if(rsWp.get("plan_class_nm",i).startsWith("공유")) { memo += StringUtil.replace(rsWp.get("plan_class_nm",i),"공유일정",""); }
									memo_txt[j] += "<span style=\"font-size:11px;font-weight:normal;color:"+color+";letter-spacing:-2px;\"><a href=\"javascript:goDetail('"+rsWp.get("plan_no",i)+"')\">" + memo + "</a></span>";
								}
							}
							
							int index = (dayOfWeek * -1) + 2;
							while(index <= monthLength){
								out.println("<tr height='100' align='center'>");
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
						<div id="tblArea" style="display:<%=box.get("view_type").equals("2")?"":"none"%>">
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="25" align="center" class="table01_title">
			          			<td width="22%">일시</td>
			          			<td width="18%">구분</td>
								<td width="20%">제목</td>
								<td width="40%">내용</td>
			          		</tr>
			          <% if(rsWp.getLength() == 0) { %>	
							<tr height="25"><td colspan="4" align="center">등록된 일정이 없습니다.</td></tr>
			          <% }else {	
				          	for(int i=0; i < rsWp.getLength(); i++) { 
				          		String dateStr = rsWp.get("start_ymd",i).substring(4,6)+"."+rsWp.get("start_ymd",i).substring(6)+"("+rsWp.get("start_week",i)+")";
				          		if(!rsWp.get("start_hhmm",i).equals("")) { dateStr += " "+rsWp.get("start_hhmm",i).substring(0,2)+":"+rsWp.get("start_hhmm",i).substring(2); }
				          		if(!rsWp.get("end_ymd",i).equals(rsWp.get("start_ymd",i))) { dateStr += " ~ "+rsWp.get("end_ymd",i).substring(4,6)+"."+rsWp.get("end_ymd",i).substring(6)+"("+rsWp.get("end_week",i)+")"; }
				          		if(!rsWp.get("end_hhmm",i).equals("") && (!rsWp.get("end_ymd",i).equals(rsWp.get("start_ymd",i)) || !rsWp.get("end_hhmm",i).equals(rsWp.get("start_hhmm",i)))) { 
				          			if(dateStr.indexOf(" ~ ") < 0) { dateStr += " ~ "; }
				          			dateStr += " "+rsWp.get("end_hhmm",i).substring(0,2)+":"+rsWp.get("end_hhmm",i).substring(2); 
				          		}
				          		
				          		String color = "";
				          		if(rsWp.get("start_week",i).equals("토")) { color = "blue"; }
				          		if(rsWp.get("holiday_yn",i).equals("Y")) { color = "red"; } %>
								<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand" onClick="set_backColor('<%=i%>');goDetail('<%=rsWp.get("plan_no",i)%>')"> 
									<td align="center"><font color="<%=color%>"><%=dateStr%></font></td>
				          			<td align="center"><%=rsWp.get("plan_class_nm",i)%></td>
				          			<td style="padding:2 5 2 5"><%=rsWp.get("subject",i).replace("@@FONT@@","<font color='red'><b>").replace("@@FONT_END@@","</b></font>")%></td>
				          			<td style="padding:2 5 2 5"><%=rsWp.get("plan_memo",i,Box.MULTILINE_TEXT)%></td>
				          		</tr>
				          <% } %>
			          	<% } %>
			          	</table>
					</td>
				    <td id="frmArea" width="*" height="400" valign="top" style="padding-top:5px;">
				    	<iframe name="ifrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="100%" scrolling="yes"></iframe>
				    </td>
				</tr>
			</table>
		</td>
  	</tr>
</table>
</form>