<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="fileWp"	class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 기안문 작성  -->

<%	if(obox.get("opinion").equals("")) {
		String opinion = "";
		if(obox.get("msg_type").equals("SLP002")) { // 목적사업신청
			opinion = obox.get("subject") + "<br>"
					+ "- 신청일자 : " + box.get("apply_ymd") + "<br>"
					+ "- 신청금액 : " + box.get("apply_amt") + "원<br>"
					+ "- 비고 : " + box.get("etc_remark");
		}else if(obox.get("msg_type").equals("SLP003")) { // 미지급금결제
			opinion = obox.get("subject") + "<br>"
					+ "- 증빙일자 : " + box.get("proof_ymd") + "<br>"
					+ "- 지출금액 : " + box.get("slip_amt") + "원";
		}else if(obox.get("msg_type").equals("SLP004")) { // 복지카드정산
			opinion = obox.get("subject") + "\n"
					+ "- 청구년월 : " + box.get("apply_ym") + "<br>"
					+ "- 청구건수 : " + box.get("apply_cnt") + "건<br>"
					+ "- 청구금액 : " + box.get("apply_amt") + "원";
		}else if(obox.get("msg_type").equals("SLP005")) { // 선물지급
			opinion = obox.get("subject") + "\n"
					+ "- 지급일자 : " + box.get("pay_ymd") + "<br>"
					+ "- 지급인원 : " + box.get("member_cnt") + "명<br>"
					+ "- 총지급액 : " + box.get("pay_amt") + "원";
		}else if(obox.get("msg_type").equals("SLP012")) { // 워크샵
			opinion = obox.get("subject") + "\n"
					+ "- 지급일자 : " + box.get("pay_ymd") + "<br>"
					+ "- 지급인원 : " + box.get("member_cnt") + "명<br>"
					+ "- 총지급액 : " + box.get("pay_amt") + "원";
		}else if(obox.get("msg_type").equals("SLP006")) { // 대부금신청
			opinion = StringUtil.arrayCol(box.get("sign_arr"),1,"|") + "을 신청합니다.<br><br>"
					+ "- 신청자 : " + StringUtil.arrayCol(box.get("sign_arr"),2,"|") + "<br>"
					+ "- 신청일자 : " + StringUtil.arrayCol(box.get("sign_arr"),3,"|") + "<br>"
					+ "- 대부금액 : " + StringUtil.arrayCol(box.get("sign_arr"),4,"|") + "원<br>"
					+ "- 대부용도 : " + StringUtil.arrayCol(box.get("sign_arr"),5,"|");
		}else if(obox.get("msg_type").equals("SLP007")) { // 대부금상환	
			if(StringUtil.arrayCol(obox.get("search_key"),3,"|").equals("L21")) {  //정기상환
				opinion = obox.get("subject") + "<br>"
						+ "- 대상자 : " + box.get("refund_cnt") + "명<br>"
						+ "- 원금상환 : " + box.get("refund_sum") + "원<br>"
						+ "- 이자상환 : " + box.get("intr_sum") + "원";
			}else {
				opinion = obox.get("subject") + "\n"
						+ "- 상환일자 : " + box.get("refund_ymd") + "<br>"
						+ "- 원금상환 : " + box.get("refund_amt") + "원";
				if(!box.get("intr_amt").equals("")) {
					opinion += "<br>- 이자상환 : " + box.get("intr_amt") + "원";
				}
			}
		}else if(obox.get("msg_type").equals("BOK001")) {  // 목적사업 신청(정기)
			opinion = obox.get("subject") + "<br>"
					+ "  - 신청일자 : " + box.get("apply_ymd") + "<br>"
					+ "  - 신청금액 : " + box.get("apply_amt") + "원";
		}else if(obox.get("msg_type").equals("SLP010")) {  // 목적사업 지급(정기)
			opinion = obox.get("subject") + "<br>"
					+ " - 대상기간 : " + box.get("target_term") + "<br>"
					+ " - 지급인원 : " + box.get("member_cnt") + "명<br>"
					+ " - 총지급액 : " + box.get("pay_amt") + "원";
		}
		obox.put("opinion", opinion);
	}
%>

