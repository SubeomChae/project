<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- [별지 제47호 서식] 주요계정명세서(갑) -->
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

	<h2 class="page-title-2depths">주요계정명세서(갑)</h2>
	
	<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
			   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
			   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
			   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>	
	<div class="table-top-control">
		<span>[별지 제47호 서식(갑)]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>
	
	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td colspan="3" class="td-head">①구분</td>
				<td colspan="2" class="td-head" width="22%">②근거법 조항</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="14%">③회사계상금액</td>
				<td colspan="2" class="td-head" width="14%">④세무상부인(조정)금액</td>
				<td class="td-head" width="14%">⑤차가감금액<br>(③－④)</td>
			</tr> 
			<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7400101","","", uSesEnt.dbo); 
				Long amt_22008 = rbox.getLong("cur_acum"); // 고유목적사업준비금 %>
				
			<%	xmlBuf += "<amt_22008>"+FormatUtil.insertComma(String.valueOf(amt_22008))+"</amt_22008>\n"; %>	
			<tr>
				<td rowspan="5" class="t-center" width="5%">준비금<br>충당금<br>등</td>
				<td colspan="2" class="t-left">(101)고유목적사업준비금</td>
				<td colspan="2" class="t-left">법인세법 제29조<br>조세특례제한법 제74조</td>
				<td class="t-center">53</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_22008))%></td>
				<td colspan="2" class="t-right">0</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_22008))%></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(102)퇴직급여충당금</td>
				<td colspan="2" class="t-left">법인세법 제33조</td>
				<td class="t-center">12</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(103)퇴직연금부담금</td>
				<td colspan="2" class="t-left">법인세법시행령 제44조의2</td>
				<td class="t-center">71</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(104)대손충당금</td>
				<td colspan="2" class="t-left">법인세법 제34조</td>
				<td class="t-center">13</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(105)대손금</td>
				<td colspan="2" class="t-left">법인세법 제19조의 2</td>
				<td class="t-center">72</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td rowspan="5" class="t-center">손금<br>산입</td>
				<td colspan="2" class="t-left">(106)합병양도손익</td>
				<td colspan="2" class="t-left">법인세법 제44조</td>
				<td class="t-center">55</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(107)분할양도손익</td>
				<td colspan="2" class="t-left">법인세법 제46조</td>
				<td class="t-center">56</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(108)물적분할자산양도차익</td>
				<td colspan="2" class="t-left">법인세법 제47조</td>
				<td class="t-center">57</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(125)선물출자자산양도차익</td>
				<td colspan="2" class="t-left">법인세법 제47조의 2</td>
				<td class="t-center">50</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(109)교환자산양도차익</td>
				<td colspan="2" class="t-left">법인세법 제50조</td>
				<td class="t-center">58</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td class="t-center">익금<br>불산입</td>
				<td colspan="2" class="t-left">(110)채무면제익 등 이월결손금 보전액</td>
				<td colspan="2" class="t-left">법인세법 제18조제6호</td>
				<td class="t-center">59</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300901","","", uSesEnt.dbo); 
				Long amt_7300901 = rbox.getLong("cur_acum"); // 법정기부금  %>
			
			<%	xmlBuf += "<amt_7300901>"+FormatUtil.insertComma(String.valueOf(amt_7300901))+"</amt_7300901>\n"; %>
			<tr>
				<td rowspan="5" width="5%" class="t-center">기부금</td>
				<td colspan="2" class="t-left">(112)법정기부금 등</td>
				<td colspan="2" class="t-left">법인세법 제24조제2항</td>
				<td class="t-center">41</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_7300901))%></td>
				<td colspan="2" class="t-right">0</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_7300901))%></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(113)특례기부금</td>
				<td colspan="2" class="t-left">조세특례제한법 제73조 제1항</td>
				<td class="t-center">64</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(114)지정기부금 한도액</td>
				<td colspan="2" class="t-left">법인세법 제24조 제1항</td>
				<td class="t-center">66</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300902","","", uSesEnt.dbo); 
				Long amt_7300902 = rbox.getLong("cur_acum"); // 지정기부금  %>
				
			<%	xmlBuf += "<amt_7300902>"+FormatUtil.insertComma(String.valueOf(amt_7300902))+"</amt_7300902>\n"; %>
			<tr>
				<td colspan="2" class="t-left">(115)지정기부금</td>
				<td colspan="2" class="t-left">법인세법 제24조 제1항</td>
				<td class="t-center">42</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_7300902))%></td>
				<td colspan="2" class="t-right">0</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_7300902))%></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300999","","", uSesEnt.dbo); 
				Long amt_7300999 = rbox.getLong("cur_acum"); // 기타기부금  %>
				
			<%	xmlBuf += "<amt_7300999>"+FormatUtil.insertComma(String.valueOf(amt_7300999))+"</amt_7300999>\n"; %>
			<tr>
				<td colspan="2" class="t-left">(116)기타기부금</td>
				<td colspan="2" class="t-left">법인세법 제24조 제1항</td>
				<td class="t-center">73</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_7300999))%></td>
				<td colspan="2" class="t-right">0</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_7300999))%></td>
			</tr>
			<tr>
				<td rowspan="4" width="5%" class="t-center">접대비</td>
				<td colspan="2" class="t-left">(117)접대비한도액</td>
				<td colspan="2" class="t-left">법인세법 제25조 제1항</td>
				<td class="t-center">49</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(117)접대비[(119),(120) 포함]</td>
				<td colspan="2" class="t-left">법인세법 제25조 제1항</td>
				<td class="t-center">65</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(119)기준금액 초과 접대비</td>
				<td colspan="2" class="t-left">법인세법 제25조 제2항</td>
				<td class="t-center">61</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(120)문화접대비</td>
				<td colspan="2" class="t-left">조세특례제한법 제136조 제3항</td>
				<td class="t-center">67</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(121)외화자산ㆍ부채평가손익</td>
				<td colspan="2" class="t-left">법인세법 제42조</td>
				<td class="t-center">74</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">업무무관부동산 등에 관련한 차입금이자</td>
				<td class="t-left">(122)업무무관부동산 등</td>
				<td colspan="2" class="t-left">법인세법 제28조 제1항</td>
				<td class="t-center">76</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-right"></td>
				<td class="t-right"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<td colspan="2" class="t-center">상여배당 등</td>
				<td class="t-left">(123)소득처분금액(법인세법 시행령 제106조)</td>
				<td class="t-center" width="5%">97</td>
				<td colspan="2" class="t-right" width="20%"></td>
				<td class="t-left" width="14%">(124)이익처분 금액<br>(상법 제462조 등)</td>
				<td class="t-center" width="5%">98</td>
				<td colspan="2" class="t-right" width="20%"></td>
			</tr> 
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>