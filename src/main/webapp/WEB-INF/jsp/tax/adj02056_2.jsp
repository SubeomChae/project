<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- 별지 제43호의6서식] 법인지방소득세 과세표준(조정계산)및 세액신고서 -->
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

	<h2 class="page-title-2depths">법인지방소득세 과세표준(조정계산)및 세액신고서</h2>

	<div class="table-top-control">
		<span>[별지 제43호의6서식]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
			<%	xmlBuf += "<addr>"+obox.get("addr")+"</addr>\n"
					   +  "<email_id>"+obox.get("email_id")+"</email_id>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<rep_person_nm>"+obox.get("rep_person_nm")+"</rep_person_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
					   +  "<saup_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+" ~ "+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</saup_ymd>\n"
					   +  "<tel_no>"+obox.get("tel_no")+"</tel_no>\n";
			%>
			<tr>
				<td colspan="3" class="td-head t-left" width="15%">① 소재지</td>
				<td colspan="3" width="50%" class="t-center"><%=obox.get("addr")%></td>
				<td class="td-head t-left" width="15%">② 전자우편주소</td>
				<td width="20%" class="t-center"><%=obox.get("email_id")%></td>
			</tr> 
			<tr>
				<td colspan="3" class="td-head t-left">③ 법인명</td>
				<td colspan="3" class="t-center"><%=obox.get("corp_nm")%></td>
				<td class="td-head t-left">④ 대표자성명</td>
				<td class="t-center"><%=obox.get("rep_person_nm")%></td>
			</tr> 
			<tr>
				<td colspan="3" class="td-head t-left">⑤ 사업자등록번호</td>
				<td width="20%" class="t-center"><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
				<td class="td-head t-left">⑥ 사업년도</td>
				<td width="20%" class="t-center"><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
				<td class="td-head t-left">⑦ 전화번호</td>
				<td class="t-center"><%=obox.get("tel_no")%></td>
			</tr> 
		</table>
   
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<th colspan="5" width="45%">구분</th>
				<th colspan="7" width="55%">법인지방소득세</th>
			</tr> 
			<tr>
				<td rowspan="7" width="5%" class="t-center">과<br>세<br>표<br>준<br>계<br>산</td>
				<td colspan="4" class="t-left">⑧ 이자소득금액계</td>
				<td colspan="7" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">⑨ 준비금손금산입액</td>
				<td colspan="7" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">⑩ 기부금손금산입액</td>
				<td colspan="7" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">⑪ 기부금한도초과 이월액손금산입</td>
				<td colspan="7" class="t-right"></td>
			</tr>								
			<tr>
				<td colspan="4" class="t-left">⑫ 각사업연도소득금액(⑧-⑨-⑩-⑪)</td>
				<td colspan="7" class="t-right">0</td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">⑬ 비과세소득</td>
				<td colspan="7" class="t-right">0</td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">⑭ 과세표준(⑫-⑬)</td>
				<td colspan="7" class="t-right">0</td>
			</tr>
			<tr>
				<td rowspan="8" class="t-center">법<br>인<br>별<br>세<br>액<br>의<br>계<br>산</td>
				<td colspan="4" class="t-left">⑮ 세율</td>
				<td colspan="7" class="t-right">1%</td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">(16) 표준산출세액</td>
				<td colspan="7" class="t-right">0</td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">(17) 가산세액<br>(미납세액, 미납일수, 세율)</td>
				<td colspan="7" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">(18)가감계(16+17)</td>
				<td colspan="7" class="t-right">0</td>
			</tr>
			<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110902","","", uSesEnt.dbo); 
				Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급법인지방소득세) %>
			<%	xmlBuf += "<amt_1111202>"+FormatUtil.insertComma(String.valueOf(amt_1111202))+"</amt_1111202>\n"
					   +  "<amt_1111202_min>"+FormatUtil.insertComma(String.valueOf(amt_1111202 * -1))+"</amt_1111202_min>\n"
					   +  "<empl_cnt>"+obox.get("empl_cnt")+"</empl_cnt>\n";
			%>
			<tr>
				<td rowspan="3" class="t-center" width="5%">기<br>납<br>부<br>세<br>액</td>
				<td colspan="3" class="t-left">(19)특별징수납부 세액</td>
				<td colspan="7" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(20)(&nbsp;&nbsp;원천납부&nbsp;&nbsp;)세액</td>
				<td colspan="7" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(21)계(19+20+21)</td>
				<td colspan="7" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">(22)차감납부할세액(18-21)</td>
				<td colspan="7" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_1111202 * -1))%></td>
			</tr>
			<tr>
				<td rowspan="15" class="t-center">납<br>세<br>지<br>별<br>세<br>액<br>의<br>계<br>산</td>
				<td colspan="3" class="t-left" width="15%">(23)본점/지점여부</td>
				<td colspan="3" class="t-left"><b><u>1. 단일사업장</u></b>&nbsp;&nbsp;&nbsp;2. 지점 있는 법인의 본점&nbsp;&nbsp;&nbsp;3. 지점</td>
				<td colspan="3" class="t-center">(24)특·광역시 주사업장 여부</td>
				<td colspan="2" class="t-center">1.여 <b><u>2.부</u></b></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(25)해당사업장</td>
				<td width="7%" class="t-left">명칭</td>
				<td width="8%"><%=obox.get("corp_nm")%></td>
				<td width="7%" class="t-left">소재지</td>
				<td colspan="2" width="8%"><%=obox.get("addr")%></td>
				<td width="7%" class="t-left">연락처</td>
				<td colspan="2" width="8%"><%=obox.get("tel_no")%></td>				
			</tr>
			<tr>
				<td colspan="11" class="t-left">(26)안분율</td>
			</tr>
			<tr>
				<td rowspan="2" class="t-center">구분</td>
				<td rowspan="2" colspan="2" class="t-center">종업원 수<br>(명)</td>
				<td colspan="5" class="t-center">건축물 연면적(㎡)</td>
				<td rowspan="2" colspan="3" class="t-center">안분율 (%)<br>(소수점6자리)</td>
			</tr>
			<tr>
				<td class="t-center">계</td>
				<td class="t-center">건물</td>
				<td colspan="2" class="t-center">기계장치</td>
				<td class="t-center">시설물</td>
			</tr>
			<tr class="t-center">
				<td>법인전체</td>
				<td colspan="2"><%=obox.get("empl_cnt")%></td>
				<td>0</td>
				<td>0</td>
				<td colspan="2">0</td>
				<td>0</td>
				<td colspan="3">100</td>
			</tr>
			<tr class="t-center">
				<td>시군구내</td>
				<td colspan="2"><%=obox.get("empl_cnt")%></td>
				<td>0</td>
				<td>0</td>
				<td colspan="2">0</td>
				<td>0</td>
				<td colspan="3">100</td>
			</tr>
			<tr class="t-center">
				<td>비율(%)</td>
				<td colspan="2">100</td>
				<td>100</td>
				<td>100</td>
				<td colspan="2">100</td>
				<td>100</td>
				<td colspan="3">100</td>
			</tr>
			<tr>
				<td colspan="11"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(27)납세지별 산출세액</td>
				<td colspan="2"></td>
				<td colspan="3" class="t-left">(28)납세지별 세액공제·감면액</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(29)납세지별 가산세액</td>
				<td colspan="2"></td>
				<td colspan="3" class="t-left">(30)납세지별 감면분 추가납부세액</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td class="t-center">합계</td>
				<td colspan="2" class="t-center">과소(초과환급)<br>신고</td>
				<td class="t-center">납부(환급)<br>불성실</td>
				<td class="t-center">기타</td>
				<td rowspan="2" colspan="2">(31)납세지별<br>&nbsp;&nbsp;&nbsp;기납부세액</td>
				<td class="t-center">특별징수납부세액</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2" ></td>
				<td></td>
				<td></td>
				<td class="t-center">수시부과세액</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="5" class="t-left">(32)경정·수정신고 등 가감액</td>
				<td colspan="3" class="t-left">(33)탄력세율적용 조정세액</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="11" class="t-left">(34)해당 납세지에 납부할 세액</td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB0">
		<%	xmlBuf += "<bank_nm>"+obox.get("bank_nm")+"</bank_nm>\n"
				   +  "<account_type>"+obox.get("account_type")+"</account_type>\n" 
				   +  "<account_no>"+obox.get("account_no")+"</account_no>\n"
				   +  "<today_ymd>"+StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)+"년 "+StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)+"월 "+StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)+"일"+"</today_ymd>\n" 
				   +  "<tax_office>"+obox.get("tax_office")+"</tax_office>\n"; 
		%>
			<tr>
				<td rowspan="3" width="15%" class="t-center">환 급 금<br>계&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;좌</td>
				<td width="10%" class="t-left">(35)금융기관명</td>
				<td width="75%" class="t-center"><%=obox.get("bank_nm")%></td>
			</tr>
			<tr>
				<td class="t-left">(36)예 금 주</td>
				<td class="t-center"><%=obox.get("corp_nm")%></td>
			</tr>
			<tr>
				<td class="t-left">(37)계 좌 번 호</td>
				<td class="t-center"><%=obox.get("account_no")%></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">
					신고인은 「지방세법」제103조의23 및 제103조의24에 따라 위의 내용을 신고하며, <b>위 내용을 충분히 검토하였고 신고인이 알고 있는 사실 그대로를 정확하게 적었음을 확인합니다.</b>
					<br><br>
					<%=StringUtil.strLooping("&nbsp;",150)%>
					신고인(대표자) &nbsp;<%=obox.get("rep_person_nm")%> &nbsp;&nbsp;&nbsp;(서명 또는 인) 
				</td>
			</tr> 
			<tr>
				<td colspan="3" class="t-left">
					<b><%=obox.get("tax_office")%> 시장·군수·구청장</b> 귀하
				</td>
			</tr> 
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>