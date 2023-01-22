<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"       class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"      class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제16호 서식] 수입금액조정명세서 -->
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
<input type="hidden" name="report_id" 		value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 			value="<%=box.get("std_yy")%>">
	
	<h2 class="page-title-2depths">수입금액조정명세서</h2>
		
	<div class="table-top-control">
		<span style="float:right;">[별지 제16호 서식]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">					
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
			<tr>
				<th colspan="10" class="t-left"><b>1. 수입금액 조정계산</b></th>
			</tr> 
			<tr>
				<td colspan="2" class="td-head">계정과목</td>
				<td rowspan="2" width="16%" class="td-head">③결산서상수입금액</td>
				<td colspan="2" class="td-head">조정</td>
				<td rowspan="2" width="15%" class="td-head">⑥수정후수입금액<br>(③＋④－⑤)</td>
				<td rowspan="2" colspan="4" width="15%" class="td-head">비고</td>
			</tr> 
			<tr>
				<td width="10%" class="td-head">①항목</td>
				<td width="15%" class="td-head">②과목</td>
				<td width="15%" class="td-head">④가산</td>
				<td width="15%" class="td-head">⑤차감</td>
			</tr> 
			<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","", uSesEnt.dbo); 
				Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익
				
				rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61002","","",  uSesEnt.dbo); 
				Long amt_61002 = rbox.getLong("cur_acum"); // 대부이자수익  %>
			<%	xmlBuf += "<amt_61001>"+FormatUtil.insertComma(String.valueOf(amt_61001))+"</amt_61001>\n"
					   +  "<amt_61002>"+FormatUtil.insertComma(String.valueOf(amt_61002))+"</amt_61002>\n"
					   +  "<amt_61>"+FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))+"</amt_61>\n"; 
			%>
			<tr>
				<td class="t-left">매출</td>
				<td class="t-left">이자수익</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
				<td class="t-right">0</td>
				<td class="t-right">0</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td class="t-left">매출</td>
				<td class="t-left">대부이자수익</td>				
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61002))%></td>
				<td class="t-right">0</td>
				<td class="t-right">0</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61002))%></td>
				<td colspan="4"></td>
			</tr>
		<% for(int i=0; i < 4; i++) { %>
			<tr>
				<td></td>
				<td></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="4"></td>
			</tr>
		<% } %>
			<tr>
				<td colspan="2" class="t-center">계</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))%></td>
				<td class="t-right">0</td>
				<td class="t-right">0</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))%></td>
				<td colspan="4"></td>
			</tr>
		</table>

		<table class="table table-bordered order-column table-cover marB0">
			<colgroup>
				<col style="width:*">
				<col style="width:*">
				<col style="width:*">
			</colgroup>
			<tr>
				<th colspan="10" class="t-left">2.수입금액 조정명세</th>
			</tr> 
			<tr>
				<th colspan="10" class="t-left">가.작업진행률에 의한 수입금액</th>
			</tr> 
			<tr>
				<td rowspan="2" class="td-head">⑦공사명</td>
				<td rowspan="2" class="td-head">⑧도급자</td>
				<td rowspan="2" class="td-head">⑨도급금액</td>
				<td colspan="3" class="td-head">작업진행률계산</td>
				<td rowspan="2" class="td-head">⑬누적익금산입액<br>(⑨×⑫)</td>
				<td rowspan="2" class="td-head">⑭전기말누적수입계상액</td>
				<td rowspan="2" class="td-head">⑮당기회사수입계상액</td>
				<td rowspan="2" class="td-head">(16)조정액<br>(⑬－⑭－⑮)</td>
			</tr> 
			<tr>
				<td class="td-head">⑩당해사업연도말총공사비누적액(작업시간등)</td>
				<td class="td-head">⑪총공사예정비(작업시간등)</td>
				<td class="td-head">⑫진행률<br>(⑩/⑪)</td>
			</tr> 
		<% for(int i=0; i < 5; i++) { %>
			<tr>
				<td></td>
				<td></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
		<% } %>
			<tr>
				<td class="t-center">계</td>
				<td></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<th colspan="10" class="t-left">나.중소기업 등 수입금액 인식기준 적용특례에 의한 수입금액</th>
			</tr> 
			<tr>
				<td colspan="2" class="td-head">계 정 과 목</td>
				<td rowspan="2" colspan="2" class="td-head">(19)세법상 당기 수익금액</td>
				<td rowspan="2" colspan="2" class="td-head">(20)당기 회사수입금액 계상액</td>
				<td rowspan="2" colspan="2" class="td-head">(21)조정액(19-20)</td>
				<td rowspan="2" colspan="2" class="td-head">(22)근 거 법 령</td>
			</tr>
			<tr>
				<td class="td-head">(17)항목</td>
				<td class="td-head">(18)과목</td>
			</tr> 
		<% for(int i=0; i < 6; i++) { %>
			<tr>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2"></td>
			</tr>
		<% } %>
			<tr>
				<td colspan="4" class="t-center">계</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<th colspan="10" class="t-left">다.기타 수입금액</th>
			</tr> 
			<tr>
				<td colspan="2" class="td-head">(23)구분</td>
				<td colspan="2" class="td-head">(24)근 거 법 령</td>
				<td colspan="2" class="td-head">(25)수 입 금 액</td>
				<td colspan="2" class="td-head">(26)대 응 원 가</td>
				<td colspan="2" class="td-head">비  고</td>
			</tr> 
		<% for(int i=0; i < 6; i++) { %>
			<tr>
				<td colspan="2"></td>
				<td colspan="2"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2"></td>
			</tr>
		<% } %>
			<tr>
				<td colspan="4" class="t-center">계</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2"></td>
			</tr>
		</table>
	</div>
	<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>