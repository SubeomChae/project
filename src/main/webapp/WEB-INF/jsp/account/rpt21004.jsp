<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- 합계잔액시산표 -->

<table id="MyTable" class="table table-bordered table-hover order-column">
	<thead>
		<tr>
			<th colspan="2">차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변</th>
			<th rowspan="2" width="28%">계정과목</th>
			<th colspan="2">대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;변</th>
	    </tr> 
		<tr>
			<th width="18%">잔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
			<th width="18%">합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</th>
			<th width="18%">합&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</th>
			<th width="18%">잔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
		</tr>
	</thead>
	<tbody> 
	<% for(int i=0; i < rsWp.getLength(); i++) {	
			String bgcolor = "";
			if(rsWp.get("row_level",i).equals("1")) { bgcolor = "#f6f6f6"; }
			if(rsWp.get("row_level",i).equals("2")) { bgcolor = "#f0f0f0"; } %>
		<tr bgcolor="<%=bgcolor%>" <%if(bgcolor.equals("")){%>onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"<%}%>> 
			<td class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("cha_amt1",i,Box.THOUSAND_COMMA)%></td>
			<td class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("cha_amt2",i,Box.THOUSAND_COMMA)%></td>
			<td nowrap><%if(!box.get("excel_yn").equals("Y")){%><a href="javascript:goDetail('<%=rsWp.get("acct_cd",i)%>','<%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%>');"><%}%><%=StringUtil.replace(rsWp.get("acct_nm",i),"^","")%></a></td>
			<td class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("dae_amt2",i,Box.THOUSAND_COMMA)%></td>
			<td class="t-right"><%=rsWp.get("acct_cd",i).equals("") ? "" : rsWp.get("dae_amt1",i,Box.THOUSAND_COMMA)%></td>
		</tr>	
	<% } %>
	</tbody>
</table>