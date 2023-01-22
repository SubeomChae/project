<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>목적사업계획서</title>

<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'bud22001_list.do';
	
			removeMask("#main");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="select_yn" value="Y">

	<h1 class="page-title">목적사업계획서</h1>

	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:13%;">
			<col style="width:87%;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">기준년도</td>
				<td class="form-inline">
					<select name="bugt_yy" title="기준년도" style="width:100px" class="bs-select form-control">
						<option value=''>선택</option>
						<%=DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="screenToExcel('#divListData', '목적사업계획서');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/budget/report/bud22001.jrf', 'P_PARAM01!<%=box.get("bugt_yy")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
					</span>
			    </td>
			</tr>
		</tbody>
	</table>
	
	<div id="divListData" class="contentsRow">
		<div id="divArea" class="table-scrollable" style="width:100%; height:calc(100vh - 127px);">
			<table class="table table-bordered table-hover order-column">
				<colgroup>
					<col style="width:15%;">
					<col style="width:30%;">
					<col style="width:10%;">
					<col style="width:15%;">
					<col style="width:10%x;">
					<col style="width:20%;">
				</colgroup>
				<thead>
					<tr>
						<th>사업명</th>
						<th>목적</th>
						<th>세분류</th>
						<th>대상인원</th>
						<th>총금액</th>
						<th>지원방법</th>
					</tr>
				</thead>
				<tbody>
				<% if(rsWp.getLength() == 0) { %>
					<tr><td colspan="6">등록된 자료가 없습니다.</td></tr>
				<% }else {
					int pass_cnt = 0;
					int span_cnt = 0;
					long bugt_amt_sum = 0;
					for(int row_index=0; row_index < rsWp.getLength(); row_index++) {	
						bugt_amt_sum += rsWp.getLong("bugt_amt",row_index); %>
					<tr> 
					<% if(pass_cnt == 0) {
						span_cnt = 1;
						for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
							if(!rsWp.get("bugt_cd",row_index).substring(0,6).equals(rsWp.get("bugt_cd",tmp_index).substring(0,6))) { break; }
							span_cnt ++;
						}
						out.println("<td rowspan='"+span_cnt+"'>"+rsWp.get("bugt_nm",row_index)+"</td>");
						out.println("<td rowspan='"+span_cnt+"' class='t-left'>"+rsWp.get("bugt_purpose",row_index)+"</td>");
						}
					%>
						<td><%=rsWp.get("sub_nm",row_index)%></td>
						<td class="t-left"> 
							<%if(rsWp.getInt("member_cnt",row_index)>0){%><%=rsWp.get("member_cnt",row_index)%>명<%}%>
							<%if(rsWp.getInt("unit_amt",row_index)>0){%> x <%=rsWp.get("unit_amt",row_index,Box.THOUSAND_COMMA)%>원<%}%>
						</td>
						<td class="t-right"><%=rsWp.get("bugt_amt",row_index,Box.THOUSAND_COMMA)%></td>
					<% if(pass_cnt == 0) {
							out.println("<td rowspan='"+span_cnt+"' class='t-left''>"+rsWp.get("pay_guide",row_index)+"</td>");
							pass_cnt = span_cnt - 1;
						}else {
							pass_cnt --;
						}
					%>
					</tr>	
				<% } %>
					<tr class="tr-summary">
						<td>계</td>
						<td></td>
						<td></td>
						<td></td>
						<td</td>
						<td class="t-right" ><%=FormatUtil.insertComma(String.valueOf(bugt_amt_sum))%></td>
						<td></td>
					</tr>
			<% } %>
				</tbody>
			</table>
		</div>
	</div>
</form>