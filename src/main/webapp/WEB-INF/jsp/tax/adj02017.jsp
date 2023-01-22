<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"       class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"      class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제17호 서식] 조정후수입금액명세서 -->
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
	
	<h2 class="page-title-2depths">조정후수입금액명세서</h2>

	<div class="table-top-control">
		<span>[별지 제17호 서식]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>

	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
			<tr>
				<th colspan="11" class="t-left">1. 업종별 수입금액명세서</th>
			</tr> 
			<tr>
				<td rowspan="3" width="10%" class="td-head">①업태</td>
				<td rowspan="3" width="10%" class="td-head">②종목</td>
				<td rowspan="3" width="10%" class="td-head">코드</td>
				<td rowspan="3" width="14%" class="td-head">③기준(단순)<br>경비율번호</td>
				<td colspan="7" class="td-head">수입금액</td>
			</tr> 
			<tr>
				<td rowspan="2" width="14%" class="td-head">④계<br>(⑤+⑥+⑦)<br></td>
				<td colspan="4" class="td-head">내수</td>
				<td rowspan="2" colspan="2" width="14%" class="td-head">⑦수출</td>
			</tr> 
			<tr>
				<td width="14%" colspan="2" class="td-head">⑤국내생산품</td>
				<td width="14%" colspan="2" class="td-head">⑥수입상품</td>
			</tr> 
			<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); 
				Long amt_61 = rbox.getLong("cur_acum"); // 이자수익+대부이자수익  %> 
				
			<%	xmlBuf += "<amt_61>"+FormatUtil.insertComma(String.valueOf(amt_61))+"</amt_61>\n"; %>
			<tr>
				<td class="t-left">(101)&nbsp;비영리</td>
				<td class="t-left">복지기금</td>
				<td class="t-cetner">01</td>
				<td class="t-cetner">000000</td>
				<td class="t-right" ><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td class="t-left">(102)</td>
				<td></td>
				<td class="t-cetner">02</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(103)</td>
				<td></td>
				<td class="t-cetner">03</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(104)</td>
				<td></td>
				<td class="t-cetner">04</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(105)</td>
				<td></td>
				<td class="t-cetner">05</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(106)</td>
				<td></td>
				<td class="t-cetner">06</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(107)</td>
				<td></td>
				<td class="t-cetner">07</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(108)</td>
				<td></td>
				<td class="t-cetner">08</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(109)</td>
				<td></td>
				<td class="t-cetner">09</td>
				<td class="t-cetner"></td>
				<td class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
				<td colspan="2" class="t-right" ></td>
			</tr>
			<tr>
				<td class="t-left">(110)</td>
				<td></td>
				<td class="t-cetner">10</td>
				<td class="t-cetner"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(111)&nbsp;기타</td>
				<td class="t-cetner">11</td>
				<td class="t-cetner"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(112)&nbsp;합계</td>
				<td class="t-cetner">99</td>
				<td class="t-cetner"></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<th colspan="11" class="t-left">2. 부가가치세 과세표준과 수입금액 차액 검토</th>
			</tr> 
			<tr>
				<th colspan="11" class="t-left">(1) 부가가치세 과세표준과 수입금액 차액</th>
			</tr> 
			<tr>
				<td colspan="2" class="td-head">⑧과세(일반)</td>
				<td colspan="2" class="td-head">⑨과세(영세율)</td>
				<td colspan="2" class="td-head">⑩면세수입금액</td>
				<td class="td-head">⑪합계(⑧+⑨+⑩)</td>
				<td colspan="2" class="td-head">⑫수입금액</td>
				<td colspan="2" class="td-head">⑬차액(⑪-⑫)</td>
			</tr> 
			<tr>
				<td class="t-cetner" colspan="2"></td>
				<td class="t-cetner" colspan="2"></td>
				<td class="t-cetner" colspan="2"><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
				<td class="t-cetner"><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
				<td class="t-cetner" colspan="2"><%=FormatUtil.insertComma(String.valueOf(amt_61))%></td>
				<td class="t-cetner" colspan="2"></td>
			</tr>
			<tr>
				<th colspan="11" class="t-left">(2) 수입금액과의 차액내역</th>
			</tr> 
			<tr>
				<td colspan="2" class="td-head">⑭구분</td>
				<td class="td-head">⑮코드</td>
				<td colspan="2" class="td-head">(16)금액</td>
				<td class="td-head">비고</td>
				<td class="td-head">⑭구분</td>
				<td class="td-head">⑮코드</td>
				<td colspan="2" class="td-head">(16)금액</td>
				<td class="td-head">비고</td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left">자가공급</td>
				<td class="t-cetner">21</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td class="t-left">거래시기차이 감액</td>
				<td class="t-cetner">30</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">사업상증여</td>
				<td class="t-cetner">22</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td class="t-left">주세·특별소비세</td>
				<td class="t-cetner">31</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">개인적공급</td>
				<td class="t-cetner">23</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td class="t-left">매출누락</td>
				<td class="t-cetner">32</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">간주임대료</td>
				<td class="t-cetner">24</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td></td>
				<td class="t-cetner">33</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td rowspan="2" class="t-left">자산<br>매각</td>
				<td class="t-left">고정자산매각액</td>
				<td class="t-cetner">25</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td></td>
				<td class="t-cetner">34</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td class="t-left">기타 자산처분액</td>
				<td class="t-cetner">26</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td></td>
				<td class="t-cetner">35</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">잔존재고재화</td>
				<td class="t-cetner">27</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td></td>
				<td class="t-cetner">36</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">작업진행율 차이</td>
				<td class="t-cetner">28</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td></td>
				<td class="t-cetner">37</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">거래시기차이 가산</td>
				<td class="t-cetner">29</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
				<td class="t-left">(17) 차 액 계</td>
				<td class="t-cetner">50</td>
				<td colspan="2" class="t-left"></td>
				<td></td>
			</tr>
		</table>
	</div>
	<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>