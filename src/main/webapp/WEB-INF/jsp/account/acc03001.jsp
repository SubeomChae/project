<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"           scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 재무재표배열 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		document.main.page_count.value = '';
		ajaxReplaceForm("acc03001_list.do", "#main", "#divListData", function() {
			var report_id = $("tr[id='tr_0']").attr("report_id");
			goDetail(report_id,"");
		});
	}
	
	function goDetail(report_id, report_nm) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(report_id != '') { $("tr[report_id='"+report_id+"']").addClass("bg-yellow"); }
		var pageUrl = 'acc03002_list.do?report_id='+report_id+'&report_nm='+report_nm;
		ajaxReplaceForm(encodeURI(pageUrl), "#main", "#divFrame");
	}

	$(function() {
	<% if(!box.get("report_id").equals("")) { %>
		goDetail('<%=box.get("report_id")%>','<%=box.get("excel_file_nm")%>');
	<% }else if(rsWp.getLength() > 0) { %>
		goDetail('<%=rsWp.get("code1",0)%>','<%=rsWp.get("data1",0)%>');
	<% } %>
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="page_count" value="">

	<h1 class="page-title">재무제표 배열</h1>
</form>
	
<div id="divListData" class="contentsRow">
<% } %>         
	<div>
		(+) 증가수식, (-) 감소수식은 계정과목코드의 배열을 <span style="color:#01a1db;">세미콜론(;)</span>으로 구분해서 입력하시기 바랍니다.
	</div> 		
	<div class="row row-set">
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 115px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<thead>
						<tr>
							<th>보고서 ID</th>
							<th>보고서명</th>
		          		</tr>
		          	</thead>
		          	<tbody> 
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="2" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% }else {
					   	   for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr id="tr_<%=i%>" report_id="<%=rsWp.get("code1",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("code1",i)%>','<%=rsWp.get("data1",i)%>')"> 
								<td class="t-left"><%=rsWp.get("code1",i)%></td>
								<td class="t-left"><%=rsWp.get("data1",i)%></td>
							</tr>	
				     	<% } %>
				    <% } %>
			    	</tbody>
				</table>
			</div>
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "", request)%>
		</div>
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>