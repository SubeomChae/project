<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- [별지 제56호 서식] 법인세·농어촌특별세 과세표준(조정계산)및 세액신고서 -->
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

<% if(!box.get("include").equals("Y")) { %>
	<h1 class="page-title">법인세·농어촌특별세 과세표준(조정계산)및 세액신고서</h1>
	
	<table class="search-panel table table-bordered">
  		<tr>
			<td width="15%" class="td-head">기준년도</td>
			<td style="padding-left:5px">
				<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:80px">
					<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
				</select>
				<span class="f-right">
					<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
					<button type="button" class="btn dark" onClick="goSearch('E');"><img src="/com/img/ico_btn_print.png">인쇄</button>
				</span>
			</td>
  		</tr>
	</table>	
<% }else { %>
	<h2 class="page-title-2depths">법인세·농어촌특별세 과세표준(조정계산)및 세액신고서</h2>
	
	<div class="table-top-control">
		<span>[별지 제56호 서식]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>
<% } %>
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
				<th colspan="4" width="40%">구분</th>
				<th colspan="2" width="30%">법인세</th>
				<th colspan="2" width="30%">농어촌특별세</th>
			</tr> 
			<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","", uSesEnt.dbo); 
				Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익  %>
			<%	xmlBuf += "<amt_61001>"+FormatUtil.insertComma(String.valueOf(amt_61001))+"</amt_61001>\n"; %>
			<tr>
				<td rowspan="7" width="5%" class="t-center">과<br>세<br>표<br>준<br>계<br>산</td>
				<td colspan="3" class="t-left">⑧ 이자소득금액계</td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">⑨ 준비금손금산입액</td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_61001))%></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">⑩ 기부금손금산입액</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">⑪ 기부금한도초과 이월액손금산입</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>								
			<tr>
				<td colspan="3" class="t-left">⑫ 각사업연도소득금액(⑧-⑨-⑩-⑪)</td>
				<td colspan="2" class="t-right">0</td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">⑬ 비과세소득</td>
				<td colspan="2" class="t-right">0</td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">⑭ 과세표준(⑫-⑬)</td>
				<td colspan="2" class="t-right">0</td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td rowspan="12" class="t-center">세<br><br>액<br><br>의<br><br>계<br><br>산</td>
				<td colspan="3">⑮ 세율</td>
				<td colspan="2" class="t-right">14%</td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(16) 산출세액</td>
				<td colspan="2" class="t-right">0</td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(17) 가산세액<br>(미납세액, 미납일수, 세율)</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;,&nbsp;3/10,000)</td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(18)가감계(16+17)</td>
				<td colspan="2" class="t-right">0</td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td rowspan="4" class="t-center" width="5%">기<br>납<br>부<br>세<br>액</td>
				<td colspan="2" class="t-left">(19)중간예납세액</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110901","","", uSesEnt.dbo); 
				Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급법인세) %>
			<%	xmlBuf += "<amt_1111202>"+FormatUtil.insertComma(String.valueOf(amt_1111202))+"</amt_1111202>\n"; %>
			<tr>
				<td colspan="2" class="t-left">(20)원천납부세액</td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(21)(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)세액</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(22)계(19+20+21)</td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(23)추가납부세액<br>(미납세액, 미납일수, 세율)</td>
				<td colspan="2" class="t-center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;,&nbsp;3/10,000)</td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(24)차감납부할세액(18-22+23)</td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_1111202 * -1))%></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(25)분납할세액</td>
				<td colspan="2" class="t-right"></td>
				<td colspan="2" class="t-right"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(26)차감납부할세액(24-25)</td>
				<td colspan="2" class="t-right"><%=FormatUtil.insertComma(String.valueOf(amt_1111202 * -1))%></td>
				<td colspan="2" class="t-right"></td>
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
				<td rowspan="3" width="15%" class="center">국세환급금<br>계좌신고</td>
				<td width="10%" class="t-left">(27)예 입 처</td>
				<td width="75%" class="center"><%=obox.get("bank_nm")%></td>
			</tr>
			<tr>
				<td class="t-left">(28)예 금 종 류</td>
				<td class="center"><%=obox.get("account_type")%></td>
			</tr>
			<tr>
				<td class="t-left">(29)계 좌 번 호</td>
				<td class="center"><%=obox.get("account_no")%></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">
					신고인은 법인세법 제60조 및 국세기본법 제45조의3에 따라 위의 내용을 신고하며, <b>위 내용을 충분히 검토하였고 신고인이 알고 있는 사실 그대로를 정확하게 기재하였음을 확인합니다.</b>
					<br><br>
					<%=StringUtil.strLooping("&nbsp;",150)%>
					신고인(대표자) &nbsp;<%=obox.get("rep_person_nm")%> &nbsp;&nbsp;&nbsp;(서명 또는 인) 
				</td>
			</tr> 
			<tr>
				<td colspan="3" class="t-left">
					<b>세무대리인은 조세전문자격자로서 위 신고서를 성실하고 공정하게 작성하였음을 확인합니다.</b>
					<br>
					<%=StringUtil.strLooping("&nbsp;",180)%>
					<%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월 <%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)%>일
					<br><br>
					<%=StringUtil.strLooping("&nbsp;",150)%>
					세무대리인 　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(서명 또는 인) 
					<br>
					<b><%=obox.get("tax_office")%></b> 세무서장 귀하
				</td>
			</tr> 
		</table>
	</div>
</table>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>