<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- 사내근로복지기금운영상황보고서 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(gbn) {
		var pageUrl = '';
		if(gbn == 'E') { 
			pageUrl = '/tax/fd/adj02008_excel.do?include=Y';
			document.taxForm.action = pageUrl + '&excel_yn=Y';
			document.taxForm.target = '_self';
			document.taxForm.submit();
		}else {
			pageUrl = '/tax/fd/adj02008.do?include=Y';
			ajaxReplaceForm(pageUrl, "#taxForm", "#divListData");
		}
	}

	function goReport() {
		var params = 'P_PARAM01!<%=box.get("std_yy")%>!P_PARAM02!'+document.taxForm.report_id.value+'!';
		goUbiViewer('/WEB-INF/jsp/tax/report/'+document.taxForm.report_id.value.toLowerCase()+'.jrf', params);
	}
	
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
<input type="hidden" id="excel_file_nm"	name="excel_file_nm" 	value="사내근로복지기금운영상황보고서">

<% if(!box.get("include").equals("Y")) { %>
	<h1 class="page-title">사내근로복지기금운영상황보고서</h1> 
	
	<table class="search-panel table table-bordered">
 		<tr>
			<td width="15%" class="td-head">기준년도</td>
			<td style="padding-left:5px">
				<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:80px">
					<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
				</select>
				<span class="f-right marR60">
		  			<button type="button" class="btn btn-primary" onclick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
		  			<button type="button" id="btnExcel" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
					<button type="button" id="btnRptViewer" class="btn dark marL5" onclick="goReport();"><img src="/com/img/ico_btn_print.png">인쇄</button>
	  			</span>
			</td>
 		</tr>
	</table>
	
	<input type="hidden" name="report_id" value="ADJ02008">
<% }else { %>
	<h2 class="page-title-2depths">사내근로복지기금운영상황보고서</b>
<% } %>
	<div class="table-top-control">
		<span >[별지 제15호 서식]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>
				  
  	<div id="divListData" class="contentsRow">
