<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제47호 서식] 주요계정명세서(을) -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/com/include/css/style.css" id="style_css">
<script language='javascript'>
	$(function() {
		ajaxSubmitForm("xmlUpdate.do","#taxForm", function(rtn) {
			if(rtn.isOk == "Y") {
				hideServerWorking();
			}else {
				alert(rtn.errMsg);
			}
		});
	});
</script>

<form id="taxForm" name="taxForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="report_id" 	value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 		value="<%=box.get("std_yy")%>">

	<h2 class="page-title-2depths">주요계정명세서(을)</h2>
		
	<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
			   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
			   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
			   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
	<div class="table-top-control">
		<span>[별지 제47호 서식(을)]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>	
		
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<th colspan="8" class="t-left">1. 재고자산ㆍ유가증권 평가</th>
         		</tr> 
			<tr>
				<td rowspan="2" colspan="2" class="td-head" width="20%">①자산별</td>
				<td rowspan="2" class="td-head" width="15%">②신고방법</td>
				<td rowspan="2" class="td-head" width="15%">③평가방법</td>
				<td rowspan="2" class="td-head" width="15%">④회사계산금액</td>
				<td colspan="2" class="td-head" width="20%">조정계산금액</td>
				<td rowspan="2" class="td-head" width="15%">⑦조정액(⑤또는 ⑤와⑥중 큰 금액-④)</td>
         		</tr> 
			<tr>
				<td width="10%" class="td-head">⑤신고방법</td>
				<td width="10%" class="td-head">⑥선입선출법</td>
         		</tr> 
			<tr>
				<td colspan="2" class="t-left">(101)제품및상품</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(102)반제품및재공품</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(103)원재료</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(104)저장품</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td rowspan="2" class="t-center">유가<br>증권</td>
				<td class="t-left">(105)채권</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td class="t-left">(106)기타</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(107)합계</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<th colspan="8" class="t-left">2. 국고보조금 등ㆍ공사부담금ㆍ보험차익 손금산입 조정</th>
         		</tr> 
			<tr>
				<td colspan="2" class="td-head" width="25%">⑧구   분</td>
				<td width="15%" class="td-head">⑨금  액</td>
				<td width="15%" class="td-head">⑩취득<br>고정자산가액</td>
				<td width="15%" class="td-head">⑪회사손금계상액</td>
				<td colspan="2" class="td-head" width="15%">⑫한도초과액<br>(⑪-⑩)</td>
				<td width="15%" class="td-head">⑬미사용분<br>익금산입액</td>
         		</tr> 
			<tr>
				<td colspan="2" class="t-left">(108)국고보조금등</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(109)공사부담금</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(110)보험차익</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<th colspan="8" class="t-left">3. 가지급금 등 인정이자 조정</th>
         		</tr> 
			<tr>
				<td colspan="4" class="td-head" width="40%">적수</td>
				<td rowspan="2" class="td-head" width="20%">(17)인정이자</td>
				<td rowspan="2" class="td-head" width="20%">(18)회사계상액</td>
				<td rowspan="2" colspan="2" class="td-head" width="20%">(19)조정액(17-18)</td>
         		</tr> 
			<tr>
				<td colspan="2" class="td-head" width="13%">⑭가지급금</td>
				<td class="td-head" width="13%">⑮가수금</td>
				<td class="td-head" width="13%">(16)차감(14-15)</td>
         		</tr> 
			<tr>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<th colspan="8" class="t-left">4. 건설자금이자 조정</th>
         		</tr> 
			<tr>
				<td colspan="3" class="td-head" width="20%">(20)구    분</td>
				<td class="td-head" width="20%">(21)건설자금이자</td>
				<td class="td-head" width="20%">(22)회사계상액</td>
				<td class="td-head" width="20%">(23)상각대상자산분</td>
				<td colspan="2" class="td-head" width="20%">(24)차감조정액(21-22-23)</td>
         		</tr> 
			<tr>
				<td colspan="3" class="t-left">(111)건설완료자산분</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(112)건설중인자산분</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(113)계(111+112)</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>