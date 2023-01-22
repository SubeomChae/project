<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="obox"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>시스템도입현황</title>

<script language="javascript">
	function goEdit() {
		document.main.action = 'adm95003_edit.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#main");
			document.main.action = 'adm95002_delete.do';
			document.main.target = '_parent';
			document.main.submit();
		}
	}
	
	function goTabpage(tab_index) {
		try { parent.document.main.tab_index.value = tab_index; } catch(e) {}
		for(var i=1; i <= 2; i++) {
			document.getElementById('tabImage'+i).style.backgroundImage = 'url(/com/img/bg_tab120_' + (tab_index == i ? 'on' : 'off') + '.gif)';
		}
		var theURL = '';
		if	   (tab_index == '1') { theURL = 'adm95002_select.do'; }
		else if(tab_index == '2') { theURL = 'adm96001_list.do'; }		

		document.main.action = theURL; 
		document.main.target = "_self";
		document.main.submit();
	}
</script>
</head>
<body>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="corp_cd" 	value="<%=obox.get("corp_cd")%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
	  	<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25" align="center">
					<td id="tabImage1" width="120" nowrap background="/com/img/bg_tab120_on.gif" style="cursor:hand;" onClick="goTabpage('1')">도입개요</td>
					<td id="tabImage2" width="120" nowrap background="/com/img/bg_tab120_off.gif" style="cursor:hand;" onClick="goTabpage('2')">거래내역</td>					
					<td width="*">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" valign="top">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table02">
				<tr height="28">
					<td rowspan="2" class="table01_title">회사정보</td>
					<td class="table01_title">회사명</td>
					<td style="padding-left:5px"><b><%=obox.get("corp_nm")%></b></td>
					<td class="table01_title">상태</td>
					<td style="padding-left:5px"><%=obox.get("sign_status")%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">사업자등록번호</td>
					<td colspan="3" style="padding-left:5px"><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
				</tr>
				<tr height="28">
					<td rowspan="2" width="10%" align="center" class="table01_title">담당자</td>
					<td width="15%" class="table01_title">성명</td>
					<td width="30%" style="padding-left:5px"><%=obox.get("empl_nm")%></td>
					<td width="15%" class="table01_title">직위</td>
					<td width="30%" style="padding-left:5px"><%=obox.get("empl_class")%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">전화번호</td>
					<td style="padding-left:5px"><%=obox.get("tel_no")%></td>
					<td class="table01_title">휴대폰번호</td>
					<td style="padding-left:5px"><%=obox.get("hp_no")%></td>
				</tr>
				<tr height="28">
					<td rowspan="7" class="table01_title">도입정보</td>
					<td class="table01_title">도입유형</td>
					<td colspan="3" style="padding-left:5px">
						(<%=obox.get("corp_class")%>) 유형<%=obox.get("loan_yn").equals("Y")?"(대부사업 포함)":""%>
					</td>
				</tr>
				<tr height="28">
					<td class="table01_title">설치유형</td>
					<td style="padding-left:5px"><%=obox.get("server_type")%></td>
					<td class="table01_title">출장비기준</td>
					<td style="padding-left:5px"><%=obox.get("distant_type")%></td>
				</tr>
				<tr height="28">					
					<td class="table01_title">기간시스템연계</td>
					<td style="padding-left:5px">
						<%=obox.get("lnk_insa_yn").equals("Y")?"사원/부서정보":""%>
						<%=(obox.get("lnk_insa_yn").equals("Y")&&obox.get("lnk_bok_yn").equals("Y"))?", ":""%>
						<%=obox.get("lnk_bok_yn").equals("Y")?"목적/대부사업":""%>
					</td>
					<td class="table01_title">전표이관</td>
					<td style="padding-left:5px"><%=obox.get("slip_year_cnt").equals("")?"없음":obox.get("slip_year_cnt")+" 년분 데이터"%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">커스터마이징 내역</td>
					<td colspan="3" style="padding:5px;"><%=StringUtil.getReplaceSpecialCharacters(obox.get("cust_content", Box.MULTILINE_TEXT))%></td>
				</tr>
				<tr height="28">
					<td class="table01_title">책임자</td>
					<td style="padding-left:5px"><%=obox.get("charge_person")%></td>	
					<td class="table01_title">도입(예정)일</td>
					<td style="padding-left:5px"><%=obox.get("tmp_open_ymd",Box.DEF_DATE_FMT)%></td>					
				</tr>	
				<tr height="28">					
					<td class="table01_title">도입비</td>
					<td style="padding-left:5px"><%=obox.get("total_amt", Box.THOUSAND_COMMA)%> 원</td>
					<td class="table01_title">유지보수비</td>
					<td style="padding-left:5px">						
						<%=obox.get("regular_pay_cycle_nm")%>				
						<%=obox.get("regular_pay_amt", Box.THOUSAND_COMMA)%>원  
					</td>
				</tr>
				<tr height="28">
					<td class="table01_title">가동일자</td>
					<td style="padding-left:5px"><%=obox.get("open_ymd",Box.DEF_DATE_FMT)%></td>	
					<td class="table01_title">유지보수개시일</td>
					<td style="padding-left:5px"><%=obox.get("start_ymd",Box.DEF_DATE_FMT)%>
					<%if(!obox.get("next_term_ymd").equals("")) {
						  if(obox.get("regular_pay_cycle_nm").equals("월")){%>	(<%=DateUtil.addDate(obox.get("next_term_ymd"), 1, "yyyy-MM-dd", "M" )%>)
						<%}else if(obox.get("regular_pay_cycle_nm").equals("분기")){%>(<%=DateUtil.addDate(obox.get("next_term_ymd"), 3, "yyyy-MM-dd", "M" )%>)
						<%}else if(obox.get("regular_pay_cycle_nm").equals("년")){%>(<%=DateUtil.addDate(obox.get("next_term_ymd"), 1, "yyyy-MM-dd", "Y" )%>)
						<%} 
					  } %>
					</td>					
				</tr>
				<tr height="28">
					<td rowspan="2" class="table01_title">기타</td>
					<td class="table01_title">특이사항</td>
					<td colspan="3" style="line-height:150%;padding:5px"><%=obox.get("etc_remark", Box.MULTILINE_TEXT)%></td>
				</tr>	
				<tr height="28">
					<td class="table01_title">제휴업체</td>
					<td colspan="3" style="padding-left:5px"><%=obox.get("consortium_nm")%></td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td align="right" style="padding-top:5px">
	  		<a href="javascript:goEdit();"><img id="btnModify" src="/com/img/bn_modify.gif" border="0" align="absmiddle"></a>
	  	<% if(uSesEnt.use_auth.equals("SA")) { %>
	  		<a href="javascript:goDelete();"><img id="btnDelete" src="/com/img/bn_delete.gif" border="0" align="absmiddle"></a>
	  	<% } %>
    	</td>
  	</tr>
</table>
</form>
