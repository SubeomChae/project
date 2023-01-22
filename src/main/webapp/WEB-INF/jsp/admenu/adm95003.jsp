<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeHelper.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "tel_no|hp_no|","","","","","",request); %>

<title>시스템도입현황</title>

<script language="javascript">
	function goSave() {
		if (formValidate("#main")) {		
			if(confirm('저장하시겠습니까?')) {
				removeMask(document.main);
				document.main.action = 'adm95003_update.do';
				document.main.target = '_parent';
				document.main.submit();
			}		
		}
	}
	
	function goCancel() {
		removeMask("#main");
		document.main.action = 'adm95002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}

	function change_total_amt(){
		var total_amt = 0;		
		if(document.main.corp_class.value == '1'){ document.main.regular_pay_amt.value = 100000; }
		else if(document.main.corp_class.value == '2'){ total_amt += 1000000; document.main.regular_pay_amt.value = 150000; }
		else if(document.main.corp_class.value == '3'){	total_amt += 2000000; document.main.regular_pay_amt.value = 200000; }
		
		if(document.main.loan_yn.value == 'Y'){ total_amt += 1000000; }
		if(document.main.server_type.value == '자체'){ total_amt += 500000;  }
		
		if(document.main.distant_type.value == '수도권'){ total_amt += 200000; }
		else if(document.main.distant_type.value == '중부권'){ total_amt += 300000; }
		else if(document.main.distant_type.value == '영호남'){ total_amt += 400000; }
		else if(document.main.distant_type.value == '제주'){	total_amt += 500000; }
		
		if(document.main.lnk_insa_yn.checked == true){ total_amt += 500000; }
		if(document.main.lnk_bok_yn.checked == true){ total_amt += 500000; }		
		
		if(document.main.slip_year_cnt.value != ''){
			total_amt += document.main.slip_year_cnt.value * 200000;			
		}		
		document.main.total_amt.value = total_amt;		
		formatMaskElm(document.main.total_amt);
		formatMaskElm(document.main.regular_pay_amt);
	}	
</script>
</head>
<body>
<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="corp_cd" 	value="<%=obox.get("corp_cd")%>">
<input type="hidden" name="action_type" value="<%=obox.get("corp_cd").equals("")?"INSERT":"UPDATE"%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100%" valign="top">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table02">
				<tr height="28">
					<td rowspan="2" class="table01_title">회사정보</td>
					<td class="table01_title">회사명</td>
					<td style="padding-left:5px"><input type="text" name="corp_nm" value="<%=obox.get("corp_nm")%>" size="35" maxlength="50" title="회사명" class="required" style="border:1 solid gray">	</td>
					<td class="table01_title">상태</td>
					<td style="padding-left:5px">
						<select name="sign_status" title="상태" style="width:100px" class="required">
							<option value='' <%=obox.get("sign_status").equals("")?"selected":"" %>>선택</option>
							<option value='도입문의' <%=obox.get("sign_status").equals("도입문의")?"selected":"" %>>도입문의</option>
							<option value='견적발송' <%=obox.get("sign_status").equals("견적발송")?"selected":"" %>>견적발송</option>
							<option value='계약서발송' <%=obox.get("sign_status").equals("계약서발송")?"selected":"" %>>계약서발송</option>
							<option value='진행중' <%=obox.get("sign_status").equals("진행중")?"selected":"" %>>진행중</option>
							<option value='완료' <%=obox.get("sign_status").equals("완료")?"selected":"" %>>완료</option>
						</select>
					</td>
				</tr>
				<tr height="28">
					<td class="table01_title">사업자등록번호</td>
					<td colspan="3" style="padding-left:5px">
						<input type="text" name="saupja_no1" value="<%=StringUtil.substr(obox.get("saupja_no"),0,3)%>" size="3" maxlength="3" title="사업자등록번호" class="autoTab" style="border:1 solid gray"> -
						<input type="text" name="saupja_no2" value="<%=StringUtil.substr(obox.get("saupja_no"),3,5)%>" size="2" maxlength="2" title="사업자등록번호" class="autoTab" style="border:1 solid gray"> -
						<input type="text" name="saupja_no3" value="<%=StringUtil.substr(obox.get("saupja_no"),5)%>" size="5" maxlength="5" title="사업자등록번호" class="autoTab" style="border:1 solid gray">
					</td>
				</tr>
				<tr height="28">
					<td width="10%" rowspan="2" class="table01_title">담당자</td>
					<td width="15%" class="table01_title">성명</td>
					<td width="30%" style="padding-left:5px"><input type="text" name="empl_nm" value="<%=obox.get("empl_nm")%>" size="20" maxlength="10" title="성명" style="border:1 solid gray"></td>
					<td width="15%" class="table01_title">직위</td>
					<td width="30%" style="padding-left:5px"><input type="text" name="empl_class" value="<%=obox.get("empl_class")%>" size="20" maxlength="10" title="직급" style="border:1 solid gray"></td>
				</tr>
				<tr height="28">
					<td class="table01_title">전화번호</td>
					<td style="padding-left:5px">
						<select name="tel_no1" style="width:50px">
							<option value=''>선택</option>
							<%=CodeHelper.OptList(codeWp, "tel_no", StringUtil.arrayCol(obox.get("tel_no"),1,"-"))%>
						</select> - 
						<input type="text" name="tel_no2" value="<%=StringUtil.arrayCol(obox.get("tel_no"),2,"-")%>" size="4" maxlength="4" title="전화번호" class="autoTab" style="border:1 solid gray"> - 
						<input type="text" name="tel_no3" value="<%=StringUtil.arrayCol(obox.get("tel_no"),3,"-")%>" size="4" maxlength="4" title="전화번호" class="autoTab" style="border:1 solid gray">
					</td>
					<td class="table01_title">휴대폰번호</td>
					<td style="padding-left:5px">
						<select name="hp_no1" style="width:50px">
							<option value=''>선택</option>
							<%=CodeHelper.OptList(codeWp, "hp_no", StringUtil.arrayCol(obox.get("hp_no"),1,"-"))%>
						</select> - 
						<input type="text" name="hp_no2" value="<%=StringUtil.arrayCol(obox.get("hp_no"),2,"-")%>" size="4" maxlength="4" title="휴대폰번호" class="autoTab" style="border:1 solid gray"> - 
						<input type="text" name="hp_no3" value="<%=StringUtil.arrayCol(obox.get("hp_no"),3,"-")%>" size="4" maxlength="4" title="휴대폰번호" class="autoTab" style="border:1 solid gray"">
					</td>
				</tr>
				<tr height="28">
					<td rowspan="6" class="table01_title">도입정보</td>
					<td class="table01_title">도입유형</td>
					<td style="padding-left:5px">
						<select name="corp_class" title="도입유형" style="width:250px" onChange="goCancel()">
							<option value="1" <%=obox.get("corp_class").equals("1")?"selected":""%>>(1) 기본재산 10억미만 / 인원수 300명미만</option>
							<option value="2" <%=obox.get("corp_class").equals("2")?"selected":""%>>(2) 기본재산 10억~50억 / 인원수 500명미만</option>
							<option value="3" <%=obox.get("corp_class").equals("3")?"selected":""%>>(3) 기본재산 50억이상 / 인원수 500명이상</option>
						</select>
					</td>		
					<td class="table01_title">대부사업</td>			
					<td style="padding-left:5px">
						<select name="loan_yn" title="대부사업" style="width:100px" onChange="goCancel()">
								<option value="N" <%=obox.get("loan_yn").equals("N")?"selected":""%>>없음</option>
								<option value="Y" <%=obox.get("loan_yn").equals("Y")?"selected":""%>>있음</option>
						</select>
					</td>				
				</tr>
				<tr height="28">					
					<td class="table01_title">설치유형</td>
					<td style="padding-left:5px">
						<select name="server_type" title="설치유형" style="width:100px" onChange="goCancel()">
							<option value="" <%=obox.get("server_type").equals("")?"selected":""%>>선택</option>
							<option value="자체" <%=obox.get("server_type").equals("자체")?"selected":""%>>자체서버</option>
							<option value="임대" <%=obox.get("server_type").equals("임대")?"selected":""%>>임대서버</option>
						</select>
					</td>
					<td class="table01_title">출장비기준</td>	
					<td style="padding-left:5px">
						<select name="distant_type" title="출장비기준" style="width:100px" onChange="goCancel()">
							<option value="" <%=obox.get("distant_type").equals("")?"selected":""%>>선택</option>
							<option value="수도권" <%=obox.get("distant_type").equals("수도권")?"selected":""%>>수도권</option>
							<option value="중부권" <%=obox.get("distant_type").equals("중부권")?"selected":""%>>중부권</option>
							<option value="영호남" <%=obox.get("distant_type").equals("영호남")?"selected":""%>>영호남</option>
							<option value="제주" <%=obox.get("distant_type").equals("제주")?"selected":""%>>제주</option>
						</select>
					</td>
				</tr>
				<tr height="28">					
					<td class="table01_title">기간시스템연계</td>
					<td style="padding-left:5px">					
						<input type="checkbox" name="lnk_insa_yn" value="Y" <%=obox.get("lnk_insa_yn").equals("Y")?"checked":""%> style="border:none" onClick="change_total_amt()">사원/부서정보&nbsp;
						<input type="checkbox" name="lnk_bok_yn" value="Y" <%=obox.get("lnk_bok_yn").equals("Y")?"checked":""%> style="border:none" onClick="change_total_amt()">목적/대부사업						
					</td>
					<td class="table01_title">전표이관</td>
					<td style="padding-left:5px"><input type="text" name="slip_year_cnt" value="<%=obox.get("slip_year_cnt")%>" size="6" maxlength="4" title="전표이관" style="border:1 solid gray" onChange="change_total_amt()"> 년분 데이터</td>
				</tr>		
				<tr height="90">
					<td class="table01_title">커스터마이징<br>내역<br></td>
					<td colspan="3" style="padding:5 5 5 5">
						<textarea name="cust_content" style="width:100%; height:80px; border:solid 1px #666666"><%=obox.get("cust_content")%></textarea>
					</td>				
				</tr>
				<tr height="28">
					<td class="table01_title">책임자</td>
					<td style="padding-left:5px">
						<select name="charge_person" title="책임자" style="width:100px">
							<option value="">선택</option>
							<option value="임치형" <%=obox.get("charge_person").equals("임치형")?"selected":""%>>임치형</option>
							<option value="채수범" <%=obox.get("charge_person").equals("채수범")?"selected":""%>>채수범</option>
							<option value="이우진" <%=obox.get("charge_person").equals("이우진")?"selected":""%>>이우진</option>
							<option value="문경남" <%=obox.get("charge_person").equals("문경남")?"selected":""%>>문경남</option>
							<option value="변상민" <%=obox.get("charge_person").equals("변상민")?"selected":""%>>변상민</option>
						</select>
					</td>
					<td class="table01_title">도입(예정)일</td>
					<td style="padding-left:5px"><input type="text" name="tmp_open_ymd" value="<%=obox.get("tmp_open_ymd")%>" size="10" maxlength="8" title="도입예정일" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.tmp_open_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a></td>
				</tr>
				<tr height="28">					
					<td class="table01_title">도입비</td>
					<td style="padding-left:5px"><input type="text" name="total_amt" value="<%=obox.get("total_amt")%>" size="15" title="도입비" class="tMONEY" style="border:1 solid gray"> 원</td>
					<td class="table01_title">유지보수비</td>
					<td style="padding-left:5px">
						<select name="regular_pay_cycle" title="유지보수단위" style="width:50px">
							<option value="M" <%=obox.get("regular_pay_cycle").equals("M")?"selected":""%>>월</option>
							<option value="B" <%=obox.get("regular_pay_cycle").equals("B")?"selected":""%>>분기</option>
							<option value="Y" <%=obox.get("regular_pay_cycle").equals("Y")?"selected":""%>>년간</option>
						</select>
						<input type="text" name="regular_pay_amt" value="<%=obox.get("regular_pay_amt")%>" size="15" title="유지보수비" class="tMONEY" style="border:1 solid gray"> 원
					</td>
				</tr>		
				<tr height="60">
					<td rowspan="2" class="table01_title">기타</td>
					<td class="table01_title">특이사항</td>
					<td colspan="3" style="padding:5 5 5 5"><textarea name="etc_remark" style="width:100%; height:50px; border:solid 1px #666666"><%=obox.get("etc_remark")%></textarea></td>
				</tr>	
				<tr height="28">
					<td class="table01_title">제휴업체</td>
					<td colspan="3" style="padding-left:5px">
						<select name="consortium_nm" title="제휴업체" style="width:150px">
							<option value="" <%=obox.get("consortium_nm").equals("")?"selected":"" %>>선택</option>	
							<option value="사내근로복지기금연구소" <%=obox.get("consortium_nm").equals("사내근로복지기금연구소")?"selected":"" %>>사내근로복지기금연구소</option>	
							<option value="다교솔루션" <%=obox.get("consortium_nm").equals("다교솔루션")?"selected":"" %>>다교솔루션</option>							
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right" style="padding-top:5px">
			<a href="javascript:goSave();"><img id="btnUpdate" src="/com/img/bn_save.gif" border="0" align="absmiddle"></a>
			<a href="javascript:goCancel();"><img id="btnCancel" src="/com/img/bn_cancel.gif" border="0" align="absmiddle"></a>
 		</td>
	</tr>
</table>		
</form>
