<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="menuWp"	class="egovframework.cbiz.RsWrapper"	scope="session" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 사이트맵 -->
<script language="JavaScript" type="text/JavaScript">
	function go_menu(menu_id, default_page) {
		parent.leftFrame.go_menu(menu_id, default_page);
    }  
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="menu_id" value="<%=box.get("menu_id")%>">

	<h1 class="page-title">사이트맵</h1>
	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 78px);">
		<table class="table table-striped table-bordered order-column">
			<colgroup>
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:20%">
			</colgroup>
				<tr>
					<th>인사관리</th>
					<th>사업계획</th>
					<th>목적사업</th>
					<th>대부사업</th>
					<th>회계관리</th>										
				</tr>
				<tr>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  int row_index = 0;
							for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("A")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							<tr>
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('A','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>
					</td>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("B")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							
							<tr>
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('B','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>
					</td>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("C")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							
							<tr>
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('C','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>
					</td>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("D")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							
							<tr height="20">
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('D','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>				
					</td>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("E")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							
							<tr>
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('E','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>				
					</td>															
				</tr>
		</table>
		<table class="table table-striped table-bordered table-hover table-cover">
			<colgroup>
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:20%">
			</colgroup>
				<tr>
					<th>세무관리</th>
					<th>전자결재</th>
					<th>커뮤니티</th>
					<th>기준정보</th>	
					<th></th>				
				</tr>
				<tr>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) {
								if(!menuWp.get("menu_id",i).startsWith("F")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
		
							<tr height="20">
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('F','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>
					</td>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("G")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							
							<tr height="20">
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('G','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>
					</td>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("H")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							
							<tr height="20">
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('H','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>
					</td>
					<td class="t-left" style="vertical-align: top;">
						<table width="100%" border="0">
						<%  for(int i=row_index; i < menuWp.getLength(); i++) { 
								if(!menuWp.get("menu_id",i).startsWith("Z")) { row_index = i; break; }
								if(menuWp.get("menu_id",i).length() == 1) { continue; } %>
							
							<tr height="20">
								<td style="border:none">
								<% if(menuWp.getInt("menu_lvl",i) == 2) { %>
									<img src="/com/img/bullet_a.gif" border="0" align="absmiddle">
								<% }else if(menuWp.getInt("menu_lvl",i) == 3) { %>
									&nbsp;&nbsp;&nbsp;&nbsp;<img src="/com/img/bullet_b.gif" border="0" align="absmiddle">&nbsp;
								<% }else { %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 
								<% } %>
								<% if(!menuWp.get("default_page",i).equals("")) { %>
									<a href="javascript:go_menu('Z','<%=menuWp.get("default_page",i)%>')"><%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%></a>
								<% }else { %>
									<%=menuWp.getInt("menu_lvl",i) == 2 ? "<b>" : ""%><%=menuWp.get("menu_nm",i)%><%=menuWp.getInt("menu_lvl",i) == 2 ? "</b>" : ""%>
								<% } %>
								</td>
							</tr>
						<% } %>
						</table>				
					</td>
					<td></td>
				</tr>
		</table>
	</div>
</form>