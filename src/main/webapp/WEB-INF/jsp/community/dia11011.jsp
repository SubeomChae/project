<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>공휴일 등록</title>

<script language='javascript'>
	function goSearch() {
		if(formValidate("#main")) {
			removeMask("#main");
		    document.main.action = "dia11011_edit.do";
		    document.main.target = "_self";
		    document.main.submit();
		}
	}

	function goSave() {
		if(formValidate("#main")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask(document.main);
			    document.main.action = "dia11011_update.do";
			    document.main.target = "_self";
			    document.main.submit();
			}
		}
	}

	function Calendar_Post() { goSearch(); }
</script>

<form  id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td align="center" valign="top" bgcolor="#D8D8D8" style="padding: 5px;">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
			<tr>
				<td align="center">
					<table width="94%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
						<tr>
							<td height="42" align="left" valign="top">
								<table border="0" cellpadding="0" cellspacing="0" align="left">
									<tr>
										<td width="11" height="7"></td>
										<td rowspan="3" valign="bottom" style="font-family:'바탕';font-size:18px;font-weight:bold;color:#336699;">&nbsp;&nbsp;공휴일 등록</td>
									</tr>
									<tr>
										<td height="13" bgcolor="#000000"></td>
									</tr>
									<tr>
										<td height="17" bgcolor="#33FF00"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>				
				</td>
			</tr>
			<tr><td height="10"></td></tr>
			<tr>
				<td align="center">
					<table cellspacing=0 cellpadding=0 width="94%" border=1 class="table01">
					    <tr height="35">
							<td width="25%" align="center" class="table01_title">일자</td>
							<td style="padding-left:5px"><input type="text" name="sys_ymd" value="<%=box.get("sys_ymd")%>" size="10" maxlength="8" title="일자" class="required tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.sys_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a></td>
					     </tr>
					     <tr height="35">
							<td align="center" class="table01_title">선택</td>
							<td style="padding-left:5px">
							<% if(DateUtil.getWeekDayNm(box.get("sys_ymd")).equals("일")) { %>
								<font color=red>일요일</font>
								<input type="hidden" name="holiday_yn" value="Y">
							<% }else { %>
								<input type="radio" name="holiday_yn" value="N" <%=obox.get("holiday_yn").equals("Y")?"":"checked"%> style="border:none;"> 근무일(토요일포함)&nbsp;&nbsp;
								<input type="radio" name="holiday_yn" value="Y" <%=obox.get("holiday_yn").equals("Y")?"checked":""%> style="border:none;"> 공휴일
							<% } %>
							</td>
					     </tr>
					     <tr height="35">
							<td align="center" class="table01_title">비고</td>
							<td style="padding-left:5px"><input type="text" name="remark" value="<%=obox.get("remark")%>" maxlength="40" title="비고" style="width:98%;border:1 solid gray;ime-mode:active;"></td>
					     </tr>
					</table>
				</td>
			</tr>
			<tr><td height="5"></td></tr>
			<tr>
				<td align="center">
					<table width="94%" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff">
						<tr>
							<td align="right">
								<a href="javascript:goSave();"><img src="/com/img/bn_save.gif" border="0" align="absmiddle"></a>
								<a href="javascript:self.close();"><img src="/com/img/bn_close.gif" border="0" align="absmiddle"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td height="60"></td></tr>
		</table>
    </td>
  </tr>
</table>
</form>