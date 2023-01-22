<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="wsfw.lib.util.*,
				 wsfw.lib.CD,
                 wsfw.comsvc.CodeHelper,
				 java.util.*" %>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"		class="wsfw.lib.util.Box"          scope="request" />
<jsp:useBean id="rsWp"    	class="wsfw.lib.dao.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" 	class="wsfw.biz.com.SesUserEntity" scope="session" />
<html>
<head>
<title>::: 증빙파일 첨부 :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/com/include/css/style.css" id="style_css">
<script language="javascript">	
	var rownum = <%=rsWp.getLength()%>;
	function go_add_tr() {
		var cnt = 0;
		for(var i=0; i < rownum; i++) {
			if(isObject('file_path'+i)) { cnt++; }
		}
		if(!isEmpty(document.main.maxRow) && cnt >= parseInt2(document.main.maxRow)) {
			alert('첨부파일은 ' + document.main.maxRow.value + '개 까지만 등록할 수 있습니다.');
			return;
		}

		var tbody = document.getElementById("MyTable").getElementsByTagName("TBODY")[0];
		var row = document.createElement("TR");
       	row.id = "tr_"+rownum; row.align="center"; row.height="25";

		var td0 = document.createElement("TD");
		var td1 = document.createElement("TD");
		var td2 = document.createElement("TD");

		td0.innerHTML = "<input type='text' name='file_desc"+rownum+"' maxlength='100' class='required' title='파일설명' style='border:1 solid gray;width:98%'>";
		td1.innerHTML = "<input type='file' name='file_path"+rownum+"' class='required' title='파일명' style='border:1 solid gray;width:98%' onChange=\"document.main['file_desc'+"+rownum+"].value=extract_filename(this.value, false);\">";
		td2.innerHTML = "<a href=\"javascript:go_del_tr('tr_"+rownum+"','','');\"><img src='/com/img/icon_remove.gif' border='0' align='absmiddle'></a>";

		for(var i=0; i <= 2; i++) { row.appendChild(eval("td"+i)); }
		tbody.appendChild(row);
		rownum++;
    }

	function go_del_tr(id, file_no, file_path) {
		if(file_no == '') {
			var cNode = document.getElementById(id);
			cNode.parentNode.removeChild(cNode);
		}else {
			if(confirm('첨부파일을 삭제하시겠습니까?')) {
				document.main.file_no.value = file_no;
				document.main.file_path.value = file_path;
				document.main.action = '/com/other.do?method=fileAttach_delete';
				document.main.submit();
			}
		}
	}
	
	function go_save() {
		if(formValidate(document.main)) {
			for(var i=0; i < rownum; i++) {
				if(isObject('file_path'+i)) {
			    	if(document.all['file_path'+i].value.indexOf("'") >= 0) {
			    		alert('파일명에 따옴표는 사용할 수 없습니다.');
			    		document.all['file_path'+i].focus();
			    		return;
			    	}
				}
			}
			
			if(confirm('저장하시겠습니까?')) {
				removeMask(document.main);
				document.main.input_cnt.value = rownum;
				document.main.action = '/com/other.do?method=fileAttach_update';
				document.main.submit();
			}
		}		
	}

	function go_download(file_no, file_nm, file_path) {
		document.main.file_no.value = file_no;
		document.main.file_nm.value = file_nm;
		document.main.file_path.value = file_path;
		document.main.action = '/com/file.do?method=downFile&proc=PR_COMTB_FILE01';
		document.main.submit();
	}
	
	function page_init() {
		if(document.main.insOk.value == 'Y' && rownum == 0) {
			go_add_tr();
		}
	}
