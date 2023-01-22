<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/com/include/excel_header.jsp" %>
<% } %>

<title>유지보수일지</title>

<script language="javascript">
	function goSearch(gbn) {
		var theURL = 'adm93001_list.do';
		if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=<%=box.get("corp_nm")%>_유지보수일지'; }

		removeMask("#main");				
		document.main.action = theURL;
		document.main.target = '_self';
		document.main.submit();
	}

	function goDetail(maint_no) {
		document.main.action = "adm93002_select.do?maint_no="+maint_no;
		document.main.target = "ifrm";
		document.main.submit();
	}

	function goWrite() {
		document.main.action = "adm93003_edit.do";
		document.main.target = "ifrm";
		document.main.submit();
	}

	function page_init() {
		goWrite();
	}
</script>

<% if(!box.get("excel_yn").equals("Y")) { %>
<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="selectedRow" value="">
<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr> 
		<td valign="top" style="padding:10 10 0 10">
	      	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	        	<tr><td height="35" class="cont_title">유지보수일지</td></tr>
		  	</table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table02">
		  		<tr height="28">
					<td width="10%" class="table01_title">요청일자</td>
					<td nowrap style="padding-left:5px">
						<input type="text" name="req_ymd_from" value="<%=box.get("req_ymd_from")%>" size="10" maxlength="8" title="요청일자(부터)" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.req_ymd_from)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a> ~ 
						<input type="text" name="req_ymd_to" value="<%=box.get("req_ymd_to")%>" size="10" maxlength="8" title="요청일자(까지)" class="tYMD" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.req_ymd_to)"><img src='/com/img/calender_icon.gif' align='absmiddle' border=0></a>
					</td>
					<td width="10%" class="table01_title">업체명</td>
					<td style="padding-left:5px">
						<select name="corp_cd" title="업체명" style="width:180px;" onChange="goSearch('N')">
							<option value=''>전체</option>
							<%=CodeHelper.OptList("PR_COMTB_CORP01_LIST","LISTCODE",box.get("corp_cd"),"corp_cd","","","","", request)%>
						</select>
					</td>
					<td width="10%" class="table01_title">처리상태</td>
					<td style="padding-left:5px">
						<select name="pro_status" title="처리상태">
							<option value=''>전체</option>
							<option value="1" <%=box.get("pro_status").equals("1")?"selected":""%>>진행중</option> 
							<option value="2" <%=box.get("pro_status").equals("2")?"selected":""%>>완료</option>
						</select>
					</td>
					<td width="10%" class="table01_title">
						<select name="search_gbn" title="검색조건" style="width:95%">
							<option value="1" <%=box.get("search_gbn").equals("1")?"selected":""%>>요청내용</option>
							<option value="1" <%=box.get("search_gbn").equals("2")?"selected":""%>>처리내용</option> 
							<option value="2" <%=box.get("search_gbn").equals("3")?"selected":""%>>요청자 성명</option>
							<option value="3" <%=box.get("search_gbn").equals("4")?"selected":""%>>처리담당자 성명</option>
						</select>
					</td>
					<td nowrap style="padding-left:5px">
						<input type="text" name="search_val" value="<%=box.get("search_val")%>" style="width:150px; border:1 solid gray; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('N');">
						<a href="javascript:goWrite()"><img src="/com/img/bn_write.gif" border="0"></a>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr height="28">
				 	<td class="table_description"><span style="font-weight:bold; color:#01a1db;">요청내용을 클릭</span>하면 해당 세부내용을 조회할 수 있습니다. (<font color="purple" size="2.5">■</font> 색상은 진행중 표시.)</td>
					<td align="right" style="padding:5 0 0 0">
						<a href="javascript:goSearch('N')"><img src="/com/img/btn_search.gif" border="0"></a>	
						<a href="javascript:goSearch('E')"><img src="/com/img/btn_excel.gif" border="0"></a>
					</td>
				</tr>
			</table>
