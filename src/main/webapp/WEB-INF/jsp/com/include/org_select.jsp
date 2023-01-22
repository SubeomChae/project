<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%	String formNmae = box.getNvl("formNmae","main"); %>
<script language='javascript'>
	function orgSelectInit() {
	<% if("D,U,S".indexOf(uSesEnt.group_type) >= 0) { %>
		if(!isEmpty(document.<%=formNmae%>.prst_org_cd)) { changePrstOrg(document.<%=formNmae%>, document.<%=formNmae%>.prst_org_cd.value, '<%=box.get("gather_org_cd")%>'); }
	<% } %>
	<% if("C,D,U,S".indexOf(uSesEnt.group_type) >= 0) { %>
		if(!isEmpty(document.<%=formNmae%>.gather_org_cd)) { changeGatherOrg(document.<%=formNmae%>, document.<%=formNmae%>.gather_org_cd.value, '<%=box.get("mng_main_cd")%>'); }
	<% } %>
	}
</script>
<% if("B,C,D,K,Y,U,S".indexOf(uSesEnt.group_type) >= 0) { %>
	<tr>
		<td class="td-head">제출기관</td>
		<td>
		<% if("D,K,Y,U,S".indexOf(uSesEnt.group_type) >= 0) { %>
			<select name="prst_org_cd" title="제출기관" class="bs-select form-control" style="width:95%" onChange="changePrstOrg(document.<%=formNmae%>, this.value, '')">
				<option value=''>전체</option>
				<%=CodeUtil.optList("PR_COMTB_ORGN01_LIST","LISTCODE",box.get("prst_org_cd"),"C","","","","")%>
			</select>
		<% }else { %>
			<%=uSesEnt.prst_org_nm%><input type="hidden" name="prst_org_cd" value="<%=uSesEnt.prst_org_cd%>">
		<% } %>
		</td>
		<td class="td-head">취합기관</td>
		<td>
		<% if("D,K,Y,U,S".indexOf(uSesEnt.group_type) >= 0) { %>
			<select name="gather_org_cd" title="취합기관" class="bs-select form-control" style="width:95%" onChange="changeGatherOrg(document.<%=formNmae%>, this.value, '')">
				<option value=''>전체</option>
			</select>
		<% }else if(uSesEnt.group_type.equals("C")) { %>
			<select name="gather_org_cd" title="취합기관" class="bs-select form-control" style="width:95%" onChange="changeGatherOrg(document.<%=formNmae%>, this.value, '')">
				<option value=''>전체</option>
				<%=CodeUtil.optList("PR_COMTB_ORGN01_LIST","LISTCODE",box.get("gather_org_cd"),"B",uSesEnt.group_cd,"","","")%>
			</select>
		<% }else if(uSesEnt.group_type.equals("B") && !box.get("upper_cd").equals("")) { %>
			<select name="gather_org_cd" title="취합기관" class="bs-select form-control" style="width:95%" onChange="changeGatherOrg(document.<%=formNmae%>, this.value, '')">
				<%=CodeUtil.optList("PR_COMTB_ORGN01_LIST","LISTCODE",box.get("gather_org_cd"),"B",box.get("upper_cd"),"","","")%>
			</select>
		<% }else if(uSesEnt.group_type.equals("B")) { %>
			<%=uSesEnt.gather_org_nm%><input type="hidden" name="gather_org_cd" value="<%=uSesEnt.gather_org_cd%>">
		<% } %>
		</td>
		<td class="td-head">관리주체</td>
		<td>
		<% if("C,D,K,Y,U,S".indexOf(uSesEnt.group_type) >= 0) { %>
			<select name="mng_main_cd" title="관리주체" class="bs-select form-control" style="width:95%">
				<option value=''>전체</option>
			</select>
		<% }else if(uSesEnt.group_type.equals("B")) { %>
			<select name="mng_main_cd" title="관리주체" class="bs-select form-control" style="width:95%">
				<option value=''>전체</option>
				<%=CodeUtil.optList("PR_COMTB_ORGN01_LIST","LISTCODE",box.get("mng_main_cd"),"A",uSesEnt.group_cd,"","","")%>
			</select>
		<% } %>
		</td>
	</tr>
<% }else { %>
	<input type="hidden" name="prst_org_cd" 	value="<%=uSesEnt.prst_org_cd%>">
	<input type="hidden" name="gather_org_cd" 	value="<%=uSesEnt.gather_org_cd%>">
	<input type="hidden" name="mng_main_cd" 	value="<%=uSesEnt.group_cd.startsWith("A") ? uSesEnt.group_cd : ""%>">
<% } %>
