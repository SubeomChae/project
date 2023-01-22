<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<% 
	Calendar calendar = Calendar.getInstance();
	setOtherToday(calendar, box.get("year"), box.get("month"), box.get("day"));
	String strToday = getStrToday();
	int intYear  = box.getInt("year");
	int intMonth = box.getInt("month");
	int intDay 	 = box.getInt("day");
	int dayOfWeek = getDayOfWeek();
	int monthLength = getMonthDay(intYear, intMonth);
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
%>
