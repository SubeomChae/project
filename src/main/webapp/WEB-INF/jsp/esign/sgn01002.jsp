<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="lineWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="fileWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isSignLine = false;
	for(int i=0; i < lineWp.getLength(); i++) {
		if(uSesEnt.empl_no.equals(lineWp.get("sign_empl_no",i)) || uSesEnt.empl_no.equals(lineWp.get("real_empl_no",i))) {
			isSignLine = true; break;
		}
	}
	String open_scope = FormatUtil.nvl2(obox.get("open_scope"),"4");
	if(uSesEnt.empl_no.equals(obox.get("send_empl_no")) || uSesEnt.use_auth.startsWith("S") || isSignLine) { open_scope = "4"; }
	if(open_scope.equals("1")) {
		out.println("<script language='javascript'>");
		out.println("alert('비공개문서입니다.');");
		if(box.get("popup_yn").equals("Y")) { out.println("self.close();"); }
		out.println("</script>");
		return;
	}
%>
<%	String msg_no = box.get("msg_no");
	String report_id = "";
	String params = "";
	Box rptbox = CodeUtil.getRsBox("PR_REPORT_SQL", "SGN01002", msg_no, "","","","",box.get("dbo"));
	if(rptbox.get("msg_type").equals("SLP001") || rptbox.get("msg_type").equals("SLP008") || rptbox.get("msg_type").equals("SLP009")) { // 일반전표, 고유목적사업준비금, 지출결의서
		report_id = "WEB-INF/jsp/account/report/slp01001.jrf";
		params = "P_PARAM01!"+rptbox.get("msg_type")+","+rptbox.get("key02")+"!P_PARAM02!,"+rptbox.get("search_key");
	}else if(rptbox.get("msg_type").equals("SLP002")) {
		if(rptbox.get("key04").startsWith("S001")) { // 경조금
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s001.jrf";
			params = "P_DBO!"+uSesEnt.dbo+"!P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S002")) { //의료비
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s002.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S003")) { //학자금
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s003.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S004")) { //자기개발비
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s004.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S005")) { //휴양시설이용
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s005.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S006")) { //사내동호인회
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s006.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S017")) { //상해보험지원
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s017.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S018")) { //건강증진활동지원
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s018.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S023")) { //돌반지선물
			if(rptbox.get("key04").equals("S02302")) { //꽃바구니 신청
				report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s02302.jrf";
			}else {
				report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s023.jrf";
			}
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S024")) { //주택임차 및 구입비용 지원
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s024.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}else if(rptbox.get("key04").startsWith("S026")) { //체력단련비
			report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s026.jrf";
			params = "P_PARAM01!SLP002,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key")+","+rptbox.get("key04");
		}
	}else if(rptbox.get("msg_type").equals("SLP003")) { // 미지급금결제
		report_id = "WEB-INF/jsp/finance/report/fin21001.jrf";
		params = "P_PARAM01!"+rptbox.get("key02")+"!P_PARAM03!"+rptbox.get("msg_no");
	}else if(rptbox.get("msg_type").equals("SLP004")) { // 복지카드정산
		report_id = "WEB-INF/jsp/account/report/crd11001.jrf";
		params = "P_PARAM01!"+rptbox.get("key02")+"!P_PARAM03!"+rptbox.get("msg_no");
	}else if(rptbox.get("msg_type").equals("SLP005")) { // 선물지급
		report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/wel11001.jrf";
		params = "P_PARAM01!"+rptbox.get("key02")+","+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("key04")+"!P_PARAM03!"+rptbox.get("msg_no");
	}else if(rptbox.get("msg_type").equals("SLP006")) { // 대부금신청
		report_id = "WEB-INF/jsp/loan/report/lon01002.jrf";
		params = "P_PARAM01!SLP006,"+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("search_key");
		//response.sendRedirect("/com/redirect.do?reqUrl=loan/report/lon01002PDF&params="+obox.get("key03"));
	}else if(rptbox.get("msg_type").equals("SLP007")) { // 대부금상환		
		if(rptbox.get("key03").equals("L21")) { //정기
			report_id = "WEB-INF/jsp/loan/report/lon11001.jrf";
			params = "P_PARAM01!"+rptbox.get("key02")+","+rptbox.get("key04")+"!P_PARAM03!"+rptbox.get("msg_no");
		}else { //일시
			report_id = "WEB-INF/jsp/loan/report/lon12002.jrf";
			params = "P_PARAM01!"+rptbox.get("key04")+"!P_PARAM03!"+rptbox.get("msg_no");
		}
	}else if(rptbox.get("msg_type").equals("BOK001")) { // 목적사업지급(정기) 신청
		report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s800.jrf";
		params = "P_PARAM01!BOK001,"+rptbox.get("key01")+"!P_PARAM02!"+rptbox.get("search_key");
	}else if(rptbox.get("msg_type").equals("SLP010")) { // 목적사업지급(정기) 지급
		report_id = "WEB-INF/jsp/welfare/"+uSesEnt.dbo+"/report/s800pay.jrf";
		params = "P_PARAM01!"+rptbox.get("key02")+","+rptbox.get("key03")+"!P_PARAM02!"+rptbox.get("key04")+"!P_PARAM03!"+rptbox.get("msg_no")+","+rptbox.get("key05")+"!P_PARAM04!"+rptbox.get("key06")+"!";
	}
