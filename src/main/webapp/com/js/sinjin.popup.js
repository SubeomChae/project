var eai_server = 'http://59.7.251.146:8080';// 'http://192.168.0.98:8080';
var report_server = 'http://192.168.0.110:8080';
var edoc_server = 'http://192.168.0.103:8080';
var ocr_server = 'http://172.12.192.40:8080';

//계정과목 찾기
function findAccountCode(params) {
	popupOpen("/popup/acctCodeSearch.do?1=1"+params, "acctCode", 600, 800);
}

//사원 찾기
function findEmployeeNo(params) {
	popupOpen("/popup/emplNoSearch.do?1=1" + params, "emplNoSearch", 600, 600);
}

// 사원정보
function goEmployeePop(params) {
	popupOpen("/popup/employeePop.do?1=1&empl_no="+params, "employeePop", 600, 350);
}

//거래처정보
function goCustInfo(params) {
	popupOpen("/popup/custCodePop.do?1=1"+params, "custCodePop", 600, 370);
}

function goLoanRevenue(params) {
	popupOpen("/budget/pd/bud12002_list.do?1=1" + params, "employeePop", 800, 600);
}

//거래처 찾기
function findCustCode(params) {
	popupOpen("/popup/custCodeSearch.do?1=1"+params, "custCode", 600, 600);
}

// 전표조회
function goSlipViewer(params) {
	popupOpen("/popup/slipView.do?1=1" + params, "slipView", 1000, 650);
}

// 전표출력
function goSlipPrint(slip_no) {
	var params = '&slip_no='+slip_no + '&excel_yn=Y'
	popupOpen("/popup/slipView.do?1=1" + params, "slipPrint", 1000, 600);
}

// 기안문서조회
function goDocuViewer(msg_no) {
	var theURL = '/esign/pd/sgn01002_select.do?1=1&msg_no='+msg_no+'&popup_yn=Y';
	popupOpen(theURL, "sgn01002", 1000, 700);
}

//목적사업 신청서 조회
function goWelfareView(apply_no, bugt_cd) {
	popupOpen("/welfare/pd/wel01002_select.do?1=1&apply_no="+apply_no+"&bugt_cd="+bugt_cd+"&popup_yn=Y", "wel01002_select", 800, 450);
}

//대부금 신청서 조회
function goLoanDetail(loan_no) {
	popupOpen("/loan/pd/lon01002_select.do?1=1&loan_no="+loan_no+"&popup_yn=Y", "LoanDetail", 800, 600);
}

// 유비리포트뷰어
function goUbiViewer(report_id, params) {
	wdt = 850;
	hgt = 750;
	xPos = Math.ceil((screen.width - wdt) / 2);
	yPos = Math.ceil((screen.height - hgt) / 2);
	window.open(
					"/com/redirectEx.do?reqUrl=/com/viewer/ubiReport/ubireport&report_id="
							+ report_id + "&params=" + encodeURI(params),
					"ubiViewer",
					"width="
							+ wdt
							+ ",height="
							+ hgt
							+ ",menubar=no,toolbar=no,scrollbars=no,resizable=yes,left="
							+ xPos + ",top=" + yPos);
}

// HTML리포트뷰어
function goHtmlViewer(report_id, params) {
	popupOpen("/com/fd/redirect.do?reqUrl=/com/viewer/" + report_id + params, 'htmlViewer', 850, 750);
}

// 기안문 작성
function goSignRequest(signForm) {
	hgt = screen.height - 100;
	popupOpen("", "sgn01001", 800, hgt);
	var pageUrl = '/esign/pd/sgn01001.do?popup_yn=Y&body_hgt='+hgt;

	signForm.action = pageUrl
	signForm.target = 'sgn01001';
	signForm.submit();
}

// 결재라인 조회
function goSignLine(msg_no, msg_type, search_key) {
	var params = msg_no == '' ? '&msg_type=' + msg_type + '&search_key='
			+ search_key : '&msg_no=' + msg_no;
	popupOpen("/popup/signLineView.do?1=1" + encodeURI(params), "signLineView", 600, 400);
}

// 파일다운로드
function fileDownload(downForm, filePath, fileNm) {
	downForm.file_nm.value = fileNm == undefined ? filePath : fileNm;
	downForm.file_path.value = filePath;
	downForm.action = '/com/fileDownload.do';
	downForm.submit();
}

//계정과목 찾기
function findAccountCode(params) {
	popupOpen("/popup/acctCodeSearch.do?1=1" + encodeURI(params), "acctCode", 550, 610);
}

//적요코드 찾기
function findRemarkCode(acct_cd, acct_nm) {
	if (acct_cd == "") {
		alert("계정과목코드가 선택되지 않았습니다.");
		return;
	}
	var params = "&acct_cd="+acct_cd+"&acct_nm="+acct_nm
	popupOpen("/popup/remarkCodeSearch.do?1=1" + encodeURI(params), "remarkCode", 550, 640);
}

