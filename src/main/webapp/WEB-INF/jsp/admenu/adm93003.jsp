<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="obox"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>유지보수일지</title>

<script language="javascript">
	function goSave() {
		if (formValidate("#main")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#main");
				document.main.action = 'adm93003_update.do?action_type=<%=box.get("maint_no").equals("")?"INSERT":"UPDATE"%>';
				document.main.target = '_self';
				document.main.submit();
			}
		}		
	}		

	function goCancel() {
		document.main.action = 'adm93002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}

	function __Calendar_Setting_Post(target) {
		if(document.main.end_ymd.value == '') {
			if(target == 'start_ymd') {
				document.main.end_ymd.value = document.main.start_ymd.value.replace(/-/g,"");
				formatMaskElm(document.main.end_ymd);
			}
		}
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="maint_no" value="<%=box.get("maint_no")%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28">
					<td width="15%" class="table01_title">업체명</td>
					<td width="40%" style="padding-left:5px">
						<select name="corp_cd" title="업체명" class="required" style="width:180px;">
							<option value=''>선택</option>
							<%=CodeHelper.OptList("PR_COMTB_CORP01_LIST","LISTCODE",obox.get("corp_cd"),"corp_cd","","","","", request)%>
						</select>
					</td>
				    <td width="15%" class="table01_title">요청자</td>
				    <td width="30%" style="padding-left:5px">
				        <input type="text" name="req_person_nm" title="요청자" value="<%=obox.get("req_person_nm") %>" style="width:100px; border:1 solid gray; ime-mode:active;">
				    </td>				    
				</tr>
				<tr height="28">
					<td class="table01_title">요청일자</td>
					<td style="padding-left:5px">
						<input type="text" name="req_ymd" value="<%=box.get("maint_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("req_ymd")%>" size="11" maxlength="8" title="요청일자" class="required tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.req_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a>
					</td>
					<td class="table01_title">요청구분</td>
					<td style="padding-left:5px">
						<select name="maint_gbn" title="요청구분" style="width:100px;">
							<%=CodeHelper.OptList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("maint_gbn"),"maint_gbn","","","","", request)%>
						</select>
					</td>
				</tr>
				<tr height="200">
					<td align="center" class="table01_title">요청내용</td>
					<td colspan="3" style="padding:5 5 5 5"><textarea name="req_content" title="요청내용" class="required" style="border:1 solid gray;height:190;width:100%"><%=obox.get("req_content")%></textarea></td>
				</tr>
				<tr height="120">
					<td align="center" class="table01_title">처리내용</td>
					<td colspan="3" style="padding:5 5 5 5"><textarea name="pro_content" title="처리내용" style="border:1 solid gray;height:110;width:100%"><%=obox.get("pro_content")%></textarea></td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">처리일자</td>
					<td colspan="3" style="padding-left:5px">
						<input type="text" name="start_ymd" value="<%=obox.get("start_ymd")%>" size="10" maxlength="8" title="처리일자(부터)" class="tYMD" style="border:1 solid gray" onChange="__Calendar_Setting_Post('start_ymd');"><a href="javascript:Calendar_D(document.main.start_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a> ~ 
						<input type="text" name="end_ymd" value="<%=obox.get("end_ymd")%>" size="11" maxlength="8" title="처리일자(까지)" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.end_ymd)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a>
					</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">처리담당자</td>
					<td colspan="3" style="padding-left:5px"><input type="text" name="pro_person_nm" title="처리담당자" value="<%=obox.get("pro_person_nm")%>" style="width:150px; border:1 solid gray; ime-mode:active;"></td>
				</tr>
			</table>
    	</td>
  	</tr>
  	<tr height="28" align="right">
  		<td align="right" style="padding:5 0 0 0">
			<a href="javascript:goSave('')"><img src="/com/img/bn_save.gif" border="0" alt="저장"></a>
		<% if(!box.get("maint_no").equals("")){ %>
			<a href="javascript:goCancel('')"><img src="/com/img/bn_cancel.gif" border="0" alt="취소"></a>
		<% } %>
  		</td>
  	</tr>
</table>
</form>
