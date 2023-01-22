<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>목적사업계획서</title>

<script language='javascript'>
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<table class="table table-bordered">
	<tr>
		<th width="15%">사업구분</th>
		<th width="15%">사업명</th>
		<th width="30%">목적</th>
		<th width="40%">지급기준</th>
       		</tr> 
<% if(rsWp.getLength() == 0) { %>
	<tr height="25"><td colspan="6" align="center">등록된 자료가 없습니다.</td></tr>
<% }else {
	int pass_cnt = 0;
	for(int i=0; i < rsWp.getLength(); i++) { 
		if(rsWp.get("bugt_cd",i).length() > 6) { continue; } %>
		<tr height="28"> 
		<% if(pass_cnt==0) {
		int span_cnt = 1;
		for(int j=i+1; j < rsWp.getLength(); j++) { 
			if(!rsWp.get("bugt_cd", i).substring(0,1).equals(rsWp.get("bugt_cd", j).substring(0,1))) { break; }
			span_cnt ++;
		} %>
		<th rowspan="<%=span_cnt%>"><%=rsWp.get("bugt_cd", i).startsWith("L") ? "대부사업":"목적사업"%></th>
	<%  pass_cnt = span_cnt - 1;
		}else {
			pass_cnt --;
		} %>			
		<td><%=rsWp.get("bugt_nm",i)%></td> 
		<td class="t-left"><%=rsWp.get("bugt_purpose",i,Box.MULTILINE_TEXT)%></td>
		<td class="t-left"><%=rsWp.get("pay_guide",i,Box.MULTILINE_TEXT)%></td>
	</tr>	
<%   } %>
<% } %>
</table>
</form>
