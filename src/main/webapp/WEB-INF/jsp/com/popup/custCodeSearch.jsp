<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 거래처 찾기 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">	
	function goSearch() {
		if(isEmpty(document.main.search_val)) {
			alert('거래처 명칭에 포함되는 일부 문자열을 입력하신 후, 검색하십시오.');
			document.main.search_val.focus();
			return;
		}
		ajaxReplaceForm("custCodeSearch.do", "#main", "#divListData")
	}	

	function goSelect(cust_cd, cust_nm){
		var openURL = getMethodFromUrl(opener.location.href).substring(0,8);
		start_pos = openURL.lastIndexOf("/");
// 		openURL = openURL.substring(start_pos + 8, start_pos + 16);
		
		var inx = '<%=box.get("object_id")%>';
			
		if(openURL == 'rpt11001' || openURL == 'fin04001') { // 계정명세서, 자금결제
			opener.document.main.search_cd.value = cust_cd;
			opener.document.main.search_nm.value = cust_nm;
		}else if(openURL == 'slp02001') { // 지출결의서
			opener.document.all["cust_cd"+inx].value = cust_cd;
			opener.document.all["cust_nm"+inx].value = cust_nm;
		}else {
			opener.document.all["cust_cd"+inx].value = cust_cd;
			opener.document.all["cust_nm"+inx].value = cust_nm;
// 			opener.document.main.cust_cd.value = cust_cd;
// 			opener.document.main.cust_nm.value = cust_nm;
		}
		parent.window.close();
	}
	
	$(function() {
		$(".page-logo-text").html("거래처 찾기");	
	});
</script>
<style type="text/css">html{overflow:hidden;}</style>
</head>
<body>
<form id="main" name="main" method="post" class="fType" action="">
<input type="hidden" name="object_id" value="<%=box.get("object_id")%>">

	<div class="table-top-guide">
		<span style="color:#01a1db;">검색하고자 하는 거래처명 또는 사업자등록번호를 기재하세요.</span> 
		<p>명칭에 포함되는 일부 문자열을 입력해서 검색할 수 있습니다.(예: '<b>신진</b>', '<b>아이티</b>' 등)</p>
	</div>

	<table class="search-panel table table-bordered">
 		<tr> 
			<td>
				<select name="search_key" class="bs-select form-control" style="width:110px">
					<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>거래처명</option>
					<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사업자번호</option>
					<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>대표자성명</option>
				</select>
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:30%;" onkeydown="if(event.keyCode == 13) goSearch('');">
				<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
			</td>
		</tr>
	</table>   	
</form>
	<div id="divListData" class="contentsRow">
<% } %>

		<div class="table-scrollable" style="height:360px">
			<table class="table table-view table-bordered">
				<tr>
				  <th width="17%">사업자번호</th>
				  <th width="40%">거래처명</th>
				  <th width="13%">대표자</th>
				  <th width="15%">업태</th>
				  <th width="15%">종목</th>
				</tr>
	  			<% for(int i=0; i < rsWp.getLength(); i++) {  %>
               	<tr>
				  <td><%=rsWp.get("cust_flag",i).equals("2") ? FormatUtil.juminNo(rsWp.get("cust_reg_no",i)) : FormatUtil.bizRegiNoFormat(rsWp.get("cust_reg_no",i))%></td>
				  <td><a href="javascript:goSelect('<%=rsWp.get("cust_cd",i)%>','<%=rsWp.get("cust_nm",i)%>');"><%=rsWp.get("cust_nm",i)%></a></td>
				  <td><%=rsWp.get("rep_person_nm",i)%></td>
				  <td><%=rsWp.get("uptae",i)%></td>
				  <td><%=rsWp.get("upjong",i)%></td>
				</tr>
	  			<% } %>               
			  </table>
		</div>
		<% if(rsWp.getLength() > 0) {  %>
    		<%=PageUtil.makePaging(box, rsWp, 100, request)%>
		<% } %>
<% if(!box.get("ajax_yn").equals("Y")) { %>
	</div>
<% } %>		   