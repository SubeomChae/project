<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	
<table id="MyTable" class="table table-bordered table-hover order-column">
<% if(box.get("accunit_yn").equals("G")) { %>
<!-- (구분)재무상태표 -->
	<thead>
		<tr class="table01_title">
			<th rowspan="2">계정과목</th>
			<th colspan="2">목적사업</th>
			<th colspan="2">기금관리</th>
			<th colspan="2">합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</th>
		</tr> 
		<tr class="table01_title">
			<th colspan="2">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
			<th colspan="2">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
			<th colspan="2">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
		</tr>
	</thead>
	<tbody> 
	<% for(int i=0; i < rsWp.getLength(); i++) {	
		String bgcolor = "#ffffff"; 
		if(rsWp.get("row_level",i).equals("1")) { bgcolor = "#f6f6f6"; }
		if(rsWp.get("row_level",i).equals("2")) { bgcolor = "#f0f0f0"; } %>
		<tr bgcolor="<%=bgcolor%>"> 
			<td width="22%" class="t-left"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd_arr",i)%>','<%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%>');"><%}%><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></a></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot00l",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot00r",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot20l",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot20r",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_totxxl",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_totxxr",i,Box.THOUSAND_COMMA)%></td>
		</tr>	
	<% } %>
	</tbody>
</table>
<% }else { %>
<!-- 재무상태표 -->
	<thead>
		<tr class="table01_title">
			<th rowspan="2" width="24%">계정과목</th>
			<th colspan="2" width="38%">
				<% if(box.get("month_flag").equals("M")) { %>
					당월 &nbsp;(<%=box.get("std_year")%>월  <%=box.get("std_month")%>월)
				<%}else { %>
					당기 &nbsp;(<%=box.get("std_year")%>년  <%=box.get("std_month")%>월 <%=DateUtil.getDayCount(box.getInt("std_year"), box.getInt("std_month"))%>일 현재)
				<% } %>
			</th>
			<th colspan="2" width="38%">
				<% if(box.get("month_flag").equals("M")) { %>
					전월 &nbsp;
					<% if(box.get("std_month").equals("01")) { %>
						(<%=Integer.parseInt(box.get("std_year"))-1%>년 12월)
					<%}else { %>
						(<%=box.get("std_year")%>년  <%=StringUtil.lpad(String.valueOf(Integer.parseInt(box.get("std_month"))-1),"0",2)%>월)
					<% } %>
				<%}else { 
					int acc_end_yy = Integer.parseInt(StringUtil.substr(obox.get("acc_end_ymd"),0,4));
					int acc_end_mm = Integer.parseInt(StringUtil.substr(obox.get("acc_end_ymd"),4,6));
					if(acc_end_mm >= box.getInt("std_month") && acc_end_mm != 12) { acc_end_yy = acc_end_yy - 1; } %>
					전기 &nbsp;(<%=acc_end_yy-1%>년  <%=acc_end_mm%>월 <%=StringUtil.substr(obox.get("acc_end_ymd"),6)%>일 현재)
				<% } %>
			</th>
		</tr> 
		<tr class="table01_title">
			<th colspan="2">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
			<th colspan="2">금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
		</tr>
	</thead>
	<tbody> 
	<% for(int i=0; i < rsWp.getLength(); i++) {	
			String bgcolor = "";
			if(rsWp.get("row_level",i).equals("1")) { bgcolor = "#f6f6f6"; }
			if(rsWp.get("row_level",i).equals("2")) { bgcolor = "#f0f0f0"; } %>
		<tr bgcolor="<%=bgcolor%>"> 
			<td width="24%" class="t-left"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd",i)%>','<%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%>');"><%}%><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></a></td>
			<td width="19%" class="t-right"><%=StringUtil.replace(rsWp.get("acct_cd",i),";","").equals("") ? "" : rsWp.get("cur_yy_tot1",i,Box.THOUSAND_COMMA)%></td>
			<td width="19%" class="t-right"><%=StringUtil.replace(rsWp.get("acct_cd",i),";","").equals("") ? "" : rsWp.get("cur_yy_tot2",i,Box.THOUSAND_COMMA)%></td>
			<td width="19%" class="t-right"><%=StringUtil.replace(rsWp.get("acct_cd",i),";","").equals("") ? "" : rsWp.get("pre_yy_tot1",i,Box.THOUSAND_COMMA)%></td>
			<td width="19%" class="t-right"><%=StringUtil.replace(rsWp.get("acct_cd",i),";","").equals("") ? "" : rsWp.get("pre_yy_tot2",i,Box.THOUSAND_COMMA)%></td>
		</tr>
	<% } %>
	</tbody>
<% } %>
</table>
	