<% } %>
		<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 150px);">			
	
				<%	xmlBuf += "<std_yy>"+box.get("std_yy")+"</std_yy>\n"
						   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
						   +  "<license_no>"+obox.get("license_no")+"</license_no>\n"
						   +  "<reg_ymd>"+StringUtil.getFormatedText(obox.get("reg_ymd"),"????년 ??월 ??일")+"</reg_ymd>\n"
						   +  "<tel_no>"+obox.get("tel_no")+"</tel_no>\n"
						   +  "<addr>"+obox.get("addr")+"</addr>\n"
						   +  "<acc_start_ymd>"+StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????년 ??월 ??일")+"</acc_start_ymd>\n"
						   +  "<acc_end_ymd>"+StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????년 ??월 ??일")+"</acc_end_ymd>\n"
						   +  "<mo_rep_person>"+obox.get("mo_rep_person")+"</mo_rep_person>\n"
						   +  "<mo_upjong>"+obox.get("mo_upjong")+"</mo_upjong>\n"
						   +  "<empl_cnt>"+obox.get("empl_cnt")+"</empl_cnt>\n"
						   +  "<nojo_entry_cnt>"+obox.get("nojo_entry_cnt")+"</nojo_entry_cnt>\n"
						   +  "<capital_amt>"+FormatUtil.insertComma(String.valueOf(Math.round(obox.getLong("capital_amt") / 1000.0)))+"</capital_amt>\n"; 
				%>
				<table class="table table-bordered order-column">
					<tr>
						<td rowspan="3" class="td-head t-center" width="5%">기금<br>법인</td>
						<td colspan="3" class="td-head t-center" width="13%">① 기금법인명</td>
						<td colspan="3" class="td-head t-center" width="13%">② 인가번호</td>
						<td colspan="4" class="td-head t-center">③ 설립등기일</td>
						<td colspan="7" class="td-head t-center">④ 전화번호</td>
						<td colspan="10" class="td-head t-center">⑤ 소재지</td>
					</tr>
					<tr>
						<td colspan="3" class="t-center"><%=obox.get("corp_nm")%></td>
						<td colspan="3" class="t-center"><%=obox.get("license_no")%></td>
						<td colspan="4" class="t-center"><%=StringUtil.getFormatedText(obox.get("reg_ymd"),"????년 ??월 ??일")%></td>
						<td colspan="7" class="t-center"><%=obox.get("tel_no")%></td>
						<td rowspan="2" colspan="10" class="t-center"><%=obox.get("addr")%></td>
					</tr>
					<tr>
						<td colspan="3" class="td-head t-center">⑥ 회계연도</td>
						<td colspan="14" class="t-center">
						<%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????년 ??월 ??일")%> ~ <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????년 ??월 ??일")%>
						</td>
					</tr>
					<tr>
						<td rowspan="2" class="td-head t-center">사업체</td>
						<td colspan="3" class="td-head t-center">⑦ 대표자</td>
						<td colspan="3" class="td-head t-center">⑧ 업종</td>
						<td colspan="4" class="td-head t-center">⑨ 근로자 수</td>
						<td colspan="7" class="td-head t-center">⑩ 협력업체 근로자 수</td>
						<td colspan="10" class="td-head t-center">⑪ 납입자본금</td>
					</tr>
					<tr>
						<td colspan="3" class="t-center"><%=obox.get("mo_rep_person")%></td>
						<td colspan="3" class="t-center"><%=obox.get("mo_upjong")%></td>
						<td colspan="4" class="t-center"><%=obox.get("empl_cnt")%> 명</td>
						<td colspan="7" class="t-center"><%=obox.get("dispatch_cnt")%> 명</td>
						<td colspan="10" class="t-center">
						<%=FormatUtil.insertComma(String.valueOf(Math.round(obox.getLong("capital_amt") / 1000000.0)))%> 백만원
						</td>
					</tr>
					<tr>
						<td rowspan="4" class="td-head t-center">기본<br>재산<br>현황</td>
						<td colspan="4" class="td-head t-center">⑫ 전기 말 기본재산 총액</td>
						<td colspan="20" class="td-head t-center">당기변동금액</td>
						<td colspan="3" class="td-head t-center" width="8%">(20)당기 말 <br>기본재산 총액</td>
					</tr>
					<% 	
						Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3","","",uSesEnt.dbo); // 기금총액
						Long amt_3_pre_iwol = rbox.getLong("pre_iwol"); 
						Long amt_3_cur_acum = rbox.getLong("cur_acum"); 
						
						rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3100103","","",uSesEnt.dbo); // 기금(기본재산)
						amt_3_pre_iwol = rbox.getLong("pre_iwol"); 
						amt_3_cur_acum = rbox.getLong("cur_acum"); 
						Long amt_3100103_dae_amt = rbox.getLong("dae_amt"); 
						Long amt_3100103_cha_amt = rbox.getLong("cha_amt"); 
					%>
					<tr>
					<%	xmlBuf += "<cell_11>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_3_pre_iwol / 1000.0)))+"</cell_11>\n"
								   +  "<cell_12>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt / 1000.0)))+"</cell_12>\n" 
								   +  "<cell_15>"+FormatUtil.insertComma(String.valueOf(Math.round(-amt_3100103_cha_amt / 1000.0)))+"</cell_15>\n" 
								   +  "<cell_16>"+FormatUtil.insertComma(String.valueOf(Math.round((amt_3100103_dae_amt-amt_3100103_cha_amt) / 1000.0)))+"</cell_16>\n" 
								   +  "<cell_17>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_3_cur_acum / 1000.0)))+"</cell_17>\n"; 
					%>  
 								<td rowspan="3" colspan="4" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_pre_iwol / 1000.0)))%></td>
								<td rowspan="2" colspan="1" class="td-head t-center">증가</td>
								<td colspan="3" class="td-head t-center">⑬ 사업주 출연</td>
								<td colspan="3" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt / 1000.0)))%></td>
								<td colspan="5" class="td-head t-center">⑭ 수익금ㆍ이월금 전입</td>
								<td colspan="4" class="t-center"></td>
								<td colspan="4" class="td-head t-center" width="8%">(19)소계</td>
								<td rowspan="3" colspan="3" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_cur_acum / 1000.0)))%></td>
							</tr>
							<tr>
								<td colspan="3" class="td-head t-center">⑮ 사업주 외의 자 출연</td>
								<td colspan="3" class="t-center"></td>
								<td colspan="5" class="td-head t-center">(16)기금법인 합병</td>
								<td colspan="4" class="t-center"></td>
								<td rowspan="2" colspan="4" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_3100103_dae_amt-amt_3100103_cha_amt) / 1000.0)))%></td>
							</tr>
							<tr>
								<td colspan="1" class="td-head t-center">감소</td>
								<td colspan="3" class="td-head t-center">(17)기본재산 사용</td>
								<td colspan="3" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(-amt_3100103_cha_amt / 1000.0)))%></td>
								<td colspan="5" class="td-head t-center">(18)기금법인 분할 등</td>
								<td colspan="4" class="t-center"></td>
							</tr>
							<tr>
								<td rowspan="3" class="td-head t-center">기금<br>운용<br>및<br>관리</td>
								<td colspan="20" class="td-head t-center">운용방법</td>
								<td rowspan="2" colspan="4" class="td-head t-center">(27)근로자 대부</td>
								<td rowspan="2" colspan="3" class="td-head t-center">(28)합계</td>
							</tr>
							<tr>
								<td colspan="4" class="td-head t-center">(21)금융회사 예입ㆍ예탁</td>
								<td colspan="1" class="td-head t-center">(22)투자신탁 수익증권 매입</td>
								<td colspan="3" class="td-head t-center">(23)유가증권 매입</td>
								<td colspan="3" class="td-head t-center">(24)보유 자사주 유상증자 참여</td>
								<td colspan="5" class="td-head t-center">(25)(부동산)투자회사가 발행하는 주식의 매입</td>
								<td colspan="4" class="td-head t-center">(26)기타</td>
							</tr>
						<% 	
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11101","","",uSesEnt.dbo); // 단기금융상품
       						Long amt_11101_cur_acum = rbox.getLong("cur_acum"); 
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110005","","",uSesEnt.dbo); // 기업자유예금
							amt_11101_cur_acum += rbox.getLong("cur_acum");
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11103","","",uSesEnt.dbo); // 유가증권
       						Long amt_11103_cur_acum = 0L;//rbox.getLong("cur_acum"); 
							 
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","12103","","",uSesEnt.dbo); // 장기대여금
							Long amt_12103_cur_acum;
							if(rbox.getLong("cur_acum")>=amt_3_cur_acum) {
								amt_12103_cur_acum = amt_3_cur_acum;
								amt_11101_cur_acum = rbox.getLong("0");
							}else {
								amt_12103_cur_acum = rbox.getLong("cur_acum");			
								amt_11101_cur_acum = amt_3_cur_acum - amt_12103_cur_acum;
							}
							
							Long amt_tot1 = amt_11101_cur_acum + amt_11103_cur_acum + amt_12103_cur_acum;
						%>
							<tr>
								<%	xmlBuf += "<cell_18>"+(uSesEnt.corp_cd.equals("SABOK22")?"0":FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0))))+"</cell_18>\n"
										   +  "<cell_20>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_11103_cur_acum / 1000.0)))+"</cell_20>\n"
										   +  "<cell_21>"+(uSesEnt.corp_cd.equals("SABOK22")?FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0))):"")+"</cell_21>\n"
										   +  "<cell_22>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_12103_cur_acum / 1000.0)))+"</cell_22>\n"
										   +  "<cell_23>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_tot1 / 1000.0)))+"</cell_23>\n";
								%>
								<td colspan="4" class="t-center">
									<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
										0
									<% }else { %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="1" class="t-center"></td>
								<td colspan="3" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11103_cur_acum / 1000.0)))%></td>
								<td colspan="3" class="t-center"></td>
								<td colspan="5" class="t-center"></td>
								<td colspan="4" class="t-center">
									<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="4" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_12103_cur_acum / 1000.0)))%></td>
								<td colspan="3" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot1 / 1000.0)))%></td>
							</tr>
							<tr>
								<td rowspan="2" class="td-head t-center">기금<br>사업<br>재원</td>
								<td colspan="4" class="td-head t-center">(29)당기 기금운용 수익금</td>
								<td colspan="3" class="td-head t-center">(30)해당 회계연도 출연금액의 <br>100분의 50 또는 100분의 80 범위 </td>
								<td colspan="3" class="td-head t-center">(31)해당 사업(장) 자본금 <br>100분의 50 초과액</td>
								<td colspan="4" class="td-head t-center">(32)기본재산 100분의 20 범위</td>
								<td colspan="6" class="td-head t-center">(33)이월금  등 </td>
								<td colspan="8" class="td-head t-center">(34)합계</td>
							</tr>
						<%  
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); // 이자수입
							Long amt_61_cur_amt = rbox.getLong("cur_amt"); 
							
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801","","", uSesEnt.dbo); // 고유목적사업준비금1
							Long amt_2200801_dae_amt = rbox.getLong("dae_amt"); 
							Long amt_2200801_cha_amt = rbox.getLong("cha_amt"); 
							Long amt_2200801_pre_iwol = rbox.getLong("pre_iwol"); 
							 
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802","","", uSesEnt.dbo); // 고유목적사업준비금2
							Long amt_2200802_dae_amt = rbox.getLong("dae_amt"); 
							Long amt_2200802_cha_amt = rbox.getLong("cha_amt"); 
							Long amt_2200802_pre_iwol = rbox.getLong("pre_iwol"); 
							Long amt_tot2 = amt_61_cur_amt + amt_3100103_cha_amt + amt_2200801_pre_iwol + amt_2200802_pre_iwol;
						%>
							<tr>
								<%	xmlBuf += "<cell_24>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_61_cur_amt / 1000.0)))+"</cell_24>\n"
										   +  "<cell_25>"+(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")?"":FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0))))+"</cell_25>\n"
										   +  "<cell_26>"+(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")?FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0))):"")+"</cell_26>\n"
										   +  "<cell_27>"+FormatUtil.insertComma(String.valueOf(Math.round((amt_2200801_pre_iwol+amt_2200802_pre_iwol) / 1000.0)))+"</cell_27>\n"
										   +  "<cell_28>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_tot2 / 1000.0)))+"</cell_28>\n";
								%>
								<td colspan="4" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_61_cur_amt / 1000.0)))%></td>
								<td colspan="3" class="t-center">
									<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
										
									<% }else { %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="3" class="t-center">
									<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="4" class="t-center"></td>
								<td colspan="6" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_2200801_pre_iwol+amt_2200802_pre_iwol) / 1000.0)))%></td>
								<td colspan="8" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot2 / 1000.0)))%></td>
							</tr>
							<tr>
								<td rowspan="2" colspan="5" class="td-head t-center">기본재산<br>100분의 20범위 사용현황</td>
								<td colspan="3" class="td-head t-center">(35)사용한 기본재산 총 금액</td>
								<td colspan="3" class="td-head t-center">(36)협력업체 근로자의 <br>복리후생 증진에 사용한 금액</td>
								<td colspan="4" class="td-head t-center">(37)복지혜택을 받은 <br>협력업체 근로자 수</td>
								<td colspan="7" class="td-head t-center">(38)소속 근로자 <br>1명당 수혜금액</td>
								<td colspan="6" class="td-head t-center">(39)협력업체 근로자 <br>1명당 수혜금액</td>
							</tr>
							<tr>
								<td colspan="3" class="t-center"></td>
								<td colspan="3" class="t-center"></td>
								<td colspan="4" class="t-center"></td>
								<td colspan="7" class="t-center"></td>
								<td colspan="6" class="t-center"></td>
							</tr>
							<tr>
								<td rowspan="2" colspan="5" class="td-head t-center">해당 회계연도  출연금<br>100분의 80범위 사용현황</td>
								<td colspan="4" class="td-head t-center">(40)해당 회계연도 출연금</td>
								<td colspan="7" class="td-head t-center">(41)복지혜택을 받은 협력업체 근로자 수</td>
								<td colspan="12" class="td-head t-center">(42)협력업체 근로자의 <br>복리후생 증진에 사용한 금액</td>
							</tr>
							<tr>
								<td colspan="4" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt / 1000.0)))%></td>
								<td colspan="7" class="t-center"><%=obox.get("dispatch_use_cnt")%> 명</td>
								<td colspan="12" class="t-center"><%=FormatUtil.insertComma(String.valueOf(Math.round(obox.getInt("dispatch_sum") / 1000.0)))%></td>
							</tr>
							<tr>
								<td rowspan="16" class="td-head t-center">사업<br>실적<br></td>
								<td rowspan="2" colspan="5" class="td-head t-center">구분</td>
								<td colspan="4" class="td-head t-center">계</td>
								<td colspan="6" class="td-head t-center">목적사업</td>
								<td colspan="12" class="td-head t-center">대부사업</td>
							</tr>
							<tr>
								<td colspan="2" class="td-head t-center" width="13%">금액</td>
								<td colspan="2" class="td-head t-center" width="13%">수혜자수</td>
								<td colspan="2" class="td-head t-center" width="13%">금액</td>
								<td colspan="4" class="td-head t-center" width="11%">수혜자수</td>
								<td colspan="7" class="td-head t-center">금액</td>
								<td colspan="5" class="td-head t-center">수혜자수</td>
							</tr>
						<%  Long use_amt_tot = 0L;
							Long use_cnt_tot = 0L;
							Long loan_amt_tot = 0L;
							Long loan_cnt_tot = 0L;
							Long amt_use_loan_tot = 0L;
							for(int i=0; i < rsWp.getLength(); i++) { 
								if(i < rsWp.getLength() - 1) {
									use_amt_tot += rsWp.getLong("use_amt",i);
									use_cnt_tot += rsWp.getLong("use_cnt",i);
									loan_amt_tot += rsWp.getLong("loan_amt",i);
									loan_cnt_tot += rsWp.getLong("loan_cnt",i);
								}
						%>
							<tr>
							<% if(i == 0) { %>
								<td rowspan="11" class="td-head t-center" width="5%">복지<br>사업비</td>
							<% } %>
								<%	xmlBuf += "<LIST>\n"
										   +  "	<bugt_nm>"+rsWp.get("bugt_nm",i)+"</bugt_nm>\n"
										   +  "	<amt_tot>"+FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i)))+"</amt_tot>\n"
										   +  "	<cnt_tot>"+FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_cnt",i)+rsWp.getLong("loan_cnt",i)))+"</cnt_tot>\n"
										   +  "	<use_amt>"+rsWp.get("use_amt",i,Box.THOUSAND_COMMA)+"</use_amt>\n"
										   +  "	<use_cnt>"+rsWp.get("use_cnt",i,Box.THOUSAND_COMMA)+"</use_cnt>\n"
										   +  "	<loan_amt>"+rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)+"</loan_amt>\n"
										   +  "	<loan_cnt>"+rsWp.get("loan_cnt",i,Box.THOUSAND_COMMA)+"</loan_cnt>\n"
										   +  "</LIST>\n";
								%>
								<td colspan="4" bgcolor="f6f6f6"><%=rsWp.get("bugt_nm",i)%></td>
								<td colspan="2" class="t-center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i)))%></td>
								<td colspan="2" class="t-center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_cnt",i)+rsWp.getLong("loan_cnt",i)))%></td>
								<td colspan="2" class="t-center" style="padding-right:2px"><%=rsWp.get("use_amt",i,Box.THOUSAND_COMMA)%></td>
								<td colspan="4" class="t-center" style="padding-right:2px"><%=rsWp.get("use_cnt",i,Box.THOUSAND_COMMA)%></td>
								<td colspan="7" class="t-center" style="padding-right:2px"><%=rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)%></td>
								<td colspan="5" class="t-center" style="padding-right:2px"><%=rsWp.get("loan_cnt",i,Box.THOUSAND_COMMA)%></td>
							</tr>
							<% if(i == 10) { 
 								amt_use_loan_tot = rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i);
							   } %>
						<%  } %>
						<% 	
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","72", "", "", uSesEnt.dbo); // 일반관리비
							Long amt_72_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
							
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801", "", "", uSesEnt.dbo); // 고유목적사업준비금1
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802", "", "", uSesEnt.dbo); // 고유목적사업준비금2
							Long amt_22008_cur_acum = Math.round(amt_tot1 / 1000.0) + Math.round(amt_tot2 / 1000.0) + Math.round(amt_12103_cur_acum / 1000.0) - amt_use_loan_tot - amt_72_cur_amt;
						%>
							<%	xmlBuf += "<cell_39>"+FormatUtil.insertComma(String.valueOf(amt_72_cur_amt))+"</cell_39>\n"
									   +  "<cell_40>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_22008_cur_acum)-Math.round(amt_tot1 / 1000.0)))+"</cell_40>\n"
									   +  "<cell_41>"+FormatUtil.insertComma(String.valueOf(/*Math.round(amt_tot1 / 1000.0)*/+Math.round(amt_tot2 / 1000.0)+Math.round(amt_12103_cur_acum / 1000.0)))+"</cell_41>\n"; 
							%>	
							<tr>
								<td colspan="5" bgcolor="f6f6f6">(54)기금 운영비</td>
								<td colspan="20" class="t-center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_72_cur_amt))%></td>
							</tr>
							<tr>
								<td colspan="5" bgcolor="f6f6f6">(55)잔액</td>
								<td colspan="20" class="t-center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_22008_cur_acum)-Math.round(amt_tot1 / 1000.0)))%></td>
							</tr>
							<tr>
								<td colspan="5" bgcolor="f6f6f6">(56)합계</td>
								<td colspan="20" class="t-center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_use_loan_tot+amt_72_cur_amt+Math.round(amt_22008_cur_acum)-Math.round(amt_tot1 / 1000.0)))%></td>
							</tr>
						<% 	
							rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7110900","","", uSesEnt.dbo); // 복지카드
							Long amt_7110900_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
							Long amt_tot = amt_7110900_cur_amt;
						%>
						
							<%	xmlBuf += "<cell_50>"+FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))+"</cell_50>\n"
									   +  "<cell_51>"+FormatUtil.insertComma(String.valueOf(amt_tot))+"</cell_51>\n"; 
							%>
							<tr>
								<td rowspan="2" class="td-head t-center">선택적<br>복지비</td>
								<td colspan="4" class="td-head t-center">(57)금액</td>
								<td colspan="3" class="td-head t-center">(58)수혜자수</td>
								<td rowspan="2" class="td-head t-center">부동산 현황</td>
								<td colspan="4" class="td-head t-center">(59)명칭</td>
								<td colspan="7" class="td-head t-center">(60)금액</td>
								<td colspan="8" class="td-head t-center">(61)취득일</td>
							</tr>
							<tr>
								<td colspan="4" class="t-center"><%=FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))%></td>
								<td colspan="3" class="t-center">
									<% //if(uSesEnt.corp_cd.equals("SABOK01")) { //교촌 %>
										<!-- 223 -->
									<% //} %>
								</td>
								<td colspan="4" class="t-center"></td>
								<td colspan="7" class="t-center"></td>
								<td colspan="8" class="t-center"></td>
							</tr>
				</table>
			</div>
		</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
	</div>
<% } %>
<input type="hidden" name="xmlBuf" value="<%=xmlBuf%>">
</form>