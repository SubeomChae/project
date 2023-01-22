<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% RsWrapper codeWp = CodeHelper.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "cong_class@"+uSesEnt.dbo+"|school_flag|condo_cd|sign_status|","","","","","",request); %>

<title>목적사업비집행현황</title>
<script language='javascript'>
	function goSearch(gbn) {
		var theURL = 'wel21002_list.do';
		if(gbn == 'E') { theURL = 'wel21002_excel.do'; }

		document.main.action = theURL;
		document.main.target = gbn == 'E' ? 'excelFrm' : 'ifrm';
		document.main.submit();
	}
	
	function change_bugt_cd(bugt_cd) {
		if(bugt_cd == '') { 
			document.getElementById('trSearch').style.display = 'none';
		}else { 
			document.getElementById('trSearch').style.display = '';
		}
		
		bugt_cd = bugt_cd.substring(0,4);
		var cHtml = '';
		
		if(bugt_cd == 'S001') {
			cHtml = "<b>경조구분</b> : "
				  + "<select name='detail_sel' style='width:90px'><option value=''>전체</option><%=CodeHelper.OptListJs(codeWp,"cong_class","")%></select>"
				  + "&nbsp;&nbsp;&nbsp;&nbsp;<select name='detail_key' style='width:90px'>"
				  + "<option value='1'>경조장소</option><option value='2'>성명</option></select> "
				  + "<input type='text' name='detail_val' value='' style='width:150px; border:1 solid gray;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '경조금 지급현황';
		}else if(bugt_cd == 'S002') {
			cHtml = "<select name='detail_key' style='width:90px'>"
				  + "<option value='1'>질환명</option><option value='2'>의료기관</option><option value='3'>성명</option></select> "
				  + "<input type='text' name='detail_val' value='' style='width:150px; border:1 solid gray;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '의료비 지원현황';
		}else if(bugt_cd == 'S003') {
			cHtml = "<b>학교구분</b> : "
				  + "<select name='detail_sel' style='width:90px'><option value=''>전체</option><%=CodeHelper.OptListJs(codeWp,"school_flag","")%></select>"
				  + "&nbsp;&nbsp;&nbsp;&nbsp;<select name='detail_key' style='width:90px'>"
				  + "<option value='1'>학교명</option><option value='2'>성명</option></select> "
				  + "<input type='text' name='detail_val' value='' style='width:150px; border:1 solid gray;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '학자금 지원현황';
		}else if(bugt_cd == 'S004') {
			cHtml = "<select name='detail_key' style='width:90px'>"
				  + "<option value='1'>교육명</option><option value='2'>교육기관</option></select> "
				  + "<input type='text' name='detail_val' value='' style='width:150px; border:1 solid gray;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '자기개발비 지원현황';
		}else if(bugt_cd == 'S005') {
			cHtml = "<select name='detail_key' style='width:90px'>"
				  + "<option value='1'>휴양시설명</option></select> "
				  + "<input type='text' name='detail_val' value='' style='width:150px; border:1 solid gray;ime-mode:active;' onkeydown=\"if(event.keyCode == 13) goSearch('N');\">";
			document.main.excel_file_nm.value = '휴양시설이용 지원현황';
		}else if(bugt_cd == 'S006') {
			cHtml = "<b>동호인회</b> : "
				  + "<select name='detail_key' class='required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeHelper.OptListJs("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S006","","","", request)%></select> ";
			document.main.excel_file_nm.value = '사내동호인회 지원현황';
		}else if(bugt_cd == 'S700') {
			cHtml = "<b>세부사업명</b> : "
				  + "<select name='detail_key' class='required' style='width:170px'>"
				  + "<option value=''>전체</option><%=CodeHelper.OptListJs("PR_BUDTB_CODE01_LIST","LISTCODE","","2","S700","","","", request)%></select> ";
			document.main.excel_file_nm.value = '선물지급현황';		
		}else if(bugt_cd == '') {
			cHtml = "";
			document.main.excel_file_nm.value = '목적사업집행현황';
		}

		if(bugt_cd == 'S700' || bugt_cd == 'S900') { 
			document.getElementById('divApplyYmd').innerHTML = '지급일자';
			document.getElementById('divText').innerHTML = '세부정보를';
		}else { 
			document.getElementById('divApplyYmd').innerHTML = '신청일자';
			document.getElementById('divText').innerHTML = '목적사업비 신청내역을'; 
		}
		document.getElementById('divDetailKey').innerHTML = cHtml;
	}

	function page_init() {
		change_bugt_cd('');
	}
