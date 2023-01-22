<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/com/include/excel_header.jsp" %>
<% } %>

<title>개인별 목적사업지원현황</title>

<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'wel22001_list.do';
			if(gbn == 'E') { theURL = 'wel22001_excel.do'; }
	
			removeMask("#main");				
			document.main.action = theURL;
			document.main.target = gbn == 'E' ? 'excelFrm' : '_self';
			document.main.submit();
		}
	}
</script>

<% if(!box.get("excel_yn").equals("Y")) { %>
<iframe name="excelFrm" style="display:none"></iframe>
<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="select_yn" 	value="Y">
<input type="hidden" name="excel_file_nm" value="개인별목적사업지원현황">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr> 
		<td valign="top" style="padding:10px 10px 0 10px;">
	      <table width="100%" height="" cellpadding="0" cellspacing="0" border="0">
	        <tr>
	          <td height="35" class="cont_title">개인별 목적사업지원현황</td>
	        </tr>
		  </table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr valign="top">
		<td align="center">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="12%" class="table01_title" align="center">기준년도</td>
					<td style="padding-left:5px">
						<select name="std_yy" title="기준년도" style="width:100px" onChange="goSearch('N')">
	            			<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2013",DateUtil.nextYear(),"desc","년")%>
						</select>
					</td>
					<td width="12%" align="center" class="table01_title">
						<select name="search_key" style="width:90px">
							<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
							<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
							<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
						</select>
					</td>
					<td style="padding-left:5px">
						<input type="text" name="search_val" value="<%=box.get("search_val")%>" style="width:150px;border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
					</td>
				    <td align="center">
			  			<a href="javascript:goSearch('N');"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goSearch('E');"><img src="/com/img/btn_excel.gif" border="0" align="absmiddle"></a>
				    </td>
		  		</tr>
			</table>		    
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr height="20">
				  	<td class="table_description">
				  		<span style="font-weight:bold; color:#01a1db;">성명을 클릭</span>하면 해당 임직원 세부정보를 조회할 수 있습니다.
				  	</td>
				  	<td align="right" valign="bottom">(단위 : 원)</td>
				</tr>
          		<tr>
					<td colspan="2" width="100%">
						<div id="divArea" style="width:100%;height:250px;overflow-y:auto">
<% } %>
					<% RsWrapper codeWp = CodeHelper.getRsWrapper("PR_BUDTB_CODE01_LIST","LIST001", "", "S","","","N","","",request); 
					   int column_cnt = codeWp.getLength() + 4; int col_width = 100 / column_cnt; %>	
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="28" align="center" class="table01_title">
								<td width="<%=col_width%>%">사번</td>
								<td width="<%=col_width%>%">성명</td>
								<td width="<%=col_width%>%">부서명</td>
							<% for(int k=0; k < codeWp.getLength(); k++) { %>	
								<td width="<%=col_width%>%"><%=codeWp.get("bugt_nm",k)%></td>
							<% } %>	
								<td width="<%=col_width%>%">합계</td>
			          		</tr> 
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="<%=column_cnt%>" align="center">검색된 자료가 없습니다.</td></tr>
					<% }else {
					   	   for(int i=0; i < rsWp.getLength(); i++) { %>
					   	   <% if(rsWp.get("empl_nm",i).equals("합계")) { %>
							<tr height="25" bgcolor="f6f6f6"> 
					   	   <% }else { %>
							<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
					   	   <% } %>
								<td align="center"><%=rsWp.get("empl_no",i)%></td>
								<td align="center"><%if(!box.get("excel_yn").equals("Y") && !rsWp.get("empl_nm",i).equals("합계")){%><a href="javascript:go_employee_info('<%=rsWp.get("empl_no",i)%>')"><%}%><%=rsWp.get("empl_nm",i)%></a></td>
								<td align="center" style="letter-spacing:-1px"><%=rsWp.get("dept_nm",i)%></td>
							<% for(int k=0; k < codeWp.getLength(); k++) { %>	
								<td align="right" style="padding-right:2px"><%=rsWp.get("amt_"+codeWp.get("bugt_cd",k).toLowerCase(),i,Box.THOUSAND_COMMA)%></td>
							<% } %>	
								<td align="right" style="padding-right:2px"><%=rsWp.get("amt_tot",i,Box.THOUSAND_COMMA)%></td>
							</tr>	
						<% } %>
					<% } %>
						</table>
						</div>
<% if(!box.get("excel_yn").equals("Y")) { %>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<% if(rsWp.getLength() > 0) { %>
					<td width="100%" align="center"><%=rsWp.getPageLine(request, 50, 10)%></td>
				<% } %>
				</tr>
			</table>
		</td>
  	</tr>
</table>
</form>
<% } %>