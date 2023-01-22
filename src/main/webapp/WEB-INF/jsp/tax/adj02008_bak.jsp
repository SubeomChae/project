<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<title>사내근로복지기금운영상황보고서</title>

<script language="javascript">
	function goSearch(gbn) {
		var pageUrl = 'tax10.do?method=adj02008';
		if(gbn == 'E') { pageUrl += '&excel_yn=Y&excel_file_nm=사내근로복지기금운영상황보고서'; }
		
		document.main.action = pageUrl; 
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goReport() {
		var params = 'P_PARAM01!<%=box.get("std_yy")%>!P_PARAM02!ADJ02008!';
		goUbiViewer('WEB-INF/jsp/tax/report/adj02008.jrf', params);
	}
	
	function page_init() {
		sinjax.updateBoxWithForm('tax10.do?method=xmlUpdate', document.main, 'page_init');
	}
	function __page_init_post(rsBox) { }
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<% if(!box.get("include").equals("Y")) { %>
	<tr> 
		<td valign="top" style="padding:10px 10px 0 10px;">
	      <table width="100%" height="" cellpadding="0" cellspacing="0" border="0">
	        <tr>
	          <td height="35" class="cont_title">사내근로복지기금운영상황보고서</td>
	        </tr>
		  </table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr valign="top">
		<td align="center">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="15%" class="table01_title" align="center">기준년도</td>
					<td style="padding-left:5px">
						<select name="std_yy" title="기준년도" style="width:80px">
							<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
						</select>
					</td>
					<td width="20%" align="center">
			  			<a href="javascript:goSearch('N');"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goSearch('E');"><img src="/com/img/btn_excel.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goReport();"><img src="/com/img/btn_print.gif" border="0" align="absmiddle"></a>
					</td>
		  		</tr>
			</table>
		</td>
	</tr>
	<input type="hidden" name="report_id" value="ADJ02008">
<% }else { %>
	<tr> 
		<td valign="top" style="padding:5 0 5 5"><img src="/com/img/title_bullet.gif" border="0" align="absmiddle"> <b>사내근로복지기금운영상황보고서</b></td>
		<input type="hidden" name="std_yy" 	  value="<%=box.get("std_yy")%>">
		<input type="hidden" name="include"   value="<%=box.get("include")%>">
	</tr>
<% } %>
	<tr valign="top">
		<td align="center">
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr height="20">
				  	<td class="table_description">[별지 제15호 서식]</td>
				  	<td align="right" class="table_description">(금액단위 : 천원)</td>
				</tr>
          		<tr>
					<td colspan="2" width="100%" valign="top">
						<%if(!box.get("include").equals("Y")){%><div id="divArea" style="width:100%;height:300px;overflow-y:scroll"><%}%>
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
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="28">
								<td rowspan="2" bgcolor="f6f6f6" align="center" width="3%">기<br>금</td>
								<td colspan="4" bgcolor="f6f6f6" align="center" width="8%">①기금명</td>
								<td colspan="1" align="center"><%=obox.get("corp_nm")%></td>
								<td colspan="5" bgcolor="f6f6f6" align="center">②인가번호</td>
								<td colspan="6" align="center"><%=obox.get("license_no")%></td>
								<td colspan="5" bgcolor="f6f6f6" align="center">③설립등기일</td>
								<td colspan="6" align="center"><%=StringUtil.getFormatedText(obox.get("reg_ymd"),"????년 ??월 ??일")%></td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6" align="center">④소재지</td>
								<td colspan="6" align="center"><%=obox.get("addr")%></td>
								<td colspan="6" bgcolor="f6f6f6" align="center">⑤회계연도</td>
								<td colspan="11" align="center">
									<%=StringUtil.getFormatedText(obox.get("acc_start_ymd"),"????년 ??월 ??일")%> ~ <%=StringUtil.getFormatedText(obox.get("acc_end_ymd"),"????년 ??월 ??일")%>
								</td>
							</tr>
							<tr height="28">
								<td rowspan="2" bgcolor="f6f6f6" align="center">사<br>업<br>체</td>
								<td colspan="4" bgcolor="f6f6f6" align="center">⑥대표자</td>
								<td colspan="1" bgcolor="f6f6f6" align="center">⑦업종</td>
								<td colspan="5" bgcolor="f6f6f6" align="center">⑧근로자수</td>
								<td colspan="6" bgcolor="f6f6f6" align="center">⑨노동조합원수</td>
								<td colspan="11" bgcolor="f6f6f6" align="center">⑩납입자본금</td>
							</tr>
							<tr height="28">
								<td colspan="4" align="center"><%=obox.get("mo_rep_person")%></td>
								<td colspan="1" align="center"><%=obox.get("mo_upjong")%></td>
								<td colspan="5" align="center"><%=obox.get("empl_cnt")%> 명</td>
								<td colspan="6" align="center"><%=obox.get("nojo_entry_cnt")%> 명</td>
								<td colspan="11" align="center">
									<%=FormatUtil.insertComma(String.valueOf(Math.round(obox.getLong("capital_amt") / 1000000.0)))%> 백만원
								</td>
							</tr>
							<tr height="28">
								<td rowspan="3" bgcolor="f6f6f6" align="center">기<br>금<br>현<br>황</td>
								<td rowspan="2" colspan="4" bgcolor="f6f6f6" align="center">⑪전기말기금<br>원금총액</td>
								<td colspan="19" bgcolor="f6f6f6" align="center">당기변동금액</td>
								<td rowspan="2" colspan="4" bgcolor="f6f6f6" align="center">(17)당기말기금원금<br>총액</td>
							</tr>
							<tr height="28">
								<td colspan="1" bgcolor="f6f6f6" align="center">⑫사업주출연</td>
								<td colspan="4" bgcolor="f6f6f6" align="center">⑬수익금전입</td>
								<td colspan="5" bgcolor="f6f6f6" align="center">⑭제3자출연등</td>
								<td colspan="5" bgcolor="f6f6f6" align="center">⑮원금사용등변동액</td>
								<td colspan="4" bgcolor="f6f6f6" align="center">(16)소계</td>
							</tr>
						<% 	
							Box rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3","","", request); // 기금총액
							Long amt_3_pre_iwol = rbox.getLong("pre_iwol"); 
							Long amt_3_cur_acum = rbox.getLong("cur_acum"); 
							
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","3100103","","", request); // 기금(기본재산)
							amt_3_pre_iwol = rbox.getLong("pre_iwol"); 
							amt_3_cur_acum = rbox.getLong("cur_acum"); 
							Long amt_3100103_dae_amt = rbox.getLong("dae_amt"); 
							Long amt_3100103_cha_amt = rbox.getLong("cha_amt"); 
						%>
							<tr height="28">
								<%	xmlBuf += "<cell_11>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_3_pre_iwol / 1000.0)))+"</cell_11>\n"
										   +  "<cell_12>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt / 1000.0)))+"</cell_12>\n"
										   +  "<cell_15>"+FormatUtil.insertComma(String.valueOf(Math.round(-amt_3100103_cha_amt / 1000.0)))+"</cell_15>\n"
										   +  "<cell_16>"+FormatUtil.insertComma(String.valueOf(Math.round((amt_3100103_dae_amt-amt_3100103_cha_amt) / 1000.0)))+"</cell_16>\n"
										   +  "<cell_17>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_3_cur_acum / 1000.0)))+"</cell_17>\n";
								%>
								<td colspan="4" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_pre_iwol / 1000.0)))%></td>
								<td colspan="1" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_dae_amt / 1000.0)))%></td>
								<td colspan="4" align="center"></td>
								<td colspan="5" align="center"></td>
								<td colspan="5" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(-amt_3100103_cha_amt / 1000.0)))%></td>
								<td colspan="4" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_3100103_dae_amt-amt_3100103_cha_amt) / 1000.0)))%></td>
								<td colspan="4" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3_cur_acum / 1000.0)))%></td>
							</tr>
							<tr height="28">
								<td rowspan="3" bgcolor="f6f6f6" align="center">기<br>금<br>관<br>리</td>
								<td colspan="17" bgcolor="f6f6f6" align="center">운용방법</td>
								<td rowspan="2" colspan="8" bgcolor="f6f6f6" align="center">(22)근로자대부</td>
								<td rowspan="2" colspan="2" bgcolor="f6f6f6" align="center">(23)합계</td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6" align="center">(18)금융기관<br>예입예탁</td>
								<td colspan="2" bgcolor="f6f6f6" align="center">(19)투자신탁수익증권매입</td>
								<td colspan="6" bgcolor="f6f6f6" align="center">(20)유가증권매입</td>
								<td colspan="5" bgcolor="f6f6f6" align="center">(21)기타</td>
							</tr>

						<% 	
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11101","","", request); // 단기금융상품
       						Long amt_11101_cur_acum = rbox.getLong("cur_acum"); 
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110005","","", request); // 기업자유예금
							amt_11101_cur_acum += rbox.getLong("cur_acum");
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","11103","","", request); // 유가증권
       						Long amt_11103_cur_acum = 0L;//rbox.getLong("cur_acum"); 
							 
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","12103","","", request); // 장기대여금
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
							<tr height="28">
								<%	xmlBuf += "<cell_18>"+(uSesEnt.corp_cd.equals("SABOK22")?"0":FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0))))+"</cell_18>\n"
										   +  "<cell_20>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_11103_cur_acum / 1000.0)))+"</cell_20>\n"
										   +  "<cell_21>"+(uSesEnt.corp_cd.equals("SABOK22")?FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0))):"")+"</cell_21>\n"
										   +  "<cell_22>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_12103_cur_acum / 1000.0)))+"</cell_22>\n"
										   +  "<cell_23>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_tot1 / 1000.0)))+"</cell_23>\n";
								%>
								<td colspan="4" align="center">
									<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
										0
									<% }else { %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="2" align="center"></td>
								<td colspan="6" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11103_cur_acum / 1000.0)))%></td>
								<td colspan="5" align="center">
									<% if(uSesEnt.corp_cd.equals("SABOK22")) { //토비스 %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_11101_cur_acum / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="8" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_12103_cur_acum / 1000.0)))%></td>
								<td colspan="2" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot1 / 1000.0)))%></td>
							</tr>
							<tr height="28">
								<td rowspan="2" bgcolor="f6f6f6" align="center">용도<br>사업<br>재원</td>
								<td colspan="4" bgcolor="f6f6f6" align="center">(24)당기기금운용<br>수익금</td>
								<td colspan="2" bgcolor="f6f6f6" align="center">(25)당해회계연도출연금액의<br>50퍼센트또는80퍼센트범위</td>
								<td colspan="7" bgcolor="f6f6f6" align="center">(26)자본금50퍼센트초과액</td>
								<td colspan="8" bgcolor="f6f6f6" align="center">(27)이월금등</td>
								<td colspan="6" bgcolor="f6f6f6" align="center">(28)합계</td>
							</tr>
						<%  
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", request); // 이자수입
							Long amt_61_cur_amt = rbox.getLong("cur_amt"); 
							
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801","","", request); // 고유목적사업준비금1
							Long amt_2200801_dae_amt = rbox.getLong("dae_amt"); 
							Long amt_2200801_cha_amt = rbox.getLong("cha_amt"); 
							Long amt_2200801_pre_iwol = rbox.getLong("pre_iwol"); 
							 
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802","","", request); // 고유목적사업준비금2
							Long amt_2200802_dae_amt = rbox.getLong("dae_amt"); 
							Long amt_2200802_cha_amt = rbox.getLong("cha_amt"); 
							Long amt_2200802_pre_iwol = rbox.getLong("pre_iwol"); 
							Long amt_tot2 = amt_61_cur_amt + amt_3100103_cha_amt + amt_2200801_pre_iwol + amt_2200802_pre_iwol;
						%>
							<tr height="28">
								<%	xmlBuf += "<cell_24>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_61_cur_amt / 1000.0)))+"</cell_24>\n"
										   +  "<cell_25>"+(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")?"":FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0))))+"</cell_25>\n"
										   +  "<cell_26>"+(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")?FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0))):"")+"</cell_26>\n"
										   +  "<cell_27>"+FormatUtil.insertComma(String.valueOf(Math.round((amt_2200801_pre_iwol+amt_2200802_pre_iwol) / 1000.0)))+"</cell_27>\n"
										   +  "<cell_28>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_tot2 / 1000.0)))+"</cell_28>\n";
								%>
								<td colspan="4" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_61_cur_amt / 1000.0)))%></td>
								<td colspan="2" align="center">
									<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
										
									<% }else { %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="7" align="center">
									<% if(uSesEnt.corp_cd.equals("SABOK12")||uSesEnt.corp_cd.equals("SABOK25")) { //현대HDS, 연성정밀화학 %>
										<%=FormatUtil.insertComma(String.valueOf(Math.round(amt_3100103_cha_amt / 1000.0)))%>
									<% } %>
								</td>
								<td colspan="8" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round((amt_2200801_pre_iwol+amt_2200802_pre_iwol) / 1000.0)))%></td>
								<td colspan="6" align="center"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_tot2 / 1000.0)))%></td>
							</tr>
							<tr height="28">
								<td rowspan="15" bgcolor="f6f6f6" align="center">사<br>업<br>실<br>적<br></td>
								<td rowspan="2" colspan="5" bgcolor="f6f6f6" align="center">구분</td>
								<td colspan="4" bgcolor="f6f6f6" align="center">계</td>
								<td colspan="6" bgcolor="f6f6f6" align="center">보조사업</td>
								<td colspan="5" bgcolor="f6f6f6" align="center">대부사업</td>
								<td colspan="7" bgcolor="f6f6f6" align="center">(42)부동산현황</td>
							</tr>
							<tr height="28">
								<td colspan="2" bgcolor="f6f6f6" align="center" width="8%">금액</td>
								<td colspan="2" bgcolor="f6f6f6" align="center" width="8%">수혜자수</td>
								<td colspan="2" bgcolor="f6f6f6" align="center" width="8%">금액</td>
								<td colspan="4" bgcolor="f6f6f6" align="center" width="8%">수혜자수</td>
								<td colspan="3" bgcolor="f6f6f6" align="center" width="8%">금액</td>
								<td colspan="2" bgcolor="f6f6f6" align="center" width="8%">수혜자수</td>
								<td colspan="2" bgcolor="f6f6f6" align="center" width="8%">명칭</td>
								<td colspan="4" bgcolor="f6f6f6" align="center" width="8%">금액</td>
								<td bgcolor="f6f6f6" align="center" width="8%">취득일</td>
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
							<tr height="28">
							<% if(i == 0) { %>
								<td rowspan="10" bgcolor="f6f6f6" align="center" width="3%">복<br>지<br>사<br>업<br>비<br></td>
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
								<td colspan="2" align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i)))%></td>
								<td colspan="2" align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(rsWp.getLong("use_cnt",i)+rsWp.getLong("loan_cnt",i)))%></td>
								<td colspan="2" align="right" style="padding-right:2px"><%=rsWp.get("use_amt",i,Box.THOUSAND_COMMA)%></td>
								<td colspan="4" align="right" style="padding-right:2px"><%=rsWp.get("use_cnt",i,Box.THOUSAND_COMMA)%></td>
								<td colspan="3" align="right" style="padding-right:2px"><%=rsWp.get("loan_amt",i,Box.THOUSAND_COMMA)%></td>
								<td colspan="2" align="right" style="padding-right:2px"><%=rsWp.get("loan_cnt",i,Box.THOUSAND_COMMA)%></td>
							<% if(i == 0) { %>
								<td rowspan="22" colspan="2"></td>
								<td rowspan="22" colspan="4"></td>
								<td rowspan="22"></td>
							<% } %>
							</tr> 
							<% if(i == 9) { 
								amt_use_loan_tot = rsWp.getLong("use_amt",i)+rsWp.getLong("loan_amt",i);
							   } %>
						<%  } %>
						<% 	
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","72","","", request); // 일반관리비
							Long amt_72_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
							
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200801","","", request); // 고유목적사업준비금1
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","2200802","","", request); // 고유목적사업준비금2
							Long amt_22008_cur_acum = Math.round(amt_tot1 / 1000.0) + Math.round(amt_tot2 / 1000.0) + Math.round(amt_12103_cur_acum / 1000.0) - amt_use_loan_tot - amt_72_cur_amt;
						%>
							<%	xmlBuf += "<cell_39>"+FormatUtil.insertComma(String.valueOf(amt_72_cur_amt))+"</cell_39>\n"
									   +  "<cell_40>"+FormatUtil.insertComma(String.valueOf(Math.round(amt_22008_cur_acum)-Math.round(amt_tot1 / 1000.0)))+"</cell_40>\n"
									   +  "<cell_41>"+FormatUtil.insertComma(String.valueOf(/*Math.round(amt_tot1 / 1000.0)*/+Math.round(amt_tot2 / 1000.0)+Math.round(amt_12103_cur_acum / 1000.0)))+"</cell_41>\n"; 
							%>	
							<tr height="28">
								<td colspan="5" bgcolor="f6f6f6">(39)기금운영비</td>
								<td colspan="15" align="center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_72_cur_amt))%></td>
							</tr>
							<tr height="28">
								<td colspan="5" bgcolor="f6f6f6">(40)잔액</td>
								<td colspan="15" align="center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(Math.round(amt_22008_cur_acum)-Math.round(amt_tot1 / 1000.0)))%></td>
							</tr>
							<tr height="28">
								<td colspan="5" bgcolor="f6f6f6">(41)합계</td>
								<td colspan="15" align="center" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(/*Math.round(amt_tot1 / 1000.0)*/+Math.round(amt_tot2 / 1000.0)+Math.round(amt_12103_cur_acum / 1000.0)))%></td>
							</tr>
							<tr height="28">
								<td rowspan="9" bgcolor="f6f6f6" align="center">선<br>택<br>적<br>복<br>지<br>제<br>도<br>실<br>적<br></td>
								<td rowspan="8" bgcolor="f6f6f6" align="center">사<br>업<br>내<br>용<br></td>
								<td colspan="4" bgcolor="f6f6f6">(43)주택구입자금지원</td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6">(44)우리사주주식구입</td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6">(45)생활안정자금</td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6">(46)장학금</td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6">(47)재난구호금</td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6">(48)체육문화활동지원</td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
							<tr height="28">
								<td colspan="4" bgcolor="f6f6f6">(49)근로자의날행사비지원</td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
						<% 	
							rbox = CodeHelper.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7110900","","", request); // 복지카드
							Long amt_7110900_cur_amt = Math.round(rbox.getLong("cur_amt") / 1000.0); 
							Long amt_tot = amt_7110900_cur_amt;
						%>
						
							<%	xmlBuf += "<cell_50>"+FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))+"</cell_50>\n"
									   +  "<cell_51>"+FormatUtil.insertComma(String.valueOf(amt_tot))+"</cell_51>\n"; 
							%>
							<tr height="28"> 
								<td colspan="4" bgcolor="f6f6f6">(50)그 밖의 복지비</td>
								<td colspan="2" align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))%></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_7110900_cur_amt))%></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
							<tr height="28">
								<td colspan="5" bgcolor="f6f6f6">(51)소계</td>
								<td colspan="2" align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_tot))%></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"><%=FormatUtil.insertComma(String.valueOf(amt_tot))%></td>
								<td colspan="4" align="right" style="padding-right:2px"></td>
								<td colspan="3" align="right" style="padding-right:2px"></td>
								<td colspan="2" align="right" style="padding-right:2px"></td>
							</tr>
						</table>
						<%if(!box.get("include").equals("Y")){%></div><%}%>
				    </td>
				</tr>
			</table>
		</td>
  	</tr>
</table>
<input type="hidden" name="xmlBuf" value="<%=xmlBuf%>">
</form>
<% if(!box.get("include").equals("Y")) { %>
<script language="javascript">
	document.getElementById("divArea").style.height = document.body.clientHeight - 130;
</script>
<script for=window event="onresize" language="JScript">
	document.getElementById("divArea").style.height = document.body.clientHeight - 130;
</script>
<% } %>