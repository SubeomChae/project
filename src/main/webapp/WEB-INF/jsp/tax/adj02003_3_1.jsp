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

<!-- [별지 제3호의3 서식(1)] 표준손익계산서(일반법인용) -->
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

	
	<h2 class="page-title-2depths">표준손익계산서(일반법인용)</h2>
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제3호의3 서식(1)]</span>
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
				  +  "<code6100301_amt>" + rbox.get("code6100301_amt",Box.THOUSAND_COMMA) + "</code6100301_amt>\n"
				  +  "<code6400101_amt>" + rbox.get("code6400101_amt",Box.THOUSAND_COMMA) + "</code6400101_amt>\n"
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
				<td class="t-left font-bold">Ⅰ.매출액</td>
				<td class="t-center">1</td>
				<td class="t-right padR5"></td>
				<td stly="width:27%" class="t-left padL15">(7)지분법손실(지주회사)</td>
				<td class="t-center">60</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">1.상품매출</td>
				<td class="t-center">2</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">(8)기타매출원가</td>
				<td class="t-center">61</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.국내상품매출</td>
				<td class="t-center">3</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.기초재고액</td>
				<td class="t-center">62</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">나.수출상품매출</td>
				<td class="t-center">4</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.당기총원가(명세별첨)</td>
				<td class="t-center">63</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">2.제품매출</td>
				<td class="t-center">5</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL15">3.기말재고액</td>
				<td class="t-center">64</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.국내제품매출</td>
				<td class="t-center">6</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.타계정대체액</td>
				<td class="t-center">65</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">나.수출제품매출</td>
				<td class="t-center">7</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅲ.매출총손익</td>
				<td class="t-center">66</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">3.공사수입</td>
				<td class="t-center">8</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅳ.판매비와관리비</td>
				<td class="t-center">67</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.국내공사수입</td>
				<td class="t-center">9</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.급여</td>
				<td class="t-center">68</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">나.해외공사수입</td>
				<td class="t-center">10</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.임원급여</td>
				<td class="t-center">69</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">4.운송수입</td>
				<td class="t-center">11</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.직원급여</td>
				<td class="t-center">70</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.국내운송수입</td>
				<td class="t-center">12</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.임원상여금</td>
				<td class="t-center">71</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">나.해외운송수입</td>
				<td class="t-center">13</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">라.직원상여금</td>
				<td class="t-center">72</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">5.부동산임대수입</td>
				<td class="t-center">14</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">마.기타</td>
				<td class="t-center">73</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.국내임대수입</td>
				<td class="t-center">15</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.퇴직급여</td>
				<td class="t-center">74</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">나.해외임대수입</td>
				<td class="t-center">16</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.임원퇴직급여</td>
				<td class="t-center">75</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">6.분양수입</td>
				<td class="t-center">17</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.직원퇴직급여</td>
				<td class="t-center">76</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.국내분양수입</td>
				<td class="t-center">18</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.퇴직급여충당부채전입액</td>
				<td class="t-center">77</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">나.해외분양수입</td>
				<td class="t-center">19</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.보험료</td>
				<td class="t-center">78</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">7.사용료·로열티 수입</td>
				<td class="t-center">20</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">4.복리후생비</td>
				<td class="t-center">79</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.국내사용료·로열티수입</td>
				<td class="t-center">21</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.여비교통비</td>
				<td class="t-center">80</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">나.해외사용료·로열티수입</td>
				<td class="t-center">22</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.임차료</td>
				<td class="t-center">81</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">8.지분법이익(지주회사)</td>
				<td class="t-center">23</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.부동산임차료</td>
				<td class="t-center">82</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">9.기타매출</td>
				<td class="t-center">24</td>
				<td class="t-right padR5"></td>
				<td stlye="width:27%" class="t-left padL35" >나.차량·중기임차료(리스료 포함)</td>
				<td class="t-center">83</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">가.</td>
				<td class="t-center">25</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.기타임차료(리스료 포함)</td>
				<td class="t-center">84</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅱ.매출원가</td>
				<td class="t-center">35</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">7.접대비</td>
				<td class="t-center">85</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(1)상품매출원가</td>
				<td class="t-center">36</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">8.유형자산감가상각비</td>
				<td class="t-center">86</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.기초재고액</td>
				<td class="t-center">37</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">9.무형자산상각비</td>
				<td class="t-center">87</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.당기매입원가</td>
				<td class="t-center">38</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.영업권상각비</td>
				<td class="t-center">88</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.상품관세환급금(-)</td>
				<td class="t-center">39</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.기타무형자산상각비</td>					
				<td class="t-center">89</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.기말재고액</td>
				<td class="t-center">40</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">10.세금과공과</td>
				<td class="t-center">90</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.타계정대체액</td>
				<td class="t-center">41</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">11.광고선전비(판매촉진비 포함)</td>
				<td class="t-center">91</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(2)제조원가</td>
				<td class="t-center">42</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">12.견본비</td>
				<td class="t-center">92</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.기초재고액</td>
				<td class="t-center">43</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">13.차량유지비(유류비 포함)</td>
				<td class="t-center">93</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.당기총원가(명세별첨)</td>
				<td class="t-center">44</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">14.연구비</td>
				<td class="t-center">94</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.제품관세환급금(-)</td>
				<td class="t-center">45</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">15.경상개발비</td>
				<td class="t-center">95</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.기말재고액</td>
				<td class="t-center">46</td>
				<td class="t-right padR5"></td>
				<td style="width:27%" class="t-left padL25">16.대손상각비(충당금전입액포함)</td>
				<td class="t-center">96</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.타계정대체액</td>
				<td class="t-center">47</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">17.미분양주택관리비</td>
				<td class="t-center">97</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(3)공사원가</td>
				<td class="t-center">48</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">18.수주비</td>
				<td class="t-center">98</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.기초재고액</td>
				<td class="t-center">49</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.국내수주비</td>
				<td class="t-center">99</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.당기총원가(명세별첨)</td>
				<td class="t-center">50</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.해외수주비</td>
				<td class="t-center">100</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.기말재고액</td>
				<td class="t-center">51</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">19.자문료</td>
				<td class="t-center">101</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.타게정대체액</td>
				<td class="t-center">52</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.국내자문료</td>
				<td class="t-center">102</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(4)운송원가</td>
				<td class="t-center">53</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.해외자문료</td>
				<td class="t-center">103</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(5)임대원가</td>
				<td class="t-center">54</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">20.지급수수료</td>
				<td class="t-center">104</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL15">(6)분양원가</td>
				<td class="t-center">55</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.국내지급수수료</td>
				<td class="t-center">105</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.기초재고액</td>
				<td class="t-center">56</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.해외지급수수료</td>
				<td class="t-center">106</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.당기총원가(명세별첨)</td>
				<td class="t-center">57</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">21.판매수수료</td>
				<td class="t-center">107</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.기말재고액</td>
				<td class="t-center">58</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">22.소모품비</td>
				<td class="t-center">108</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.타계정대체액</td>
				<td class="t-center">59</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">23.통신비</td>
				<td class="t-center">109</td>
				<td class="t-right padR5"></td>
			</tr>
		</table>

		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<td class="td-head" width="25%">계정과목</td>
				<td width="5%">코드</td>
				<td width="20%">금액</td>
				<td width="25%">계정과목</td>
				<td width="5%">코드</td>
				<td width="20%">금액</td>
			</tr>
			<tr>
				<td class="t-left padL25">24.운반비</td>
				<td class="t-center">110</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">22.수수료수익</td>
				<td class="t-center">164</td>
				<td></td>
			</tr>
			<tr>
				<td class="t-left padL25">25.보관료</td>
				<td class="t-center">111</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.국내수수료수익</td>
				<td class="t-center">165</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">26.건물·시설관리비(수선비 제외)</td>
				<td class="t-center">112</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.해외수수료수익</td>
				<td class="t-center">166</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">27.수선비</td>
				<td class="t-center">113</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">23.사용료·로열티수익</td>
				<td class="t-center">167</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">28.수도광열비(전기료 제외)</td>
				<td class="t-center">114</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.국내사용료·로열티수익</td>
				<td class="t-center">168</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">29.전기료</td>
				<td class="t-center">115</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.해외사용료·로열티수익</td>
				<td class="t-center">169</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">30.인쇄비</td>
				<td class="t-center">116</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">24.정부보조금</td>
				<td class="t-center">170</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">31.교육훈련비</td>
				<td class="t-center">117</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">25.판매장려금수익</td>
				<td class="t-center">171</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">32.특허권등 사용료</td>
				<td class="t-center">118</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">26.위약금·보상금·배상금 수익</td>
				<td class="t-center">172</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">33.수출입제비용</td>
				<td class="t-center">119</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">27.상각채권추심이익</td>
				<td class="t-center">173</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">34.해외시장개척비</td>
				<td class="t-center">120</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">28.기타</td>
				<td class="t-center">174</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">35.기타외주용역비</td>
				<td class="t-center">121</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅶ.영업외비용</td>
				<td class="t-center">179</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.국내외주용역비</td>
				<td class="t-center">122</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">1.이자비용</td>
				<td class="t-center">180</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.해외외주용역비</td>
				<td class="t-center">123</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">2.기타대손상각비</td>
				<td class="t-center">181</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">36.기타</td>
				<td class="t-center">124</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">3.유가증권처분손실</td>
				<td class="t-center">182</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅴ.영업손익</td>
				<td class="t-center">129</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.단기매매증권처분손실</td>
				<td class="t-center">183</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left font-bold">Ⅵ.영업외수익</td>
				<td class="t-center">130</td>
				<td class="t-right padR5"><%=rbox.get("code61_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL35">나.매도가능증권처분손실</td>
				<td class="t-center">184</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">1.이자수익</td>
				<td class="t-center">131</td>
				<td class="t-right padR5"><%=rbox.get("code6100_amt",Box.THOUSAND_COMMA)%></td>
				<td style="width:27%" class="t-left padL35">다.지분법적용투자주식처분손실</td>
				<td class="t-center">185</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">2.배당금수익</td>
				<td class="t-center">132</td>
				<td class="t-right padR5"><%=rbox.get("code6100301_amt",Box.THOUSAND_COMMA)%></td>
				<td class="t-left padL25">4.매출채권처분손실</td>
				<td class="t-center">186</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">3.임대료</td>
				<td class="t-center">133</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">5.단기투자자산평가손실</td>
				<td class="t-center">187</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">4.유가증권처분이익</td>
				<td class="t-center">134</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">6.재고자산감모손실</td>
				<td class="t-center">188</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.단기매매증권처분이익</td>
				<td class="t-center">135</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">7.외환차손</td>
				<td class="t-center">189</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.매도가능증권처분이익</td>
				<td class="t-center">136</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">8.외화환산손실</td>
				<td class="t-center">190</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.지분법적용투자주식처분이익</td>
				<td class="t-center">137</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">9.지분법손실</td>
				<td class="t-center">191</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">5.매출채권처분이익</td>
				<td class="t-center">138</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">10.장기투자증권손상차손</td>
				<td class="t-center">192</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">6.단기투자자산평가이익</td>
				<td class="t-center">139</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.매도가능증권손상차손</td>
				<td class="t-center">193</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">7.외환차익</td>
				<td class="t-center">140</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.만기보유증권손상차손</td>
				<td class="t-center">194</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">8.외화환산이익</td>
				<td class="t-center">141</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">11.파생상품관련손실</td>
				<td class="t-center">195</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">9.지분법이익</td>
				<td class="t-center">142</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.파생상품평가손실</td>
				<td class="t-center">196</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">10.장기투자증권손상차손환입</td>
				<td class="t-center">143</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.파생상품거래손실</td>
				<td class="t-center">197</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.매도가능증권손상차손환입</td>
				<td class="t-center">144</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.기타파생상품손실</td>
				<td class="t-center">198</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.만기보유증권손상차손환입</td>
				<td class="t-center">145</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">12.투자부동산처분손실</td>
				<td class="t-center">199</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">11.파생상품관련이익</td>
				<td class="t-center">146</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">13.유형자산처분손실</td>
				<td class="t-center">200</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.파생상품평가이익</td>
				<td class="t-center">147</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">가.토지처분손실</td>
				<td class="t-center">201</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.파생상품거래이익</td>
				<td class="t-center">148</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">나.건물처분손실</td>
				<td class="t-center">202</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기타파생상품이익</td>
				<td class="t-center">149</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">다.기계장치처분손실</td>
				<td class="t-center">203</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">12.투자부동산처분이익</td>
				<td class="t-center">150</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL35">라.기타유형자산처분손실</td>
				<td class="t-center">204</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">13.유형자산처분이익</td>
				<td class="t-center">151</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">14.무형자산처분손실</td>
				<td class="t-center">205</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">가.토지처분이익</td>
				<td class="t-center">152</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">15.기부금</td>
				<td class="t-center">206</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">나.건물처분이익</td>
				<td class="t-center">153</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">16.사채상환손실</td>
				<td class="t-center">207</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">다.기계장치처분이익</td>
				<td class="t-center">154</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">17.위약금·보상금·배상금비용</td>
				<td class="t-center">208</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL35">라.기타유형자산처분이익</td>
				<td class="t-center">155</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">18.기타충당금·준비금전입</td>
				<td class="t-center">209</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">14.무형자산처분이익</td>
				<td class="t-center">156</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">19.전기오류수정손실</td>
				<td class="t-center">210</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">15.사채상환이익</td>
				<td class="t-center">157</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">20.재해손실</td>
				<td class="t-center">211</td>
				<td class="t-right padR5"></td>
			</tr>
			<tr>
				<td class="t-left padL25">16.법인세환급액</td>
				<td class="t-center">158</td>
				<td class="t-right padR5"></td>
				<td class="t-left padL25">21.기타</td>
				<td class="t-center">212</td>
				<td class="t-right padR5"><%=rbox.get("code6400101_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">17.충당금·준비금환입</td>
				<td class="t-center">159</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅷ.법인세비용차감전손익</td>
				<td class="t-center">217</td>
				<td class="t-right padR5"><%=rbox.get("code6164_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">18.전기오류수저이익</td>
				<td class="t-center">160</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅸ.법인세비용</td>
				<td class="t-center">218</td>
				<td class="t-right padR5"><%=rbox.get("code7500101_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">19.자산수중이익</td>
				<td class="t-center">161</td>
				<td class="t-right padR5"></td>
				<td class="t-left font-bold">Ⅹ.당기순손익</td>
				<td class="t-center">219</td>
				<td class="t-right padR5"><%=rbox.get("code616475_amt",Box.THOUSAND_COMMA)%></td>
			</tr>
			<tr>
				<td class="t-left padL25">20.채무면제(조정)이익</td>
				<td class="t-center">162</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
			<tr>
				<td class="t-left padL25">21.보험차익</td>
				<td class="t-center">163</td>
				<td class="t-right padR5"></td>
				<td colspan="3" style="border:none"></td>
			</tr>
		</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>
<% } %>