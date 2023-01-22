<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"    class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"    class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% 	boolean isEditable = false;
	if(uSesEnt.use_auth.equals("SA") && !obox.get("edit_flag").equals("N")) { isEditable = true; }
%>
<!-- 공통코드 세부  -->
<script language="javascript">
	function goSearch(code_group){
		document.main.action = 'adm02011_list.do?code_group='+code_group;
		document.main.target = '_self';
		document.main.submit();
	}

	var corp_cd = '<%=obox.get("edit_flag").equals("X") ? uSesEnt.dbo : ""%>';
	function goView(code_group,code1,code2,code3) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		$("tr[code='"+code1+code2+code3+"']").addClass("bg-yellow");
		<% if(isEditable) { %>
			var param = "code_group=<%=box.get("code_group")%>&code1="+code1+"&code2="+code2+"&code3="+code3;
			if(corp_cd != '') { param += '&corp_cd='+corp_cd; }
			ajaxReplace("adm02012_edit.do?action_type=view", param, "#dialog-form", function(rtn) {
				$('#dialog-form').modal('show');
			});
		<% } %>
	}
	
	function goWrite() {
		var param = "code_group=<%=box.get("code_group")%>";
		if(corp_cd != '') { param += '&corp_cd='+corp_cd; }
		ajaxReplace("adm02012_edit.do?action_type=write", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}

	function goList(){
		document.main.action = "adm02001_list.do";
		document.main.target = "_self";
		document.main.submit();
	}

	$(function() {
		<% if(isEditable) { %>
			fixTableHeader("MyTable");
		<% } %>
	});
</script>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="selectedRow" value="">

	<h1 class="page-title">공통코드</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:15%;">
			<col style="width:30%;">
			<col style="width:15%;">
			<col style="width:40%;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">코드</td>
				<td><%=obox.get("code_group")%><%if(obox.get("edit_flag").equals("X")){%><font color=red>@<%=uSesEnt.dbo.toLowerCase()%></font><%}%></td>
				<td class="td-head">명칭</td>
				<td><%if(obox.get("edit_flag").equals("X")){%><font color=red>(회사별)</font> <%}%><%=obox.get("group_nm")%>
					<span class="f-right marR60">
					<% if(isEditable) { %>
						<button type="button" id="btnWrite" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
					<% } %>
						<button type="button" id="btnList" class="btn dark" onClick="goList();"><img src="/com/img/ico_btn_list.png">목록</button>
					</span>
				</td>
			</tr>
		</tbody>
	</table>
</form>
	
<div id="divListData" class="contentsRow">
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 146px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<thead>
		  		<tr>
					<th width="30">No</th>
					<th>코드1</th>
					<th>코드2</th>
					<th>코드3</th>
					<th>데이터1</th>
					<th>데이터2</th>
					<th>데이터3</th>
					<th>데이터4</th>
					<th>데이터5</th>
					<th width="40">순서</th>
					<th width="40">사용</th>
				</tr>
			<thead>
			<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>" code="<%=rsWp.get("code1",i)+rsWp.get("code2",i)+rsWp.get("code3",i)%>" style="cursor:pointer" onClick="goView('<%=rsWp.get("code_group",i)%>','<%=rsWp.get("code1",i)%>','<%=rsWp.get("code2",i)%>','<%=rsWp.get("code3",i)%>')"> 
					<td class="t-center"><%=i+1%></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("code1",i)%></font></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("code2",i)%></font></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("code3",i)%></font></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("data1",i)%></font></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("data2",i)%></font></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("data3",i)%></font></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("data4",i)%></font></td>
					<td class="t-left"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("data5",i)%></font></td>
					<td class="t-center"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("sort_order",i)%></font></td>
					<td class="t-center"><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("use_yn",i)%></font></td>
				</tr>	
			<% } %>
			</tbody>
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="11" class="t-center">등록된 자료가 없습니다.</td></tr>
		<% } %>
		</table>
	</div>
	
	<div id="divFrame">
	
	</div>
</div>