<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<table id="MyTable" class="table table-bordered table-hover order-column">
<% if(box.get("accunit_yn").equals("G")) { %>	<!-- (구분)일반관리비명세서 -->
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
			<td width="18%" class="t-left"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd_arr",i)%>','<%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%>');"><%}%><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></a></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot00l",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot00r",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot20l",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_tot20r",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_totxxl",i,Box.THOUSAND_COMMA)%></td>
			<td width="13%" class="t-right"><%=rsWp.get("cur_yy_totxxr",i,Box.THOUSAND_COMMA)%></td>
		</tr>	
	<% } %>
	</tbody>
<% }else { %>	<!-- 일반관리비명세서 -->
	<thead>
		<tr>
			<th width="34%">계정과목</th>
			<th width="22%">전월누계</th>
			<th width="22%">당월증감</th>
			<th width="22%">당월누계</th>
		</tr>
	</thead> 
	<% for(int i=0; i < rsWp.getLength(); i++) {	
			String bgcolor = "#ffffff";
			if(rsWp.get("row_level",i).equals("1")) { bgcolor = "#f6f6f6"; }
			if(rsWp.get("row_level",i).equals("2")) { bgcolor = "#f0f0f0"; } %>
		<tr bgcolor="<%=bgcolor%>"> 
			<td class="t-left"><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd_arr",i)%>','<%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%>');"><%}%><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","&nbsp;&nbsp;&nbsp;&nbsp;")%></a></td>
			<td class="t-right"><%=rsWp.get("pre_yy_tot",i,Box.THOUSAND_COMMA)%></td>
			<td class="t-right"><%=rsWp.get("cur_mm_tot",i,Box.THOUSAND_COMMA)%></td>
			<td class="t-right"><%=rsWp.get("cur_yy_tot",i,Box.THOUSAND_COMMA)%></td>
		</tr>	
	<% } %>
<% } %>
</table>
	