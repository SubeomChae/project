<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box" class="egovframework.cbiz.Box" scope="request" />
<jsp:useBean id="obox" class="egovframework.cbiz.Box" scope="request" />
<jsp:useBean id="rsWp" class="egovframework.cbiz.RsWrapper" scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<title>일반문서</title>
<script language='javascript'>
	function goSearch(gbn) {
		if (formValidate("#main")) {
			var theURL = 'sgn41001_list.do';
			removeMask("#main");				
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goWrite() {
		wdt = 950; hgt = screen.height - 100;
		xPos = Math.ceil((screen.width - wdt) / 2);
		yPos = Math.ceil((screen.height - hgt) / 2);
		window.open("/esign/pd/sgn01001.do?popup_yn=Y&msg_type=ETC001&body_hgt="+hgt, "signRequest", "width="+wdt+",height="+hgt+",menubar=no,toolbar=no,scrollbars=yes,status=yes,resizable=no,left="+xPos+",top=0");
	}

	function goSelect(msg_no, sign_status_nm) {
		if(sign_status_nm == '작성중' || sign_status_nm == '반려') {
			document.main.msg_no.value = msg_no;
			document.main.sign_status_nm.value = sign_status_nm;
			goSignRequest(document.main);
		}else {
			goDocuViewer(msg_no);
		}
	}
</script>
<iframe name="excelFrm" style="display:none"></iframe>
<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="msg_no"  		value="">
<input type="hidden" name="sign_status_nm"  value="">
<input type="hidden" name="select_yn"  		value="Y">

	<h1 class="page-title">일반문서</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width: 10%;">
			<col style="width: 22%;">
			<col style="width: 10%;">
			<col style="width: 18%;">
			<col style="width: 10%;">
			<col style="width: 40%; ">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">기안일자</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd", Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="결산반영일(부터)" class="form-control required tYMD">
							<span class="input-group-btn">
								<button class="btn dark" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd", Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="결산반영일(까지)" class="form-control required tYMD">
							<span class="input-group-btn">
								<button class="btn dark" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</div>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>문서제목</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>기안자성명</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>기안자사번</option>
					</select>
				</td>
					<td><input type="text" name="search_val" value="<%=box.get("search_val")%>" class ="form-control" style="width:180px;" onkeydown="if(event.keyCode == 13) goSearch('N');"></td>
				<td class="td-head">결재상태</td>
				<td colspan="3">
					<select name="sign_status" class="bs-select form-control" title="결재상태" style="width:80px">
						<option value=''>전체</option>
						<option value='3' <%=box.get("sign_status").equals("3")?"selected":""%>>완료</option>
						<option value='2' <%=box.get("sign_status").equals("2")?"selected":""%>>진행</option>
						<option value='1' <%=box.get("sign_status").equals("1")?"selected":""%>>대기</option>
						<option value='0' <%=box.get("sign_status").equals("0")?"selected":""%>>작성중</option>
						<option value='4' <%=box.get("sign_status").equals("4")?"selected":""%>>반려</option>
					</select>
				
					<span class="f-right marR60">
						<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
					</span>
				</td>
			</tr>
		</tbody>
	</table>		    
    
	<div id="divListData" class=" contentsRow">
	
	<div class="table-top-guide">
		<span style="color:#01a1db;">문서제목을 클릭</span>하면 일반문서 세부내용을 조회할 수 있습니다.
	</div>
	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 160px);">
		<table class="table table-striped table-bordered table-hover order-column">
			<tr height="28" align="center" class="table01_title">
				<th>문서번호 </th>
				<th>문서제목 </th>
				<th>기안일시 </th>
				<th>생산부서 </th>
				<th>기안자  </th>
				<th>붙임   </th>
				<th>결재상태 </th>
			</tr> 
			<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
			<tr height="25"><td colspan="7" align="center">검색된 자료가 없습니다.</td></tr>
			<% }else if(rsWp.getLength() > 0) {
			for(int i = 0; i < rsWp.getLength(); i++) {	%>
			<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
				<td align="center"><span style="letter-spacing:0px"><%=rsWp.get("sign_status_nm",i).equals("작성중")?"":FormatUtil.msgNo(rsWp.get("msg_no",i))%></span></td>
				<td style="letter-spacing:-1px"><a href="javascript:goSelect('<%=rsWp.get("msg_no",i)%>','<%=rsWp.get("sign_status_nm",i)%>')"><%=StringUtil.getReplaceSpecialCharacters(rsWp.get("subject",i))%></a></td>
				<td align="center"><%=rsWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
				<td align="center" style="letter-spacing:-1px"><%=rsWp.get("send_dept_nm",i)%></td>
				<td align="center" style="letter-spacing:-1px"><%=rsWp.get("send_empl_nm",i)%></td>
				<td align="center" style="letter-spacing:-1px"><%if(rsWp.getInt("file_cnt",i)>0){%><img src="/com/img/icon_clip.gif" border="0" align="absmiddle"><%}%></td>
				<td align="center" style="letter-spacing:-1px"><%=rsWp.get("sign_status_nm",i)%></td>
			</tr>	
		<%}
		} %>
		</table>
	</div>
	
	<% if(rsWp.getLength() > 0) { %>	
		<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
	<% } %>
</form>