</script>
<style type="text/css">html{overflow:hidden;}</style>
</head>
<body>
<form name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="pathKey"		value="<%=box.get("pathKey")%>">
<input type="hidden" name="subDir" 		value="<%=box.get("subDir")%>">
<input type="hidden" name="ref_table" 	value="<%=box.get("ref_table")%>">
<input type="hidden" name="ref_pk" 		value="<%=box.get("ref_pk")%>">
<input type="hidden" name="insOk" 		value="<%=FormatUtil.nvl2(box.get("insOk"),"Y")%>">
<input type="hidden" name="delOk" 		value="<%=FormatUtil.nvl2(box.get("delOk"),"Y")%>">
<input type="hidden" name="maxRow" 		value="<%=box.get("maxRow")%>">
<input type="hidden" name="file_no"		value="">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">
<input type="hidden" name="input_cnt" 	value="">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="10" bgcolor="d3d0c7"></td>
  	<td height="5" bgcolor="d3d0c7"></td>
	<td width="10" bgcolor="d3d0c7"></td>
  </tr>
  <tr> 
    <td width="10" height="35" bgcolor="d3d0c7"></td>
	<td valign="top" height="35"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr> 
				<td width="15"></td>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr><td height="5"></td></tr>
						<tr> 
							<td height="35" class="sub_cont_title" vAlign="middle">
								<IMG height="13" src="/com/img/title_bullet.gif" width="17" border="0" align="absmiddle"> 첨부파일 등록
							</td>
						</tr>
					</table>
				</td>
				<td width="7"></td>
			</tr>
		</table>
	</td>
	<td width="10" bgcolor="d3d0c7"></td>
  </tr>
  <tr>
    <td width="10" bgcolor="d3d0c7">&nbsp;</td>
    <td align="center" valign="top">
	  <table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
		<tr height="20">
		  	<td class="table_description"><span style="font-weight:bold; color:#01a1db;">첨부파일명을 클릭</span>하면 해당 파일을 다운로드할 수 있습니다.</td>
		</tr>
  		<tr>
		  <td width="100%">
			<table id="MyTable" width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="25" align="center" class="table01_title">
					<td width="35%">파일설명</td>
					<td width="60%">파일명</td>
					<td width="5%"><a href="javascript:go_add_tr();"><img src="/com/img/icon_add3.gif" border="0" align="absmiddle"></a></td>
          		</tr> 
			<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr<%=i%>" height="25">
					<td style="font-size:11px;padding-left:5px"><%=rsWp.get("file_desc",i)%></td>
					<td style="font-size:11px;padding-left:5px">
						<a href="javascript:go_download('<%=rsWp.get("file_no",i)%>','<%=rsWp.get("file_nm",i)%>','<%=box.get("subDir")%><%=box.get("subDir").equals("")?"":"/"%><%=rsWp.get("file_path",i)%>')">
						&nbsp;<img src="/com/img/icn_disk.gif" align="absmiddle" border="0"> <%=rsWp.get("file_nm",i)%> (<%=rsWp.get("file_size",i,Box.THOUSAND_COMMA)%> Byte)</a>
					</td>
					<td align="center">
					<% if(!box.get("delOk").equals("N")) { %>
						<a href="javascript:go_del_tr('tr_<%=i%>','<%=rsWp.get("file_no",i)%>','<%=rsWp.get("file_path",i)%>');"><img id="btnDel<%=i%>" src="/com/img/icon_remove.gif" border="0" align="absmiddle"></a>
					<% } %>
					</td>
				</tr>
			<% } %>
			</table>
		<% if(!box.get("insOk").equals("N")) { %>
  			<table width="100%" border="0" cellpadding="0" cellspacing="0">
  				<tr height="30">
					<td align="center">
						<a href="javascript:go_save();"><img id="btnSave" src="/com/img/bn_save.gif" border="0" align="absmiddle"></a>
					</td>
				</tr>
			</table>
		<% } %>
		  </td>
	    </tr>
	  </table>
    </td>
    <td width="10" bgcolor="d3d0c7">&nbsp;</td>
  </tr>
  <tr align="center">
    <td width="10" height="25" bgcolor="d3d0c7"></td>
    <td height="25" bgcolor="d3d0c7">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="129"></td>
          <td>&nbsp;</td>
          <td width="55"></td>
        </tr>
      </table>
    </td>
    <td width="10" height="25" bgcolor="d3d0c7">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>