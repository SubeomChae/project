<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 주간일정 -->
<style type="text/css">
.schedule_table_header_center {height: 22px; background-color: #E8E8E8; }
.schedule_table_header_center_sun {height: 22px; background-color: #FAF2F2; }
.schedule_table_header_center_sat {height: 22px; background-color: #E7F9FF; }
</style>
<script language='javascript'>
	function goSearch() {
		document.main.action = 'dia11004_list.do';
		document.main.target = '_self';
		document.main.submit();
	}	

	function goMoveWeek(sys_ymd) {
		document.main.action = 'dia11004_list.do?sys_ymd='+sys_ymd;
		document.main.target = '_self';
		document.main.submit();
	}	
	
	function openPlanPopup(plan_no, action_type) {
 		var theUrl = '/community/pd/' + (action_type == 'SELECT' ? 'dia11002_select.do' : 'dia11003_edit.do');
		popupOpen("about:blank", "planPopup", 500, 400); 
		
		document.main.action = theUrl + '?popup_yn=Y&plan_no='+plan_no;
		document.main.target = 'planPopup';
		document.main.submit();
	}
	
	function go_select_cell(new_ymd) {
		var old_ymd = document.main.selectedYmd.value;
		document.main.selectedYmd.value = new_ymd;

		document.getElementById('td_'+old_ymd).style.backgroundColor = 'white';
		document.getElementById('td_'+new_ymd).style.backgroundColor = 'yellow';
		<% for(int i=0; i < rsWp.getLength(); i++) { %>
			if(new_ymd == '<%=rsWp.get("start_ymd",i)%>') {
				document.getElementById('tr_<%=i%>').style.backgroundColor = 'yellow';
			}else {
				document.getElementById('tr_<%=i%>').style.backgroundColor = 'white';
			}
		<% } %>
	}
</script> 

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="selectedYmd"		value="<%=DateUtil.toString("yyyyMMdd")%>">
<div style="height:calc(70vh - 45px)">
	<table class="table table-view table-bordered">
		<tr>
			<th colspan="7" class="t-left">
				<select name="cal_range" class='bs-select form-control' style="width:90px" onChange="if(this.value=='M') { parent.go_calendar('M'); }">
					<option value='W' selected>주간일정</option>
					<option value='M'>월간일정</option>
				</select>
				&nbsp;
				<a href="javascript:goMoveWeek('<%=DateUtil.addDate(obox.get("start_ymd"), -7, "yyyyMMdd", "D")%>')"><img src="/com/img/l2.gif" align="absmiddle" border="0"></a>
				&nbsp;<b><%=obox.get("weekly_txt")%></b>
				<a href="javascript:goMoveWeek('<%=DateUtil.addDate(obox.get("start_ymd"),  7, "yyyyMMdd", "D")%>')"><img src="/com/img/r2.gif" align="absmiddle" border="0"></a>
				<span style="float:right">
					<button type="button" class="btn btn-primary btn-table" onClick="openPlanPopup('','EDIT');" style="float:right">새 일정 등록</button>
				</span>
			</th>
		</tr>
		<tr style="height:30px; !important">
			<td width="13%" class="schedule_table_header_center_sun" style="text-align:center"><font color="#740000"><%=DateUtil.addDate(obox.get("start_ymd"), 0, "MM/dd", "D")%>(일)</font></td>
			<td width="13%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 1, "MM/dd", "D")%>(월)</td>
			<td width="13%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 2, "MM/dd", "D")%>(화)</td>
			<td width="13%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 3, "MM/dd", "D")%>(수)</td>
			<td width="13%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 4, "MM/dd", "D")%>(목)</td>
			<td width="13%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 5, "MM/dd", "D")%>(금)</td>
			<td width="13%" class="schedule_table_header_center_sat" style="text-align:center"><font color="#1B1464"></font><%=DateUtil.addDate(obox.get("start_ymd"), 6, "MM/dd", "D")%>(토)</td>
		</tr>
	<%	String memo_txt[] = {"","","","","","","","","","","","","",""};
		for(int i=0; i < 14; i++) {
			String today = DateUtil.addDate(obox.get("start_ymd"), i, "yyyyMMdd", "D");
			for(int k=0; k < rsWp.getLength(); k++) {
				if(today.compareTo(rsWp.get("start_ymd",k)) >= 0 && today.compareTo(rsWp.get("end_ymd",k)) <= 0) {  
					String color = "";
					if(rsWp.get("plan_class_nm",k).startsWith("개인")) { color = "blue"; }
					if(rsWp.get("plan_class_nm",k).startsWith(uSesEnt.dept_nm)) { color = "4488dd"; }
					memo_txt[i] += (memo_txt[i].equals("")?"":"<br>");
					String memo = rsWp.getCutStr("subject",k,50);
					memo_txt[i] += "<a href=\"javascript:openPlanPopup('"+rsWp.get("plan_no",k)+"','SELECT');\"><span title='"+rsWp.get("plan_memo",k)+"' style=\"font-size:11px;font-weight:normal;color:"+color+";letter-spacing:-2px;\">" + memo.replace("@@FONT@@","<font color='red'><b>").replace("@@FONT_END@@","</b></font>") + "</span></a>";
				}
			}
			
		}
		String TDstyle = "style='adding:2 2 2 2;cursor:pointerbackgroundColor=" + DateUtil.toString("yyyyMMdd");
		int startPos = 0;
	%>	
		<tr id="tr_A" style="height:180px; !important">
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),0,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),0,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),0,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),1,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),1,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),1,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),2,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),2,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),2,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),3,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),3,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),3,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),4,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),4,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),4,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),5,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),5,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),5,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),6,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),6,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),6,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
		</tr>
		<tr style="height:30px; !important">
			<td width="14%" class="schedule_table_header_center_sun" style="text-align:center"><font color="#740000"><%=DateUtil.addDate(obox.get("start_ymd"), 7, "MM/dd", "D")%>(일)</font></td>
			<td width="14%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 8, "MM/dd", "D")%>(월)</td>
			<td width="14%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 9, "MM/dd", "D")%>(화)</td>
			<td width="14%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 10, "MM/dd", "D")%>(수)</td>
			<td width="14%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 11, "MM/dd", "D")%>(목)</td>
			<td width="14%" class="schedule_table_header_center" style="text-align:center"><%=DateUtil.addDate(obox.get("start_ymd"), 12, "MM/dd", "D")%>(금)</td>
			<td width="14%" class="schedule_table_header_center_sat" style="text-align:center"><font color="#1B1464"></font><%=DateUtil.addDate(obox.get("start_ymd"), 13, "MM/dd", "D")%>(토)</td>
		</tr>
		<tr id="tr_B" style="height:180px; !important">
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),7,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),7,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),7,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),8,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),8,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),8,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),9,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),9,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),9,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),10,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),10,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),10,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),11,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),11,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),11,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),12,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),12,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),12,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
			<td id="td_<%=DateUtil.addDate(obox.get("start_ymd"),13,"yyyyMMdd","D")%>" align="center" style="cursor:pointer;<%=DateUtil.addDate(obox.get("start_ymd"),13,"yyyyMMdd","D").equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>" onClick="go_select_cell('<%=DateUtil.addDate(obox.get("start_ymd"),13,"yyyyMMdd","D")%>');"><%=memo_txt[startPos++]%></td>
		</tr>
	</table>
