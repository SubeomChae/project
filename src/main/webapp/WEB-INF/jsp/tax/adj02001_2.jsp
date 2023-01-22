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

<!--[별지 제43호 서식] 법인세지방소득세 과세표준 및 세액신고서  -->

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
	
	<h2 class="page-title-2depths">법인세지방소득세 과세표준 및 세액신고서</h2>
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제43호 서식]</span>
	</div>

	<div id="divListData" class="contentsRow">
		<table class="table table-bordered order-column table-cover marB10">
				<%	xmlBuf += "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
						   +  "<corp_reg_no>"+FormatUtil.juminNo(obox.get("corp_reg_no"))+"</corp_reg_no>\n"
						   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
						   +  "<tel_no>"+obox.get("tel_no")+"</tel_no>\n"
						   +  "<rep_person_nm>"+obox.get("rep_person_nm")+"</rep_person_nm>\n"
						   +  "<email_id>"+obox.get("email_id")+"</email_id>\n"
						   +  "<addr>"+obox.get("addr")+"</addr>\n"
						   +  "<uptae>"+obox.get("uptae")+"</uptae>\n"
						   +  "<upjong>"+obox.get("upjong")+"</upjong>\n"
						   +  "<saup_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+" ~ "+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</saup_ymd>\n"
						   +  "<report_ymd>"+DateUtil.addDate(obox.get("tax_report_ymd"),-1,"yyyy-MM-dd","D")+"</report_ymd>\n"
						   +  "<tax_report_ymd>"+obox.get("tax_report_ymd",Box.DEF_DATE_FMT)+"</tax_report_ymd>\n"
						   +  "<empl_cnt>"+obox.get("empl_cnt")+"</empl_cnt>\n";
				%>
			<tr>
				<td colspan="2" width="15%" class="t-left">①사업자등록번호</td>
				<td colspan="4" width="35%" class="t-left"><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
				<td width="15%" class="t-left">②법인등록번호</td>
				<td colspan="3" width="35%" class="t-left"><%=FormatUtil.juminNo(obox.get("corp_reg_no"))%></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">③법인명</td>
				<td colspan="4" class="t-left"><%=obox.get("corp_nm")%></td>
				<td class="t-left">④전화번호</td>
				<td colspan="3" class="t-left"><%=obox.get("tel_no")%></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">⑤대표자성명</td>
				<td colspan="4" class="t-left"><%=obox.get("rep_person_nm")%></td>
				<td class="t-left">⑥전자우편주소</td>
				<td colspan="3" class="t-left"><%=obox.get("email_id")%></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">⑦소재지</td>
				<td colspan="8" class="t-left"><%=obox.get("addr")%></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">⑧업태</td>
				<td colspan="2" width="22%" class="t-left"><%=obox.get("uptae")%></td>
				<td colspan="2" width="13%" class="t-left">⑨종목</td>
				<td width="15%" class="t-left"><%=obox.get("upjong")%></td>
				<td width="13%" class="t-left">⑩주업종코드</td>
				<td colspan="2" width="22%"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">⑪사업연도</td>
				<td colspan="4" class="t-center"><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
				<td class="t-left">⑫수시부과기간</td>
				<td colspan="3"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td colspan="2" width="15%" class="t-left">⑬법인구분</td>
				<td colspan="6" width="35%" class="t-left"><b><u>1.내국</u></b>&nbsp;&nbsp;2.외국&nbsp;&nbsp;3.외투(비율<%=StringUtil.strLooping("&nbsp;",5)%>%)</td>
				<td width="15%" class="t-left">⑭조정구분</td>
				<td colspan="3" width="35%" class="t-left">1.외부&nbsp;&nbsp;<b><u>2.자기</u></b></td>
			</tr>
			<tr>
				<td rowspan="2" colspan="2" class="t-left">⑮종류별구분</td>
				<td rowspan="2" width="8%" class="t-center">중소기업</td>
				<td colspan="3" class="t-center">일반</td>
				<td rowspan="2" colspan="2" width="7%" class="t-center">당기순이익<br>과세</td>
				<td rowspan="2" class="t-left">(16)외부감사대상</td>
				<td colspan="3" rowspan="2" class="t-left">1.여 &nbsp;&nbsp;<b><u>2.부</u></b></td>
			</tr>
			<tr>
				<td width="7%" class="t-center">중견<br>기업</td>
				<td width="9%" class="t-center">상호출자<br>제한기업</td>
				<td width="7%" class="t-center">그외<br>기업</td>
			</tr>							
			<tr>
				<td rowspan="3" width="5%" class="t-center">영리<br>법인</td>
				<td width="10%" class="t-center">상장법인</td>
				<td class="t-center">11</td>
				<td class="t-center">71</td>
				<td class="t-center">81</td>
				<td class="t-center">91</td>
				<td colspan="2" bgcolor="f6f6f6"></td>
				<td rowspan="5" class="t-left">(17)신고구분</td>
				<td colspan="3" class="t-left"><b><u>1.정기신고</u></b></td>
			</tr>
			<tr>
				<td style="width:12%" class="t-center">코스닥상장법인</td>
				<td class="t-center">21</td>
				<td class="t-center">72</td>
				<td class="t-center">82</td>
				<td class="t-center">92</td>
				<td colspan="2" bgcolor="f6f6f6"></td>
				<td colspan="3" class="t-left">2.수정신고(가.서면분석, 나.기타)</td>
			</tr>
			<tr>
				<td class="t-center">기타법인</td>
				<td class="t-center">30</td>
				<td class="t-center">73</td>
				<td class="t-center">83</td>
				<td class="t-center">93</td>
				<td colspan="2" bgcolor="f6f6f6"></td>
				<td colspan="3" class="t-left">3.기한후 신고</td>
			</tr>
			<tr>
				<td rowspan="2" colspan="2" class="t-center">비영리법인</td>
				<td rowspan="2" class="t-center">60</td>
				<td rowspan="2" class="t-center">74</td>
				<td rowspan="2" class="t-center">84</td>
				<td rowspan="2" class="t-center"><b><u>94</u></b></td>
				<td rowspan="2" colspan="2" class="t-center">50</td>
				<td colspan="3" class="t-left">4.중도폐업 신고</td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">5.경정청구</td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(18)법인유형별구분</td>
				<td colspan="3"></td>
				<td width="6%" class="t-center">코드</td>
				<td colspan="2" width="7%" class="t-center"></td>
				<td class="t-left">(19)결산확정일</td>
				<td colspan="3" class="t-center"><%=DateUtil.addDate(obox.get("tax_report_ymd"),-1,"yyyy-MM-dd","D")%></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(20)신고일</td>
				<td colspan="6" class="t-center"><%=obox.get("tax_report_ymd",Box.DEF_DATE_FMT)%></td>
				<td class="t-left" class="t-left">(21)납부일</td>
				<td colspan="3" bgcolor="f6f6f6"></td>
			</tr>
			<tr>
				<td colspan="2" class="t-left">(22)신고기한연장승인</td>
				<td colspan="3" class="t-left">1. 신청일</td>
				<td colspan="3"></td>
				<td class="t-left" class="t-left">2. 연장기한</td>
				<td colspan="3"></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td colspan="4" width="37%" class="t-center">구분</td>
				<td width="6%" class="t-center">여</td>
				<td width="7%" class="t-center">부</td>
				<td colspan="2" width="37%" class="t-center">구분</td>
				<td width="6%" class="t-center">여</td>
				<td width="7%" class="t-center">부</td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">(23)주식변동</td>
				<td class="t-center">1</td>
				<td class="t-center"><b><u>2</u></b></td>
				<td colspan="2" class="t-left">(24)장부전산화</td>
				<td class="t-center"><b><u>1</u></b></td>
				<td class="t-center">2</td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">(25)사업연도의제</td>
				<td class="t-center">1</td>
				<td class="t-center"><b><u>2</u></b></td>
				<td colspan="2" class="t-left">(26)결손금소급공제 법인세환급신청</td>
				<td class="t-center">1</td>
				<td class="t-center"><b><u>2</u></b></td>
			</tr>
			<tr>
				<td colspan="4" class="t-left">(27)동업기업의 출자자(동업자)</td>
				<td class="t-center">1</td>
				<td class="t-center">2</td>
				<td colspan="2" class="t-left">(28)미환류소득에 대한 법인지방소득세 신고</td>
				<td class="t-center">1</td>
				<td class="t-center">2</td>
			</tr>
		</table>

		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td rowspan="2" colspan="3" width="20%" class="t-center">구분</td>
				<td colspan="7" width="80%" class="t-center">법인지방소득세</td>
			</tr>
			<tr>
				<td colspan="2" width="20%" class="t-center">각 사업연도 소득세에 대한<br>법인지방소득세</td>
				<td colspan="2" width="20%" class="t-center">토지 등 양도소득에 대한 <br>법인지방소득세</td>
				<td colspan="2" width="20%" class="t-center">미환류소득에 대한 <br>법인지방소득세</td>
				<td colspan="1" width="20%" class="t-center">계</td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61001","","",uSesEnt.dbo);
				Long amt_61001 = rbox.getLong("cur_acum"); // 이자수익

				rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","61002","","",uSesEnt.dbo);
				Long amt_61002 = rbox.getLong("cur_acum"); // 대부이자수익  %>

			<%	xmlBuf += "<amt_6>"+FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))+"</amt_6>\n"; %>
			<tr>
				<td colspan="3" class="t-left">(28)수입금액</td>
				<td colspan="6" class="t-center">(<%=FormatUtil.insertComma(String.valueOf(amt_61001+amt_61002))%>)</td>
				<td colspan="1" class="t-center" bgcolor="f6f6f6"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(29)과세표준</td>
				<td colspan="2" class="t-center">0</td>
				<td colspan="2" class="t-center"></td>
				<td colspan="2" class="t-center"></td>
				<td colspan="1" class="t-center" bgcolor="f6f6f6"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(30)표준산출세액</td>
				<td colspan="2" class="t-center">0</td>
				<td colspan="2" class="t-center"></td>
				<td colspan="2" class="t-center"></td>
				<td colspan="1" class="t-center"></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(31)총부담세액</td>
				<td colspan="2" class="t-center">0</td>
				<td colspan="2" class="t-center"></td>
				<td colspan="2" class="t-center"></td>
				<td colspan="1" class="t-center"></td>
			</tr>
			<% 	rbox = CodeUtil.getRsBox("PR_ACC_TAX_REPORT","LIST002",box.get("std_yy")+"12","","1110902","","",uSesEnt.dbo);
				Long amt_1111202 = rbox.getLong("cur_acum"); // 기납부세액(선급지방소득세) %>
			<%	xmlBuf += "<amt_1111202>"+FormatUtil.insertComma(String.valueOf(amt_1111202))+"</amt_1111202>\n"
					   +  "<amt_1111202_min>"+FormatUtil.insertComma(String.valueOf(amt_1111202*-1))+"</amt_1111202_min>\n"; %>
			<tr>
				<td colspan="3" class="t-left">(32)기납부세액</td>
				<td colspan="2" class="t-center"><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
				<td colspan="2" class="t-center"></td>
				<td colspan="2" class="t-center"></td>
				<td colspan="1" class="t-center"><%=FormatUtil.insertComma(String.valueOf(amt_1111202))%></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">(33)차감납부할세액</td>
				<td colspan="2" class="t-center"><%=FormatUtil.insertComma(String.valueOf(amt_1111202*-1))%></td>
				<td colspan="2" class="t-center"></td>
				<td colspan="2" class="t-center"></td>
				<td colspan="1" class="t-center"><%=FormatUtil.insertComma(String.valueOf(amt_1111202*-1))%></td>
			</tr>
		</table>
		
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td colspan="3" width="15%" class="t-left">(35)본점/지점</td>
				<td colspan="9" width="45%" class="t-left"><b><u>1.단일사업장</u></b>  2.지점 있는 법인의 본점  3.지점 </td>
				<td colspan="5" width="25%" class="t-left">(36)특ㆍ광역시 주사업장 여부</td>
				<td colspan="3" width="15%" class="t-center">1.여    <b><u>2.부</u></b></td>
			</tr>
			<tr>
				<td colspan="3" width="15%" class="t-left">(37)해당사업장</td>
				<td colspan="1" width="5%" class="t-center">명칭</td>
				<td colspan="4" width="20%" class="t-left"><%=obox.get("corp_nm")%></td>
				<td colspan="1" width="6%" class="t-center">소재지</td>
				<td colspan="7" width="35%" class="t-left"><%=obox.get("addr")%></td>
				<td colspan="1" width="6%" class="t-center">연락처</td>
				<td colspan="3" width="15%" class="t-center"><%=obox.get("tel_no")%></td>
			</tr>
			<tr>
				<td colspan="20" class="t-left">(38)안분율의 계산</td>
			</tr>
			<tr>
				<td rowspan="2" colspan="3" width="15%" class="t-center">구분</td>
				<td rowspan="2" colspan="2" width="10%" class="t-center">종업원 수<br>(명)</td>
				<td colspan="12" class="t-center" width="60%">건축물 연면적(㎡)</td>
				<td rowspan="2" colspan="3" width="15%" class="t-center">안분율(%)<br>(소수점6자리)</td>
			</tr>
			<tr>
				<td width="15%" colspan="3" class="t-center">계</td>
				<td width="15%" colspan="3" class="t-center">건물</td>
				<td width="15%" colspan="3" class="t-center">기계장치</td>
				<td width="15%" colspan="3" class="t-center">시설물</td>
			</tr>
			<tr>
				<td colspan="3" class="t-center">법인전체</td>
				<td colspan="2" class="t-center"><%=obox.get("empl_cnt")%></td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">100</td>
			</tr>
			<tr>
				<td colspan="3" class="t-center">시군구내</td>
				<td colspan="2" class="t-center"><%=obox.get("empl_cnt")%></td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">0</td>
				<td colspan="3" class="t-center">100</td>
			</tr>
			<tr>
				<td colspan="3" class="t-center">비율(%)</td>
				<td colspan="2" class="t-center">100</td>
				<td colspan="3" class="t-center">100</td>
				<td colspan="3" class="t-center">100</td>
				<td colspan="3" class="t-center">100</td>
				<td colspan="3" class="t-center">100</td>
				<td colspan="3" class="t-center">100</td>
			</tr>
		</table>
			
		<table class="table table-bordered order-column table-cover marB10">
			<tr>
				<td colspan="5" class="t-left">(39)납세지별 세액산출</td>
				<td colspan="6" width="30%"></td>
				<td colspan="5" width="25%" class="t-left">(40)납세지별 세액공제ㆍ감면액</td>
				<td colspan="4" width="20%" class="t-center"></td>
			</tr>
			<tr>
				<td colspan="5" width="25%" class="t-left">(41)납세지별 가산세액</td>
				<td colspan="6" width="30%"></td>
				<td colspan="5" width="25%" class="t-left">(42)납세지별 감면분 추가납부세액</td>
				<td colspan="4" width="20%"></td>
			</tr>
			<tr>
				<td rowspan="2" colspan="2" class="t-center">합계</td>
				<td rowspan="2" colspan="2" class="t-center">무(과소)<br>신고</td>
				<td rowspan="2" colspan="2" class="t-center">납부(환급)<br>불성실</td>
				<td rowspan="2" colspan="2" class="t-center">지방세법<br>제103조의30에<br>따른 가산세</td>
				<td rowspan="2" colspan="2" class="t-center">동업기업<br>가산세<br>배분액</td>
				<td rowspan="2" colspan="1"  class="t-center">기타</td>
				<td rowspan="2" colspan="2" class="t-center">(43)납세지별<br>기납부세액</td>
				<td colspan="3" width="15%" class="t-left">특별징수납부세액</td>
				<td colspan="4" width="20%"></td>
			</tr>
			<tr>
				<td colspan="3" width="15%" class="t-left">수시부과세액 및<br>예정신고납부세액</td>
				<td colspan="4" width="20%"></td>
			</tr>
			<tr>
				<td colspan="2" width="10%" class="t-center"></td>
				<td colspan="2" width="10%" class="t-center"></td>
				<td colspan="2" width="10%" class="t-center"></td>
				<td colspan="2" width="10%" class="t-center"></td>
				<td colspan="2" width="10%" class="t-center"></td>
				<td colspan="1" width="5%"  class="t-center"></td>
				<td colspan="5" width="25%" class="t-left">(44)경정ㆍ수정신고 등 가감액</td>
				<td colspan="4" width="20%"></td>
			</tr>
			<tr>
				<td colspan="11" width="55%" class="t-left">(45)탄력세율적용 조정세액</td>
				<td colspan="5" width="25%" class="t-left">(46)당해 납세지에 납부할 세액</td>
				<td colspan="4" width="20%"></td>
			</tr>
		</table>
			
		<table class="table table-bordered order-column table-cover marB0">
			<%	xmlBuf += "<bank_nm>"+obox.get("bank_nm")+"</bank_nm>\n"
					   +  "<account_no>"+obox.get("account_no")+"</account_no>\n"
					   +  "<today_ymd>"+StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)+"년 "+StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)+"월 "+StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)+"일"+"</today_ymd>\n" 
					   +  "<tax_office>"+obox.get("tax_office")+"</tax_office>\n"; 
			%>
			<tr>
				<td rowspan="3" width="20%" class="t-center">환급금 계좌<br>(환급세액을 계좌로<br>받는 경우)</td>
				<td width="25%" class="t-left">(47)금융기관명</td>
				<td class="t-center"><%=obox.get("bank_nm")%></td>
			</tr>
			<tr>
				<td width="25%" class="t-left">(48)예금주</td>
				<td class="t-center"><%=obox.get("corp_nm")%></td>
			</tr>
			<tr>
				<td width="25%" class="t-left">(49)계좌번호</td>
				<td class="t-center"><%=obox.get("account_no")%></td>
			</tr>
			<tr>
				<td colspan="3" class="t-left">
					신고인은 「지방세법」 제 103조의 23, 제 103조의 24 및 「지방세기본법」 제50조, 제51조, 제52조에 따라 위의 내용을 신고하며, 위 내용을 충분히 검토하였고 신고인이 알고 있는 사실 그대로를 정확하게 기재하였음을 확인합니다.
					<br>
					<span class="f-right">
						<%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),0,4)%>년
						<%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),4,6)%>월
						<%=StringUtil.substr(DateUtil.toString("yyyyMMdd"),6)%>일
					</span>
					<br>
					<%=StringUtil.strLooping("&nbsp;",90)%>신고인(법 인) &nbsp;&nbsp;<%=StringUtil.strLooping("&nbsp;",10)%>( 인 )
					<br>
					<%=StringUtil.strLooping("&nbsp;",90)%>신고인(대표자) &nbsp;&nbsp;<%=obox.get("rep_person_nm")%> (서명)
				</td>
				</tr> 							
			<tr>
				<td colspan="3" align="left" style="padding-left:5px" class="t-left"><%=obox.get("tax_office")%> 시장ㆍ군수ㆍ구청장 귀하</td>
			</tr> 
		</table>
	</div>
	<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>