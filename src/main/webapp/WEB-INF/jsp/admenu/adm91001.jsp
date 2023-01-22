<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 시스템 접속현황 -->
<script language="javascript">
	function goSearch() {
		document.main.action = "adm91001_list.do";
		document.main.target = "_self";
		document.main.submit();
		fixTableHeader("MyTable");


	}

	$(function() {
		fixTableHeader("MyTable");
	});
</script>

<form name="main" method="post" action="" style="margin:0px">

	<h1 class="page-title">시스템 접속현황</h1>	

	<h2 class="page-title-2depth">월별 접속추이
		<div class="form-inline f-right marB5">
			<select name="std_yy" class="bs-select form-control" style="width:90px;" onchange="goSearch();">
				<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2013",DateUtil.nextYear(),"desc","년")%>
			</select>
		</div>
	</h2>
	
	<div class="table-scrollable">
		<table class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
				<col style="width:7%">
			</colgroup>
			<thead>
				<tr>
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
				<tr>
					<td><%=obox.get("pre_tot",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt01",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt02",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt03",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt04",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt05",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt06",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt07",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt08",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt09",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt10",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt11",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cnt12",Box.THOUSAND_COMMA)%></td>
					<td><%=obox.get("cur_tot", Box.THOUSAND_COMMA)%></td>
				</tr>
			</tbody>
		</table>
	</div>

	<h2 class="page-title-2depth">사용자별 접속현황
		<div class="form-inline f-right marB5">
			<select name="connect_cnt" class="bs-select form-control" style="width:150px" onChange="goSearch()">
				<option value='500' <%=box.get("connect_cnt").equals("500")?"selected":""%>>500회 이상</option>
				<option value='100' <%=box.get("connect_cnt").equals("100")?"selected":""%>>100회 이상</option>
				<option value='50'  <%=box.get("connect_cnt").equals("50") ?"selected":""%>> 50회 이상</option>
				<option value='10'  <%=box.get("connect_cnt").equals("10") ?"selected":""%>> 10회 이상</option>
			</select>
		</div>
	</h2>	
	
	<div class="table-scrollable scrollOptionY"  style="width:100%; height:calc(100vh - 195px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">						
			<thead>
				<tr>
					<th width="4%">No</th>
					<th>사번</th>
					<th>성명</th>
					<th>부서</th>								
					<th>직위</th>																
					<th width="8%">접속횟수</th>
					<th width="18%">최종접속일시</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++){ %>
				<tr>
					<td><%=String.valueOf(i+1)%></td>
					<td><%=rsWp.get("empl_no",i)%></td>
					<td><a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')"><font color="<%=rsWp.get("empl_status",i).equals("Y")?"red":""%>"><%=rsWp.get("empl_nm",i)%></font></a></td>
					<td><%=rsWp.get("dept_nm",i)%></td>
					<td><%=rsWp.get("position_nm",i)%></td>									
					<td><%=rsWp.get("connect_cnt",i,Box.THOUSAND_COMMA)%></td>
					<td><%=rsWp.get("sys_upd_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
				</tr>
			<% } %>		
			<tbody>
		</table>
	</div>
</form>