</div>
<div class="table-scrollable scrollOptionY" style="height:(30vh -50px)">
	<table class="table table-view table-bordered">
		<tr>
			<th colspan="3"><img src="/com/img/bullet_e.gif"> <b>주간(<%=obox.get("weekly_txt")%>) 세부일정</b></th>
		</tr>
		<tr>
			<td class="td-head"><b>일시</b></td>
			<td class="td-head"><b>제목</b></td>
			<td class="td-head"><b>세부내용</b></td>
		</tr>
	<% if(rsWp.getLength() == 0) { %>	
		<tr height="25"><td colspan="3" class="t-center">등록된 일정이 없습니다.</td></tr>
	<% }else {	
		for(int i=0; i < rsWp.getLength(); i++) { 
			String dateStr = rsWp.get("start_ymd",i).substring(4,6)+"."+rsWp.get("start_ymd",i).substring(6)+"("+rsWp.get("start_week",i)+")";
			if(!rsWp.get("start_hhmm",i).equals("")) { dateStr += " "+rsWp.get("start_hhmm",i).substring(0,2)+":"+rsWp.get("start_hhmm",i).substring(2); }
			if(!rsWp.get("end_ymd",i).equals(rsWp.get("start_ymd",i))) { dateStr += " ~ "+rsWp.get("end_ymd",i).substring(4,6)+"."+rsWp.get("end_ymd",i).substring(6)+"("+rsWp.get("end_week",i)+")"; }
			if(!rsWp.get("end_hhmm",i).equals("") && (!rsWp.get("end_ymd",i).equals(rsWp.get("start_ymd",i)) || !rsWp.get("end_hhmm",i).equals(rsWp.get("start_hhmm",i)))) { 
			if(dateStr.indexOf(" ~ ") < 0) { dateStr += " ~ "; }
			dateStr += " "+rsWp.get("end_hhmm",i).substring(0,2)+":"+rsWp.get("end_hhmm",i).substring(2); 
			} %>
		<tr id="tr_<%=i%>" height="25" style="<%=rsWp.get("start_ymd",i).equals(DateUtil.toString("yyyyMMdd"))?"background-color:yellow":""%>"> 
			<td><%=dateStr%></td>
			<td><%=rsWp.get("subject",i)%></td>
			<td><%=rsWp.get("plan_memo",i,Box.MULTILINE_TEXT).replace("@@FONT@@","<font color='red'><b>").replace("@@FONT_END@@","</b></font>")%></td>
		</tr>
		<% } %>
	<% } %>
	</table>
</div>
</form>