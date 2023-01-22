<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 고유목적사업준비금 설정/전출입 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>

<script language="javascript">
	function goSearch() {
		document.main.action = "gls01001_list.do";
		document.main.target = "_self";
		document.main.submit();
		fixTableHeader("MyTable");
	}

	function goDelete(search_key, slip_no) {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("gls01001_delete.do?search_key="+search_key.replace('|','@')+"&slip_no="+slip_no,"#main", function(rtn) {
				if(rtn.isOk == "Y") {
					alert('삭제되었습니다.');
					goSearch();
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goWrite() {
		var param = "slip_no=<%=box.get("slip_no")%>";
		ajaxReplace("gls01002_write.do?actionType=write", param, "#dialog-form", function(rtn) {
			$('#dialog-form').modal('show');
		});
	}
	
	function goSign(slip_no, search_key, subject) {
		document.signForm.search_key.value = 'ACCTB_SLIP01|' + slip_no;
		if(search_key.substring(0,1) == 'B') { document.signForm.search_key.value += '|' + search_key.substring(3); }
		document.signForm.subject.value = subject;
		goSignRequest(document.signForm);
	}
	
	function signRequestPost() { goSearch(); }

	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="selectedRow" value="">

	<h1 class="page-title">고유목적사업준비금 설정/전출입</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
	  		<tr>
				<td width="10%" class="td-head">기준년도</td>
				<td width="20%">
					<select name="std_year" style="width:100px;" class="bs-select form-control" onChange="goSearch()">
						<%=DateUtil.getYearOptionTag(box.get("std_year"),"2009",DateUtil.nextYear(),"desc","년")%>
					</select>
				</td>
				<td width="10%" class="td-head">준비금유형</td>
				<td width="60%">
					<select name="basis_law" title="준비금유형" style="width:190px" class="bs-select form-control" onChange="goSearch()">
						<option value=''>전체</option>
						<option value='1' <%=box.get("basis_law").equals("1")?"selected":""%>>법인세법(준비금1)</option>
						<option value='2' <%=box.get("basis_law").equals("2")?"selected":""%>>근로복지기본법(준비금2)</option>
					</select>
					<span class="f-right marR60">
					  	<button type="button" class="btn btn-primary" onclick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
			  		<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
					  	<button class="btn dark" onclick="goWrite();" type="button"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
			  		<% } %>
			  		</span>
		  		</td>
	  		</tr>
		</tbody>
	</table>
</form>
	
<div id="divListData" class="contentsRow">
<% } %>
	
	<div class="table-top-guide marB5">
		<span style="color:#01a1db;">전표번호를 클릭</span>하면 해당 회계처리 세부내용을 조회할 수 있습니다.
	</div>	
	
	<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 150px)">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:4%;">
				<col style="width:11%;">
				<col style="width:27%;">
				<col style="width:12%;">
				<col style="width:12%;">
				<col style="width:10%;">
				<col style="width:12%;">
				<col style="width:10%;">
				<col style="width:3%;">
			</colgroup>
			<thead>
				<tr class="t-center" class="table01_title">
					<th rowspan="2">No</th>
					<th rowspan="2">작성일</th>
					<th rowspan="2">회계처리구분</th>
					<th rowspan="2">금액</th>
					<th colspan="2">목적사업회계</th>
					<th colspan="2">기금관리회계</th>
					<th rowspan="2"></th>
          		</tr> 
				<tr height="20" class="t-center" class="table01_title">
					<th>전표번호</th>
					<th>상태</th>
					<th>전표번호</th>
					<th>상태</th>
          		</tr> 
			</thead>
			<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="9" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   		for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
					<td class="t-center"><%=String.valueOf(i+1)%></td>
					<td class="t-center"><%=rsWp.get("slip_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td><%=rsWp.get("subject",i)%></td>
					<td class="t-right" style="padding-right:5px"><%=rsWp.get("cha_amt",i, Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no_00",i)%>');"><span style="letter-spacing:0px"><%=rsWp.get("slip_no_00",i,Box.SLIP_NO)%></span></a></td>
					<td class="t-center">
						<% if(rsWp.get("acc_unit",i).equals("20") && rsWp.get("sign_status_00",i).equals("1")) { %>
							<button type="button" class="btn btn-primary btn-table" onclick="goSign('<%=rsWp.get("slip_no_00",i)%>','<%=rsWp.get("search_key",i)%>','<%=rsWp.get("subject",i)%>');">기안문작성</button>
						<% }else { %>
							<%=rsWp.get("sign_status_nm_00",i)%>
						<% } %>
					</td>
					<td class="t-center"><a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no_20",i)%>');"><span style="letter-spacing:0px"><%=rsWp.get("slip_no_20",i,Box.SLIP_NO)%></span></a></td>
					<td class="t-center">
						<% if(rsWp.get("acc_unit",i).equals("20") && rsWp.get("sign_status_20",i).equals("1")) { %>
							<button type="button" class="btn btn-primary btn-table" onclick="goSign('<%=rsWp.get("slip_no_20",i)%>','<%=rsWp.get("search_key",i)%>','<%=rsWp.get("subject",i)%>');">기안문작성</button>
						<% }else { %>
							<%=rsWp.get("sign_status_nm_20",i)%>
						<% } %>
					</td>
					<td class="t-center"><%if(rsWp.get("acc_unit",i).equals("20") && (rsWp.get("sign_status",i).equals("1") || rsWp.get("sign_status",i).equals("4"))){%><a href="javascript:goDelete('<%=rsWp.get("search_key",i)%>','<%=rsWp.get("slip_no",i)%>');"><img src="/com/img/icon_tresh.png" border="0" align="absmiddle"></a><%}%></td>
				</tr>	
				<% } %>
			<% } %>
		   	</tbody>
		</table>
	</div>
	<div>
		<tr> 
		  	<td id="frmArea" style="padding-top:10px">
	    		<iframe name="ifrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>
		  	</td>
		</tr>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>

<form id="signForm" name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="">
<input type="hidden" name="msg_type" 		value="SLP008">
<input type="hidden" name="search_key" 		value="">
<input type="hidden" name="etc_remark"		value="">
<input type="hidden" name="nextUrl" 		value="">
</form>