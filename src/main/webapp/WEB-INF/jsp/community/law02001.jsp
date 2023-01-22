<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 자료실(정관, 운영규정) -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goDetail(chg_seq) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(chg_seq != '') { $("tr[chg_seq='"+chg_seq+"']").addClass("bg-yellow"); }
		var pageUrl = '/community/fd/law02002_select.do?law_id=<%=box.get("law_id")%>&chg_seq=' + chg_seq;
		$('#ifrm').attr('src', pageUrl);  
	}
	
	$(function() {
	<% if(rsWp.getLength() > 0) { 
		out.println("goDetail('"+rsWp.get("chg_seq",0)+"');");
	   } %>
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="law_id" 		value="<%=box.get("law_id")%>">
<input type="hidden" name="law_class" 	value="<%=obox.get("law_class")%>">
<input type="hidden" name="selectedRow" value="">

	<div id="divListData" class="contentsRow">
<% } %>
		<div class="row row-set">
			<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
				<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 130px);">
					<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
						<thead>
							<tr>
								<th>No</th>
								<th>개정일</th>
								<th>등록자</th>
			          		</tr>
			          	</thead>
			          	<tbody>	
			          	 <% for(int i=0; i < rsWp.getLength(); i++) {	%>
							<tr id="tr_<%=i%>" chg_seq=<%=rsWp.get("chg_seq",i)%> style="cursor:pointer" onClick="goDetail('<%=rsWp.get("chg_seq",i)%>')"> 
								<td><%=String.valueOf(rsWp.getLength()-i)%></td>
								<td><%=rsWp.get("chg_ymd",i,Box.DEF_DATE_FMT)%></td>
								<td><%=rsWp.get("sys_upd_nm",i)%></td>
							</tr>
						<% } %>	 
						<% if(rsWp.getLength() == 0) { %>
							<tr><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
						<% } %>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
				<iframe id="ifrm" name="ifrm" marginwidth="0" frameborder="0" width="100%" height="600" scrolling="no"></iframe>
			</div>
		</div>	
	</div>
</form>