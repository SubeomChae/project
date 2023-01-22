<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if(!rbox.get("pay_guide").equals("")) { %>
<div class="table-scrollable">
	<table class="table table-view table-bordered">
		<tr>
			<th><%=rbox.get("bugt_nm")%></th>
		</tr>
		<tr>
			<td class="t-left"><%=rbox.get("pay_guide",Box.MULTILINE_TEXT)%></td>
		</tr>
	</table>
</div>
<% } %>