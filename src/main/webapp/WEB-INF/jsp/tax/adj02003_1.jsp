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

<title>[별지 제3호 서식] 법인세 과세표준 및 세액조정계산서</title>

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
	
	
	<h2 class="page-title-2depths">법인세 과세표준 및 세액조정계산서</h2>
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제3호 서식]</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column" border="0" cellspacing="0">
			<tr>
				<td class="pad0" style="border:0" valign="top">
				<%	xmlBuf += "<acc_start_ymd>"+StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????-??-??")+"</acc_start_ymd>\n"
						   +  "<acc_end_ymd>"+StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????-??-??")+"</acc_end_ymd>\n"
						   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
						   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
					<div class="table-scrollable">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="7" width="5%" class="t-center">①<br>각<br>사<br>업<br>연<br>도<br>소<br>득<br>금<br>액<br>계<br>산</td>
								<td colspan="3" width="55%" class="t-left">(101)결산서상당기순손익</td>
								<td width="5%" class="t-center">01</td>
								<td width="35%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td rowspan="2" width="20%" class="t-center">소득금액<br>조정</td>
								<td colspan="2" class="t-left" width="35%">(102)익 금 산 입</td>
								<td class="t-center">02</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(103)손 금 산 입</td>
								<td class="t-center">03</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(104)차가감 소득금액(101+102-103)</td>
								<td class="t-center">04</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(105)기부금한도초과액</td>
								<td class="t-center">05</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(106)기부금한도초과 이월금손금산입</td>
								<td class="t-center">54</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(107)각 사업연도소득금액(104+105-106)</td>
								<td class="t-center">06</td>
								<td class="t-right">0</td>
							</tr>
						</table>
					</div>
					<div class="table-scrollable">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="7" width="5%" class="t-center">②<br>과<br>세<br>표<br>준<br>계<br>산</td>
								<td colspan="3" class="t-left" width="55%">(108)각 사업연도 소득금액(108=107)</td>
								<td width="5%" class="t-center"></td>
								<td width="35%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(109)이월결손금</td>
								<td class="t-center">07</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(110)비과세소득</td>
								<td class="t-center">08</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(111)소득공제</td>
								<td class="t-center">09</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(112)과세표준(108-109-110-111)</td>
								<td class="t-center">10</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="14">
								<td colspan="5"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(159)선박표준이익</td>
								<td class="t-center">55</td>
								<td class="t-right"></td>
							</tr>
						</table>
					</div>
						
					<div class="table-scrollable">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="7" width="5%" class="t-center">③<br>산<br>출<br>세<br>액<br>계<br>산</td>
								<td colspan="3" class="t-left" width="55%">(113)과세표준(112+159)</td>
								<td width="5%" class="t-center">56</td>
								<td width="35%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(114)세율</td>
								<td class="t-center">11</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3"class="t-left">(115)산출세액</td>
								<td class="t-center">12</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(116)지점유보소득(법인세법 제96조)</td>
								<td class="t-center">13</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(117)세율</td>
								<td class="t-center">14</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(118)산출세액</td>
								<td class="t-center">15</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(119)합계(115+118)</td>
								<td class="t-center">16</td>
								<td class="t-right">0</td>
							</tr>
						</table>
					</div>
					
					<div class="table-scrollable">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="13" width="5%" class="t-center">④<br>납<br>부<br>할<br>세<br>액<br>계<br>산</td>
								<td colspan="3" width="55%" class="t-left">(120)산출세액(120=119)</td>
								<td width="5%" class="t-center"></td>
								<td width="35%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(121)공제감면세액(ㄱ)</td>
								<td class="t-center">17</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(122)차감세액</td>
								<td class="t-center">18</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(123)공제감면세액(ㄴ)</td>
								<td class="t-center">19</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(124)가산세액</td>
								<td class="t-center">20</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(125)가감계(122-123+124)</td>
								<td class="t-center">21</td>
								<td class="t-right">0</td>
							</tr>
							<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110901","","", uSesEnt.dbo); 
								Long pre_tax_amt = rbox.getLong("cur_acum"); // 기납부세액(선급법인세) %>
							<tr height="28">
								<td rowspan="7" width="5%" class="t-center">기<br>납<br>부<br>세<br>액</td>
								<td rowspan="5" width="5%" class="t-center">기<br>한<br>내<br>납<br>부<br>세<br>액</td>
								<td class="t-left" width="45%">(126)중간예납세액</td>
								<td class="t-center">22</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td class="t-left">(127)수시부과세액</td>
								<td class="t-center">23</td>
								<td class="t-right"></td>
							</tr>
							<%	xmlBuf += "<pre_tax_amt>"+FormatUtil.insertComma(String.valueOf(pre_tax_amt))+"</pre_tax_amt>\n"
									   +  "<pre_tax_amt_min>"+FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))+"</pre_tax_amt_min>\n"; %>
							<tr height="28">
								<td class="t-left">(128)원천납부세액</td>
								<td class="t-center">24</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
							</tr>
							<tr height="28">
								<td class="t-left">(129)간접투자회사 등의 외국납부세액</td>
								<td class="t-center">25</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td class="t-left">(130)소계(126+127+128+129)</td>
								<td class="t-center">26</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(131)신고납부전가산세액</td>
								<td class="t-center">27</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(132)합계(130+131)</td>
								<td class="t-center">28</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt))%></td>
							</tr>
						</table>
					</div>
				</td>
					
				<td class="padR0" style="border:0" valign="top">
					<div class="table-scrollable">
						<table class="table table-bordered order-column" style="height:70px;">
							<tr height="28">
								<td rowspan="2" width="5%" class="t-center"></td>
								<td colspan="3" width="55%" class="t-left">(133)감면분추가납부세액</td>
								<td width="5%" class="t-center">29</td>
								<td width="35%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(134)차감납부할세액(125-132+133)</td>
								<td class="t-center">30</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
							</tr>
						</table>
					</div>
					
					<div class="table-scrollable">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="16" width="5%" class="t-center">⑤<br>토<br>지<br>등<br><br>양<br>도<br>소<br>득<br>에<br><br>대<br>한<br><br>법<br>인<br>세<br>계<br>산</td>
								<td rowspan="2" width="10%" class="t-center">양도<br>차익</td>
								<td colspan="2" width="45%" class="t-left">(135)등기자산</td>
								<td width="5%" class="t-center">31</td>
								<td width="35%" class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(136)미등기자산</td>
								<td class="t-center">32</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(137)비과세소득</td>
								<td class="t-center">33</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(138)과세표준(135+136-137)</td>
								<td class="t-center">34</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(139)세율</td>
								<td class="t-center">35</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(140)산출세액</td>
								<td class="t-center">36</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(141)감면세액</td>
								<td class="t-center">37</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(142)차감세액(140-141)</td>
								<td class="t-center">38</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(143)공제세액</td>
								<td class="t-center">39</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(144)동업기업 법인세 배분액(가산세 제외)</td>
								<td class="t-center">58</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(145)가산세액(동업기업 배분액 포함)</td>
								<td class="t-center">40</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(146)가감계(142-143+144+145)</td>
								<td class="t-center">41</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td rowspan="3" class="t-center">기<br>납<br>부<br>세<br>액</td>
								<td colspan="2" class="t-left">(147)수시부과세액</td>
								<td class="t-center">42</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(148)(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)세액</td>
								<td class="t-center">43</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(149)계(147+148)</td>
								<td class="t-center">44</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(150)차감납부할세액(146-149)</td>
								<td class="t-center">45</td>
								<td class="t-right">0</td>
							</tr>
						</table>
					</div>
					
					<div class="table-scrollable">
						<table class="table table-bordered order-column">
							<tr height="28">
								<td rowspan="6" width="5%" class="t-center">⑥<br>미<br>환<br>류<br>소<br>득<br>법<br>인<br>세</td>
								<td colspan="3" width="55%" class="t-left">(161) 과세대상 미환류소득</td>
								<td width="5%" class="t-center">59</td>
								<td width="35%" class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(162)세율</td>
								<td class="t-center">60</td>
								<td class="t-right"></td>
							</tr>							
							<tr height="28">
								<td colspan="3" class="t-left">(163)산출세액</td>
								<td class="t-center">61</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(164)가산세액</td>
								<td class="t-center">62</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(165)이자상당액</td>
								<td class="t-center">63</td>
								<td class="t-right"></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(166)납부할세액(163+164+165)</td>
								<td class="t-center">64</td>
								<td class="t-right"></td>
							</tr>
						</table>
					</div>
					
					<div class="table-scrollable">
						<table class="table table-bordered order-column">	
							<tr height="28">
								<td rowspan="9" width="5%" class="t-center">⑦<br>세<br>액<br>계</td>
								<td colspan="3" width="55%" class="t-left">(151)차감납부할세액계(134+150+166)</td>
								<td width="5%" class="t-center">46</td>
								<td width="35%" class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(152)사실과 다른 회계처리 경정세액공제</td>
								<td class="t-center">57</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="3" class="t-left">(153)분납세액계산범위액(151-124-133-145-152+131)</td>
								<td class="t-center">47</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
							</tr>
							<tr height="28">
								<td rowspan="3" width="10%" class="t-center">분납할세액</td>
								<td colspan="2" width="45%" class="t-left">(154)현금납부</td>
								<td class="t-center">48</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(155)물납</td>
								<td class="t-center">49</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(156)계(154+155)</td>
								<td class="t-center">50</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td rowspan="3" class="t-center">차감납부세액</td>
								<td colspan="2" class="t-left">(157)현금납부</td>
								<td class="t-center">51</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(158)물납</td>
								<td class="t-center">52</td>
								<td class="t-right">0</td>
							</tr>
							<tr height="28">
								<td colspan="2" class="t-left">(160)계(157+158)<br>(160=(151-152-156))</td>
								<td class="t-center">53</td>
								<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(pre_tax_amt*-1))%></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>