<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>자기개발비</title>
<script language="javascript">
	function goSearch() {
		removeMask("#main");
		document.main.action = 'wel01001_list.do';
		document.main.target = '_self';
		document.main.submit();
	}

	function goWrite() {
		var oldRow = document.main.selectedRow.value;
		if(oldRow != '') { document.getElementById("tr_"+oldRow).style.background = 'white'; }
		
		document.main.action = 'wel01003_edit.do';
		document.main.target = 'ifrm';
		document.main.submit();
	}

	function goDetail(apply_no) {
		removeMask("#main");
		document.main.action = 'wel01002_select.do?apply_no='+apply_no;
		document.main.target = 'ifrm';
		document.main.submit();
	}

	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('N');
	}
	
	function page_init() {
		goWrite();
	}
</script>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd"  	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="sort_order"  value="">
<input type="hidden" name="selectedRow" value="">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td valign="top" style="padding:10px 10px 0 10px;">
	      <table width="100%" height="" cellpadding="0" cellspacing="0" border="0">
	        <tr>
	          <td height="35" class="cont_title">자기개발비 신청</td>
	        </tr>
		  </table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr valign="top">
		<td align="center">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="10%" class="table01_title" align="center">신청일자</td>
					<td nowrap style="padding-left:5px">
						<input type="text" name="start_ymd" value="<%=box.get("start_ymd")%>" size="10" maxlength="8" class="tYMD" title="신청일자(부터)" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.start_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a> ~
						<input type="text" name="end_ymd" value="<%=box.get("end_ymd")%>" size="10" maxlength="8" class="tYMD" title="신청일자(까지)" style="border:1 solid gray"><a href="javascript:Calendar_D(document.main.end_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a>
					</td>
					<td width="10%" class="table01_title" align="center">
						<select name="search_key" style="width:90px">
							<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
							<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
							<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
						</select>
					</td>
					<td style="padding-left:5px"><input type="text" name="search_val" value="<%=box.get("search_val")%>" style="width:140px; border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');"></td>
					<td width="10%" align="center" class="table01_title">결재상태</td>
					<td style="padding-left:5px">
						<select name="sign_status" title="결재상태" style="width:80px">
							<option value=''>전체</option>
				            <%=CodeHelper.OptList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("sign_status"),"sign_status","","","","", request)%>
						</select>
					</td>
					<td nowrap align="center">
						<a href="javascript:goSearch()"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>
						<a href="javascript:goWrite();"><img src="/com/img/btn_new.gif" border="0" align="absmiddle"></a>
					</td>
		  		</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
				<tr>
				  	<td colspan="2" class="table_description">
				  		<span style="font-weight:bold; color:#01a1db;">신청일자를 클릭</span>하면 해당 자기개발비 신청 세부내역을 조회할 수 있습니다.
				  	</td>
				</tr>
          		<tr>
					<td width="40%" valign="top">
						<div id="divArea" style="width:100%;height:300px;overflow-y:auto">
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
							<tr height="28" align="center" class="table01_title">
								<td width="18%"><a href="javascript:goSort('t1.apply_ymd')">신청일자</a></td>
								<td width="30%"><a href="javascript:goSort('t3.dept_nm')">부서명</a></td>
								<td width="15%"><a href="javascript:goSort('t2.empl_nm')">성명</a></td>
								<td width="23%"><a href="javascript:goSort('t1.data01')">교육명</a></td>
								<td width="14%"><a href="javascript:goSort('t4.sign_status')">상태</a></td>
			          		</tr>
						<% if(rsWp.getLength() == 0) { %>
								<tr height="25"><td colspan="5" align="center">등록된 자료가 없습니다.</td></tr>
						<%}else { 
							  for(int i=0; i < rsWp.getLength(); i++) { %>
								<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand" onClick="set_backColor('<%=i%>');goDetail('<%=rsWp.get("apply_no",i)%>')"> 
									<td align="center"><%=rsWp.get("apply_ymd",i,Box.DEF_DATE_FMT)%></td>
									<td align="center"><%=rsWp.get("dept_nm",i)%></td>
									<td align="center"><%=rsWp.get("empl_nm",i)%></td>
									<td align="center"><%=rsWp.get("course_nm",i)%></td>
									<td align="center"><%=rsWp.get("sign_status_nm",i)%></td>
								</tr>
							<% } %>
						<% } %>			          		
						</table>
						</div>
					<% if(rsWp.getLength() > 0) { %>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
		        			<tr>
								<td align="center" style="padding-top:5px"><%=rsWp.getPageLine(request, 30, 5)%></td>
							</tr>
		    			</table>
					<% } %>
					</td>
				    <td id="frmArea" width="*" height="300" valign="top" style="padding-left:5px">
				    	<iframe name="ifrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="100%" scrolling="yes"></iframe>
				    </td>
				</tr>
			</table>
		</td>
  	</tr>
</table>
</form>