<% } %>
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
			<% if(box.get("excel_yn").equals("Y") && (!box.get("req_ymd_from").equals("") || !box.get("req_ymd_to").equals(""))) { %>
				<tr align="right">
					<td>기간 : <%=box.get("req_ymd_from",Box.DEF_DATE_FMT)%> ~ <%=box.get("req_ymd_to",Box.DEF_DATE_FMT)%></td>
				</tr>
			<% }  %>
				<tr>
					<td width="50%" valign="top">
						<div id="divArea" style='width:100%;height:600;overflow-y:auto'>
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="28" align="center" class="table01_title">
								<td width="8%">No</td>
								<td width="15%">요청일자</td>
						<% if(box.get("excel_yn").equals("Y")){ %>
								<td width="6%">요청부서</td>
								<td width="6%">요청자 성명</td>
								<td width="6%">요청구분</td>
						<% } %>
								<td width="*">요청내용</td>
						<% if(box.get("excel_yn").equals("Y")) { %>
								<td width="20%">처리내용</td>
								<td width="10%">처리일자</td>
								<td width="6%">처리담당자</td>
						<% }else { %>
								<td width="20%">업체명</td>
						<% } %>
							</tr>
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="4" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						   for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr id="tr_<%=i%>" height="28" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand" onClick="set_backColor('<%=i%>');goDetail('<%=rsWp.get("maint_no",i)%>')">
								<td align="center"><%=box.get("excel_yn").equals("Y") ? String.valueOf(i+1) : rsWp.get("row_num",i)%></td>
								<td align="center"><%=rsWp.get("req_ymd",i,Box.DEF_DATE_FMT)%></td>
						<% if(box.get("excel_yn").equals("Y")) { %>
								<td align="center"><%=rsWp.get("req_dept_nm",i)%></td>
								<td align="center"><%=rsWp.get("req_person_nm",i)%></td>
								<td align="center"><%=rsWp.get("req_gbn",i)%></td>
								<td><%=rsWp.get("req_content",i)%></td>
						<% }else { %>
								<td><%if(DateUtil.dayDiff(rsWp.get("sys_reg_date",i),DateUtil.toString("yyyyMMdd")) <= 1) {%> <img src="/com/img/ico_new_s.gif" border="0"> <%}%><font color="<%=rsWp.get("end_ymd",i).equals("")?"purple":""%>"><%=StringUtil.fixLength(rsWp.get("req_content",i),20)%></font></td>
						<% }  %>
						<% if(box.get("excel_yn").equals("Y")) { %>
								<td><%=rsWp.get("pro_content",i)%></td>
								<td align="center"><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%><%if(!rsWp.get("end_ymd",i).equals("") && !rsWp.get("end_ymd",i).equals(rsWp.get("start_ymd",i))){%>~<%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%><%}%></td>
								<td align="center"><%=rsWp.get("pro_person_nm",i)%></td>
						<% }else { %>
								<td align="center"><%=StringUtil.replace(rsWp.get("corp_nm",i)," 사내근로복지기금","")%></td>
						<% } %>
							</tr>
					<% 	   }
					   } %>
						</table>
						</div>
					<% if(rsWp.getLength() > 0 && !box.get("excel_yn").equals("Y"))  { %>	
		    			<table width="100%" border="0" cellspacing="0" cellpadding="0">
		       			 	<tr>
								<td align="center" style="padding-top:5px"><%=rsWp.getPageLine(request, 30, 5)%></td>
							</tr>
		  				</table>
					<% } %>	
					
					</td>
				<% if(!box.get("excel_yn").equals("Y")) { %>
					<td id="frmArea" width="*" valign="top" style="padding-left:10px">
						<iframe name="ifrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="500" scrolling="no"></iframe>
					</td>
				<% } %>	
				</tr>
			</table>		    
		</td>
	</tr>
</table>
</form>