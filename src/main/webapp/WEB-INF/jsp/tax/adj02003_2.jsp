<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<!-- [별지 제43호의2서식] 법인지방소득세 과세표준 및 세액조정계산서 -->
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

	
	<h2 class="page-title-2depths">법인지방소득세 과세표준 및 세액조정계산서</h2>
	
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제3호 서식]</span>
	</div>
	
	<div class="table-scrollable">
		<table class="table table-bordered order-column">
			<tr height="28">
				<td width="30%" class="t-left">법인명 : <%=obox.get("corp_nm")%></td>
				<td width="30%" class="t-left">사업자등록번호 : <%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
				<td width="40%" class="t-left">사업연도 : <%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
			</tr>							
		</table>
	</div>
		
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column">
			<tr>
				<td class="pad0" valign="top" style="border:0">
				<%	xmlBuf += "<saup_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+" ~ "+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</saup_ymd>\n"
					  	   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					  	   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
					<div class="table-scrollable" style="height:196px; !important">
						<table class="table table-bordered order-column">						   
							<tr height="28">
								<td rowspan="7" width="5%" class="center">1.<br>과<br>세<br>표<br>준<br>계<br>산</td>
								<td colspan="3" width="55%" class="t-left">(108)각 사업연도 소득금액(108=107)</td>
								<td width="40%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(109)이월결손금</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(110)비과세소득</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(111)소득공제</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(112)과세표준(108-109-110-111)</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="5">
								<td colspan="5"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(158)선박표준이익</td>
								<td class="t-right"></td>
							</tr>
						</table>
					</div>
						
					<div class="table-scrollable" style="height:209px; !important">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="7" width="5%" class="t-center">2.<br>산<br>출<br>세<br>액<br>계<br>산</td>
								<td colspan="3" width="55%" class="t-left">(113)과세표준(112+159)</td>
								<td width="40%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(114)세율</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(115)산출세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(116)지점유보소득(법인세법 제96조)</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(117)지점유보소득에 대한 법인세 산출세액</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(118)법인지방소득세 산출세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(119)합계(115+118)</td>
								<td class="t-right">0</td>
							</tr>
						</table>
					</div>
						
					<div class="table-scrollable" style="height:474px; !important">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="16" width="5%" class="center">3.<br>납<br>부<br>할<br>세<br>액<br>계<br>산</td>
								<td colspan="3" class="t-left" width="55%">(120)산출세액(120=119)</td>
								<td width="40%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(121)최저한세 적용대상 공제감면세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(122)차감세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(123)최저한세 적용제외 공제감면세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(124)가산세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(125)가감계(120-121-123+124)</td>
								<td class="t-right">0</td>
							</tr>
							<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110902","","", uSesEnt.dbo); 
								Long pre_tax_amt = rbox.getLong("cur_acum"); // 기납부세액(선급법인세) %>
							<tr height="28">
								<td rowspan="7" width="5%" class="center">기<br>납<br>부<br>세<br>액</td>
								<td rowspan="5" width="5%" class="center">기<br>한<br>내<br>납<br>부<br>세<br>액</td>
								<td class="t-left" width="45%">(126)비영리내국법인의 예정신고세액</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td class="t-left">(127)수시부과세액</td>
								<td class="t-right"></td>
							</tr>
							<%	xmlBuf += "<pre_tax_amt>"+FormatUtil.insertComma(String.valueOf(pre_tax_amt))+"</pre_tax_amt>\n"
									   +  "<pre_tax_amt_min>"+FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))+"</pre_tax_amt_min>\n"; %>
							<tr height="28">
								<td class="t-left">(128)특별징수납부세액</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
							</tr>
							<tr height="28">
								<td class="t-left">(129)간접투자회사 등의 외국납부세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td class="t-left">(130)소계(126+127+128+129)</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(131)신고납부전가산세액</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(132)합계(130+131)</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(133)탄력세율적용 조정세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(134)감면분 추가 납부세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(136)차감납부할 세액(125-132+-133+134)</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
							</tr>
						</table>
					</div>
				</td>
					
				<td class="padR0" style="border:0" valign="top">
					<div class="table-scrollable" style="height:377px; !important">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="16" width="5%" class="center">4.<br>토<br>지<br>등<br><br>양<br>도<br>소<br>득<br>에<br><br>대<br>한<br><br>법<br>인<br>세<br>계<br>산</td>
								<td colspan="3" width="55%" class="t-left">(137)과세표준</td>
								<td width="40%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(138)세율</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(139)산출세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(140)감면세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(141)차감세액(139-140)</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(142)공제세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(143)동업기업 법인지방세 세 배분액(가산세 제외)</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(144)가산세액(동업기업 배분액 포함)</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(145)가감계(139+143+144)</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td rowspan="3" class="center">기<br>납<br>부<br>세<br>액</td>
								<td colspan="2" class="t-left">(146)수시부과세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(147)(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(149)계(146+147)</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(149)차감납부할세액(145-148)</td>
								<td class="t-right">0</td>
							</tr>
						</table>
					</div>
					
					<div class="table-scrollable" style="height:196px; !important">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="7" width="5%" class="center">5.<br>미<br>환<br>류<br>소<br>득<br>법<br>인<br>지<br>방<br>소<br>득<br>세</td>
								<td colspan="3" width="55%" class="t-left">(150)미환류소득</td>
								<td width="40%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(151)세율</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(152)산출세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(153)가산세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(154)기납부세액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(158)이자상당액</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(155)차감납부할세액(152+153-154+158)</td>
								<td class="t-right">0</td>
							</tr>
						</table>
					</div>
										   
					<div class="table-scrollable">
						<table class="table table-bordered order-column" style="height:97px; !important">
							<tr height="28">
								<td rowspan="3" width="5%" class="center">6.<br>세<br>액<br>계</td>
								<td colspan="3" width="55%" class="t-left">(156)해당연도 차감납부할 세액계(136+149+155)</td>
								<td width="40%" class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(135)경정·수정신고 등 가감액</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(157)조정 후 납부할 세액계(156+135)</td>
								<td class="t-right">0</td>
							</tr>
						</table>
					</div>
					<div style="height:206px">
					</div>											   
				</td>
			</tr>
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>