<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 사원 찾기  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		document.pForm.page_count.value = '';
		ajaxReplaceForm("emplNoSearch.do", "#pForm", "#divListData");
	}

	function goPage(page_count) {
		document.pForm.page_count.value = page_count;
		ajaxReplaceForm("emplNoSearch.do", "#pForm", "#divListData");
		return false;
	}

	function goSelect(empl_no, empl_nm, dept_cd, dept_nm){
		var openURL = getMethodFromUrl(opener.location.href).substring(0,8);
		
		if(openURL == 'rpt01001' || openURL == 'rpt11001') { // 보조부, 계정명세서
			opener.document.main.search_cd.value = empl_no;
			opener.document.main.search_nm.value = empl_nm;
		}else if(openURL == 'wel01001' || openURL == 'wel02003' || openURL == 'lon01001' || openURL == 'wel02001') { // 목적사업신청, 대부금 신청
			opener.findEmployeeNoPost(empl_no, empl_nm);
		}else if(openURL == 'sgn01001' || openURL == 'sgn02001') { // 전자결재
			opener.findEmployeeNoPost(empl_no, empl_nm, '<%=box.get("column")%>');
		}else if(!isEmpty(document.pForm.column)) {
			arr = document.pForm.column.value.split(',');
			target_cd = arr[0]; target_nm = arr[1];
			form_nm = arr.length > 2 ? arr[2] : 'main';
			eval('opener.document.'+form_nm+'.'+target_cd).value = empl_no;
			eval('opener.document.'+form_nm+'.'+target_nm).value = empl_nm;
		}else {
			opener.document.all["empl_no"].value = empl_no;
			opener.document.all["empl_nm"].value = empl_nm;
		}
		parent.window.close();
	}
	
	$(function() {
		$(".page-logo-text").html("사원찾기");	
	});
</script>

<form id="pForm" name="pForm" method="post" action="" class="fType">
<input type="hidden" name="column" 		value="<%=box.get("column")%>">
<input type="hidden" name="dept_cd" 	value="<%=box.get("dept_cd")%>">
<input type="hidden" name="empl_class" 	value="<%=box.get("empl_class")%>">
<input type="hidden" name="retire_flag" value="<%=box.get("retire_flag")%>">
<input type="hidden" name="page_count"	value="">
  
	<div class="table-top-guide">
		검색하고자 하는 성명/사번 또는 부서명을 기재하세요.
		<p>명칭에 포함되는 일부 문자열을 입력해서 검색할 수 있습니다.(예: '<b>홍길동</b>', '<b>홍</b>' 등)</p>
	</div>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:100%;">
		</colgroup>
		<tbody>
			<tr>
				<td class="form-inline">
					<select name="search_key" class="bs-select form-control" style="width:80px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
					<input type="text" name="search_val" value="<%=box.get("search_val",Box.SPECIAL_CHAR)%>" class="form-control" style="width:150px;" onkeydown="if(event.keyCode == 13) goSearch();">
					<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
				
<div id="divListData" class="contentsRow">
<% } %>

	<div class="table-scrollable" style="height:360px;overflow-y:auto">
		<table class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
				  <th width="15%">사번</th>
				  <th width="15%">성명</th>
				  <th width="20%">직위</th>
				  <th width="35%">부서명</th>
				  <th width="15%">생년월일</th>
				</tr>
			</thead>
			<tbody>
   			<% for(int i=0; i < rsWp.getLength(); i++) {  %>
                <tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase">
				  <td align="center"><%=rsWp.get("empl_no",i)%></td>
				  <td align="center"><a href="javascript:goSelect('<%=rsWp.get("empl_no",i)%>','<%=rsWp.get("empl_nm",i)%>','<%=rsWp.get("dept_cd",i)%>','<%=rsWp.get("dept_nm",i)%>');"><%=rsWp.get("empl_nm",i)%></a></td>
				  <td align="center"><%=rsWp.get("position_nm",i)%></td>
				  <td><%=rsWp.get("dept_nm",i)%></td>
				  <td align="center"><%=rsWp.get("birth_ymd",i,Box.DEF_DATE_FMT)%></td>
				</tr>
   			<% } %>      
			</tbody>         
		</table>
	</div>
	
	<%=PageUtil.makePaging(box, rsWp, 30, request)%>
	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>