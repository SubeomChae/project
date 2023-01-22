<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>사업계획 계정과목코드</title>

<script language="javascript">
	function goSearch() {
		ajaxReplaceForm("bud11002_list.do", "#main", "#divListData",null);
		fixTableHeader("MyTable");
	}
	
	function goSave() {
		if (formValidate("#main")) {
			if(confirm('저장하시겠습니까?')) {
				ajaxSubmitForm("bud11002_update.do","#main", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	$(function() {
		$(".page-logo-text").html("사업계획 계정과목코드");
		fixTableHeader("MyTable");
	});
</script>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<div id="divListData" class="contentsRow">
	<div class="table-scrollable scrollOptionY" style="height:420px">
		<table id="MyTable" class="table table-view table-bordered">
			<thead>
				<tr>
					<th width="20%">코드</th>
					<th width="45%">계정과목명</th>
					<th width="25%">계정분류</th>
					<th width="10%">선택</th>
				</tr>
			</thead>
			<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr height="25"><td colspan="4">등록된 자료가 없습니다.</td></tr>
			<% }else {
				for(int i=0; i < rsWp.getLength(); i++) { 
					if(rsWp.get("acct_cd",i).length() < 5) { continue; } 
					if(rsWp.get("acct_cd",i).startsWith("121") || rsWp.get("acct_cd",i).startsWith("711")) { continue; }  %>
				<tr> 
					<td><%=rsWp.get("acct_cd",i)%></td>
					<td style="padding-left:<%=(rsWp.get("acct_cd",i).length()-4)*10%>px"><%=rsWp.get("acct_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("upper_nm",i)%></td>
					<td class="t-center">
						<label class="mt-checkbox mt-checkbox-outline">
							<input type="checkbox" name="acct_cd" value="<%=rsWp.get("acct_cd",i)%>|" <%=rsWp.get("plan_yn",i).equals("Y")?"checked":""%>><span/>
						</label>
					</td>
				</tr>	
				<% } %>
			<% } %>
			</tbody>
	  	</table>
	</div>
		<div class="table-bottom-control">
			<span style="width: 100%;">
				<span style="float: right;">
					<button id="btnSave" type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_edit.png">저장</button>
				</span>
			</span>
		</div>
</div>
</form>