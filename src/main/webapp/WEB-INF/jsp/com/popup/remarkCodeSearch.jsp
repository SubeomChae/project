<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 적요코드 찾기 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">	
	function goSearch() {
		if(isEmpty(document.pForm.acct_nm)) {
			alert('적요 명칭에 포함되는 일부 문자열을 입력하신 후, 검색하십시오.');
			document.pForm.acct_nm.focus();
			return;
		}
		document.pForm.action = "remarkCodeSearch.do";
		document.pForm.target = "_self";
		document.pForm.submit();
	}	
	
	function goPage(page_count) {
		document.pForm.page_count.value = page_count;
		ajaxReplaceForm("remarkCodeSearch.do", "#pForm", "#divListData");
		return false;
	}
	
	function goSelect(remark_cd, remark_nm) {
		var openURL = getMethodFromUrl(opener.location.href).substring(0,8);
			
		opener.document.main.etc_remark.value = remark_nm;
		parent.window.close();
	}

	function goSave() {
		if (formValidate("#pForm")) {
			if(confirm('신규 적요코드를 등록하시겠습니까?')) {
				ajaxSubmitForm("remarkCode_insert.do","#pForm", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						toastPop1('등록되었습니다.');
						goSearch();
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}

	function goDelete(remark_cd) {
		if (confirm('삭제하시겠습니까?')) {
			document.pForm.remark_cd.value = remark_cd;
			ajaxSubmitForm("remarkCode_delete.do","#pForm", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					goSearch();
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
</script>

<form id="pForm" name="pForm" method="post" class="fType" action="">
<input type="hidden" name="acct_cd" 	value="<%=box.get("acct_cd")%>">
<input type="hidden" name="acct_nm" 	value="<%=box.get("acct_nm")%>">
<input type="hidden" name="remark_cd" 	value="">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">적요코드 찾기</h1>
	
	<div class="table-top-guide">
		<span style="color:#01a1db;"><b>계정과목 : <%=box.get("acct_cd")%>&nbsp;<%=box.get("acct_nm")%></b></span> 
		<p>명칭에 포함되는 일부 문자열을 입력해서 검색할 수 있습니다.(예: '<b>등기</b>', '<b>야근</b>' 등)</p></p>
	</div>
	
	<table class="search-panel table table-bordered">
  		<tr> 
			<td>
				<select name="search_key" class="bs-select form-control" style="width:80px">
					<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>적요명</option>
				</select>
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:30%;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
				<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
			</td>
	  	</tr>
    </table>
    
	<div id="divListData" class="contentsRow">
<% } %>	    
		<div class="table-scrollable" style="height:380px">
			<table class="table table-view table-bordered">
				<thead>
					<tr>
					  <th width="15%">적요코드</th>
					  <th width="85%">적요명</th>
					  <th width="20"></th>
				  	<% if(rsWp.getLength() == 0) { %>
					<tr height="25"><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% } %>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0; i < rsWp.getLength(); i++) {  %>
	             	<tr height="25">
				  		<td class="t-center"><%=rsWp.get("remark_cd",i)%></td>
				  		<td><a href="javascript:goSelect('<%=rsWp.get("remark_cd",i)%>','<%=rsWp.get("remark_nm",i)%>');"><%=rsWp.get("remark_nm",i)%></a>
					<% if(uSesEnt.use_auth.equals("SA") || (uSesEnt.use_auth.equals("S") && uSesEnt.corp_cd.equals(rsWp.get("corp_cd",i))) || (uSesEnt.corp_cd.equals(rsWp.get("corp_cd",i)) && uSesEnt.empl_no.equals(rsWp.get("sys_reg_id",i)))) { %>
						<td class="t-center">
							<button type="button" class="btn btn-primary btn-table" onClick="goDelete('<%=rsWp.get("remark_cd",i)%>');">삭제</button>
			  			</td>
			  		</tr>
					<% } %>
				<% } %>
				</tbody>
		  	</table>
		</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
	</div>
	<% if(rsWp.getLength() > 0) {  %>
   		<%=PageUtil.makePaging(box, rsWp, 30, request)%>
	<% } %>
	<br>			
	<div class="table-top-guide">
		<h2 class="page-title-2depth">신규 적요코드 추가</h2>
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr height="30"> 
				<td style="padding-left:10px"><input type="text" name="remark_nm" value="" maxlength="50" class="form-control required" title="적요명" style="width:70%;ime-mode:active;">
				<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
				<td style="padding-left:5px"></td>
	          	<td width="55"></td>
			</tr>
	    </table>
	</div>	
</form>
<% } %>