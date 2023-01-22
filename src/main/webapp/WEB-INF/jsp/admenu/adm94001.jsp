<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 회사별 시스템 접속현황 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		document.main.action = "adm94001_list.do";
		document.main.target = "_self";
		document.main.submit();
		fixTableHeader("MyTable");
	}
		
	function goDetail(corp_cd, corp_nm) {
		document.getElementById("spanCorpNm").innerHTML = "<h2 class='page-title-2depth'> ["+corp_nm+"] 사용자별 접속현황</h2>";
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(corp_cd != '') { $("tr[corp_cd='"+corp_cd+"']").addClass("bg-yellow"); }
		var theUrl = "adm94002_list.do?corp_cd="+corp_cd;
		$('#ifrm').attr('src', theUrl);
   	}

	$(function() {
		<% if(rsWp.getLength() > 1) { %>
			setBackColor(1);
			goDetail('<%=rsWp.get("corp_cd",1)%>','<%=rsWp.get("corp_nm",1)%>');
	    <% } %>
	    fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" style="margin:0px">
<input type="hidden" name="selectedRow" value="">

	<h1 class="page-title">회사별 시스템 접속현황</h1>
	
	<h2 class="page-title-2depth">월별 접속추이
		<div class="form-inline f-right marB5">
			<select name="std_yy" class="bs-select form-control" style="width:90px;" onchange="goSearch();">
				<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2015",DateUtil.nextYear(),"desc","년")%>
			</select>
		</div>
	</h2>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 396px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:20%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
				<col style="width:5%">
			</colgroup>
			<thead>
				<tr>
					<th>회사명</th>
					<th>전년말</th>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++){ %>
				<tr id="tr_<%=i%>" corp_cd="<%=rsWp.get("corp_cd",i)%>" corp_nm="<%=rsWp.get("corp_nm",i)%>" <%if(rsWp.get("sort_key",i).equals("z")){%>bgcolor="f6f6f6"<%}else{%> style="cursor:pointer" onClick="goDetail('<%=rsWp.get("corp_cd",i)%>','<%=rsWp.get("corp_nm",i)%>')"<%}%>>
					<td class="t-center"><%=StringUtil.replace(rsWp.get("corp_nm",i),"사내근로복지기금","")%></td>
					<td class="t-center"><%=rsWp.get("pre_tot",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt01",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt02",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt03",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt04",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt05",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt06",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt07",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt08",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt09",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt10",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt11",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cnt12",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-center"><%=rsWp.get("cur_tot",i,Box.THOUSAND_COMMA)%></td>
				</tr>
			<% } %>
			</tbody>
		</table>
	</div>
	<div>
		<span id="spanCorpNm"></span>
	</div>
		<iframe id="ifrm" name="ifrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="800px" scrolling="no"></iframe>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>