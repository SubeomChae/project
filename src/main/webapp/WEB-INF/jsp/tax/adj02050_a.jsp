<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- [별지 제50호 서식] 자본금과 적립금 조정명세서(갑) -->
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
<input type="hidden" name="report_id"  value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 	   value="<%=box.get("std_yy")%>">

	<h2 class="page-title-2depths">자본금과 적립금 조정명세서(갑)</h2>
		
	<div class="table-top-control">
		<span>[별지 제50호 서식(갑)]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
			<%	xmlBuf += "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n";
			%>
			<tr>
				<th colspan="11" class="t-left">I. 자본금과 적립금 계산서</th>
			</tr> 
			<tr>
				<td rowspan="2" colspan="2" class="td-head" width="26%">①  과목 또는 사항</td>
				<td rowspan="2" class="td-head" width="6%">코드</td>
				<td rowspan="2" class="td-head" width="12%">②  기초잔액</td>
				<td colspan="2" class="td-head">당기중 증감</td>
				<td rowspan="2" class="td-head" width="12%">⑤  기말잔액</td>
				<td rowspan="2" colspan="4" class="td-head" width="20%">비고</td>
			</tr> 
			<tr>
				<td class="td-head" width="12%">③ 감소</td>
				<td class="td-head" width="12%">④ 증가</td>
			</tr> 
			<% 	Long sum_2 = 0L;
				Long sum_3 = 0L;
				Long sum_4 = 0L;
				Long sum_5 = 0L;
				rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","31","","", uSesEnt.dbo); // 자본금 
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol1>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol1>\n"
					   +  "<cha_amt1>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt1>\n"
					   +  "<dae_amt1>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt1>\n"
					   +  "<cur_acum1>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum1>\n"; %>
			<tr>
				<td rowspan="7" width="4%" class="t-center">자<br>본<br>금<br> 및<br><br>잉<br>여<br>금<br><br>등<br>의<br><br>계<br>산</td>
				<td class="t-left">1. 자본금</td>
				<td class="t-center">01</td>
				<td class="t-right"><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cha_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("dae_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
				<td colspan="4"></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","32","","", uSesEnt.dbo); // 자본잉여금   
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol2>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol2>\n"
					   +  "<cha_amt2>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt2>\n"
					   +  "<dae_amt2>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt2>\n"
					   +  "<cur_acum2>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum2>\n"; %>
			<tr>
				<td class="t-left">2. 자본잉여금</td>
				<td class="t-center">02</td>
				<td class="t-right"><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cha_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("dae_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
				<td colspan="4"></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","34","","", uSesEnt.dbo); // 자본조정   
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol3>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol3>\n"
					   +  "<cha_amt3>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt3>\n"
					   +  "<dae_amt3>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt3>\n"
					   +  "<cur_acum3>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum3>\n"; %>
			<tr>
				<td class="t-left">3. 자본조정</td>
				<td class="t-center">15</td>
				<td class="t-right"><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cha_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("dae_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td class="t-left">4. 기타포괄손익누계액</td>
				<td class="t-center">18</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="4"></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","33","","", uSesEnt.dbo); // 이익잉여금  
				sum_2 += rbox.getLong("pre_iwol");
				sum_3 += rbox.getLong("cha_amt");
				sum_4 += rbox.getLong("dae_amt");
				sum_5 += rbox.getLong("cur_acum"); 
	
				xmlBuf += "<pre_iwol4>"+rbox.get("pre_iwol",Box.THOUSAND_COMMA)+"</pre_iwol4>\n"
					   +  "<cha_amt4>"+rbox.get("cha_amt",Box.THOUSAND_COMMA)+"</cha_amt4>\n"
					   +  "<dae_amt4>"+rbox.get("dae_amt",Box.THOUSAND_COMMA)+"</dae_amt4>\n"
					   +  "<cur_acum4>"+rbox.get("cur_acum",Box.THOUSAND_COMMA)+"</cur_acum4>\n"								
					   +  "<sum_2>"+FormatUtil.insertComma(String.valueOf(sum_2))+"</sum_2>\n"
					   +  "<sum_3>"+FormatUtil.insertComma(String.valueOf(sum_3))+"</sum_3>\n"
					   +  "<sum_4>"+FormatUtil.insertComma(String.valueOf(sum_4))+"</sum_4>\n"
					   +  "<sum_5>"+FormatUtil.insertComma(String.valueOf(sum_5))+"</sum_5>\n"; %>
			<tr>
				<td class="t-left">5. 이익잉여금</td>
				<td class="t-center">14</td>
				<td class="t-right"><%=rbox.get("pre_iwol",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cha_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("dae_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-right"><%=rbox.get("cur_acum",Box.THOUSAND_COMMA)%></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td class="t-left"></td>
				<td class="t-center">17</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td class="t-left">6. 계</td>
				<td class="t-center">20</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_2))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_3))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_4))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_5))%></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">7. 자본금과 적립금명세서(을) 계</td>
				<td class="t-center">21</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td rowspan="3" class="t-center">손익<br>미계상<br>법인세<br>등</td>
				<td class="t-left">8. 법인세</td>
				<td class="t-center">22</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td class="t-left">9. 지방소득세</td>
				<td class="t-center">23</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td class="t-left">10. 계 (8+9)</td>
				<td class="t-center">30</td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="4"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">11. 차가감계 (6+7-10) 계</td>
				<td class="t-center">31</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_2))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_3))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_4))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(sum_5))%></td>
				<td colspan="4"></td>
			</tr>
		</table>		
	
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<th colspan="13" class="t-left">II. 이월 결손금 계산서</th>
			</tr> 
			<tr>
				<th colspan="13" class="t-left">1. 이월결손금 발생 및 증감내역</th>
			</tr>
			<tr>
				<td rowspan="3" class="td-head" width="9%">⑥  사업년도</td>
				<td colspan="5" class="td-head">이월결손금</td>
				<td colspan="4" class="td-head">감소내역</td>
				<td colspan="3" class="td-head">잔액</td>
			</tr> 
			<tr>
				<td colspan="3" class="td-head">발생액</td>
				<td rowspan="2" class="td-head" width="8%">⑩소급공제</td>
				<td rowspan="2" class="td-head" width="8%">⑪차감계</td>
				<td rowspan="2" class="td-head" width="8%">⑫기공제액</td>
				<td rowspan="2" class="td-head" width="6%">⑬당기공제액</td>
				<td rowspan="2" class="td-head" width="8%">⑭보전</td>
				<td rowspan="2" class="td-head" width="8%">⑮계</td>
				<td rowspan="2" class="td-head" width="8%">(16)기한내</td>
				<td rowspan="2" class="td-head" width="6%">(17)기한경과</td>
				<td rowspan="2" class="td-head" width="8%">(18)계</td>
			</tr>
				<tr>
				<td width="7%" class="td-head">⑦계</td>
				<td width="8%" class="td-head">⑧일반결손금</td>
				<td width="8%" class="td-head">⑨배분한도초과 결손금(9=25)</td>
			</tr>
		<% for(int i=0; i < 3; i++) { %>
			<tr>
				<td class="t-center"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
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
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr bgcolor="f6f6f6">
				<th colspan="13" class="t-left">2. 법인세 신고 사업연도의 결손금에 동업기업으로부터 배분한도를 초과하여 배분받은 결손금(배분한도 초과결손금)이 포함되어 있는 경우 사업연도별 이월결손금 구분내역</th>
			</tr>
			<tr>
				<td rowspan="3" class="td-head">(19)법인세 신고 사업연도</td>
				<td rowspan="3" class="td-head">(20)동업기업 과세연도 종료일</td>
				<td rowspan="3" class="td-head">(21)손금산입한 배분한도 초과 결손금</td>
				<td rowspan="3" class="td-head">(22)법인세신고 사업연도 결손금</td>
				<td colspan="9" class="td-head">배분한도 초과결손금이 포함된 이월결손금 사업연도별 구분</td>
			</tr> 
			<tr>
				<td rowspan="2" class="td-head">(23)합계(23=25+26)</td>
				<td colspan="4" class="td-head">배분한도 초과결손금 해당액</td>
				<td rowspan="2" colspan="4" class="td-head">(26)법인세 신고 사업연도 발생 이월결손금 해당액(8일반결손금으로 계상)(21≥22의 경우는 "0", 21≤22의 경우는 22-21)</td>
			</tr>
			<tr>
				<td colspan="2" class="td-head">(24)이월결손금 발생 사업연도</td>
				<td colspan="2" class="td-head">(25)이월결손금(25=9)21과22중 작은것에 상당하는 금액</td>
			</tr>
		<% for(int i=0; i < 3; i++) { %>
			<tr>
				<td class="t-center"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td colspan="4" class="t-right"></td>
			</tr>
		<% } %>
		</table>

		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<th colspan="11" class="t-left">Ⅲ. 회계기준 변경에 따른 자본금과 적립금 기초잔액 수정</th>
			</tr> 
			<tr>
				<td rowspan="2" colspan="2" class="td-head" width="26%">(27)과목 또는 사항</td>
				<td rowspan="2" class="td-head" width="6%">(28)코드</td>
				<td rowspan="2" class="td-head" width="12%">(29)전기말 잔액</td>
				<td colspan="2" class="td-head">기초잔액 수정</td>
				<td rowspan="2" class="td-head" width="12%">(32)수정후 기초잔액(29+30-31)</td>
				<td rowspan="2" colspan="4" class="td-head" width="20%">비고</td>
			</tr> 
			<tr>
				<td width="12%" class="td-head">(30)증가</td>
				<td width="12%" class="td-head">(31)감소</td>
			</tr>
		<% for(int i=0; i < 3; i++) { %>
			<tr>
				<td colspan="2" class="t-center"></td>
				<td class="t-center"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-center"></td>
			</tr>
		<% } %>
		</table>
	</div>	
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>