<script language="javascript">
	function go_search() {
		removeMask("#main");				
		document.main.action = 'sgn01001.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	var fileRow = <%=fileWp.getLength()%>;
	// 기안문 임시저장
	function goSave(save_gbn) {
		if(formValidate("#main")) {
			if(save_gbn == 'tempSave' || <%=obox.get("sign_status_nm").equals("대기")%>) {
				for(var i=0; i < fileRow; i++) {
					if(isObject('attach_doc'+i)) {
				    	if(document.all['attach_doc'+i].value.indexOf("'") >= 0) {
				    		alert('파일명에 따옴표는 사용할 수 없습니다.');
				    		document.all['attach_doc'+i].focus();
				    		return;
				    	}
					}
				}
			}
			if(confirm('저장하시겠습니까?')) {
				removeMask('#main');
				Editor.save();
				if(save_gbn == 'tempSave') {
					document.main.file_cnt.value = fileRow;
					ajaxSubmitForm('sgn01001_update.do?save_flag='+save_gbn,"#main", function(rtn) {
						if(rtn.isOk == "Y") {
							toastPop1('저장되었습니다.');
							opener.goSearch();
							window.close();
						}else {
							alert(rtn.errMsg);
						}
					});
				}else if(save_gbn == 'saveOnly') {
					document.main.file_cnt.value = fileRow;
					ajaxSubmitForm('sgn01002_update.do?isEditable=Y',"#main", function(rtn) {
						if(rtn.isOk == "Y") {
							toastPop1('저장되었습니다.');
							opener.goSearch();
							window.close();
						}else {
							alert(rtn.errMsg);
						}
					});
				}
			}
		}
	}
	
	// 기안문(임시저장) 삭제
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#main");
			ajaxSubmitForm('sgn01001_delete.do',"#main", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					opener.goSearch();
					window.close();
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goApply() {
		if(formValidate("#main")) {
			for(var i=0; i < fileRow; i++) {
				if(isObject('attach_doc'+i)) {
			    	if(document.all['attach_doc'+i].value.indexOf("'") >= 0) {
			    		alert('파일명에 따옴표는 사용할 수 없습니다.');
			    		document.all['attach_doc'+i].focus();
			    		return;
			    	}
				}
			}
			
		<% if((box.get("msg_type").equals("ETC001") || obox.get("msg_type").equals("ETC001")) && "작성중,반려".indexOf(obox.get("sign_status_nm")) >= 0) { %>
			var signWp = new Array();
			var lineCnt = 0;
			var max_step = '';
			
			// 협조(20)
			for(var i=0; i < empl20_cnt; i++) {
				try {
					signWp[lineCnt++] = '20'+document.all['sign_empl20'+i].value;
				}catch(e) {}
			}
		
			// 선임,팀장,임원,대표이사(31~35)
			for(var i=31; i <= 35; i++) {
				try {
					var empl_no = eval('document.saveForm.sign_empl'+i).value;
					if(empl_no != '') {
						signWp[lineCnt++] = i + empl_no;
						if(i > max_step) { max_step = i; }
					}
				}catch(e) {}
			}
			if(max_step == '' || max_step < 32) {
				alert('최종 결재권자는 팀장 이상으로 지정해야 합니다.');
				return;
			}

			// 참조(40)
			for(var i=0; i < empl40_cnt; i++) {
				try {
					signWp[lineCnt++] = '40'+document.all['sign_empl40'+i].value;
				}catch(e) {}
			}
				
			// 순위매기기
			var sign_step = '';
			var sign_empl_no = '';
			var sign_order = '';
			var rank = 1;
			var cnt20 = 0;
			for(var i=0; i < signWp.length; i++) {
				sign_step += signWp[i].substring(0,2) + 'Ð';
				sign_empl_no += signWp[i].substring(2) + 'Ð';
				if(signWp[i].substring(0,2) == '20') { 
					cnt20++; if(cnt20 == 1) { rank++; }
					sign_order += (rank < 10 ? '0' : '') + rank + 'Ð';
				}else if(signWp[i].substring(0,2) == '40') { 
					sign_order += '00' + 'Ð';
				}else { 
					rank++; 
					sign_order += (rank < 10 ? '0' : '') + rank + 'Ð';
				}
			}
			document.main.sign_step.value = sign_step;
			document.main.sign_empl_no.value = sign_empl_no;
			document.main.sign_order.value = sign_order;
		<% } %>	
			if(confirm('결재를 올리시겠습니까?')) {
				removeMask("#main");
				Editor.save();
				document.main.file_cnt.value = fileRow;
				ajaxSubmitForm('sgn01001_update.do',"#main", function(rtn) {
					if(rtn.isOk == "Y") {
						if(document.main.popup_yn.value == 'Y' && document.main.msg_type.value != 'ETC001'){
							opener.signRequestPost(); 
							window.close();
						}else{
							opener.goSearch(); 
							window.close();
						}
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}		
	}
	function fileUpload() {
		$("#upload_file").click();
	}
	
	function goUpload() {
		if(confirm('업로드하시겠습니까?')) {
			removeMask("#main");
			ajaxSubmitForm("sgn01001_upload_file.do","#main", function(rtn) {
				if(rtn.isOk == "Y") {
					go_upload_file_post(rtn.file_nm, rtn.file_path, rtn.file_type, rtn.file_size);
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function go_upload_file_post(file_nm, file_path, file_type, file_size) {
		var tbody = document.getElementById("fileListTable").getElementsByTagName("TBODY")[0];
		var row = document.createElement("TR");
		row.id = "fileListRow"+fileRow;
		var td0 = document.createElement("TD"); td0.align="left"; td0.style.border="none"; td0.style.fontSize="11px"; 
		var td1 = document.createElement("TD"); td1.width="120"; td1.align="center"; td1.style.border="none"; td1.style.fontSize="11px"; 
		var td2 = document.createElement("TD"); td2.width="100"; td2.align="center"; td2.style.border="none"; td2.style.fontSize="11px"; 
		var td3 = document.createElement("TD"); td3.width="30"; td3.align="center"; td3.style.border="none";


		td0.innerHTML = "&nbsp;<img src='/com/img/icn_disk.gif' align='absmiddle' border='0'> <a href=\"javascript:fileDownload(document.temp, '<%=uSesEnt.dbo%>/temp/"+file_path+"')\">" + file_nm + "</a>" 
					  + "<input type='hidden' name='file_no"+fileRow+"' value=''>"
					  + "<input type='hidden' name='file_nm"+fileRow+"' value='"+file_nm+"'>"
					  + "<input type='hidden' name='file_path"+fileRow+"' value='"+file_path+"'>"
					  + "<input type='hidden' name='file_type"+fileRow+"' value='"+file_type+"'>"
					  + "<input type='hidden' name='file_size"+fileRow+"' value='"+file_size+"'>";
		td1.innerHTML = insertComma(file_size);
		td2.innerHTML = file_type;
		td3.innerHTML = "<a href=\"javascript:goRemoveFile('"+fileRow+"');\"><img src='/com/img/icon_tresh.png' border='0' align='absbottom' alt='삭제'></a>";
		for(var j=0; j <= 3; j++) { row.appendChild(eval("td"+j)); }
		tbody.appendChild(row);
		fileRow++;	
	}
	
	function goRemoveFile(inx) {
		if(confirm('파일을 삭제하시겠습니까?')) {
			document.temp.file_no.value = document.all['file_no'+inx].value;
			document.temp.file_path.value = document.all['file_path'+inx].value;
			$("#fileListRow"+inx).remove();
			ajaxSubmitForm("sgn01001_delete_file.do","#temp", function(rtn) {
				if(rtn.isOk == "Y") {
					alert("삭제되었습니다.");
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goPreview() {
		if(isEmpty(document.main.msg_type)) { return; }
		Editor.save();
		var theURL = 'sgn01001_preview.do';
		sinjax.updateWithForm(theURL, document.main, 'go_preview');
	}
	function __goPreview_post(rsBox) {
		var wait_no = sinjax.GetObject(rsBox,'wait_no');
		go_html_viewer('htmlReport_preview', '&wait_no='+wait_no);
	}
	
	$(function() {
		$(".page-logo-text").html("기안문 작성");
		<% if((box.get("msg_type").equals("ETC001") || obox.get("msg_type").equals("ETC001")) && "작성중,반려".indexOf(obox.get("sign_status_nm")) >= 0) { %>	
		document.getElementById("newLineTable").style.display = '';
	<% } %>
	});
</script>
<form id="main" name="main" method="post" action="" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="msg_no" 			value="<%=box.get("msg_no")%>">
<input type="hidden" name="send_empl_no" 	value="<%=obox.get("send_empl_no")%>">
<input type="hidden" name="msg_type" 		value="<%=obox.get("msg_type")%>">
<input type="hidden" name="search_key" 		value="<%=obox.get("search_key")%>">
<input type="hidden" name="sign_step" 		value="">
<input type="hidden" name="sign_empl_no" 	value="">
<input type="hidden" name="sign_order" 		value="">
<input type="hidden" name="popup_yn" 		value="<%=box.get("popup_yn")%>">
<input type="hidden" name="file_cnt" 		value="">
<input type="hidden" name="body_hgt" 		value="<%=box.get("body_hgt")%>">
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr height="28">
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="subject" value="<%=obox.get("subject")%>" maxlength="100" class="form-control required" title="제목" style="width:95%; border:none; ime-mode:active;" <%if(box.get("msg_no").equals("") || "작성중,대기,반려".indexOf(obox.get("sign_status_nm"))>=0){%><%}else{%>readOnly<%}%>>
				</td>
			</tr> 
			<tr height="28">
				<th width="18%">작성자</th>
				<td width="32%"><%=uSesEnt.empl_nm%>&nbsp;&nbsp;(작성일 : <%=DateUtil.toString("yyyy-MM-dd")%>)</td>
				<th width="18%">보안결재<%=obox.get("sign_status")%></th>
				<td width="32%">
					<select name="open_scope" class="bs-select form-control" style="width:120px">
						<option value='4'>공개</option>
						<option value='3' <%=obox.get("open_scope").equals("3")?"selected":""%>>붙임문서 비공개</option>
						<option value='2' <%=obox.get("open_scope").equals("2")?"selected":""%>>표지만 공개</option>
						<option value='1' <%=obox.get("open_scope").equals("1")?"selected":""%>>비공개</option>
					</select>
				</td>
			</tr> 
		<%  int bodyHeight = box.getInt("body_hgt"); int EditorHeight = 0;
			if(box.get("msg_type").equals("ETC001") || obox.get("msg_type").equals("ETC001")) { 
				if(box.get("msg_no").equals("") || "작성중,반려".indexOf(obox.get("sign_status_nm")) >= 0) {
					EditorHeight += bodyHeight-370;
				}else {
					EditorHeight += bodyHeight-180;
				}
			}else {
				if(!obox.get("msg_no").equals("")) {
					if(obox.get("sign_status_nm").equals("대기")) {
						EditorHeight += bodyHeight-340;
					}else {
						EditorHeight += bodyHeight-300;
					}
				}else {
					EditorHeight += bodyHeight-370;
				}
			}
		%>
			<tr height="<%=EditorHeight%>">
				<td colspan="4" style="padding: 0px 0px 0px 0px">
					<input type="hidden" name="opinion" value="">
					<%	request.setAttribute("initContents", obox.get("opinion"));
						request.setAttribute("contents_fld_nm", "opinion");
						request.setAttribute("form_name", "main");
// 						request.setAttribute("editor_width", "800"); 
						request.setAttribute("content_width", "650");
						request.setAttribute("editor_height", String.valueOf(EditorHeight));
						request.setAttribute("toolbar_advanced", box.get("msg_no").equals("") || "작성중,대기,반려".indexOf(obox.get("sign_status_nm")) >= 0 ?"":"none");
						request.setAttribute("readonly", box.get("msg_no").equals("") || "작성중,대기,반려".indexOf(obox.get("sign_status_nm")) >= 0 ?"false":"true");
						request.setAttribute("display", box.get("msg_no").equals("") || "작성중,대기,반려".indexOf(obox.get("sign_status_nm")) >= 0 ?"":"none");
					%>
					<%@ include file="/WEB-INF/jsp/com/daumeditor/incDaumEditor.jsp" %> 
				</td>
			</tr>
		<% if(box.get("msg_no").equals("") || "작성중,대기,반려".indexOf(obox.get("sign_status_nm")) >= 0) { %>
			<tr>
				<th>붙임문서</th>
				<td colspan="3" class="table-in-table">
					<table class="table table-bordered">
						<tr height="25">
							<th width="*" style="font-size:11px">파일명</th>
							<th width="120" style="font-size:11px">용량</th>
							<th width="100" style="font-size:11px">형식</th>
							<th width="30">
								<button type="button" class="btn btn-primary btn-table" onClick="fileUpload();" style="float:right">추가</button><input type="file" id="upload_file" name="upload_file" style="display:none" onChange="goUpload()">
							</th>
						</tr>
						<tr height="50">
							<td colspan="4" valign="top" style="padding:0 0 0 0">
								<div id="divFileList" style="height:40px;overflow-y:auto">
								<table id="fileListTable" width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr style="display:none"><td style="border:none"></td><td style="border:none"></td><td style="border:none"></td><td style="border:none"></td></tr>
								<% for(int i=0; i < fileWp.getLength(); i++) { %>
									<tr id="fileListRow<%=i%>">
										<td style="font-size:11px;border:none">&nbsp;<img src="/com/img/icn_disk.gif" align="absmiddle" border="0"> <a href="javascript:fileDownload(document.temp,'<%=uSesEnt.dbo+"/"+fileWp.get("file_path",i)%>', '<%=fileWp.get("file_nm",i)%>')"><%=fileWp.get("file_nm",i)%></a> 
											
											<input type="hidden" name="file_no<%=i%>" value="<%=fileWp.get("file_no",i)%>">
											<input type="hidden" name="file_path<%=i%>" value="<%=fileWp.get("file_path",i)%>">
										</td>
										<td width="120" class="t-center" style="font-size:11px;border:none"><%=fileWp.get("file_size",i,Box.THOUSAND_COMMA)%></td>
										<td width="100" class="t-center" style="font-size:11px;border:none"><%=fileWp.get("file_type",i)%></td>
										<td width="30" class="t-center" style="font-size:11px;border:none"><a href="javascript:goRemoveFile('<%=i%>')"><img src="/com/img/icon_tresh.png" align="absbottom" border="0" alt="삭제"></a></td>
									</tr>
								<% } %>	
								</table>
								</div>
							</td>
						</tr>
					</table>	
				</td>
			</tr> 
		<% } %>
		</table>
	</div>
</form>
<% if((box.get("msg_type").equals("ETC001") || obox.get("msg_type").equals("ETC001")) && "작성중,반려".indexOf(obox.get("sign_status_nm")) >= 0) { %>	
	<form name="saveForm" method="post" action="" style="margin:0px">
	<%@ include file="/WEB-INF/jsp/esign/signUp.jsp" %>
	</form>
<% } %>	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
		<% if(box.get("msg_type").equals("ETC001") || obox.get("msg_type").equals("ETC001")) { %>
			<% if(box.get("msg_no").equals("") || obox.get("sign_order").equals("0") || (obox.get("sign_order").equals("") && obox.get("cancel_seq").equals(""))) { %>
				<button type="button" class="btn dark marL5" onclick="goSave('tempSave');"><img src="/com/img/ico_btn_save.png">임시저장</button>
			<% } %>
			<% if(!box.get("msg_no").equals("") && (obox.get("sign_order").equals("0") || (obox.get("sign_order").equals("") && obox.get("cancel_seq").equals("")))) { // 작성중, 반려 %>
				<button type="button" class="btn dark marL5" onclick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
			<% } %>
			<% if(box.get("msg_no").equals("") || obox.get("sign_order").equals("0") || (obox.get("sign_order").equals("") && obox.get("cancel_seq").equals(""))) { %>
				<button type="button" class="btn dark marL5" onClick="goApply();"><img src="/com/img/ico_btn_refresh_edit.png">결제올리기</button>
			<% } %>
			<% if(box.get("msg_no").equals("")) { %>
				<button type="button" class="btn dark marL5" onclick="goPreview();"><img src="/com/img/ico_btn_print.png">인쇄</button>
			<% }else { %>
				<% if("진행,완료".indexOf(obox.get("sign_status_nm")) >= 0) { %>
					<button type="button" class="btn dark marL5" onClick="goSave('saveOnly');"><img src="/com/img/ico_btn_save.png">저장</button>
					<button type="button" class="btn dark marL5" onClick="javascript:self.close();"><img src="/com/img/ico_btn_cancel.png">취소</button>
				<% } %>
				<button type="button" class="btn dark marL5" onclick="goHtmlViewer('htmlReport', '&msg_no=<%=obox.get("msg_no")%>');"><img src="/com/img/ico_btn_print.png">인쇄</button>
			<% } %>
		<% }else { %>
			<% if(!obox.get("msg_no").equals("")) { // 결재단계 중 수정%>
				<button type="button" class="btn dark marL5" onClick="goSave('saveOnly');"><img src="/com/img/ico_btn_save.png">저장</button>
				<button type="button" class="btn dark marL5" onClick="javascript:self.close();"><img src="/com/img/ico_btn_cancel.png">취소</button>
			<% }else { %>
				<button type="button" class="btn dark marL5" onClick="goApply();"><img src="/com/img/ico_btn_refresh_edit.png">결제올리기</button>
			<% } %>
		<% } %>
			</span>
		</span>
	</div>

<form id="temp" name="temp" method="post" action="" style="display:none">
<input type="hidden" name="pathKey"			value="groupware">
<input type="hidden" name="file_no"			value="">
<input type="hidden" name="file_nm"			value="">
<input type="hidden" name="file_path"		value="">
<input type="hidden" name="file_inx"		value="">
</form>