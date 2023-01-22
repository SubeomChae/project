<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>기금운용실적분석(기간별 분석)</title>

<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {
			var theURL = 'bud25001_list.do';
	
			removeMask("#main");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function change_column_key(column_key) {
		document.getElementById('spanStartYY').style.display = column_key == '2' ? 'none'  : '';
	}
	
	$(function() {
		change_column_key('<%=box.get("column_key")%>');
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
	
	<h1 class="page-title">기금운용실적분석(기간별 분석)</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:12%;">
			<col style="width:12%;">
			<col style="width:12%;">
			<col style="width:64%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">조회기준</td>
				<td style="padding-left:5px">
					<select name="column_key" title="조회기준" class='bs-select form-control' style="width:80px" onChange="change_column_key(this.value)">
						<option value='1' <%=box.get("column_key").equals("1")?"selected":""%>>년도별</option>
						<option value='2' <%=box.get("column_key").equals("2")?"selected":""%>>월별</option>
					</select>
			    </td>
				<td class="td-head">기준년도</td>
				<td>
					<span id="spanStartYY">
					<select id="start_yy" name="start_yy" class='bs-select form-control' style="width:80px;" onChange="goSearch('N')">
						<%=DateUtil.getYearOptionTag(box.get("start_yy"),"2011",DateUtil.nextYear(),"desc","년")%>
					</select> ~ 
					</span>
					<select id="end_yy" name="end_yy" class='bs-select form-control' style="width:80px;" onChange="goSearch('N')">
						<%=DateUtil.getYearOptionTag(box.get("end_yy"),"2011",DateUtil.nextYear(),"desc","년")%>
					</select>
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="screenToExcel('#divListData', '기금운용실적분석(기간별 분석)');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					</span>
				</td>
	  		</tr>
  		</tbody>
	</table>

<div id="divListData" class="contentsRow"> 
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 125px);">
		<table class="table table-striped table-bordered table-hover order-column">
			<tr>
				<th colspan="2">사업명</th>
			<% if(box.get("column_key").equals("1")) { %>
				<% for(int i=box.getInt("start_yy"); i <= box.getInt("end_yy"); i++) { %>	
					<th><%=i%>년</th>
				<% } %>
			<% }else { %>
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
			<% } %>
				<th>계</th>
			</tr>
		<% if(rsWp.getLength() == 0) { %>
			<tr><td colspan="15">등록된 자료가 없습니다.</td></tr>
		<% }else {
			int width = 100 / (box.getInt("end_yy") - box.getInt("start_yy") + 5);
			int pass_cnt = 0;
			for(int row_index=0; row_index < rsWp.getLength(); row_index++) { %>
			<tr id="tr_<%=row_index%>" class="<%=rsWp.get("sort_key",row_index).endsWith("Z")?"tr-summary":"odd gradeX"%>">
			<%	if(pass_cnt == 0) {
					int span_cnt = 1;
					for(int tmp_index=row_index + 1; tmp_index < rsWp.getLength() ; tmp_index++) {
						if(!rsWp.get("data1",row_index).equals(rsWp.get("data1",tmp_index))) { break; }
						span_cnt ++;
					} %>
					<td <%if(rsWp.get("data1",row_index).equals("합계")){%>colspan="2"<%}%> rowspan="<%=span_cnt%>"><%=rsWp.get("data1",row_index)%></td>
				<%		pass_cnt = span_cnt - 1;
				}else {
						pass_cnt --;
				}	%>
			<% if(!rsWp.get("data1",row_index).equals("합계")) { %>
					<td><%=rsWp.get("data2",row_index)%></td>
			<% } %>
			<% if(box.get("column_key").equals("1")) { %>
				<% int amt_total = 0;
				   for(int j=box.getInt("start_yy"); j <= box.getInt("end_yy"); j++) { 
				   		amt_total += rsWp.getInt("cnt_"+String.valueOf(j),row_index); %>	
					<td width="<%=width%>%" class="t-right"><%=rsWp.get("cnt_"+String.valueOf(j),row_index,Box.THOUSAND_COMMA)%></td>
				<% } %>
				<td width="<%=width%>%" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_total))%></td>
			<% }else { %>
					<td width="6%" class="t-right"><%=rsWp.get("col01",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col02",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col03",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col04",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col05",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col06",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col07",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col08",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col09",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col10",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col11",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="6%" class="t-right"><%=rsWp.get("col12",row_index,Box.THOUSAND_COMMA)%></td>
					<td width="7%" class="t-right"><%=rsWp.get("col_sum",row_index,Box.THOUSAND_COMMA)%></td>
			<% } %>
			</tr>	
		<%	}	%>
		<% } %>
		</table>
	</div>
</form>