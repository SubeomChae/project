<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<% 
	String contextPath 	= request.getContextPath();
	Calendar calendar = null;
	if(request.getParameter("year")==null && request.getParameter("month")==null){
		calendar = Calendar.getInstance();
		setToday(calendar);
	}else{
		calendar = Calendar.getInstance();
		setOtherToday(calendar, (String)request.getParameter("year"), (String)request.getParameter("month"), "01");
	}

	String strToday = getStrToday();
	int intYear = getIntYear();
	int intMonth = getIntMonth();
	int intDay = getIntDay();
	int dayOfWeek = getDayOfWeek();
	int monthLength = getMonthDay(intYear, intMonth);

	String yearMonth = String.valueOf(intYear);
	if (intMonth < 10) yearMonth += "0";
	yearMonth += intMonth;
%>

<%!	
	int monthLength = 0;
	int yyyy=0;
	int mm=0;
	int dd=0;
	int dayOfWeek=0;
	String strToday;
	HashMap holidays;
	Calendar today = null;
	
	void setToday(Calendar c){
		today = c;
		yyyy = today.get(Calendar.YEAR);
		mm = today.get(Calendar.MONTH)+1;
		dd = today.get(Calendar.DATE);
		setStrToday(new Integer(yyyy).toString() + StringUtil.lpad(new Integer(mm).toString(),"0",2) + StringUtil.lpad(new Integer(dd).toString(),"0",2));
		today.set(Calendar.DAY_OF_MONTH, 1);
		dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
	}

	void setOtherToday(Calendar c, String y, String m, String d){
		today = c;
		today.set(Calendar.YEAR, Integer.parseInt(y));
		today.set(Calendar.MONTH, Integer.parseInt(m)-1);

		today.set(Calendar.DAY_OF_MONTH, 1);
		yyyy = today.get(Calendar.YEAR);
		mm = today.get(Calendar.MONTH)+1;	
		dd = today.get(Calendar.DATE);
		setStrToday(new Integer(yyyy).toString() + StringUtil.lpad(new Integer(mm).toString(),"0",2) + StringUtil.lpad(d,"0",2));
		dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
	}

	int getMonthDay(int yyyy, int mm){
		if(mm == 2)
			monthLength = getLeapYearFebruary(yyyy);
		else if(mm == 4 || mm == 6 || mm == 9 || mm == 11)
			monthLength = 30;
		else
			monthLength = 31;

		return monthLength;
	}

	int getLeapYearFebruary(int yyyy){
		if((yyyy % 4 == 0 && yyyy % 100 != 0) || yyyy % 400 == 0)
			return 29;
		else return 28;
	}

	int getIntYear(){
		return yyyy;
	}

	int getIntMonth(){
		return mm;
	}

	public int getIntDay(){
		return dd;
	}

	public int getDayOfWeek(){
		return dayOfWeek;
	}

	String getStrToday(){
		return strToday; 
	}

	void setStrToday(String str){
		this.strToday = str;
	}

	String getDateString(String yearMonthStr, int dayOfMonth) {
	    StringBuffer newDateStr = new StringBuffer(yearMonthStr);
	    if (dayOfMonth < 10)
	        newDateStr.append("0");

	    return newDateStr.append(dayOfMonth).toString();
	}

	String getHolidayName(String dateString) {
	    // 양력 휴일명
		String solarHolidayName = (String)holidays.get(dateString);
		if (solarHolidayName == null) {
		    return (String)holidays.get("9999." + dateString.substring(5));
		}

		else {
		    // 음력 휴일명
		    String lunarHolidayName = (String)holidays.get("9999." + dateString.substring(5));
		    if (lunarHolidayName == null)
		        return solarHolidayName;
		    // 음력휴일과 양력휴일이 겹쳤을 때
		    else
		        return solarHolidayName + "," + lunarHolidayName;
		}
	}
%>
<html>
<head>
<title>달력</title>
<link href="./css/calendar.css" rel="stylesheet" type="text/css">
<meta http-equiv="Cache-Control" content="no-cache; no-store; no-save">
<script language="javascript"> 
	function setMonth(month) {
		document.frmCalendar.month.value = month;
		document.frmCalendar.submit();  
	}
	
	function setYear(year) {
		document.frmCalendar.year.value = year;
		document.frmCalendar.submit();
	}
	
	function setValue(day) {
		var year = document.frmCalendar.year.value;
		var month = document.frmCalendar.month.value;
		if(month < 10){
			month = "0" +month;
		}
	
		parent.setValue(year+month+day);
	}
</script>
</head>
<body>
<table width="200" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" style="padding:0 20 0 20">
			<table align="center" width="200" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="14"><a href="javascript:setYear('<%=(intYear-1)%>')"><img src="./img/Content_icon_arrowleft.gif" width="14" height="28" border="0"></a></td>
								<td width="70" height="28" align="center" valign="bottom" class="schedule_title_red"><%=intYear%>년</td>
								<td width="14"><a href="javascript:setYear('<%=(intYear+1)%>')"><img src="./img/Content_icon_arrowright.gif" width="14" height="28" border="0"></a></td>
								<td width="*" align="right" valign="bottom">
									<select name="intMonth" style="width:55px;height:18px" onChange="setMonth(this.value)">
										<%=DateUtil.getMonthOptionTag(String.valueOf(intMonth),"월")%>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr><td height="15" align="center"><img src="./img/Content_schedule_popupbar02.gif" width="200" height="15"></td></tr>
			</table>
			<table align="center" width="200" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="table_bg">
						<table width="100%" border="0" cellspacing="1" cellpadding="0">
							<tr height="22" align="center">
								<td class="schedule_table_header_center_sun"><font color="#740000">일</font></td>
								<td class="schedule_table_header_center">월</td>
								<td class="schedule_table_header_center">화</td>
								<td class="schedule_table_header_center">수</td>
								<td class="schedule_table_header_center">목</td>
								<td class="schedule_table_header_center">금</td>
								<td class="schedule_table_header_center_sat"><font color="#1B1464"></font>토</td>
							</tr>
						<%  int index = (dayOfWeek*-1) + 2;
							while(index <= monthLength){
								out.print("<tr height=\"22\" align=\"center\">");
								out.println("\n");
								for(int j=0; j<=6; j++){
									String sum = new Integer(intYear).toString()+new Integer(intMonth).toString()+new Integer(index).toString();
									if(strToday.equals(sum)){
										out.print("<td bgcolor=\"#FFEFD5\" class=\"schedule_number_today\"");
									}else if(j == 6) { // 토요일
										out.print("<td bgcolor=\"#E7F9FF\" class=\"schedule_number_blue\"");
									}else {
										out.print("<td bgcolor=\"#FFFFFF\" class=\"schedule_number_gray\"");
									}

									if(index > 0 && index <= monthLength){
										out.print(" onmouseover=this.style.backgroundColor=\"#F3F0D2\" onmouseout=this.style.backgroundColor=\"\">" 
										+"<a href=\"#\" onClick=\"javascript:setValue('");

										if(index < 10){ out.print("0"); }
										out.print(index);
										out.print("')\">");
										out.print(index);
										out.print("</a></td>");
										out.println("\n");
									}else {
										out.print("></td>");
										out.println("\n");
									}
									index++;
								}
							out.print("</tr>");
							out.println("\n");
						} %>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<form name="frmCalendar" method="post" style="display:none">
<input type="hidden" name="year" 	value="<%=intYear%>">
<input type="hidden" name="month" 	value="<%=intMonth%>">
</form>
</body>
</html>