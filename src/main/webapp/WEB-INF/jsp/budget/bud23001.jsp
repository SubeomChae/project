<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>기금운용계획서</title>

<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'bud23001_list.do';
			if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=기금운용계획서'; }
	
			removeMask("#main");
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">

	<h1 class="page-title">기금운용계획서</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:13%;">
			<col style="width:67%;">
			<col style="width:20%;">
		</colgroup>
		<tbody>
	  		<tr height="28">
				<th width="13%">기준년도</th>
				<td width="67%">
					<select name="bugt_yy" title="기준년도" style="width:100px" class="bs-select form-control">
						<option value=''>선택</option>
						<%=DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
		  			<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn btn-primary" onClick="screenToExcel('#divListData', '기금운용계획서');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/budget/report/bud23001.jrf', 'P_PARAM01!<%=box.get("bugt_yy")%>!');"><img src="/com/img/ico_btn_print.png">인쇄</button>
					</span>
			    </td>
	  		</tr>
	  	</tbody>
	</table>		    
	
	<div id="divListData" class="contentsRow">
		<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 127px);">
			<table class="table table-striped table-bordered table-hover order-column">
				<tr>
					<th width="10%">구분</th>
					<th width="55%">내역</th>
					<th width="15%">금액</th>
					<th width="20%">비고</th>
	       		</tr> 
				<tr>
					<th rowspan="4"f>조달</th>
					<td class="t-left"> 1. <%=box.get("bugt_yy")%>년도 수입</td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(obox.getLong("bugt_amt_61001")+obox.getLong("bugt_amt_61002")))%></td>
					<td rowspan="4"></td>
				</tr>	
				<tr height="40">
					<td class="t-left" nowrap style="padding-left:20px">이자수입 총액<br>대부이자수입 총액</td>
					<td class="t-right"><%=obox.get("bugt_amt_61001",Box.THOUSAND_COMMA)%><br><%=obox.get("bugt_amt_61002",Box.THOUSAND_COMMA)%></td>
				</tr>	
				<tr>
					<td class="t-left"> 2. <%=box.get("bugt_yy")%>년 출연금 중 준비금 설정</td>
					<td class="t-right"><%=obox.get("bugt_amt_64001",Box.THOUSAND_COMMA)%></td>
				</tr>	
				<tr> 
					<td>합계</td>
					<td class="t-right"><%=obox.get("bugt_amt_6",Box.THOUSAND_COMMA)%></td>
				</tr>	
				<tr> 
					<th rowspan="4" class="td-head" >지출</th>
					<td class="t-left"> 1. 고유목적사업비용</td>
					<td class="t-right"><%=obox.get("bugt_amt_71",Box.THOUSAND_COMMA)%></td>
					<td rowspan="4" align="t-left"></td>
				</tr>	
				<tr>
					<td class="t-left"> 2. 일반관리비</td>
					<td class="t-right"><%=obox.get("bugt_amt_72",Box.THOUSAND_COMMA)%></td>
				</tr>	
				<tr>
					<td class="t-left"> 3. 예비비</td>
					<td class="t-right"><%=obox.get("bugt_amt_74002",Box.THOUSAND_COMMA)%></td>
				</tr>	
				<tr>
					<td>합계</td>
					<td class="t-right"><%=obox.get("bugt_amt_7",Box.THOUSAND_COMMA)%></td>
				</tr>	
				<tr> 
					<th>과부족</th>
					<td></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(obox.getLong("bugt_amt_6")-obox.getLong("bugt_amt_7")))%></td>
					<td></td>
				</tr>	
			</table>
		</div>
	</div>
</form>