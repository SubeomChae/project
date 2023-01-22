<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>시스템도입현황 - 거래내역</title>
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script language="javascript">
	function goSave() {
		if (formValidate("#mian")) {
			if(confirm('저장하시겠습니까?')) {					
				removeMask("#main");				
				document.main.action = 'adm96003_update.do';
				document.main.target = '_parent';				
				document.main.submit();
			}
		}
	}
		
	function goCancel() {
		removeMask(document.main);
		document.main.action = 'adm96002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function change_amt_class(){
		if(document.main.amt_class.value == '도입비'){
			document.getElementById("divProgArea1").style.display = '';
			document.getElementById("divProgArea2").style.display = '';
			document.getElementById("divProgArea3").style.display = '';
			document.getElementById("divProgArea4").style.display = '';
			document.getElementById("divregularArea").style.display = 'none';
		} else {
			document.getElementById("divProgArea1").style.display = 'none';
			document.getElementById("divProgArea2").style.display = 'none';
			document.getElementById("divProgArea3").style.display = 'none';
			document.getElementById("divProgArea4").style.display = 'none';
			document.getElementById("divregularArea").style.display = '';
		}
	}
	
	function page_init () {
		change_amt_class();
	}
</script>

<form name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="corp_cd"     value="<%=obox.get("corp_cd")%>">
<input type="hidden" name="prof_cd" 	value="<%=obox.get("prof_cd")%>">
<input type="hidden" name="action_type" value="<%=obox.get("prof_cd").equals("")?"INSERT":"UPDATE"%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100%" valign="top">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table02">
				<tr height="28">
					<td colspan="2" width="20%" class="table01_title">구분</td>
					<td width="30%" style="padding-left:5px">
						<select name="amt_class" title="구분" style="width:100px" class="required" onChange="change_amt_class();">
							<option value=''>선택</option>
							<option value='도입비'		<%=obox.get("amt_class").equals("도입비")?"selected":"" %>>도입비</option>
							<option value='유지보수비'	<%=obox.get("amt_class").equals("도입비")?"":"selected" %>>유지보수비</option>
						</select>
					</td>
					<td width="15%" class="table01_title">상태</td>
					<td width="35%" style="padding-left:5px">
						<select name="sign_status" title="상태" style="width:100px" class="required">
							<option value=''>선택</option>
							<option value='세금계산서발행' <%=obox.get("sign_status").equals("세금계산서발행")?"selected":"" %>>세금계산서발행</option>
							<option value='입금완료' <%=obox.get("sign_status").equals("입금완료")?"selected":"" %>>입금완료</option>							
						</select>
					</td>
				</tr>		
				<tr height="28">
					<td colspan="2" class="table01_title">계산서일자</td>
					<td style="padding-left:5px"><input type="text" name="apply_ymd" value="<%=obox.get("apply_ymd")%>" size="10" maxlength="8" title="계산서일자" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.apply_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a></td>
					<td class="table01_title">입금일자</td>
					<td style="padding-left:5px"><input type="text" name="acct_ymd" value="<%=obox.get("acct_ymd")%>" size="10" maxlength="8" title="입금일자" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.acct_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a></td>
				</tr>
				<tr height="28" id="divProgArea1" style="display:none">
					<td rowspan="4" class="table01_title">청구금액</td>
					<td class="table01_title">구축비</td>
					<td style="padding-left:5px"><input type="text" name="corp_class_amt" value="<%=obox.get("corp_class_amt")%>" size="15" title="구축비" class="tMONEY" style="border:1 solid gray" onChange="change_total_amt()"> 원</td>
					<td class="table01_title">대부사업</td>
					<td style="padding-left:5px"><input type="text" name="loan_amt" value="<%=obox.get("loan_amt")%>" size="15" title="대부사업" class="tMONEY" style="border:1 solid gray" onChange="change_total_amt()"> 원</td>
				</tr>
				<tr height="28" id="divProgArea2" style="display:none">
					<td class="table01_title">프로그램 설치비</td>
					<td style="padding-left:5px"><input type="text" name="server_type_amt" value="<%=obox.get("server_type_amt")%>" size="15" title="프로그램 설치비" class="tMONEY" style="border:1 solid gray" onChange="change_total_amt()"> 원</td>
					<td class="table01_title">출장비</td>
					<td style="padding-left:5px"><input type="text" name="distant_amt" value="<%=obox.get("distant_amt")%>" size="15" title="출장비" class="tMONEY" style="border:1 solid gray" onChange="change_total_amt()"> 원</td>
				</tr>
				<tr height="28" id="divProgArea3" style="display:none">
					<td class="table01_title">기간시스템연계</td>
					<td style="padding-left:5px"><input type="text" name="lnk_amt" value="<%=obox.get("lnk_amt")%>" size="15" title="기간시스템연계" class="tMONEY" style="border:1 solid gray" onChange="change_total_amt()"> 원</td>
					<td class="table01_title">전표이관</td>
					<td style="padding-left:5px"><input type="text" name="slip_year_amt" value="<%=obox.get("slip_year_amt")%>" size="15" title="전표이관" class="tMONEY" style="border:1 solid gray" onChange="change_total_amt()"> 원</td>
				</tr>
				<tr height="28" id="divProgArea4" style="display:none">
					<td class="table01_title">커스터마이징</td>
					<td style="padding-left:5px"><input type="text" name="cust_content_amt" value="<%=obox.get("cust_content_amt")%>" size="15" title="커스터마이징" class="tMONEY" style="border:1 solid gray" onChange="change_total_amt()"> 원</td>
					<td class="table01_title">합계</td>
					<td style="padding-left:5px"><input type="text" name="total_amt" value="<%=obox.get("total_amt")%>" size="15" title="도입비" class="tMONEY" style="border:1 solid gray"> 원</td>
				</tr>					
				<tr height="28" id="divregularArea" style="display:none">				
					<td colspan="2" class="table01_title">유지보수비</td>
					<td colspan="3" style="padding-left:5px">
						<select name="regular_pay_cycle" title="유지보수단위" style="width:50px">
							<option value="M" <%=obox.get("regular_pay_cycle").equals("M")?"selected":""%>>월</option>
							<option value="B" <%=obox.get("regular_pay_cycle").equals("B")?"selected":""%>>분기</option>
							<option value="Y" <%=obox.get("regular_pay_cycle").equals("Y")?"selected":""%>>년간</option>
						</select>
						<input type="text" name="regular_pay_amt" value="<%=obox.get("regular_pay_amt")%>" size="15" title="유지보수비" class="tMONEY" style="border:1 solid gray"> 원
					</td>
				</tr>
				<tr height="28">
					<td colspan="2" class="table01_title">특이사항</td>
					<td colspan="3" style="padding:5 5 5 5"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" title="비고" style="border:1 solide gray; width:100%;"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right" style="padding-top:5px">
			<a href="javascript:goSave();"><img id="btnUpdate" src="/com/img/bn_save.gif" border="0" align="absmiddle"></a>
		<% if(!box.get("prof_cd").equals("")) { %>
			<a href="javascript:goCancel();"><img id="btnCancel" src="/com/img/bn_cancel.gif" border="0" align="absmiddle"></a>
		<% } %>
 		</td>
	</tr>
</table>		
</form>