<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% RsWrapper bknoWp = CodeUtil.getRsWrapper("PR_BASTB_MAST01_LIST","LIST_BKNO", "", box.get("facil_no"),"","","","");
   if(bknoWp.getLength() > 1) { %> 
	<select name="bk_no" title="변경차수" class="bs-select form-control f-left" style="width:295px" onChange="goSearch()">
	<% for(int i=0; i < bknoWp.getLength(); i++) { %>
		<option value="<%=bknoWp.get("code",i)%>" <%=bknoWp.get("code",i).equals(box.get("bk_no"))?"selected":""%>><%=bknoWp.get("data",i)%></option>
	<% } %>
	</select>
<% } %>
