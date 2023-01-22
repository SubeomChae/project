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
<!-- [별지 제3호의2 서식(1)] 표준재무상태표(금융·보험·증권업 법인용) -->
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
<form id="taxFrom" name="taxForm" method="post" action="" class="fType">
<input type="hidden" name="report_id" 	value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 		value="<%=box.get("std_yy")%>">
	
	
	<h2 class="page-title-2depths">표준재무상태표(금융·보험·증권업 법인용)</h2>
	
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제3호의2 서식(3)]</span>
	</div>
<% } %>	
	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
		<% xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
				  +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
				  +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
				  +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
				  +  "<corp_reg_no>"+FormatUtil.juminNo(obox.get("corp_reg_no"))+"</corp_reg_no>\n"
				  +  "<code11_amt>" + rbox.get("code11_amt",Box.THOUSAND_COMMA) + "</code11_amt>\n"
				  +  "<code11101_amt>" + rbox.get("code11101_amt",Box.THOUSAND_COMMA) + "</code11101_amt>\n"
				  +  "<code11103_amt>" + rbox.get("code11103_amt",Box.THOUSAND_COMMA) + "</code11103_amt>\n"
				  +  "<code12_amt>" + rbox.get("code12_amt",Box.THOUSAND_COMMA) + "</code12_amt>\n"; %>
			<tr>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅰ.현금 및 예치금</td>
				<td class="t-center">1</td>
				<td class="t-right padR5"><%=rbox.get("code11_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">106</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)현금 및 현금성자산</td>
				<td class="t-center">2</td>
				<td class="t-right padR5"><%=rbox.get("code11_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">5.부동산담보대출금(보험업)</td>
				<td class="t-center">107</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.현금</td>
				<td class="t-center">3</td>
				<td class="t-right padR5"><%=rbox.get("code11101_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">108</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.예금</td>
				<td class="t-center">4</td>
				<td class="t-right padR5"><%=rbox.get("code11103_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">6.신용대출금(보험업)</td>
				<td class="t-center">109</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.MMDA</td>
				<td class="t-center">5</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">110</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.MMF</td>
				<td class="t-center">6</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">7.신용공여금(증권업)</td>
				<td class="t-center">111</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.금융어음</td>
				<td class="t-center">7</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">112</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.기타</td>
				<td class="t-center">8</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">8.기타</td>
				<td class="t-center">113</td>
				<td class="t-right padR5"><%=rbox.get("code12_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)예치금</td>
				<td class="t-center">18</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">114</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.지급준비예치금</td>
				<td class="t-center">19</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)콜론</td>
				<td class="t-center">123</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.중앙회예치금</td>
				<td class="t-center">20</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)내국수입유산스</td>
				<td class="t-center">124</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.고객예탁금별도예치금(예금)</td>
				<td class="t-center">21</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">125</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.고객예탁금별도예치금(신탁)</td>
				<td class="t-center">22</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(4)신용카드채권</td>
				<td class="t-center">126</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.기타</td>
				<td class="t-center">23</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.카드대급금</td>
				<td class="t-center">127</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)기타</td>
				<td class="t-center">33</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">128</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅱ.유가증권</td>
				<td class="t-center">43</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.카드론</td>
				<td class="t-center">129</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)단기매매증권</td>
				<td class="t-center">44</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">130</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.주식</td>
				<td class="t-center">45</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.기타</td>
				<td class="t-center">131</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.채권</td>
				<td class="t-center">46</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">132</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.신주인수권증서</td>
				<td class="t-center">47</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(5)매입외환</td>
				<td class="t-center">141</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.수익증권</td>
				<td class="t-center">48</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">142</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.기업융통어음</td>
				<td class="t-center">49</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(6)할인 및 매입어음</td>
				<td class="t-center">143</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.해외유가증권</td>
				<td class="t-center">50</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">144</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.신종증권</td>
				<td class="t-center">51</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(7)환매조건부채권 매수</td>
				<td class="t-center">145</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">8.기타</td>
				<td class="t-center">52</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(8)팩토링채권</td>
				<td class="t-center">146</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)매도가능증권</td>
				<td class="t-center">62</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">147</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.주식</td>
				<td class="t-center">63</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(9)지급보증대지급</td>
				<td class="t-center">148</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.출자금</td>
				<td class="t-center">64</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">149</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.채권</td>
				<td class="t-center">65</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(10)사모사채</td>
				<td class="t-center">150</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.수익증권</td>
				<td class="t-center">66</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">151</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.해외유가증권</td>
				<td class="t-center">67</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(11)할부금융채권</td>
				<td class="t-center">152</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.신종증권</td>
				<td class="t-center">68</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">153</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.기타</td>
				<td class="t-center">69</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅳ.파생상품자산</td>
				<td class="t-center">154</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)만기보유증권</td>
				<td class="t-center">79</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)선물</td>
				<td class="t-center">155</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.주식</td>
				<td class="t-center">80</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)옵션</td>
				<td class="t-center">156</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.채권</td>
				<td class="t-center">81</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)장외파생상품</td>
				<td class="t-center">157</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.수익증권</td>
				<td class="t-center">82</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅴ.어음관리계좌자산</td>
				<td class="t-center">158</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.해외유가증권</td>
				<td class="t-center">83</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)예치금</td>
				<td class="t-center">159</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.기타</td>
				<td class="t-center">84</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)유가증권</td>
				<td class="t-center">160</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)지분법적용투자주식</td>
				<td class="t-center">94</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)할인및매입어음</td>
				<td class="t-center">161</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.주식</td>
				<td class="t-center">95</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">162</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.출자금</td>
				<td class="t-center">96</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅵ.리스자산</td>
				<td class="t-center">163</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅲ.대출채권</td>
				<td class="t-center">97</td>
				<td class="t-right padR5"><%=rbox.get("code12_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL15">(1)금융리스채권</td>
				<td class="t-center">164</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)대출금</td>
				<td class="t-center">98</td>
				<td class="t-right padR5"><%=rbox.get("code12_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL35">(현재가치할인차금)</td>
				<td class="t-center">165</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.
				원화대출금(은행업)</td>
				<td class="t-center">99</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">166</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">100</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)운용리스자산</td>
				<td class="t-center">167</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.외화대출금(은행업)</td>
				<td class="t-center">101</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">168</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">102</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(리스자산처분손실충당금)</td>
				<td class="t-center">169</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.보험약관대출금(보험업)</td>
				<td class="t-center">103</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)해지금융리스채권</td>
				<td class="t-center">170</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">104</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">171</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.유가증권담보대출금(보험업)</td>
				<td class="t-center">105</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(4)해지금융리스자산</td>
				<td class="t-center">172</td>
				<td class="t-right padR5"></td>
			</tr>
		</table>

		<table class="table table-bordered order-column table-cover marB10">
		<% xmlBuf += "<code1_amt>" + rbox.get("code1_amt",Box.THOUSAND_COMMA) + "</code1_amt>\n"
				  +  "<code11109_amt>" + rbox.get("code11109_amt",Box.THOUSAND_COMMA) + "</code11109_amt>\n"
				  +  "<code22_amt>" + rbox.get("code22_amt",Box.THOUSAND_COMMA) + "</code22_amt>\n"
				  +  "<code1110901_amt>" + rbox.get("code1110901_amt",Box.THOUSAND_COMMA) + "</code1110901_amt>\n" 
				  +  "<code1110902_amt>" + rbox.get("code1110902_amt",Box.THOUSAND_COMMA) + "</code1110902_amt>\n"; %>
			<tr>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
				</tr>
			<tr>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">173</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅸ.특별계정자산(보험업)</td>
				<td class="t-center">269</td>
				<td></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)선급리스자산</td>
				<td class="t-center">174</td>
				<td class="t-right padR5"></td>
				<td class="td-head">자산총계(Ⅰ+ Ⅸ)</td>
				<td class="t-center">270</td>
				<td class="t-right padR5"><%=rbox.get("code1_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)기타</td>
				<td class="t-center">175</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅰ.예수부채</td>
				<td class="t-center">271</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅶ.유형자산</td>
				<td class="t-center">185</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)예수금</td>
				<td class="t-center">272</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)토지</td>
				<td class="t-center">186</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.요구불예금</td>
				<td class="t-center">273</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">187</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.기한부예금</td>
				<td class="t-center">274</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)건물</td>
				<td class="t-center">188</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.고객예수금</td>
				<td class="t-center">275</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">189</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.수입담보금</td>
				<td class="t-center">276</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">190</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)기타</td>
				<td class="t-center">277</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)차량운반구</td>
				<td class="t-center">191</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅱ.차입부채</td>
				<td class="t-center">287</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">192</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)단기차입금</td>
				<td class="t-center">288</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)임차시설물</td>
				<td class="t-center">193</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)장기차입금</td>
				<td class="t-center">289</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">194</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)콜머니</td>
				<td class="t-center">290</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)건설중인자산</td>
				<td class="t-center">195</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(4)매출어음</td>
				<td class="t-center">291</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)집기,기구,비품</td>
				<td class="t-center">196</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(5)환매조건부채권 매도</td>
				<td class="t-center">292</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">197</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(6)기타</td>
				<td class="t-center">293</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">198</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅲ.사채</td>
				<td class="t-center">303</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(7)기타</td>
				<td class="t-center">199</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)후순위사채</td>
				<td class="t-center">304</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅷ.기타자산</td>
				<td class="t-center">204</td>
				<td class="t-right padR5"><%=rbox.get("code11109_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL15">(2)전환사채</td>
				<td class="t-center">305</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)투자부동산</td>
				<td class="t-center">205</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)기타</td>
				<td class="t-center">306</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.토지</td>
				<td class="t-center">206</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅳ.파생상품부채</td>
				<td class="t-center">311</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.건물</td>
				<td class="t-center">207</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)선물</td>
				<td class="t-center">312</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">208</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)옵션</td>
				<td class="t-center">313</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.기타</td>
				<td class="t-center">209</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)장외파생상품</td>
				<td class="t-center">314</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">210</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅴ.기타부채</td>
				<td class="t-center">315</td>
				<td class="t-right padR5"><%=rbox.get("code22_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)비업무용자산</td>
				<td class="t-center">219</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)퇴직급여충당부채</td>
				<td class="t-center">316</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)보증금</td>
				<td class="t-center">220</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)퇴직연금미지급금</td>
				<td class="t-center">317</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)미수금</td>
				<td class="t-center">221</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(국민연금전환금)</td>
				<td class="t-center">318</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.자기매매미수금</td>
				<td class="t-center">222</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(퇴직보험예치금)</td>
				<td class="t-center">319</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">223</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(퇴직연금운용자산)</td>
				<td class="t-center">320</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.위탁매매미수금</td>
				<td class="t-center">224</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)미지급금</td>
				<td class="t-center">321</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">225</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(4)미지급배당금</td>
				<td class="t-center">322</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.보험미수금</td>
				<td class="t-center">226</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(5)미지급법인세</td>
				<td class="t-center">323</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">227</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(6)미지급비용</td>
				<td class="t-center">324</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.기타</td>
				<td class="t-center">228</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.미지급이자</td>
				<td class="t-center">325</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(대손충당금)</td>
				<td class="t-center">229</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.기타</td>
				<td class="t-center">326</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)선급금</td>
				<td class="t-center">238</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(7)선수금</td>
				<td class="t-center">331</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.채권경과이자</td>
				<td class="t-center">239</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(8)선수수익</td>
				<td class="t-center">332</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.기타</td>
				<td class="t-center">240</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(9)보증금</td>
				<td class="t-center">333</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)선급비용</td>
				<td class="t-center">245</td>
				<td class="t-right padR5"><%=rbox.get("code11109_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">1.수입보증금</td>
				<td class="t-center">334</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.선급법인세</td>
				<td class="t-center">246</td>
				<td class="t-right padR5"><%=rbox.get("code1110901_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">2.리스보증금</td>
				<td class="t-center">335</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.기타</td>
				<td class="t-center">247</td>
				<td class="t-right padR5"><%=rbox.get("code1110902_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">3.임대보증금</td>
				<td class="t-center">336</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(7)이연법인세자산</td>
				<td class="t-center">252</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.기타</td>
				<td class="t-center">337</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(8)무형자산</td>
				<td class="t-center">253</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(10)이연법인세부채</td>
				<td class="t-center">342</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.영업권</td>
				<td class="t-center">254</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(11)지급보증충당부채</td>
				<td class="t-center">343</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.산업재산권</td>
				<td class="t-center">255</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(12)기타</td>
				<td class="t-center">344</td>
				<td class="t-right padR5"><%=rbox.get("code22_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.개발비</td>
				<td class="t-center">256</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅵ.보험사제준비금</td>
				<td class="t-center">354</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.소프트웨어</td>
				<td class="t-center">257</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)책임준비금</td>
				<td class="t-center">355</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.기타</td>
				<td class="t-center">258</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(출재보험준비금)</td>
				<td class="t-center">356</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(9)손해배상공동기금</td>
				<td class="t-center">263</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)계약자지분조정</td>
				<td class="t-center">357</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(10)기타</td>
				<td class="t-center">264</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(3)비상위험준비금</td>
				<td class="t-center">358</td>
				<td class="t-right padR5"></td>
			</tr>
		</table>

		<table class="table table-bordered order-column table-cover marB0">
		<% xmlBuf += "<code31_amt>" + rbox.get("code31_amt",Box.THOUSAND_COMMA) + "</code31_amt>\n"
				  +  "<code3_amt>" + rbox.get("code3_amt",Box.THOUSAND_COMMA) + "</code3_amt>\n"
				  +  "<code32_amt>" + rbox.get("code32_amt",Box.THOUSAND_COMMA) + "</code32_amt>\n"; %>
			<tr>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
				<td class="td-head" width="25%">계정과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="20%">금액</td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅶ.특별계정부채(보험업)</td>
				<td class="t-center">359</td>
				<td class="t-right padR5"></td>
				<td rowspan="35" colspan="3"></td>
			</tr>
			<tr>
				<td class="td-head">부채총계(Ⅰ+～Ⅶ)</td>
				<td class="t-center">360</td>
				<td class="t-right padR5"><%=rbox.get("code22_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅷ.자본금</td>
				<td class="t-center">361</td>
				<td class="t-right padR5"><%=rbox.get("code31_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)보통주자본금</td>
				<td class="t-center">362</td>
				<td class="t-right padR5"><%=rbox.get("code31_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)우선주자본금</td>
				<td class="t-center">363</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅸ.자본잉여금</td>
				<td class="t-center">364</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)주식발행초과금</td>
				<td class="t-center">365</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)감자차익</td>
				<td class="t-center">366</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)자기주식처분이익</td>
				<td class="t-center">367</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)재평가적립금</td>
				<td class="t-center">368</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)기타</td>
				<td class="t-center">369</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅹ.자본조정</td>
				<td class="t-center">374</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)주식할인발행차금</td>
				<td class="t-center">375</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)감자차손</td>
				<td class="t-center">376</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)자기주식</td>
				<td class="t-center">377</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)미교부주식배당금</td>
				<td class="t-center">378</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)자기주식처분손실</td>
				<td class="t-center">379</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)주식매수선택권</td>
				<td class="t-center">380</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(7)기타</td>
				<td class="t-center">381</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">&#8554;.기타포괄손익누계액</td>
				<td class="t-center">386</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)매도가능증권평가손익</td>
				<td class="t-center">387</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)해외사업환산손익</td>
				<td class="t-center">388</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)지분법자본변동</td>
				<td class="t-center">389</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)현금흐름위험회피파생상품평가손익</td>
				<td class="t-center">390</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)재평가잉여금</td>
				<td class="t-center">391</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)기타</td>
				<td class="t-center">392</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">&#8555;.이익잉여금</td>
				<td class="t-center">397</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)이익준비금</td>
				<td class="t-center">398</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)기업합리화적립금</td>
				<td class="t-center">399</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)재무구조개선적립금</td>
				<td class="t-center">400</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)「조세특례제한법」상 준비금</td>
				<td class="t-center">401</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)기타임의적립금</td>
				<td class="t-center">402</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left" style="letter-spacing:-1;padding-left:15px;">(6)미처분이익잉여금 또는 미처리결손금</td>
				<td class="t-center">403</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="td-head">자본총계(Ⅷ+～&#8555;)</td>
				<td class="t-center">404</td>
				<td class="t-right padR5"><%=rbox.get("code3_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="td-head">부채와 자본총계</td>
				<td class="t-center">405</td>
				<td class="t-right padR5"><%=rbox.get("code32_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
		</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>
<% } %>