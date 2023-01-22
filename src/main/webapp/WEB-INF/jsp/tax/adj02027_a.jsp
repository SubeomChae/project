<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"       class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"      class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>
<!-- [별지 제27호 서식] 고유목적사업준비금조정명세서(갑) -->

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

	<h2 class="page-title-2depths">고유목적사업준비금조정명세서(갑)</h2>
		
	<div class="table-top-control">
		<span>[별지 제27호 서식(갑)]</span>
		<span style="float:right;">(금액단위 : 천원)</span>
	</div>

	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<th colspan="7" class="t-left">1. 손금산입액 조정</th>
         		</tr> 
			<% 	Box rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61","","", uSesEnt.dbo); 
				Long amt_61 = rbox.getLong("cur_acum"); // 이자수익+대부이자수익
				
					rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","74001","","", uSesEnt.dbo);  
				Long amt_74001 = rbox.getLong("cur_acum"); // 고유목적사업준비금전입액
				
					rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","7300802","","", uSesEnt.dbo);  
				Long amt_7300902 = rbox.getLong("cur_acum"); // 지정기부금 
				
				Long cell_01 = 0L;
				Long cell_02 = amt_74001;
				Long cell_03 = amt_7300902;
				Long cell_04 = cell_01 + cell_02 + cell_03;
				Long cell_05 = amt_61;
				Long cell_06 = 0L;
				Long cell_07 = amt_7300902;
				Long cell_08 = cell_04 - cell_05 - cell_06 - cell_07;
				if(cell_08 < 0) { cell_08 = 0L; }
				
				Long cell_10 = (long)(cell_05 + cell_08 * 0.5);
				Long cell_11 = cell_02;
				Long cell_12 = cell_11 - cell_10; 
			%>
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
					   +  "<cell_01>"+FormatUtil.insertComma(String.valueOf(cell_01))+"</cell_01>\n"
					   +  "<cell_02>"+FormatUtil.insertComma(String.valueOf(cell_02))+"</cell_02>\n"
					   +  "<cell_03>"+FormatUtil.insertComma(String.valueOf(cell_03))+"</cell_03>\n"
					   +  "<cell_04>"+FormatUtil.insertComma(String.valueOf(cell_04))+"</cell_04>\n"
					   +  "<cell_05>"+FormatUtil.insertComma(String.valueOf(cell_05))+"</cell_05>\n"
					   +  "<cell_06>"+FormatUtil.insertComma(String.valueOf(cell_06))+"</cell_06>\n"
					   +  "<cell_07>"+FormatUtil.insertComma(String.valueOf(cell_07))+"</cell_07>\n"
					   +  "<cell_08>"+FormatUtil.insertComma(String.valueOf(cell_08))+"</cell_08>\n"
					   +  "<cell_10>"+FormatUtil.insertComma(String.valueOf(cell_10))+"</cell_10>\n"
					   +  "<cell_12>"+FormatUtil.insertComma(String.valueOf(cell_12))+"</cell_12>\n"; 
			%>
			<tr>
				<td class="td-head" width="14.2%"><a title="법인세 과세표준 및 세액조정계산서(별지 제3호서식)의 란의 차가감소득금액을 적습니다. 다만, 해당 서식  익금산입란 및  손금산입란에 고유목적사업준비금 중 손금부인된 금액 및 5년 내 미사용하여 익금에 산입한 금액이 포함되어 있는 경우에는 란의 차가감소득금액에 손금부인된 금액과 5년 내 미사용하여 익금에 산입한 금액을 더하거나 빼고 적습니다.">①소득금액</a></td>
				<td class="td-head" width="14.2%"><a title="직전 사업연도 종료일 현재의 고유목적사업준비금의 잔액을 초과하여 해당 사업연도의 고유목적사업 등에 지출한 금액이 있는 경우 그 금액을 포함하여 적습니다.">②당기 계상<br>고유목적사업 준비금</a></td>
				<td class="td-head" width="14.2%">③법인세법  제24조 2항에 따른 기부금</td>
				<td class="td-head" width="14.2%">④해당 사업연도<br>소득금액 (①+②+③)</td>
				<td class="td-head" width="14.2%">⑤「법인세법」 제29조제1항제1호부터<br>제3호까지에 따른 금액</td>
				<td class="td-head" width="14.2%">⑥－1「법인세법」<br>제13조제1호에<br>따른결손금</td>
				<td class="td-head" width="14.2%">⑥－2「법인세법」<br>제29조 제1항 제4호에 따른 수익사업에서<br>발생한 결손금</td>
         		</tr> 
			<tr class="t-center">
				<td><%=FormatUtil.insertComma(String.valueOf(cell_01))%></td>
				<td><%=FormatUtil.insertComma(String.valueOf(cell_02))%></td>
				<td><%=FormatUtil.insertComma(String.valueOf(cell_03))%></td>
				<td><%=FormatUtil.insertComma(String.valueOf(cell_04))%></td>
				<td><%=FormatUtil.insertComma(String.valueOf(cell_05))%></td>
				<td><%=FormatUtil.insertComma(String.valueOf(cell_06))%></td>
				<td>0</td>
			</tr>
			<tr>
				<td class="td-head">⑦법인세법 제24조제2항에 따른 기부금</td>
				<td class="td-head">⑧조세특례제한법<br>제121조의23 및<br>제121조의 25에<br>따른 금액</td>
				<td class="td-head">⑨수익사업 소득금액<br>(④－⑤－(⑥－1)－⑦－⑧)</td>
				<td class="td-head"><a title="일반 비영리내국법인은 50/100(「공익법인의 설립·운영에 관한 법률」에 따라 설립된 법인으로서 고유목적사업 등에 대한 지출액 중 50/100 이상의 금액을 장학금으로 지출하는 법인의 경우에는 80/100)을, 「조세특례제한법」 제74조 제1항 또는 제4항을 적용받는 법인은 100/100 또는 80/100을,「조세특례제한법」 제121조의23제3항을 적용받는 법인은 50/100을 적습니다.">⑩손금산입률</a></td>
				<td class="td-head">⑪손금산입한도액<br>(⑤＋⑧＋⑨×⑩)또는(⑤＋⑧－(⑥－2))</td>
				<td class="td-head" colspan="2">⑫손금부인액<br>((②－⑪)>0)</td>
			</tr>
			<tr class="t-center">
				<td><%=FormatUtil.insertComma(String.valueOf(cell_07))%></td>
				<td>0</td>
				<td><%=FormatUtil.insertComma(String.valueOf(cell_08))%></td>
				<td><%=uSesEnt.dbo.equals("SABOK03")?"100":"50"%>(80,100)<br>-----------<br>100</td>
				<td><%=FormatUtil.insertComma(String.valueOf(cell_10))%></td>
				<td colspan="2"><%=FormatUtil.insertComma(String.valueOf(cell_12))%></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB0">
			<tr>
				<th colspan="7" class="t-left">2. 고유목적사업준비금 명세서</th>
         		</tr> 
			<tr>
				<td class="td-head" rowspan="2" width="13.5%">⑬사업연도</td>
				<td class="td-head" rowspan="2" width="13.5%"><a title="해당 사업연도종료일 전 5사업연도에 세법상 손금산입된 고유목적사업준비금을 손금산입 사업연도 순차로 적되, 각 사업연도별로(②-⑫)의 금액을 적습니다.">⑭손금산입액</a></td>
				<td class="td-head" rowspan="2" width="15.5%"><a title="직전 사업연도까지 고유목적사업에 실제 지출한 금액을 적으며, 먼저 손금에 계상한 사업연도의 준비금부터 순차로 사용한 것으로 보아 적습니다.">⑮직전 사업연도까지 고유목적사업지출액</a></td>
				<td class="td-head" rowspan="2" width="*">(16)해당 사업연도고유목적사업지출액</td>
				<td class="td-head" rowspan="2" width="13.5%">(17)익금산입액</td>
				<td class="td-head" colspan="2">(18)잔액<br>⑭－⑮－(16)-(17)</td>
         		</tr> 
			<tr>
				<td class="td-head" width="16.5%">(19)5년이내분</td>
				<td class="td-head"width="16.5%"><a title="5년 경과분란의 익금산입액에 대해서는 추가납부세액계산서(별지 제8호서식 부표6)에 따라 「법인세법」 제29조제5항 및 같은 법 시행령 제56조제7항에 따라 계산한 이자상당가산액을 법인세에 가산하여 납부해야 합니다.">(20)5년경과분</a></td>
         		</tr> 
		<% Long cell[][] = {{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L},{0L,0L,0L,0L,0L}};  
		   // 최근 5개년 손금산입액 및 고유목적사업지출액 구하기	
		   int start_yy = box.getInt("std_yy")-4;
		   long tot_cost = 0L;
		   Long cur_cost = 0L;
		   for(int i=0; i < 5; i++) {
			   	// ⑭ 손금산입액 : 고유목적사업준비금전입액
			 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",String.valueOf(start_yy+i)+"12","","74001","","", uSesEnt.dbo); 
				cell[i][0] = rbox.getLong("cur_acum");
				
			   	// 고유목적사업지출액 : 고유목적사업비 수입대체금액
				rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",String.valueOf(start_yy+i)+"12","00","2200801","","", uSesEnt.dbo); 
				//cell[i][1] = rbox.getLong("cha_amt");
				tot_cost += rbox.getLong("cha_amt");
				if(i == 4) { cur_cost = rbox.getLong("cha_amt"); }	// 당해년도 고유목적사업지출액
			}

			// 당해년도 고유목적사업지출액을 먼저 손금에 계상한 사업연도의 준비금부터 순차로 차감
			for(int i=0; i < 5; i++) {
				if(tot_cost > cell[i][0]) {
					cell[i][1] = cell[i][0];
				}else {
					cell[i][1] = tot_cost;
				}
				tot_cost -= cell[i][0];
//				out.println("tot_cost === " + tot_cost);
			}

			for(int i=4; i >= 0; i--) {
				if(cur_cost >= cell[i][1]) {
					cell[i][2] = cell[i][1];
					cell[i][1] = 0L;
					cur_cost -= cell[i][2];
				}else {
					cell[i][2] = cur_cost;
					cell[i][1] -= cur_cost;
					break;
				}
			}

			// 잔액
			for(int i=0; i < 5; i++) {
				if(i == 0) { // 5년 경과분
					cell[i][4] = cell[i][0] - cell[i][1] - cell[i][2];
					cell[i][4] = cell[i][4] < 0 ? 0 : cell[i][4];
				}else { // 5년 이내분
					cell[i][3] = cell[i][0] - cell[i][1] - cell[i][2];
					cell[i][3] = cell[i][3] < 0 ? 0 : cell[i][3];
				}
			}

			// 합계
			for(int i=0; i < 5; i++) {
				cell[5][0] += cell[i][0];
				cell[5][1] += cell[i][1];
				cell[5][2] += cell[i][2];
				cell[5][3] += cell[i][3];
				cell[5][4] += cell[i][4];
			}
		%>
		<% for(int i=0; i < 4; i++) { %>
			<tr> 
				<%	xmlBuf += "<LIST>\n"
						   +  "	<cell_13>"+String.valueOf(start_yy+i)+"</cell_13>\n"
						   +  "	<cell_14>"+FormatUtil.insertComma(String.valueOf(cell[i][0]))+"</cell_14>\n" 
						   +  "	<cell_15>"+FormatUtil.insertComma(String.valueOf(cell[i][1]))+"</cell_15>\n"
						   +  "	<cell_16>"+FormatUtil.insertComma(String.valueOf(cell[i][2]))+"</cell_16>\n" 
						   +  "	<cell_19>"+FormatUtil.insertComma(String.valueOf(cell[i][3]))+"</cell_19>\n" 
						   +  "	<cell_20>"+FormatUtil.insertComma(String.valueOf(cell[i][4]))+"</cell_20>\n" 
						   +  "</LIST>\n";
				%>
				<td class="t-center"><%=String.valueOf(start_yy+i)%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[i][0]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[i][1]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[i][2]))%></td>
				<td class="t-right"></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[i][3]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[i][4]))%></td>
			</tr>	
		<% } %>
		<% for(int i=0; i < 5; i++) { %>
			<tr>
				<td class="t-center"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
				<td class="t-right"></td>
			</tr>
		<% } %>
			<tr>
				<%	xmlBuf += "<cell_40>"+FormatUtil.insertComma(String.valueOf(cell[4][0]))+"</cell_40>\n"
						   +  "<cell_41>"+FormatUtil.insertComma(String.valueOf(cell[4][1]))+"</cell_41>\n"
						   +  "<cell_42>"+FormatUtil.insertComma(String.valueOf(cell[4][2]))+"</cell_42>\n"
						   +  "<cell_43>"+FormatUtil.insertComma(String.valueOf(cell[4][3]))+"</cell_43>\n"
						   +  "<cell_44>"+FormatUtil.insertComma(String.valueOf(cell[4][4]))+"</cell_44>\n"
						   +  "<cell_50>"+FormatUtil.insertComma(String.valueOf(cell[5][0]))+"</cell_50>\n"
						   +  "<cell_51>"+FormatUtil.insertComma(String.valueOf(cell[5][1]))+"</cell_51>\n"
						   +  "<cell_52>"+FormatUtil.insertComma(String.valueOf(cell[5][2]))+"</cell_52>\n"
						   +  "<cell_53>"+FormatUtil.insertComma(String.valueOf(cell[5][3]))+"</cell_53>\n"
						   +  "<cell_54>"+FormatUtil.insertComma(String.valueOf(cell[5][4]))+"</cell_54>\n"; 
				%>
				<td class="t-center">(당기)</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[4][0]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[4][1]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[4][2]))%></td>
				<td class="t-right"></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[4][3]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[4][4]))%></td>
			</tr>
			<tr>
				<td class="t-center">계</td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[5][0]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[5][1]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[5][2]))%></td>
				<td class="t-right"></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[5][3]))%></td>
				<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(cell[5][4]))%></td>
			</tr>
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>