%>
<title>전자결재 세부</title>
<script language="javascript">
	function goSearch(msg_type, search_key) {
	<% if(open_scope.equals("2")) { %>
		alert('표지만 공개된 문서입니다.');
		go_tabpage('1','','');
		return;
	<% } %>
	
		var theURL = 'about:blank';
		var arr = search_key.split('|');
		if(msg_type == 'SLP002') { // 목적사업비 신청 */
			theURL = '/welfare/fd/wel01002_select.do?apply_no='+arr[2]+'&bugt_cd='+arr[3].substring(0,6);
		}else if(msg_type == 'SLP003') { // 미지급금 결제
			theURL = '/finance/fd/fin21002_list.do?slip_no='+arr[1];
		}else if(msg_type == 'SLP005') { // 선물지급
			theURL = '/welfare/fd/wel11001_list.do?std_yy='+arr[2]+'&bugt_cd='+arr[3]+"&msg_popup=Y";
		}else if(msg_type == 'SLP006') { // 대부금신청
			theURL = '/loan/fd/lon01002_select.do?loan_no='+arr[2];
		}else if(msg_type == 'SLP007') { // 대부금일시상환
			if(arr[2] == 'L21') {
				theURL = '/loan/fd/lon11001_list.do?std_yy='+arr[3].substring(0,4)+'&std_mm='+arr[3].substring(4,6)+"&msg_popup=Y";
			}else {
				theURL = '/loan/fd/lon12002_list.do?loan_no='+arr[3];
			}
		}else if(msg_type == 'SLP012') { //워크샵
			theURL = '/welfare/fd/wel12001_list.do?std_yy='+arr[2]+'&bugt_cd='+arr[3]+"&msg_popup=Y";
		}else if(msg_type == 'BOK001'){ // 목적사업신청(정기)
				theURL = '/welfare/fd/wel02002_select.do?apply_no='+arr[0]+'&bugt_cd='+arr[1].substring(0,6);	
		}else if(msg_type == 'SLP010'){ // 목적사업지급(정기)
				theURL = '/welfare/fd/wel03001_list.do?bugt_cd='+arr[2]+'&pay_ymd='+arr[3]+'&pay_no='+arr[4]+'&support_item='+arr[5]+"&msg_popup=Y";	
		}else {
			theURL = '/popup/fd/slipView.do?slip_no='+arr[1];
		}
		$('#sfrm').attr('src', theURL);
	}
	
	function goTabpage(tab_index, msg_type, search_key) {
		document.main.tab_index.value = tab_index;
		$("#sgnTabMenu li").removeClass('active');
		$("#sgnTabMenu #tabMenu"+tab_index).addClass('active');
		if(tab_index == 1) {
			$('#mesg01Table').show();
			$('#mesg02Table').hide();
		} else {
			$('#mesg01Table').hide();
			$('#mesg02Table').show();
	 		goSearch(msg_type, search_key);
		}
	}
	
	function file_upload_post() {
		removeMask(document.main);				
		document.main.action = 'sgn10.do?method=sgn01002_select&isEditable=Y';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function go_modify_scope() {
		displaySinjaxAlert(200,400,'처리중입니다. 잠시만 기다려 주십시오.');
		sinjax.updateWithParm('PR_COMTB_MESG01@UPDATE_SCOPE', ['msg_no','open_scope'], ['<%=obox.get("msg_no")%>', document.main.open_scope.value],'go_modify_scope');
	}
	function __go_modify_scope_post() { clearSinjaxAlert(); }
		
	$(function() {
		$(".page-logo-text").html("전자결재 세부");	
		goTabpage('1','','');
	});
</script>

<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="msg_no" 		value="<%=box.get("msg_no")%>">
<input type="hidden" name="tab_index"   value="">
<input type="hidden" name="pathKey"		value="groupware">
<input type="hidden" name="file_no"		value="">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">
<input type="hidden" name="file_cnt" 	value="">

<% boolean signOK = false; %>	
	<ul class="nav nav-tabs border-top" id="sgnTabMenu">
		<li class="active"">
			<li id="tabMenu1" onClick="goTabpage('1','','')">
				<a data-toggle="tab">표지</a>
			</li>
			<li id="tabMenu2" onClick="goTabpage('2','<%=obox.get("msg_type")%>','<%=obox.get("search_key")%>')" style="<%if(obox.get("msg_type").startsWith("ETC")){%>display:none<%}%>">
				<a data-toggle="tab"><%=obox.get("msg_type").equals("SLP005") && uSesEnt.corp_cd.equals("SABOK05") ? "연금지금":obox.get("msg_type_nm")%></a>
			</li>
		</li>
	</ul>
	<div id="mesg01Table">
		<div class="table-scrollable">
			<table class="table table-view table-bordered">
			<% 	RsWrapper signWp = lineWp;
				int line_cnt = signWp.getLength() < 3 ? 3 : signWp.getLength(); 
			%>
				<tr>
					<th rowspan="3" width="18%">결재</th>
				<% 	int pass_cnt = 0;
				   	for(int i=0; i < signWp.getLength(); i++) { 
				   		int span_cnt = 1;
				   		if(pass_cnt == 0) {
					   		for(int j=i+1; j < signWp.getLength(); j++) {
					   			if(!signWp.get("sign_step",j).equals(signWp.get("sign_step",i))) { break; }
					   			span_cnt++;
					   		} 
					   	%>
							<th colspan="<%=span_cnt%>" width="<%=Math.round(82*span_cnt/line_cnt)%>%"><%=signWp.get("sign_step_nm",i)%></th>
					<%		pass_cnt = span_cnt - 1;
					   	}else {
					   		pass_cnt--;
					   	}
					}				   
				%>	
				<% 	for(int i=signWp.getLength(); i < 3; i++) { out.println("<th width='"+Math.round(82/line_cnt)+"%'></th>"); } %>
				</tr> 
				<tr>
				<% 	for(int i=0; i < signWp.getLength(); i++) { %>	
					<td class="t-center"><%=signWp.get("sign_empl_nm",i)%><%if(!signWp.get("real_empl_no",i).equals("") && signWp.get("sign_empl_no",i).length() > 3 && !signWp.get("real_empl_no",i).equals(signWp.get("sign_empl_no",i))){%>(代)<%}%></td>
				<% 	} %>	
				<% 	for(int i=signWp.getLength(); i < 3; i++) { out.println("<td></td>"); } %>
			    </tr> 
				<tr>
				<% 	for(int i=0; i < signWp.getLength(); i++) { %>	
					<td class="t-center">
					<% if(signWp.get("sign_status",i).equals("4")) { %>
						<font color=red><b>반려</b></font>
					<% }else { %>
						<%=signWp.get("sign_date",i)%>
						<% if(!signWp.get("esign_file",i).equals("")) {
							signOK = true; %>	
							<br><img src="/upload_data/photo/<%=StringUtil.urlEncode(signWp.get("esign_file",i))%>" width="60" height="40" border="0" align="absmiddle" alt="<%=signWp.get("sign_empl_nm",i)%>" onerror="this.src='/com/img/noimg.gif'">
						<% } %>
					<% } %>
					</td>
				<% 	} %>	
				<% 	for(int i=signWp.getLength(); i < 3; i++) { out.println("<td></td>"); } %>
		       	</tr> 
			</table>
		</div>
		<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 120px)">
			<table class="table table-view table-bordered">
				<tr>
					<th>제목</th>
					<td colspan="3">
						<%if(!obox.get("open_scope").equals("") && !obox.get("open_scope").equals("4")){%><img src="/com/img/icon_noxo.gif" border=0 align="absmiddle" alt="<%=obox.get("open_scope_nm")%>"> <%}%>
						<input type="text" name="subject" value="<%=obox.get("subject")%>" maxlength="100" title="제목" style="width:90%;border:none; ime-mode:active;" readOnly>
						<input type="hidden" name="open_scope" value="<%=obox.get("open_scope")%>">
					</td>
	         	</tr> 
				<tr>
					<th width="18%">작성자</th>
					<td width="32%"><%=obox.get("send_empl_nm")%></td>
					<th width="18%">작성일</th>
					<td width="32%"><%=obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM)%></td>
	         	</tr> 
				<tr style="height:240px">
					<th>내용</th>
					<td colspan="3">
						<input type="hidden" name="opinion" value="">
						<%	request.setAttribute("initContents", obox.get("opinion"));
							request.setAttribute("contents_fld_nm", "opinion");
							request.setAttribute("form_name", "main");
							//request.setAttribute("editor_width", "680");
							request.setAttribute("content_width", "620");
							request.setAttribute("editor_height", "240");
							request.setAttribute("toolbar_advanced", "none");
							request.setAttribute("readonly", "true");
							request.setAttribute("display", "none");
						%>
						<%@ include file="/WEB-INF/jsp/com/daumeditor/incDaumEditor.jsp" %>
					</td>
	         	</tr> 
				<tr>
					<th>붙임문서
					<% if(box.get("isEditable").equals("Y") || uSesEnt.use_auth.startsWith("S")) { %>
					   <!-- <button id="btnSave" type="button" class="btn btn-primary btn-table" onclick="go_attach_file('groupware.pds.dir','<%=uSesEnt.dbo%>','<%=uSesEnt.dbo%>.COMTB_MESG01','<%=obox.get("msg_no")%>','&delOk=<%=obox.get("sign_order").equals("")?"N":"Y"%>');">추가</button>-->
					<% } %>
					</th>
					<td colspan="3" nowrap>
					<% if(open_scope.equals("3")) { %>
						비공개
					<% }else { %>
						<% for(int i=0; i < fileWp.getLength(); i++) { %>
							<a href="javascript:fileDownload(document.main, '<%=uSesEnt.dbo+"/"+fileWp.get("file_path",i)%>','<%=fileWp.get("file_nm",i)%>')">
							 <%=i+1%>. <%=fileWp.get("file_nm",i)%> (<%=fileWp.get("file_size",i,Box.THOUSAND_COMMA)%> Byte)&nbsp;
							 <img src="/com/img/ico_disk_s.png" alt="다운로드"></a><br>
						<% } %>
					<% } %>
					</td>
	         	</tr> 
			</table>
			<div class="table-bottom-control">
				<span style="width:100%;">
					<span style="float:right;padding-right:5px">
					<% if(!box.get("popup_yn").equals("Y") && !obox.get("sign_status_nm").equals("반려")) { %>
						<button type="button" class="btn dark" onClick="goSignRequest(document.main)"><img src="/com/img/ico_btn_edit.png">수정</button>
					<% } %>
					<% if(open_scope.compareTo("3") >=0) { %>
						<% if(obox.get("msg_type").equals("ETC001")) { %>
							<button type="button" class="btn dark" onClick="goHtmlViewer('htmlReport', '&msg_no=<%=obox.get("msg_no")%>')"><img src="/com/img/ico_btn_print.png">인쇄</button>
						<% }else { %>
							<button type="button" class="btn dark" onClick="goUbiViewer('<%=report_id%>', '<%=params%>')"><img src="/com/img/ico_btn_print.png">인쇄</button>
						<% } %>
					<% } %>
					</span>
				</span>
			</div>
		</div>
	</div>
</form>

<div id="mesg02Table" style="display:none">
	<iframe id="sfrm" name="sfrm" marginwidth="0" frameborder="0" style="width:100%;height:calc(100vh - 80px);" scrolling="yes"></iframe>
</div>