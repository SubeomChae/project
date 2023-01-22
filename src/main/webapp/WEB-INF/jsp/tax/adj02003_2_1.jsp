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

<!-- [별지 제3호의2 서식(1)] 표준재무상태표(일반법인용) -->
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
	
	
	<h2 class="page-title-2depths">표준재무상태표(일반법인용)</h2>
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제3호의2 서식(1)]</span>
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
					  +  "<code11109_amt>" + rbox.get("code11109_amt",Box.THOUSAND_COMMA) + "</code11109_amt>\n"
					  +  "<code111_amt>" + rbox.get("code111_amt",Box.THOUSAND_COMMA) + "</code111_amt>\n"
					  +  "<code11101_amt>" + rbox.get("code11101_amt",Box.THOUSAND_COMMA) + "</code11101_amt>\n"
					  +  "<code11103_amt>" + rbox.get("code11103_amt",Box.THOUSAND_COMMA) + "</code11103_amt>\n"
					  +  "<code1110901_amt>" + rbox.get("code1110901_amt",Box.THOUSAND_COMMA) + "</code1110901_amt>\n"
					  +  "<code1110902_amt>" + rbox.get("code1110902_amt",Box.THOUSAND_COMMA) + "</code1110902_amt>\n"
					  +  "<code12_amt>" + rbox.get("code12_amt",Box.THOUSAND_COMMA) + "</code12_amt>\n"; %>
			<tr>
				<td class="td-head" style="width:25%">계정과목</td>
				<td class="td-head" style="width:5%">코드</td>
				<td class="td-head" style="width:20%">금액</td>
				<td class="td-head" style="width:25%">계정과목</td>
				<td class="td-head" style="width:5%">코드</td>
				<td class="td-head" style="width:20%">금액</td>
       		</tr>
     		<tr>
				<td class="t-left font-bold">Ⅰ.유동자산</td>
				<td class="t-center">1</td>
				<td class="t-right padR5"><%=rbox.get("code11_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL15">(3)기타유동자산</td>
				<td class="t-center">67</td>
				<td class="t-right padR5"><%=rbox.get("code11109_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)당좌자산</td>
				<td class="t-center">2</td>
				<td class="t-right padR5"><%=rbox.get("code111_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">1.미수수익</td>
				<td class="t-center">68</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.현금 및 현금성자산</td>
				<td class="t-center">3</td>
				<td class="t-right padR5"><%=rbox.get("code11101_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">2.선급비용</td>
				<td class="t-center">69</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.단기예금</td>
				<td class="t-center">4</td>
				<td class="t-right padR5"><%=rbox.get("code11103_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">3.이연법인세자산</td>
				<td class="t-center">70</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.유가증권</td>
				<td class="t-center">5</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.기타유동자산</td>
				<td class="t-center">71</td>
				<td class="t-right padR5"><%=rbox.get("code11109_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.단기매매증권</td>
				<td class="t-center">6</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.선급법인세</td>
				<td class="t-center">72</td>
				<td class="t-right padR5"><%=rbox.get("code1110901_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.유동성매도가능증권</td>
				<td class="t-center">7</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.부가가치세대급금</td>
				<td class="t-center">73</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.유동성만기보유증권</td>
				<td class="t-center">8</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.선급관세</td>
				<td class="t-center">74</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.매출채권</td>
				<td class="t-center">9</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">라.기타유동자산</td>
				<td class="t-center">75</td>
				<td class="t-right padR5"><%=rbox.get("code1110902_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.외상매출금</td>
				<td class="t-center">10</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅱ.비유동자산</td>
				<td class="t-center">80</td>
				<td class="t-right padR5"><%=rbox.get("code12_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">11</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(1)투자자산</td>
				<td class="t-center">81</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.받을어음</td>
				<td class="t-center">12</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.장기예금</td>
				<td class="t-center">82</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">13</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.장기투자증권</td>
				<td class="t-center">83</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기타매출채권</td>
				<td class="t-center">14</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.매도가능증권</td>
				<td class="t-center">84</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">15</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.만기보유증권</td>
				<td class="t-center">85</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.단기대여금</td>
				<td class="t-center">24</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.지분법적용투자주식</td>
				<td class="t-center">86</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.관계회사</td>
				<td class="t-center">25</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.장기대여금</td>
				<td class="t-center">87</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">26</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.관계회사</td>
				<td class="t-center">88</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.주주·임원·종업원</td>
				<td class="t-center">27</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">89</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">28</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">90</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기타</td>
				<td class="t-center">29</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.주주·임원·종업원</td>
				<td class="t-center">91</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">30</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">92</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.미수금</td>
				<td class="t-center">31</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">93</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.분양미수금</td>
				<td class="t-center">32</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.기타</td>
				<td class="t-center">94</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">33</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">95</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.공사미수금</td>
				<td class="t-center">34</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">96</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">63</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.투자부동산</td>
				<td class="t-center">97</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기타</td>
				<td class="t-center">36</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.토지</td>
				<td class="t-center">98</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">37</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.건물</td>
				<td class="t-center">99</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.선급금</td>
				<td class="t-center">38</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.기타투자부동산</td>
				<td class="t-center">100</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">8.기타당좌자산</td>
				<td class="t-center">39</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.기타투자자산</td>
				<td class="t-center">105</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)재고자산</td>
				<td class="t-center">44</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(2)유형자산</td>
				<td class="t-center">110</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.상품</td>
				<td class="t-center">45</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.토지</td>
				<td class="t-center">111</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.제품</td>
				<td class="t-center">46</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">112</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.반제품</td>
				<td class="t-center">47</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(정부보조금등차감액)</td>
				<td class="t-center">113</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.재공품</td>
				<td class="t-center">48</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.건물</td>
				<td class="t-center">114</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.부산물</td>
				<td class="t-center">49</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">115</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.원재료(원자재)</td>
				<td class="t-center">50</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">116</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.원재료</td>
				<td class="t-center">51</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(정부보조금등차감액)</td>
				<td class="t-center">117</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.부재료</td>
				<td class="t-center">52</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.구축물</td>
				<td class="t-center">118</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기타원재료</td>
				<td class="t-center">53</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">119</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.가성재</td>
				<td class="t-center">54</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">120</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">8.저장품</td>
				<td class="t-center">55</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(정부보조금등차감액)</td>
				<td class="t-center">121</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">9.미착상품(미착재료)</td>
				<td class="t-center">56</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.기계장치</td>
				<td class="t-center">122</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">10.완성주택</td>
				<td class="t-center">57</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">123</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">11.미완성주택</td>
				<td class="t-center">58</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">124</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">12.용지(건설업)</td>
				<td class="t-center">59</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(정부보조금등차감액)</td>
				<td class="t-center">125</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">13.완성공사(주택외)</td>
				<td class="t-center">60</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.선박·항공기</td>
				<td class="t-center">126</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">14.미완성공사(주택외)</td>
				<td class="t-center">61</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(감가상각누계액)</td>
				<td class="t-center">127</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">15.기타재고자산</td>
				<td class="t-center">62</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">(손상차손누계액)</td>
				<td class="t-center">128</td>
				<td class="t-right padR5"></td>
			</tr>
		</table>
		
			<table class="table table-bordered order-column table-cover marB10">
			<% xmlBuf += "<code1_amt>" + rbox.get("code1_amt",Box.THOUSAND_COMMA) + "</code1_amt>\n"; %>
				<tr>
					<td class="td-head" style="width:25%"">계정과목</td>
					<td class="td-head" style="width:5%">코드</td>
					<td class="td-head" style="width:20%">금액</td>
					<td class="td-head" style="width:25%">계정과목</td>
					<td class="td-head" style="width:5%">코드</td>
					<td class="td-head" style="width:20%">금액</td>
				</tr>
				<tr>
					<td class="t-left padL35">(정부보조금등차감액)</td>
					<td class="t-center">129</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(대손충당금)</td>
					<td class="t-center">203</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">6.건설용장비</td>
					<td class="t-center">130</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(현재가치할인자금)</td>
					<td class="t-center">204</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(감가상각누계액)</td>
					<td class="t-center">131</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">2.장기미수금</td>
					<td class="t-center">205</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(손상차손누계액)</td>
					<td class="t-center">132</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">가.분양장기미수금</td>
					<td class="t-center">206</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(정부보조금등차감액)</td>
					<td class="t-center">133</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(대손충당금)</td>
					<td class="t-center">207</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">7.차량운반구</td>
					<td class="t-center">134</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(현재가치할인차금)</td>
					<td class="t-center">208</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(감가상각누계액)</td>
					<td class="t-center">135</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">나.공사장기미수금</td>
					<td class="t-center">209</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(손상차손누계액)</td>
					<td class="t-center">136</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(대손충당금)</td>
					<td class="t-center">210</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(정부보조금등차감액)</td>
					<td class="t-center">137</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(현재가치할인차금)</td>
					<td class="t-center">211</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">8.건설중인유형자산</td>
					<td class="t-center">138</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">다.기타장기미수금</td>
					<td class="t-center">212</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(손상차손누계액)</td>
					<td class="t-center">139</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(대손충당금)</td>
					<td class="t-center">213</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(정부보조금등차감액)</td>
					<td class="t-center">140</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL45">(현재가치할인차금)</td>
					<td class="t-center">214</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">9.시설장치</td>
					<td class="t-center">141</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">3.장기선급금</td>
					<td class="t-center">215</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(감가상각누계액)</td>
					<td class="t-center">142</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">(대손충당금)</td>
					<td class="t-center">216</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(손상차손누계액)</td>
					<td class="t-center">143</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">4.보증금</td>
					<td class="t-center">217</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(정부보조금등차감액)</td>
					<td class="t-center">144</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">가.임차보증금</td>
					<td class="t-center">218</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">10.공구·기구·비품</td>
					<td class="t-center">145</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">(대손충당금)</td>
					<td class="t-center">219</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(감가상각누계액)</td>
					<td class="t-center">146</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">나.기타보증금</td>
					<td class="t-center">220</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(손상차손누계액)</td>
					<td class="t-center">147</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">(대손충당금)</td>
					<td class="t-center">221</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(정부보조금등차감액)</td>
					<td class="t-center">148</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">5.이연법인세자산</td>
					<td class="t-center">222</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">11.기타유형자산</td>
					<td class="t-center">149</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">6.기타비유동자산</td>
					<td class="t-center">223</td>
					<td class="t-right padR5"><%=rbox.get("code12_amt", Box.THOUSAND_COMMA)%></td>
				</tr>
				<tr>
					<td class="t-left padL35">(감가상각누계액)</td>
					<td class="t-center">150</td>
					<td class="t-right padR5"></td>
					<td class="td-head">자산총계(Ⅰ+Ⅱ)</td>
					<td class="t-center">228</td>
					<td class="t-right padR5"><%=rbox.get("code1_amt",Box.THOUSAND_COMMA)%></td>
				</tr>
				<tr>
					<td class="t-left padL35">(손상차손누계액)</td>
					<td class="t-center">151</td>
					<td class="t-right padR5"></td>
					<td class="t-left font-bold">Ⅰ.유동부채</td>
					<td class="t-center">229</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">(정부보조금등차감액)</td>
					<td class="t-center">152</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">1.매입채무</td>
					<td class="t-center">230</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL15">(3)무형자산</td>
					<td class="t-center">169</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">가.외상매입금</td>
					<td class="t-center">231</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">1.영업권</td>
					<td class="t-center">170</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">나.지급어음</td>
					<td class="t-center">232</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">2.산업재산권</td>
					<td class="t-center">171</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">다.기타매입채무</td>
					<td class="t-center">233</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">가.특허권</td>
					<td class="t-center">172</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">2.단기차입금</td>
					<td class="t-center">234</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">나.상표권</td>
					<td class="t-center">173</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">가.관계회사</td>
					<td class="t-center">235</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">다.실용신안권</td>
					<td class="t-center">174</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">나.주주·임원·종업원</td>
					<td class="t-center">236</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">라.의장권</td>
					<td class="t-center">175</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">다.기타</td>
					<td class="t-center">237</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">마.기타산업재산권</td>
					<td class="t-center">176</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">3.미지급금</td>
					<td class="t-center">238</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">3.광업권</td>
					<td class="t-center">181</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">가.미지급법인세</td>
					<td class="t-center">239</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">4.어업권</td>
					<td class="t-center">182</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">나.미지급배당금</td>
					<td class="t-center">240</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">5.차지권</td>
					<td class="t-center">183</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">다.기타미지급금</td>
					<td class="t-center">241</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">6.개발비</td>
					<td class="t-center">184</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">4.선수금</td>
					<td class="t-center">242</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">7.사용수익기부자산가액</td>
					<td class="t-center">185</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">가.분양선수금</td>
					<td class="t-center">243</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">8.소프트웨어</td>
					<td class="t-center">186</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">나.공사선수금</td>
					<td class="t-center">244</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">9.저작권</td>
					<td class="t-center">187</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">다.기타</td>
					<td class="t-center">245</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">10.제 이용권</td>
					<td class="t-center">188</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">5.예수금</td>
					<td class="t-center">246</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">11.기타무형자산</td>
					<td class="t-center">189</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">가.부가가치세예수금</td>
					<td class="t-center">247</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL15">(4)기타비유동자산</td>
					<td class="t-center">194</td>
					<td class="t-right padR5"><%=rbox.get("code12_amt", Box.THOUSAND_COMMA)%></td>
					<td class="t-left padL35">나.제세예수금</td>
					<td class="t-center">248</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL25">1.장기매출채권</td>
					<td class="t-center">195</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">다.예수보증금</td>
					<td class="t-center">249</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL35">가.장기외상매출금</td>
					<td class="t-center">196</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL35">라.기타예수금</td>
					<td class="t-center">250</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL45">(대손충당금)</td>
					<td class="t-center">197</td>
					<td class="t-right padR5"></td>
					<td class="t-left padL25">6.미지급비용</td>
					<td class="t-center">251</td>
					<td class="t-right padR5"></td>
				</tr>
				<tr>
					<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">198</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">7.선수수익</td>
				<td class="t-center">252</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.장기받을어음</td>
				<td class="t-center">199</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">8.유동성장기부채</td>
				<td class="t-center">253</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(대손충당금)</td>
				<td class="t-center">200</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.유동성장기차입금</td>
				<td class="t-center">254</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">201</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">255</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.장기기타매출채권</td>
				<td class="t-center">202</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.유동성사채</td>
				<td class="t-center">256</td>
				<td class="t-right padR5"></td>
			</tr>
		</table>

		<table class="table table-bordered order-column table-cover marB0">
		<% xmlBuf += "<code22_amt>" + rbox.get("code22_amt",Box.THOUSAND_COMMA) + "</code22_amt>\n"
				  +  "<code31_amt>" + rbox.get("code31_amt",Box.THOUSAND_COMMA) + "</code31_amt>\n"
				  +  "<code3_amt>" + rbox.get("code3_amt",Box.THOUSAND_COMMA) + "</code3_amt>\n"
				  +  "<code32_amt>" + rbox.get("code32_amt",Box.THOUSAND_COMMA) + "</code32_amt>\n"; %>
			<tr>
				<td class="td-head" style="width:25%"">계정과목</td>
				<td class="td-head" style="width:5%">코드</td>
				<td class="td-head" style="width:20%">금액</td>
				<td class="td-head" style="width:25%">계정과목</td>
				<td class="td-head" style="width:5%">코드</td>
				<td class="td-head" style="width:20%">금액</td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">257</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">13.장기기타보증금</td>
				<td class="t-center">327</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기타유동성장기부채</td>
				<td class="t-center">258</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">14.기타비유동부채</td>
				<td class="t-center">328</td>
				<td class="t-right padR5"><%=rbox.get("code22_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">259</td>
				<td class="t-right padR5"></td>
				<td class="td-head">부채총계(Ⅰ+Ⅱ)</td>
				<td class="t-center">333</td>
				<td class="t-right padR5"><%=rbox.get("code22_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">9.단기충당부채</td>
				<td class="t-center">268</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅲ.자본금</td>
				<td class="t-center">334</td>
				<td class="t-right padR5"><%=rbox.get("code31_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.단기공사손실충당부채</td>
				<td class="t-center">269</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.보통주자본금</td>
				<td class="t-center">335</td>
				<td class="t-right padR5"><%=rbox.get("code31_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.단기제품보증충당부채</td>
				<td class="t-center">270</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.우선주자본금</td>
				<td class="t-center">336</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.단기반품추정충당부채</td>
				<td class="t-center">271</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅳ.자본잉여금</td>
				<td class="t-center">337</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">라.단기하자보수충당부채</td>
				<td class="t-center">272</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.주식발행초과금</td>
				<td class="t-center">338</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">마.단기기타충당부채</td>
				<td class="t-center">273</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.감자차익</td>
				<td class="t-center">339</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">10.이연법인세부채</td>
				<td class="t-center">278</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.합병차익</td>
				<td class="t-center">340</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">11.기타유동부채</td>
				<td class="t-center">279</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.자기주식처분이익</td>
				<td class="t-center">341</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅱ.비유동부채</td>
				<td class="t-center">284</td>
				<td class="t-right padR5"><%=rbox.get("code22_amt", Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">5.재평가적립금</td>
				<td class="t-center">342</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.사채</td>
				<td class="t-center">285</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.기타자본잉여금</td>
				<td class="t-center">343</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(현재가치할인차금)</td>
				<td class="t-center">286</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅴ.자본조정</td>
				<td class="t-center">348</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.전환사채등신종사채</td>
				<td class="t-center">287</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.주식할인발행차금</td>
				<td class="t-center">349</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(현재가치할인차금)</td>
				<td class="t-center">288</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.감자차손</td>
				<td class="t-center">350</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.장기차입금</td>
				<td class="t-center">289</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.자기주식</td>
				<td class="t-center">351</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.관계회사</td>
				<td class="t-center">290</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.미교부주식배당금</td>
				<td class="t-center">352</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">291</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.자기주식처분손실</td>
				<td class="t-center">353</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.주주·임원·종업원</td>
				<td class="t-center">292</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.부의지분법자본변동</td>
				<td class="t-center">354</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">293</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">7.주식매수선택권</td>
				<td class="t-center">355</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기타</td>
				<td class="t-center">294</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">8.기타자본조정</td>
				<td class="t-center">356</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">295</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅵ.기타포괄손익누계액</td>
				<td class="t-center">361</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.장기매입채무</td>
				<td class="t-center">296</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.매도가능증권평가손익</td>
				<td class="t-center">362</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.장기외상매입금</td>
				<td class="t-center">297</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.해외사업환산손익</td>
				<td class="t-center">363</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">298</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.지분법자본변동</td>
				<td class="t-center">364</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.장기지급어음</td>
				<td class="t-center">299</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.파생상품평가손익</td>
				<td class="t-center">365</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">300</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.재평가잉여금</td>
				<td class="t-center">366</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.장기기타매입채무</td>
				<td class="t-center">301</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.기타</td>
				<td class="t-center">367</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL45">(현재가치할인차금)</td>
				<td class="t-center">302</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅶ.이익잉여금</td>
				<td class="t-center">372</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.장기미지급금</td>
				<td class="t-center">303</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.이익준비금</td>
				<td class="t-center">373</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(현재가치할인차금)</td>
				<td class="t-center">304</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.재무구조개선적립금</td>
				<td class="t-center">374</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.장기선수금</td>
				<td class="t-center">305</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.「조세특례제한법상」준비금</td>
				<td class="t-center">375</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.장기분양선수금</td>
				<td class="t-center">306</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.기타임의적립금</td>
				<td class="t-center">376</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.장기공사선수금</td>
				<td class="t-center">307</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25" style="width:27%">5.미처분이익잉여금(미처리결손금)</td>
				<td class="t-center">381</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.장기기타선수금</td>
				<td class="t-center">308</td>
				<td class="t-right padR5"></td>
				<td class="td-head">자본총계(Ⅲ+~Ⅶ)</td>
				<td class="t-center">382</td>
				<td class="t-right padR5"><%=rbox.get("code3_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.퇴직급여충당부채</td>
				<td class="t-center">309</td>
				<td class="t-right padR5"></td>
				<td class="td-head">부채와 자본총계</td>
				<td class="t-center">383</td>
				<td class="t-right padR5"><%=rbox.get("code32_amt", Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">8.퇴직연금미지급금</td>
				<td class="t-center">310</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(국민연금전환금)</td>
				<td class="t-center">311</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(퇴직보험예치금)</td>
				<td class="t-center">312</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">(퇴직연금운용자산)</td>
				<td class="t-center">313</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL25">9.장기충당부채</td>
				<td class="t-center">314</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.장기공사손실충당부채</td>
				<td class="t-center">315</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.장기제품보증충당부채</td>
				<td class="t-center">316</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.장기반품추정충당부채</td>
				<td class="t-center">317</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">라.장기하자보수충당부채</td>
				<td class="t-center">318</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL35">마.장기기타충당부채</td>
				<td class="t-center">319</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL25">10.제준비금</td>
				<td class="t-center">324</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL25">11.이연법인세부채</td>
				<td class="t-center">201</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL25">12.장기임대보증금</td>
				<td class="t-center">202</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
		</table>
	</div>
<% if(!box.get("excel_yn").equals("Y")) { %>
	<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>
<% } %>