// 사용자그룹 찾기
function findUserGroup(params) {
	popupOpen("/popup/userGroupSearch.do?1=1" + params, "userGroupSearch", 700,
			600);
}

// 공통코드 선택
function findCommonCode(codeObj, dataObj, params) {
	var pageUrl = "/popup/codeSearch.do?1=1" + params + "&codeObj=" + codeObj
			+ "&dataObj=" + dataObj;
	popupOpen(pageUrl, "commonCode", 400, 450);
}

// N개 코드 선택
function findMultiCode(codeObj, dataObj, params, maxCount) {
	var pageUrl = "/popup/multCodeSearch.do?1=1" + params + "&codeObj="
			+ codeObj + "&dataObj=" + dataObj;
	if (maxCount != undefined) {
		pageUrl += '&maxCount=' + maxCount;
	}
	popupOpen(pageUrl, "multiCode", 400, 450);
}

//쪽지보내기
function sendNote(params) {
	popupOpen("/community/pd/not01002_write.do?1=1&receive_id="+params, "not01002", 500, 500);
}

//온라인도움말
function sabokHelp(id) {
	var menu_id = id == undefined ? '' : id;
	if (menu_id == '' && $("#divmanuId").length > 0) {
		menu_id = $("#divmenuId").text();
	}
	if (menu_id == '') {
		try {
			if (location.href.indexOf('redirect') > 0) {
				menu_id = location.href.substring(location.href
						.lastIndexOf('reqUrl=') + 7);
				if (menu_id.indexOf('&') > 0) {
					menu_id = menu_id.substring(0, menu_id.indexOf('&'));
				}
				menu_id = menu_id.substring(menu_id.lastIndexOf('/') + 1);
			} else {
				menu_id = getMethodFromUrl(location.href);
				if (menu_id.indexOf("_") > 0) {
					menu_id = menu_id.substring(0, menu_id.indexOf("_"));
				}
			}
		} catch (e) {
		}
	}
	pageUrl = "/popup/**/sabokHelpAll.do?menu_id=" + menu_id.toUpperCase();
	popupOpen(pageUrl, "sabokHelp", 1200, 800);
}

//우편번호 찾기
function findZipNo() {
	findZipNo('1');
}
function findZipNo(val) {
	wdt = 640; hgt = 540;
	xPos = Math.ceil((screen.width - wdt) / 2);
	yPos = Math.ceil((screen.height- hgt) / 2);
	window.open("/com/fd/redirect.do?reqUrl=com/popup/jusoLink&object_id="+val, "zipFinder", "width="+wdt+",height="+hgt+",menubar=no,toolbar=no,scrollbars=yes,resizable=yes,left="+xPos+",top="+yPos);
}

// Report Viewer
function goRptViewer(report_head, report_id, param) {
	var pageUrl = report_server + '/com/viewer/HTML5ViewerPop.jsp';
	var params = encodeURI('?report_head=' + report_head
			+ '&report_id=/cxReport' + report_id + '&param=' + param);
	popupOpen(pageUrl + params, 'RDViewer', 1024, screen.height - 100);
}

// 파일첨부
function goAttachFile(pathKey, subDir, ref_table, ref_pk, etc_param, subject) {
	var params = "pathKey=" + pathKey + "&subDir=" + subDir + "&ref_table="
			+ ref_table + "&ref_pk=" + ref_pk + etc_param;
	ajaxReplace("/popup/fileAttach.do", params, "#dialog-form", function(rtn) {
		$('#dialog-form').modal('show');
		if (subject != undefined) {
			$(".modal-title").text(subject);
		}
	});
}

// POI로 생성된 엑셀파일 다운로드
function poiExcelDownload(excelPath) {
	if ($("#excelFrm").length == 0) {
		var div = document.createElement('div');
		div.innerHTML = "<iframe id='excelFrm' name='excelFrm' style='display:none'></iframe>";
		document.body.appendChild(div);
	}
	$('#excelFrm').attr('src',
			"/com/fileDownload.do?pathKey=temp&file_path=" + excelPath);
}

// 회원정보
function goUserInfo(params) {
	popupOpen("/popup/userInfo.do?1=1" + params, "userInfoPop", 550, 380);
}

// 아이디/비밀번호 찾기
function findIdPw() {
	popupOpen("/popup/idPwFinder.do", "idPwFinder", 500, 375);
}

// 화면 중앙에 팝업화면 열기
function popupOpen(pageUrl, windowNm, wdt, hgt, status, scrollbars, resizable) {
	var xPos = Math.ceil((screen.width - wdt) / 2);
	var yPos = Math.ceil((screen.height - hgt) / 2);
	var winProperty = "width=" + wdt + ",height=" + hgt
			+ ",menubar=no,toolbar=no,left=" + xPos + ",top=" + yPos
			+ ",status=" + (status == undefined ? "no" : status)
			+ ",scrollbars=" + (scrollbars == undefined ? "yes" : scrollbars)
			+ ",resizable=" + (resizable == undefined ? "no" : resizable);
	window.open(pageUrl, windowNm, winProperty);
}