</script>

<iframe name="excelFrm" style="display:none"></iframe>
<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="select_yn"  		value="Y">
<input type="hidden" name="excel_file_nm"  	value="">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr> 
		<td valign="top" style="padding:10 10 0 10">
			<table width="100%" height="" cellpadding="0" cellspacing="0" border="0">
	        	<tr><td height="35" class="cont_title">목적사업비집행현황</td></tr>
		  	</table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr valign="top">
		<td align="center">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="10%" class="table01_title" align="center">목적사업</td>
					<td style="padding-left:5px">
						<select name="bugt_cd" title="목적사업" style="width:130px" onChange="change_bugt_cd(this.value.substring(0,4));">
							<option value="">전체</option>
						<% RsWrapper bizWp = CodeHelper.getRsWrapper("PR_BUDTB_CODE01_LIST","LISTCODE", "", "1","S","","","","",request);
							for(int i=0; i < bizWp.getLength(); i++) { if(bizWp.get("code",i).equals("S900")) { continue; } %>
	                		<option value="<%=bizWp.get("code",i)%>"><%=bizWp.get("data",i)%></option> 
	                	<% } %>
						</select>
					</td>
					<td width="10%" class="table01_title" align="center"><div id="divApplyYmd">신청일자</div></td>
					<td nowrap style="padding-left:5px">
						<input type="text" name="start_ymd" value="<%=box.get("start_ymd")%>" size="10" maxlength="8" class="tYMD" title="시작일" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.start_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a> ~
						<input type="text" name="end_ymd" value="<%=box.get("end_ymd")%>" size="10" maxlength="8" class="tYMD" title="종료일" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.end_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a>
					</td>
					<td width="10%" class="table01_title" align="center">
						<select name="search_key" style="width:90px">
							<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
							<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
							<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
						</select>
					</td>
					<td style="padding-left:5px"><input type="text" name="search_val" value="<%=box.get("search_val")%>" style="width:120px; border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');"></td>
					<td width="10%" align="center" class="table01_title">결재상태</td>
					<td style="padding-left:5px">
						<select name="sign_status" title="결재상태" style="width:80px">
							<option value=''>전체</option>
				            <%=CodeHelper.OptList(codeWp, "sign_status", box.get("sign_status"))%>
						</select>
					</td>
		  		</tr>
		  		<tr id="trSearch" height="28">
					<td class="table01_title" align="center">검색조건</td>
					<td colspan="7" nowrap style="padding-left:5px"><span id="divDetailKey"></span></td>
		  		</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr height="20">
				  	<td class="table_description"><span style="font-weight:bold; color:#01a1db;">성명을 클릭</span>하면 해당 사원의 <span id="divText"></span>&nbsp;조회할 수 있습니다.</td>
				    <td align="right">
			  			<a href="javascript:goSearch('N');"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goSearch('E');"><img src="/com/img/btn_excel.gif" border="0" align="absmiddle"></a>
				    </td>
				</tr>
          		<tr>
					<td id="frmArea" colspan="2" width="100%">
						<iframe name="ifrm" marginwidth="0" src="wel21002_list.do" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>
					</td>
				</tr>
			</table>
		</td>
  	</tr>
</table>
</form>