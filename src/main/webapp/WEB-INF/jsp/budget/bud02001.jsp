<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>사업계획 계정과목코드</title>

<script language="javascript">
	function goDetail(acct_cd, acct_nm, use_flag, bud_ctrl_yn) {
		document.main.acct_cd.value 	= acct_cd;
		document.main.acct_nm.value 	= acct_nm;
		document.main.use_flag.value 	= use_flag;
		document.main.bud_ctrl_yn.value = bud_ctrl_yn;
		document.all['imgAcctSearch'].style.display = 'none';
		document.main.action_type.value = 'UPDATE';
	<% if(uSesEnt.use_auth.startsWith("S")) { %>	
		document.getElementById('btnUpdate').style.display = '';
		document.getElementById('btnDelete').style.display = '';
	<% } %>	
	}
	
	function goWrite() {
		goDetail('', '', 'A', 'N');
		document.all['imgAcctSearch'].style.display = '';
		document.main.action_type.value = 'INSERT';
	<% if(uSesEnt.use_auth.startsWith("S")) { %>	
		document.getElementById('btnUpdate').style.display = '';
		document.getElementById('btnDelete').style.display = 'none';
	<% } %>	
		var oldRow = document.all["selectedRow"].value;
		if(oldRow != '') { document.all["tr_"+oldRow].style.background = 'white'; }
	}

	function goSave() {
		if (formValidate(document.main)) {
			if(confirm('저장하시겠습니까?')) {
				removeMask(document.main);
				document.main.action = 'bud12001_update.do'; 
				document.main.target = '_self';
				document.main.submit();
			}
		}		
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			document.main.action = 'bud12001_delete.do'; 
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function page_init() {
		goWrite();
		parent.document.all['btnExcel'].style.display = 'none';
	}
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="action_type" value="">
<input type="hidden" name="selectedRow" value="">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr> 
		<td width="100%" valign="top"> 
			<div id="divArea" style='width:100%;height:300;overflow-y:auto'>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="25" align="center" class="table01_title">
					<td width="7%">No</td>
					<td width="15%">코드</td>
					<td colspan="2" width="48%">계정과목명칭</td>
					<td width="15%">사용구분</td>
					<td width="15%">예산통제여부</td>
			    </tr> 
			<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand" 
					onClick="set_backColor('<%=i%>');goDetail('<%=rsWp.get("acct_cd",i)%>','<%=rsWp.get("acct_nm",i)%>','<%=rsWp.get("use_flag",i)%>','<%=rsWp.get("bud_ctrl_yn",i)%>')">
					<td align="center"><%=i+1%></td>
					<td align="center"><%=rsWp.get("acct_cd",i)%></td>
					<td align="center"><%=rsWp.get("acct_class_nm",i)%></td>
					<td><%=rsWp.get("acct_cd",i).length() == 7 ? "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" : ""%><%=rsWp.get("acct_nm",i)%></td>
					<td align="center"><%=rsWp.get("use_flag",i).equals("A")?"일반계정":"내부관리계정"%></td>
					<td align="center"><%=rsWp.get("bud_ctrl_yn",i).equals("Y")?"예":"아니오"%></td>
				</tr>	
			<% } %>
			</table>
			</div>
		</td>
	</tr>
	<tr height="10"><td></td></tr>
	<tr> 
		<td width="100%" valign="top"> 
			<!-- 사업계획 계정과목 등록 -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="40">
					<td class="sub_cont_title" style="padding:10 0 0 5"><img src="/com/img/title_bullet.gif" width="17" height="13" border="0" align="absmiddle"> 계정과목 등록</td>
					<td align="right"><a href="javascript:goWrite();"><img src="/com/img/icon_add.gif" border="0" align="absmiddle" style="display:"></a></td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28">
					<td width="15%" align="center" class="table01_title">계정과목코드</td>
					<td width="35%" style="padding-left:5px">
						<input type="text" name="acct_cd" value="" size="7" maxlength="7" title="계정과목코드" class="required" style="background-color:f6f6f6; border:1 solid gray" readOnly>
						<a href="javascript:find_account_code2('5','*','','');"><img id="imgAcctSearch" src="/com/img/icon_find.gif" border="0" align="absmiddle"></a>
					</td>
					<td width="15%" align="center" class="table01_title">계정과목명칭</td>
					<td width="35%" style="padding-left:5px"><input type="text" name="acct_nm" value="" maxlength="25" title="계정과목명칭" class="required" style="width:300px;border:1 solid gray;ime-mode:active;"></td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">사용구분</td>
					<td style="padding-left:5px">
						<select name="use_flag" size="1" title="사용구분" style="width:100px">
							<option value="A">일반계정</option>
							<option value="B">내부관리계정</option>
							<option value="X">사용금지(폐지)</option>
						</select>		
					</td>
					<td align="center" class="table01_title">예산통제여부</td>
					<td style="padding-left:5px">
						<select name="bud_ctrl_yn" size="1" title="예산통제여부" style="width:100px">
							<option value="N">아니오</option>
							<option value="Y">예</option>
						</select>
					</td>
				</tr>
				<tr height="28">
					<td colspan="4" align="center">
					<% if(uSesEnt.use_auth.startsWith("S")) { %>
				  		<a href="javascript:goSave();"><img id="btnUpdate" src="/com/img/btn_save.gif" border="0" align="absmiddle"></a>&nbsp;
				  		<a href="javascript:goDelete();"><img id="btnDelete" src="/com/img/btn_delete.gif" border="0" align="absmiddle" style="display:none"></a>
					<% } %>
			    	</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>