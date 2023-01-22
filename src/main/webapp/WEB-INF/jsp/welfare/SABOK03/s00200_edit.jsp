<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeHelper.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "family_rel_cd|bank_cd@@@@A|","","","","","",request);
	boolean isEditable = false;
	if(obox.get("sign_status").equals("") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { isEditable = true; }
%>

<title>의료비 신청서 작성</title>

<script language="javascript">
	function goSave() {
		if (formValidate("#main")) {
			if(document.main.apply_ymd.value.replace(/-/g,"") > '<%=DateUtil.toString("yyyyMMdd")%>') { 
				alert('신청일이  오늘 날짜 이후로 입력되었습니다.\n다시 확인 후 입력해주세요.');
				document.main.apply_ymd.focus();
				return;
			}	
								
			if(confirm('저장하시겠습니까?')) {
				removeMask("#main");
				document.main.data01.value = document.main.family_rel_cd.value;
				document.main.data02.value = document.main.family_nm.value;
				document.main.data03.value = document.main.family_reside_no.value;
				document.main.data04.value = document.main.medi_org_nm.value;
				document.main.data05.value = document.main.medi_org_addr.value;
				document.main.data07.value = document.main.medi_ymd.value;
				document.main.data06.value = document.main.disease_nm.value;
				document.main.data08.value = document.main.start_ymd.value;
				document.main.data09.value = document.main.end_ymd.value;
				document.main.data10.value = document.main.inner_ilsu.value;
				document.main.data11.value = document.main.use_amt.value;

				document.main.action = 'wel01003_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}		
	}
			
	function goCancel() {
		removeMask("#main");
		document.main.action = 'wel01002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}	  
	
	function change_family_id(family_id) {
		if(family_id == '') { return; }
		var family_value = document.main.family_id.options[document.main.family_id.options.selectedIndex].title;
		var arr = family_value.split('|');
		document.main.family_rel_cd.value = arr[0];
		document.main.family_nm.value = arr[1];
		document.main.family_reside_no.value = arr[2];
	}
	
	function find_employee_no_post(empl_no, empl_nm) {
		removeMask("#main");
		document.main.apply_no.value = '';
		document.main.empl_no.value = empl_no;
		document.main.empl_nm.value = empl_nm;
		document.main.action = "wel01003_edit.do";
		document.main.target = "_self";
		document.main.submit();
	}
	
	function __Calendar_Setting_Post(target) {
		if(target.substring(0,9) == 'start_ymd') {
			inx = target.substring(9);
			if(!isEmpty(document.all['end_ymd'+inx])) {
				document.all['inner_ilsu'+inx].value = getDayInterval(document.all['start_ymd'+inx].value.replace(/-/g,"")+'000', document.all['end_ymd'+inx].value.replace(/-/g,"")+'000') + 1;
			}		
		}else if(target.substring(0,7) == 'end_ymd') {
			inx = target.substring(7);		
			if(!isEmpty(document.all['start_ymd'+inx])) {
				document.all['inner_ilsu'+inx].value = getDayInterval(document.all['start_ymd'+inx].value.replace(/-/g,"")+'000', document.all['end_ymd'+inx].value.replace(/-/g,"")+'000') + 1;
			}		
		} 
		formatMaskElm(document.all['inner_ilsu'+inx]);
	}
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="apply_no" 	value="<%=box.get("apply_no")%>">
<%for(int i=1;i<=15;i++){%><input type="hidden" name="data<%=StringUtil.lpad(String.valueOf(i),"0",2)%>" value=""><%}%>
<%@ include file="/welfare/payGuide.jsp" %>
<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
			<% if(uSesEnt.use_auth.startsWith("S")) { %>
				<tr height="28">
					<td align="center" class="table01_title">사원선택</td>
					<td colspan="3" style="padding-left:5px"><input type="text" name="empl_nm" value="<%=obox.get("empl_nm")%>" size="12" style="background-color:f6f6f6;border:1 solid gray" readOnly>
					<a href="javascript:find_employee_no('')"><img src="/com/img/icon_find.gif" border="0" alt="사원 찾기" align="absmiddle"></a></td>
				</tr>
			<% } %>
				<tr height="28">
					<td align="center" class="table01_title">사번/성명</td>
					<td style="padding-left:5px"><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;<%=obox.get("empl_nm")%>
						&nbsp;<a href="javascript:go_employee_info('<%=obox.get("empl_no")%>');"><img src="/com/img/icon_zoom.gif" border="0" align="absmiddle" alt="자세히보기"></a>
						<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
					</td>
					<td align="center" width="15%" class="table01_title">부서</td>
					<td style="padding-left:5px"><%=obox.get("dept_nm")%></td>
				</tr>
				<tr height="28">
					<td width="15%" align="center" class="table01_title">주민번호</td>
					<td width="35%" style="padding-left:5px"><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
					<td width="15%" align="center" class="table01_title">직위</td>
					<td width="35%" style="padding-left:5px"><%=obox.get("position_nm")%></td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">입사일자</td>
					<td style="padding-left:5px"><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
					<td align="center" class="table01_title">사원구분</td>
					<td style="padding-left:5px"><%=obox.get("empl_class_nm")%></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td height="10"></td></tr>
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28">
					<td width="15%" align="center" class="table01_title">대상자</td>
					<td width="35%" style="padding-left:5px">
						<select name="family_id" class="required" title="대상자 선택" onChange="change_family_id(this.value)">
							<option value=''>:: 선택 ::</option>
						<%	RsWrapper familyWp = CodeHelper.getRsWrapper("PR_INSTB_EMPL12_LIST","LISTCODE", "", obox.get("empl_no"),"00","","","","",request);
							for(int i=0; i < familyWp.getLength(); i++) { %>
							<option value='<%=familyWp.get("code",i)%>' <%=StringUtil.arrayCol(familyWp.get("optkey",i),2,"|").equals(obox.get("family_nm"))?"selected":""%> title='<%=familyWp.get("optkey",i)%>'><%=familyWp.get("data",i)%></option>
						<%	} %>	
						</select>
						<input type="hidden" name="family_rel_cd" 	value="<%=obox.get("family_rel_cd")%>">
						<input type="hidden" name="family_nm" 		value="<%=obox.get("family_nm")%>">
						<input type="hidden" name="family_reside_no" value="<%=obox.get("family_reside_no")%>">
					</td>
					<td width="15%" align="center" class="table01_title">질환명</td>
					<td width="35%" style="padding-left:5px"><input type="text" name="disease_nm" value="<%=obox.get("disease_nm")%>" maxlength="50" title="질환명"  style="width:90%;border:1 solid gray"></td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">의료기관</td>
					<td style="padding-left:5px"><input type="text" name="medi_org_nm" value="<%=obox.get("medi_org_nm")%>" maxlength="50" title="의료기관명"  style="width:90%; border:1 solid gray"></td>
					<td align="center" class="table01_title">소재지</td>
					<td style="padding-left:5px"><input type="text" name="medi_org_addr" value="<%=obox.get("medi_org_addr")%>" maxlength="50" title="의료기관 소재지"  style="width:90%; border:1 solid gray"></td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">진료일자</td>
					<td style="padding-left:5px"><input type="text" name="medi_ymd" value="<%=obox.get("medi_ymd")%>" size="10" maxlength="8" class="tYMD" title="진료일자" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.medi_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a></td>
					<td align="center" class="table01_title">사용금액</td>
					<td style="padding-left:5px"><input type="text" name="use_amt" value="<%=obox.get("use_amt")%>" size="8" maxlength="10" class="tMONEY" title="사용금액" style="width:70px; border:1 solid gray" >&nbsp;원</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">입원기간</td>
					<td colspan="3" style="padding-left:5px">
						<input type="text" name="start_ymd" value="<%=obox.get("inner_start_ymd")%>" size="10" maxlength="8" class="tYMD" title="입원기간(부터)" style="border:1 solid gray" onChange="Calendar_Setting_Post('start_ymd')"><a href="javascript:Calendar_D(document.main.start_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a>&nbsp;부터&nbsp;~&nbsp;
						<input type="text" name="end_ymd" value="<%=obox.get("inner_end_ymd")%>" size="10" maxlength="8" class="tYMD" title="입원기간(까지)" style="border:1 solid gray" onChange="Calendar_Setting_Post('end_ymd')"><a href="javascript:Calendar_D(document.main.end_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a>&nbsp;까지&nbsp;(총&nbsp;<input type="text" name="inner_ilsu" value="<%=obox.get("inner_ilsu")%>" class="tMONEY" title="입원일수" size="3" maxlength="3" style="border:1 solid gray" readOnly>&nbsp;일)
					</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">신청일자</td>
					<td style="padding-left:5px"><input type="text" name="apply_ymd" value="<%=box.get("apply_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" size="10" maxlength="8" title="신청일자" class="required tYMD" style="border:1 solid gray" <%=isEditable?"":"readonly"%>><%if(isEditable){%><a href="javascript:Calendar_D(document.main.apply_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a><%}%></td>
					<td align="center" class="table01_title">신청금액</td>
					<td style="padding-left:5px"><input type="text" name="apply_amt" value="<%=obox.get("apply_amt")%>" size="8" maxlength="10" class="required tMONEY" title="신청금액" style="width:70px; border:1 solid gray">&nbsp;원</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">계좌번호</td>
					<td colspan="3" style="padding-left:5px">
						<select name="bank_cd" title="금융기관" class="required" style="width:120px">
							<option value=''>:: 금융기관 선택 ::</option>
				            <%=CodeHelper.OptList(codeWp, "bank_cd", obox.get("bank_cd"))%>
						</select>
						<input type="text" name="account_no" value="<%=obox.get("account_no")%>" size="18" maxlength="30" title="계좌번호" class="required" style="border:1 solid gray">
						&nbsp;예금주 : <input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" size="10" maxlength="15" title="예금주" class="required" style="border:1 solid gray">
					</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">비고</td>
					<td colspan="3" style="padding-left:5px"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" style="width:90%;border:1 solid gray"></td>
				</tr>
			<% if(!box.get("apply_no").equals("")) { %>
		  		<tr height="28">
					<td class="table01_title" align="center">전표번호</td>
					<td nowrap style="padding-left:5px"><%=obox.get("slip_no",Box.SLIP_NO)%>
						<%if(!obox.get("slip_no").equals("")){%><a href="javascript:go_slip_viewer('<%=obox.get("slip_no")%>');"><img src="/com/img/icon_zoom.gif" align="absmiddle" border="0"></a><%}%>
						<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
						<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
					</td>
					<td class="table01_title" align="center">결재상태</td>
					<td nowrap style="padding-left:5px"><b><font color=red><%=obox.get("sign_status_nm")%></font></b></td>
		  		</tr>
			<% } %>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right" style="padding-top:5px">
			<a href="javascript:goSave();"><img src="/com/img/bn_save.gif" border="0" align="absmiddle"></a>
			<%if(!box.get("apply_no").equals("")){%><a href="javascript:goCancel();"><img src="/com/img/bn_cancel.gif" border="0" align="absmiddle"></a><%}%>
		</td>
	</tr>
</table>
</form>