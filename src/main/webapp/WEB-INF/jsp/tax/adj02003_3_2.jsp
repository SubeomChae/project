<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>

<!-- [별지 제3호의3 서식(2)] 표준손익계산서(금융·보험·증권업 법인용) -->
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

<% if(!box.get("excel_yn").equals("Y")) { %>
<form id="taxForm" name="taxForm" method="post" action="" class="fType">
<input type="hidden" name="report_id" 	value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 		value="<%=box.get("std_yy")%>">
	
	
	<h2 class="page-title-2depths">표준손익계산서(금융·보험·증권업 법인용)</h2>
			
	<div class="table-top-control">
		<span style="float:right;">[별지 제3호의3 서식(2)]</span>
	</div>
<% } %>
	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
		<% xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
				  +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
				  +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
				  +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
				  +  "<code61_amt>" + rbox.get("code61_amt",Box.THOUSAND_COMMA) + "</code61_amt>\n"
				  +  "<code6100_amt>" + rbox.get("code6100_amt",Box.THOUSAND_COMMA) + "</code6100_amt>\n"
				  +  "<code6100201_amt>" + rbox.get("code6100201_amt",Box.THOUSAND_COMMA) + "</code6100201_amt>\n"
				  +  "<code6100101_amt>" + rbox.get("code6100101_amt",Box.THOUSAND_COMMA) + "</code6100101_amt>\n"
				  +  "<code6100301_amt>" + rbox.get("code6100301_amt",Box.THOUSAND_COMMA) + "</code6100301_amt>\n"; %>
			<tr>
				<td width="25%">계정과목</td>
				<td width="5%">코드</td>
				<td width="20%">금액</td>
				<td width="25%">계정과목</td>
				<td width="5%">코드</td>
				<td width="20%">금액</td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅰ.영업수익</td>
				<td class="t-center">1</td>
				<td class="t-right padR5"><%=rbox.get("code61_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL35">바.해외유가증권처분이익</td>
				<td class="t-center">69</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)이자수익</td>
				<td class="t-center">2</td>
				<td class="t-right padR5"><%=rbox.get("code6100_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL35">사.신종증권처분(상환)이익</td>
				<td class="t-center">70</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.예적금(예치금)이자</td>
				<td class="t-center">3</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">아.기타</td>
				<td class="t-center">71</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.대출채권이자</td>
				<td class="t-center">4</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.매도가능증권처분이익</td>
				<td class="t-center">81</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.매입어음이자</td>
				<td class="t-center">5</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.주식처분이익</td>
				<td class="t-center">82</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.유가증권이자</td>
				<td class="t-center">6</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.출자금처분이익</td>
				<td class="t-center">83</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.단기매매증권</td>
				<td class="t-center">7</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.채권처분이익</td>
				<td class="t-center">84</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.매도가능증권</td>
				<td class="t-center">8</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">라.수익증권처분이익</td>
				<td class="t-center">85</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.만기보유증권</td>
				<td class="t-center">9</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">마.해외유가증권처분이익</td>
				<td class="t-center">86</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.채권이자</td>
				<td class="t-center">10</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">바.신종증권처분(상환)이익</td>
				<td class="t-center">87</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.콜론이자</td>
				<td class="t-center">11</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">사.기타</td>
				<td class="t-center">88</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.할부금융이자</td>
				<td class="t-center">12</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(10)유가증권평가이익</td>
				<td class="t-center">98</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">8.금융리스이자</td>
				<td class="t-center">13</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.주식평가이익</td>
				<td class="t-center">99</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">9.기업융통어음이자</td>
				<td class="t-center">14</td>
				<td class="t-right padR5"><%=rbox.get("code6100201_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">2.채권평가이익</td>
				<td class="t-center">100</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">10.증권금융예치금이자</td>
				<td class="t-center">15</td>
				<td class="t-right padR5"><%=rbox.get("code6100101_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">3.신주인수권증서평가이익</td>
				<td class="t-center">101</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">11.양도성정기예금증서이자</td>
				<td class="t-center">16</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.수익증권평가이익</td>
				<td class="t-center">102</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">12.환매조건부채권매수이자</td>
				<td class="t-center">17</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.기업융통어음평가이익</td>
				<td class="t-center">103</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">13.신용거래융자이자</td>
				<td class="t-center">18</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.신종증권평가이익</td>
				<td class="t-center">104</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">14.주주·임원·종업원 대여금 이자</td>
				<td class="t-center">19</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">7.기타</td>
				<td class="t-center">105</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">15.기타</td>
				<td class="t-center">20</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(11)매도가능증권손상차손환입</td>
				<td class="t-center">115</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)수수료수익</td>
				<td class="t-center">30</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(12)만기보유증권손상차손환입</td>
				<td class="t-center">116</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.수입수수료</td>
				<td class="t-center">31</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(13)신탁업무운용수익</td>
				<td class="t-center">117</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.수입보증료</td>
				<td class="t-center">32</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(14)외환거래이익</td>
				<td class="t-center">118</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.신용카드수수료</td>
				<td class="t-center">33</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.외환차익</td>
				<td class="t-center">119</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.중도해지수수료</td>
				<td class="t-center">34</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.외화환산이익</td>
				<td class="t-center">120</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.수탁수수료(증권업)</td>
				<td class="t-center">35</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(15)파생상품거래이익</td>
				<td class="t-center">121</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.수익증권취급수수료</td>
				<td class="t-center">36</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.선물거래이익</td>
				<td class="t-center">122</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.인수및주선수수료</td>
				<td class="t-center">37</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.옵션거래이익</td>
				<td class="t-center">123</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">8.자산관리수수료</td>
				<td class="t-center">38</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.장외파생상품거래이익</td>
				<td class="t-center">124</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">9.자문수수료</td>
				<td class="t-center">39</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(16)파생상품평가이익</td>					
				<td class="t-center">125</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">10.신종증권판매수수료</td>
				<td class="t-center">40</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.선물평가이익</td>
				<td class="t-center">126</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">11.신탁보수</td>
				<td class="t-center">41</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.옵션평가이익</td>
				<td class="t-center">127</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">12.기타</td>
				<td class="t-center">42</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.장외파생상품평가이익</td>
				<td class="t-center">128</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)보험료수익</td>
				<td class="t-center">52</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(17)투자부동산처분이익</td>
				<td class="t-center">129</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.개인보험료</td>
				<td class="t-center">53</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(18)투자부동산평가이익</td>
				<td class="t-center">130</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.단체보험료</td>
				<td class="t-center">54</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(19)충당부채 및 준비금 환입액</td>
				<td class="t-center">131</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)재보험수익</td>
				<td class="t-center">55</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.지급보증충당부채환입액</td>
				<td class="t-center">132</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)구상이익</td>
				<td class="t-center">56</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.책임준비금환입액</td>
				<td class="t-center">133</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)대출채권평가및처분이익</td>
				<td class="t-center">57</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.비상위험준비금환입액</td>
				<td class="t-center">134</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.대손충당금환입액</td>
				<td class="t-center">58</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.기타</td>
				<td class="t-center">135</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.대출채권처분이익</td>
				<td class="t-center">59</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(20)수입임대료(보험업)</td>
				<td class="t-center">145</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(7)리스및렌탈관련수익</td>
				<td class="t-center">60</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(21)기타</td>
				<td class="t-center">146</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(8)배당금수익</td>
				<td class="t-center">61</td>
				<td class="t-right padR5"><%=rbox.get("code6100301_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left font-bold">Ⅱ.영업비용</td>
				<td class="t-center">156</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(9)유가증권처분이익</td>
				<td class="t-center">62</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)이자비용</td>
				<td class="t-center">157</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.단기매매증권처분이익</td>
				<td class="t-center">63</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.예수금이자</td>
				<td class="t-center">158</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.주식처분이익</td>
				<td class="t-center">64</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.차입금이자</td>
				<td class="t-center">159</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.채권처분이익</td>
				<td class="t-center">65</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.사채이자</td>
				<td class="t-center">160</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.신주인수권증서처분이익</td>
				<td class="t-center">66</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.콜머니이자</td>
				<td class="t-center">161</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">라.수익증권처분이익</td>
				<td class="t-center">67</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.환매조건부채권매도이자</td>
				<td class="t-center">162</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">마.기업융통어음처분이익</td>
				<td class="t-center">68</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.기타</td>
				<td class="t-center">163</td>
				<td class="t-right padR5"></td>
			</tr>
		</table>
		<br>
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td width="25%">계정과목</td>
				<td width="5%">코드</td>
				<td width="20%">금액</td>
				<td width="25%">계정과목</td>
				<td width="5%">코드</td>
				<td width="20%">금액</td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)수수료비용</td>
				<td class="t-center">173</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(16)외환거래손실</td>
				<td class="t-center">259</td>
				<td></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.지급수수료</td>
				<td class="t-center">174</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.외환차손</td>
				<td class="t-center">260</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.신용카드관련수수료</td>
				<td class="t-center">175</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.외화환산손실</td>
				<td class="t-center">261</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.투자상담사수수료</td>
				<td class="t-center">176</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(17)대손상각비</td>
				<td class="t-center">262</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.기타</td>
				<td class="t-center">177</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(18)판매비와 관리비(사업비)</td>
				<td class="t-center">263</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)유가증권처분손실</td>
				<td class="t-center">187</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.신계약비</td>
				<td class="t-center">264</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.단기매매증권처분손실</td>
				<td class="t-center">188</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.신계약상각비</td>
				<td class="t-center">265</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.주식처분손실</td>
				<td class="t-center">189</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.급여</td>
				<td class="t-center">266</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.채권처분손실</td>
				<td class="t-center">190</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.임원급여</td>
				<td class="t-center">267</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.신주인수권증서처분손실</td>
				<td class="t-center">191</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.직원급여</td>
				<td class="t-center">268</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">라.수익증권처분손실</td>
				<td class="t-center">192</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.임원상여금</td>
				<td class="t-center">269</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">마.기업융통어음처분손실</td>
				<td class="t-center">193</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">라.직원상여금</td>
				<td class="t-center">270</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">바.신종증권처분(상환)손실</td>
				<td class="t-center">194</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">마.잡급(일용급여)</td>
				<td class="t-center">271</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">사.기타</td>
				<td class="t-center">195</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.퇴직급여</td>
				<td class="t-center">272</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.매도가능증권처분손실</td>
				<td class="t-center">205</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.임원퇴직급여</td>
				<td class="t-center">273</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.주식처분손실</td>
				<td class="t-center">206</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.직원퇴직급여</td>
				<td class="t-center">274</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.출자금처분손실</td>
				<td class="t-center">207</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.퇴직급여충당부채전입액</td>
				<td class="t-center">275</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.채권처분손실</td>
				<td class="t-center">208</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.보험료</td>
				<td class="t-center">276</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">라.수익증권처분손실</td>
				<td class="t-center">209</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.복리후생비</td>
				<td class="t-center">277</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">마.기업융통어음매매손실</td>
				<td class="t-center">210</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">7.여비교통비</td>
				<td class="t-center">278</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">바.해외유가증권처분손실</td>
				<td class="t-center">211</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">8.임차료</td>
				<td class="t-center">279</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">사.신종증권처분(상환)손실</td>
				<td class="t-center">212</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.부동산임차료</td>
				<td class="t-center">280</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">아.기타</td>
				<td class="t-center">213</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.차량임차료(리스료 포함)</td>
				<td class="t-center">281</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)유가증권평가손실</td>
				<td class="t-center">223</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.기타</td>
				<td class="t-center">282</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.주식평가손실</td>
				<td class="t-center">224</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">9.차량유지비(유류비 포함)</td>
				<td class="t-center">287</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.채권평가손실</td>
				<td class="t-center">225</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">10.접대비</td>
				<td class="t-center">288</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.수익증권평가손실</td>
				<td class="t-center">226</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">11.유형자산감가상각비</td>
				<td class="t-center">289</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.신주인수권증서평가손실</td>
				<td class="t-center">227</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">12.무형자산상각비</td>
				<td class="t-center">290</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.기업융통어음평가손실</td>
				<td class="t-center">228</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.영업권상각비</td>
				<td class="t-center">291</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.신종증권평가손실</td>
				<td class="t-center">229</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.기타 무형자산상각비</td>
				<td class="t-center">292</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.기타</td>
				<td class="t-center">230</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">13.세금과공과</td>
				<td class="t-center">293</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)매도가능증권손상차손</td>
				<td class="t-center">240</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">14.광고선전비(판매촉진비 포함)</td>
				<td class="t-center">294</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)만기보유증권손상차손</td>
				<td class="t-center">241</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">15.연구비</td>
				<td class="t-center">295</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(7)파생상품거래손실</td>
				<td class="t-center">242</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">16.경상개발비</td>
				<td class="t-center">296</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.선물거래손실</td>
				<td class="t-center">243</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">17.소모품비</td>
				<td class="t-center">297</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.옵션거래손실</td>
				<td class="t-center">244</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">18.통신비</td>
				<td class="t-center">298</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.장외파생상품평가손실</td>
				<td class="t-center">245</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">19.운반및보관료</td>
				<td class="t-center">299</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(8)파생상품평가손실</td>
				<td class="t-center">246</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">20.건물·시설관리비(수선비 제외)</td>
				<td class="t-center">300</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.선물평가손실</td>
				<td class="t-center">247</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">21.수선비</td>
				<td class="t-center">301</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.옵션평가래손실</td>
				<td class="t-center">248</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">22.수도광열비</td>
				<td class="t-center">302</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.장외파생상품평가손실</td>
				<td class="t-center">249</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">23.인쇄비</td>
				<td class="t-center">303</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(9)대출채권처분손실</td>
				<td class="t-center">250</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">24.교육훈련비</td>
				<td class="t-center">304</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(10)신탁업무운용손실</td>
				<td class="t-center">251</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">25.전산운영비</td>
				<td class="t-center">305</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(11)리스및렌탈관련비용</td>
				<td class="t-center">252</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">26.기타 판매비와 관리비</td>
				<td class="t-center">306</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(12)책임준비금등전입액</td>
				<td class="t-center">253</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(19)기타영업비용</td>
				<td class="t-center">316</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.책임준비금전입액</td>
				<td class="t-center">254</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅲ.영업손익</td>
				<td class="t-center">326</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.비상위험준비금전입액</td>
				<td class="t-center">255</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅳ.영업외수익</td>
				<td class="t-center">327</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(13)보험.배당.환급금 비용</td>
				<td class="t-center">256</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)유형자산처분이익</td>
				<td class="t-center">328</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(14)재보험비용</td>
				<td class="t-center">257</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)유형자산손상차손환입</td>
				<td class="t-center">329</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(15)재보험료비용</td>
				<td class="t-center">258</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)비업무용자산처분이익</td>
				<td class="t-center">330</td>
				<td class="t-right padR5"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB0">
			<% xmlBuf += "<code6400101_amt>" + rbox.get("code6400101_amt",Box.THOUSAND_COMMA) + "</code6400101_amt>\n"
					  +  "<code6164_amt>" + rbox.get("code6164_amt",Box.THOUSAND_COMMA) + "</code6164_amt>\n"
					  +  "<code7500101_amt>" + rbox.get("code7500101_amt",Box.THOUSAND_COMMA) + "</code7500101_amt>\n"
					  +  "<code616475_amt>" + rbox.get("code616475_amt",Box.THOUSAND_COMMA) + "</code616475_amt>\n"; %>
			<tr>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)지분법이익</td>
				<td class="t-center">331</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(4)지분법손실</td>
				<td class="t-center">351</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)전기오류수정이익</td>
				<td class="t-center">332</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(5)지분법주식처분손실</td>
				<td class="t-center">352</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)자산수중이익</td>
				<td class="t-center">333</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(6)「조세특례제한법」 상 준비금</td>
				<td class="t-center">353</td>
				<td class="t-right padR5"><%=rbox.get("code6400101_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(7)채무면제(조정)이익</td>
				<td class="t-center">334</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(7)기부금</td>
				<td class="t-center">354</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(8)보험차익</td>
				<td class="t-center">335</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(8)전기오류수정손실</td>
				<td class="t-center">355</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(9)지분법주식처분이익</td>
				<td class="t-center">336</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(9)재해손실</td>
				<td class="t-center">356</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(10)수업임대료(보험업 외)</td>
				<td class="t-center">337</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(10)유입물건관리비</td>
				<td class="t-center">357</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(11)기타</td>
				<td class="t-center">338</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(11)기타</td>
				<td class="t-center">358</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅴ.영업외비용</td>
				<td class="t-center">347</td>
				<td class="t-right padR5"><%=rbox.get("code6400101_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left font-bold">Ⅵ.법인세비용차감전손익</td>
				<td class="t-center">368</td>
				<td class="t-right padR5"><%=rbox.get("code6164_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)유형자산처분손실</td>
				<td class="t-center">348</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅶ.법인세비용</td>
				<td class="t-center">369</td>
				<td class="t-right padR5"><%=rbox.get("code7500101_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)유형자산손상차손</td>
				<td class="t-center">349</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅷ.당기순손익</td>
				<td class="t-center">370</td>
				<td class="t-right padR5"><%=rbox.get("code616475_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)비업무용자산처분손실</td>
				<td class="t-center">350</td>
				<td class="t-right padR5"></td>
				<td colspan="3"></td>
			</tr>
		</table>
       	
<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>		
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>
<% } %>