<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 재무제표 연이월 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>

<script language='javascript'>
	function goSearch() {
		if (formValidate("#main")) {
			removeMask("#main");		
			ajaxReplaceForm("rpt22001_list.do", "#main", "#divListData");
		}
	}
	
	function goCreate() {
		if (formValidate("#main")) {
			if(confirm(document.main.std_year.value +'년도 재무제표 잔액데이터를 '+(parseInt(document.main.std_year.value)+1)+'년도 기초데이터로 이관하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'rpt22001_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn" value="Y">

	<h1 class="page-title">재무제표 연이월</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
	  		<tr>
				<td width="10%" class="td-head">기준년도</td>
				<td width="90%">
					<select name="std_year" style="width:100px;" class="bs-select form-control" onChange="goSearch()">
						<%=DateUtil.getYearOptionTag(box.get("std_year"),"2009",DateUtil.nextYear(),"desc","년")%>
					</select>
					<span class="f-right marR60">
					  	<button type="button" id="btnSearch" class="btn btn-primary" onclick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
			  		<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
					  	<button type="button" id="btnSearch" class="btn btn-primary" onclick="goCreate();">자료생성</button>
			  		<% } %>
			  		</span>
		  		</td>
	  		</tr>
		</tbody>
	</table>
</form>
	
<div id="divListData" class="contentsRow">
<% } %>
	
	<div class="table-top-guide marB5 marL5">
		다음은 <%=box.get("std_year")%>년도 기말 계정별 잔액현황입니다.&nbsp;&nbsp;<span style="color:#01a1db;">[자료생성]버튼을 클릭</span>하면  <%=box.getInt("std_year")+1%>년 기초데이터로 생성되어 집니다.
	</div>	
	
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 150px)">
		<table id="MyTable" class="table table-bordered table-hover order-column">
			<colgroup>
				<col style="width:24%;">
				<col style="width:19%;">
				<col style="width:19%;">
				<col style="width:19%;">
				<col style="width:19%;">
			</colgroup>
			<thead>
				<tr class="t-center">
					<th>계정과목</th>
					<th>전기이월</th>
					<th>당기증가</th>
					<th>당기감소</th>
					<th>당기잔액</th>
	         	</tr>
	        </thead>
	        <tbody> 
			<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
				<tr><td colspan="5" class="t-center">검색된 자료가 없습니다.</td></tr>
			<% }else if(rsWp.getLength() > 0) {
		   		for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=rsWp.get("acct_nm",i)%></td>
					<td class="t-right""><%=rsWp.get("pre_iwol_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right""><%=rsWp.get("cur_incr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right""><%=rsWp.get("cur_decr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right""><%=rsWp.get("cur_acum_amt",i,Box.THOUSAND_COMMA)%></td>
				</tr>	
				<% } %>
		   	<% } %>
		   	</tbody>
		</table>
	</div>

<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>