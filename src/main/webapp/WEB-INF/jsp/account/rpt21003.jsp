<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<table id="MyTable" class="table table-bordered table-hover order-column">
<% if(box.get("accunit_yn").equals("G")) { %>	<!-- (구분)손익계산서 -->
	<thead>
		<tr>
			<th rowspan="2">계정과목</th>
			<th colspan="2">목적사업</th>
			<th colspan="2">기금관리</th>
			<th colspan="2">합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</th>
		</tr> 
		<tr>
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
			<td width="18%" class="t-left"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd",i)%>','<%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%>');"><%}%><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></a></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot00l",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot00r",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot20l",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot20r",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_totxxl",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_totxxr",i,Box.THOUSAND_COMMA)%></td>
		</tr>	
	<% } %>
	</tbody>
<% }else { %> <!-- 손익계산서 -->
	<thead>
		<tr>
			<th width="24%" rowspan="2">계정과목</th>
			<th width="38%" colspan="2">
				<%
					boolean pass_acounting = false;
					if(!obox.get("account_closing").equals("12") && Integer.parseInt(obox.get("account_closing")) >= box.getInt("std_month")) { pass_acounting = true; }
					int acc_start_yy = Integer.parseInt(StringUtil.substr(obox.get("acc_start_ymd"),0,4));
					String acc_start_mm = StringUtil.substr(obox.get("acc_start_ymd"),4,6);
					String acc_start_dd = StringUtil.substr(obox.get("acc_start_ymd"),6);
					int acc_end_yy = Integer.parseInt(StringUtil.substr(obox.get("acc_end_ymd"),0,4))-1;
					String acc_end_mm = StringUtil.substr(obox.get("acc_end_ymd"),4,6);
					String acc_end_dd = StringUtil.substr(obox.get("acc_end_ymd"),6);
					if(pass_acounting) { acc_start_yy--; }
					if(pass_acounting) { acc_end_yy--; }
				%>
				<% if(box.get("month_flag").equals("M")) { %>
					당월<br>(<%=box.get("std_year")%>월  <%=box.get("std_month")%>월)
				<%}else { %>
					당기<br>(<%=acc_start_yy%>년  <%=acc_start_mm%>월 <%=acc_start_dd%>일 부터 &nbsp;<%=box.get("std_year")%>년  <%=box.get("std_month")%>월  <%=DateUtil.getDayCount(box.getInt("std_year"), box.getInt("std_month"))%>일 까지)
				<% } %>
			</th>
			<th width="38%" colspan="2">
				<% if(box.get("month_flag").equals("M")) { %>
					전월<br>
					<% if(box.get("std_month").equals("01")) { %>
						(<%=Integer.parseInt(box.get("std_year"))-1%>년 12월)
					<%}else { %>
						(<%=box.get("std_year")%>년  <%=StringUtil.lpad(String.valueOf(Integer.parseInt(box.get("std_month"))-1),"0",2)%>월)
					<% } %>
				<%}else { %>
					전기<br>(<%=acc_start_yy-1%>년  <%=acc_start_mm%>월 <%=acc_start_dd%>일 부터 &nbsp;<%=acc_end_yy%>년  <%=acc_end_mm%>월 <%=acc_end_dd%>일 까지)
				<% } %>
			</th>
		</tr> 
		<tr>
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
			<td width="19%" class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("cur_yy_tot1",i,Box.THOUSAND_COMMA)%></td>
			<td width="19%" class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("cur_yy_tot2",i,Box.THOUSAND_COMMA)%></td>
			<td width="19%" class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("pre_yy_tot1",i,Box.THOUSAND_COMMA)%></td>
			<td width="19%" class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("pre_yy_tot2",i,Box.THOUSAND_COMMA)%></td>
		</tr>	
	<% } %>
	</tbody>
<% } %>
</table>
	