// 현재화면이 팝업창인지 여부?
function isPopup(pageUrl) {
	if (pageUrl == undefined) {
		pageUrl = location.href;
	}
	if (pageUrl.indexOf('/popup/') >= 0 || pageUrl.indexOf('/pd/') >= 0) {
		return true;
	}
	return false;
}

// 토스트 팝업
function toastPop1(msg, topPos, subject, timeOut) {
	if (timeOut == undefined) {
		timeOut = 300;
	}
	toastr.options = {
		"closeButton" : false,
		"timeOut" : timeOut,
		"positionClass" : "toast-top-center",
	}

	if (subject == undefined) {
		toastr.success(msg);
	} else {
		toastr.success(msg, subject);
	}
	if (topPos > 0) {
		$("#toast-container").css("top", topPos - 100);
	}
}

function showServerWorking(buttonId, msg, leftPos, topPos) {
	if($("#divServerWorking").length == 0) {
		var cHtml = "<div id='divServerWorking' style='position:absolute; background-color:#d0d0f0; z-index:9999; display:none'>"
				  +	"	<img src='/com/img/loading.gif' class='mar5'><span id='spanServerWorkingMsg' class='f14 marL20 marR20'></span>"
				  + "</div>";
		$("#dialog-form").after(cHtml);
	}
	if(msg == undefined) {
		msg = "처리중 입니다. 잠시만 기다려 주세요."; 
		if(buttonId == 'btnExcel') { msg = "엑셀파일을 생성중입니다. 잠시만 기다려 주세요."; }
		else if(buttonId == 'btnSearch') { msg = "조회중입니다. 잠시만 기다려 주세요."; }
		else if(buttonId == 'btnSave') { msg = "저장중입니다. 잠시만 기다려 주세요."; }
	} 
	if(leftPos == undefined) { leftPos = $("#"+buttonId).offset().left - 60; } 
	if(topPos == undefined) { topPos = $("#"+buttonId).offset().top; } 
	$("#spanServerWorkingMsg").html(msg);
	if((leftPos + $("#divServerWorking").width()) > ($(".page-content").width()+$(".page-content").offset().left)) { 
		leftPos = $(".page-content").width() - $("#divServerWorking").width() + $(".page-content").offset().left;
	} 
	$("#divServerWorking").css("top", topPos).css("left", leftPos);
	$("#divServerWorking").show();
}

function hideServerWorking() {
	$("#divServerWorking").hide();
}

// alert 모달
function alertModal(mBody, mTitle) {
	if (mTitle == undefined) {
		mTitle = "알림";
	}
	var modHtml = "	<div class='modal-dialog'>"
			+ "		<div class='modal-content' style='max-width:400px'>"
			+ "		<div class='modal-header'>"
			+ "			<button type='button' class='close' data-dismiss='modal' aria-hidden='true'></button>"
			+ "			<h4 class='modal-title'>"
			+ mTitle
			+ "</h4>"
			+ "		</div>"
			+ "		<div class='modal-body'><p>"
			+ mBody
			+ "</p></div>"
			+ "			<div class='modal-footer'>"
			+ "				<button data-dismiss='modal' class='btn btn-primary'>OK</button>"
			+ "			</div>" + "		</div>" + "</div>";

	$("#dialog-form").html(modHtml);
	$('#dialog-form').modal('show');
}

// confirm 모달
function confirmModal(mBody, mTitle, callback) {
	var modHtml = "	<div class='modal-dialog'>"
			+ "		<div class='modal-content' style='max-width:400px'>";
	if (mTitle != "") {
		modHtml += "		<div class='modal-header'>"
				+ "			<button type='button' class='close' data-dismiss='modal' aria-hidden='true'></button>"
				+ "			<h4 class='modal-title'>" + mTitle + "</h4>" + "		</div>";
	}
	modHtml += "		<div class='modal-body'><p>"
			+ mBody
			+ "</p></div>"
			+ "			<div class='modal-footer'>"
			+ "				<button id='confirm-ok' class='btn btn-primary' data-dismiss='modal'>확인</button>"
			+ "				<button id='confirm-cancel' class='btn dark btn-outline' data-dismiss='modal' aria-hidden='true'>취소</button>"
			+ "			</div>" + "		</div>" + "</div>";

	$("#dialog-form").html(modHtml);
	var result = false;
	modalConfirm(function(confirm) {
		result = confirm;
		callback(result);
	});
}
var modalConfirm = function(callback) {
	$('#dialog-form').modal('show');
	$("#confirm-ok").on("click", function() {
		callback(true);
		$("#dialog-form").modal('hide');
	});

	$("#confirm-cancel").on("click", function() {
		callback(false);
		$("#dialog-form").modal('hide');
	});
};
