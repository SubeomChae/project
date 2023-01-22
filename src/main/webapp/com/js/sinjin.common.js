$(document).ready(
    function() {
        if (typeof page_init == 'function') {
            page_init();
        }

        fvInit("#main");
        
        $(document).on("focus", ":input", function() {
        	$(this).select();
        });

        $(".tYMD").unbind("blur");
        $(document).on("blur", ".tYMD",function() {
            $(this).val($(this).val().getFormatVal("YMD"));
        });
        $(".tYMD").unbind("focus");
        $(document).on("focus", ".tYMD",function() {
            $(this).val($(this).val().replaceAll("-", ""));
        });
        
        $(".tMONEY").unbind("blur");
        $(document).on("blur", ".tMONEY",function() {
            $(this).val($(this).val().getFormatVal("MONEY"));
        });
        $(".tMONEY").unbind("focus");
        $(document).on("focus", ".tMONEY",function() {
            $(this).val($(this).val().replaceAll(",", ""));
        });
        $(".tMONEY").unbind("blur");
        $(document).on("blur", ".tMONEY",function() {
            $(this).val($(this).val().getFormatVal("MONEY"));
        });
        
        $(".tFMONEY").unbind("focus");
        $(document).on("focus", ".tFMONEY",function() {
            $(this).val($(this).val().replaceAll(",", ""));
        });
        $(".tFMONEY").unbind("blur");
        $(document).on("blur", ".tFMONEY",function() {
            $(this).val($(this).val().getFormatVal("MONEY"));
        });

        $(".tYMD").each(function() {
            $(this).val($(this).val().getFormatVal("YMD"));
        });
        $(".tMONEY").each(function() {
            $(this).val($(this).val().getFormatVal("MONEY"));
            $(this).css("text-align", "right");
        });
        $(".tFMONEY").each(function() {
            $(this).val($(this).val().getFormatVal("MONEY"));
            $(this).css("text-align", "right");
        });
        $(".tFNUM").each(function() {
            $(this).css("text-align", "right");
        });

        $(".required").each(function() {
            $(this).css("background-color", getItemColor('required'));
        });
        
        if($(".date-picker", $(".page-frame")).length) { orientDatePicker(); }
        
        $(document).on("keyup", ".autoTab", function() {
            if ($(this).attr("maxlength") != undefined && $(this).attr("maxlength") != "") {
                if ($(this).val().length == $(this).attr("maxlength")) {
                    $(":input:eq(" + ($(":input").index(this) + 1) + ")").focus();
                }
            }
        });
        
		$("input[type='text']").keydown(function() {
		    if(event.keyCode === 13) {
		        event.preventDefault();
		    }
		});
        
    });

// form 에 숫자 입력 등 제한처리
function fvInit(formId) {
	$(document).on("keydown", formId + " :input.tNUM",function(e) {
	    return numberKeydownCheck(e);
	});
	$(document).on("keydown", formId + " :input.tMONEY",function(e) {
	    return numberKeydownCheck(e);
	});
	$(document).on("keydown", formId + " :input.tFMONEY",function(e) {
	    return floatKeydownCheck(e);
	});
	$(document).on("keydown", formId + " :input.tFLOAT",function(e) {
	    return floatKeydownCheck(e);
	});
	$(document).on("keydown", formId + " :input.tENG",function(e) {
	    return engKeydownCheck(e);
	});
	$(document).on("keydown", formId + " :input.tENGNUM",function(e) {
	    return engNumKeydownCheck(e);
	});
	
	// 한글 전환이 필요없는 input 영문 고정
	$(formId + " :input").filter(".tNUM").css("ime-mode", "disabled");
	$(formId + " :input").filter(".tMONEY").css("ime-mode", "disabled");
	$(formId + " :input").filter(".tFMONEY").css("ime-mode", "disabled");
	$(formId + " :input").filter(".tFLOAT").css("ime-mode", "disabled");
	$(formId + " :input").filter(".tEMAIL").css("ime-mode", "disabled");
	$(formId + " :input").filter(".tENG").css("ime-mode", "disabled");
	$(formId + " :input").filter(".tENGNUM").css("ime-mode", "disabled");
	$(formId + " :input").filter(".tYMD").css("ime-mode", "disabled");
}

function formValidate(formId) {
	return fv(formId, "alert");
}

// form validation check
function fv(formId, alertGbn) {
	var validationResult = true;
	var errMsg = "";
	var chkRadioNameList = "";
	
	$(formId + " :input").each(function() {
        var title = ($(this).prop("title") == "" ? $(this).prop("name") : $(this).prop("title"));
        if($(this).hasClass("required") && ($(this).attr("disabled") == undefined || $(this).attr("disabled") == false)) {
            if(($(this).prop("type") == "text" || $(this).prop("type") == "password" || $(this).prop("type") == "textarea" || $(this).prop("type") == "file") && $(this).val() == "") {
                if(alertGbn == "alert") {
                    $(this).focus();
                    alert(title + "을(를) 입력하여 주십시오.");
                    validationResult = false;
                    return false;
                }else if (alertGbn == "allerr") {
                    errMsg += title + "을(를) 입력하여 주십시오." + "\n";
                }
            }else if($(this).get(0).tagName == "SELECT" && $(this).val() == "") {
                if(alertGbn == "alert") {
                    $(this).focus();
                    alert(title + "을(를) 선택하여 주십시오.");
                    validationResult = false;
                    return false;
                }else if(alertGbn == "allerr") {
                    errMsg += title + "을(를) 선택하여 주십시오." + "\n";
                }
            }else if(($(this).prop("type") == "radio" || $(this).prop("type") == "checkbox") && $("input[name='" + $(this).prop("name") + "']:checked").length == 0) {
                if(alertGbn == "alert") {
                    $(this).focus();
                    alert(title + "을(를) 선택하여 주십시오.");
                    validationResult = false;
                    return false;
                }else if(alertGbn == "allerr") {
                    if(chkRadioNameList.indexOf($(this).prop("name") + ",") < 0) {
                        errMsg += title + "을(를) 선택하여 주십시오" + "\n";
                        chkRadioNameList += $(this).prop("name") + ",";
                    }
                }
            }
        }
        if($(this).hasClass("tYMD") && $(this).val() != "" && $(this).val().isYmd() == false) {
            if(alertGbn == "alert") {
                $(this).focus();
                alert(title + " 입력값이 날짜 형식에 맞지 않습니다.\n");
                validationResult = false;
                return false;
            }else if(alertGbn == "allerr") {
                errMsg += title + " 입력값이 날짜 형식에 맞지 않습니다.\n";
            }
        }
        if(($($(this).hasClass("tMONEY") || this).hasClass("tNUM")) && $(this).val() != "" && $(this).val().replace(/,/g, '').isNum() == false) {
            if(alertGbn == "alert") {
                $(this).focus();
                alert(title + " 입력값은 숫자로만 입력하여 주십시오.");
                validationResult = false;
                return false;
            }else if(alertGbn == "allerr") {
                errMsg += title + " 입력값은 숫자로만 입력하여 주십시오.\n";
            }
        }
        if(($(this).hasClass("tFMONEY") || $(this).hasClass("tFLOAT")) && $(this).val() != "" && $(this).val().replace(/,/g, '').isFloat() == false) {
            if(alertGbn == "alert") {
                $(this).focus();
                alert(title + " 입력값은 실수로만 입력하여 주십시오.");
                validationResult = false;
                return false;
            }else if(alertGbn == "allerr") {
                errMsg += title + " 입력값은 실수로만 입력하여 주십시오.\n";
            }
        }
        if($(this).hasClass("tENG") && $(this).val() != "" && $(this).val().isEng() == false) {
            if(alertGbn == "alert") {
                $(this).focus();
                alert(title + " 입력값은 영문으로만 입력하여 주십시오.");
                validationResult = false;
                return false;
            }else if(alertGbn == "allerr") {
                errMsg += title + " 입력값은 영문으로만 입력하여 주십시오.\n";
            }
        }
        if($(this).hasClass("tENGNUM") && $(this).val() != "" && $(this).val().isEngNum() == false) {
            if(alertGbn == "alert") {
                $(this).focus();
                alert(title + " 입력값은 영문/숫자로만 입력하여 주십시오.");
                validationResult = false;
                return false;
            }else if(alertGbn == "allerr") {
                errMsg += title + " 입력값은 영문/숫자로만 입력하여 주십시오.\n";
            }
        }
        if($(this).hasClass("tEMAIL") && $(this).val() != "" && $(this).val().isEmail() == false) {
            if(alertGbn == "alert") {
                $(this).focus();
                alert(title + " 입력값이 이메일 형식에 맞지 않습니다." + "\n");
                validationResult = false;
                return false;
            }else if(alertGbn == "allerr") {
                errMsg += title + " 입력값이 이메일 형식에 맞지 않습니다." + "\n";
            }
        }
    });
	if(alertGbn == "alert") {
	    return validationResult;
	}else if(alertGbn == "allerr") {
	    return errMsg;
	}
    return "";
}

// ajax 화면처리
function ajaxReplace(callUrl, jsonData, layerId, successFunc, errFunc, completeFunc) {
	if(getType(jsonData) == "object") {
	    jsonData.jdcid = (new Date()).getTime();
	    jsonData.ajax_yn = "Y";
	}else if(getType(jsonData) == "string") {
	    jsonData += "&jdcid=" + (new Date()).getTime() + "&ajax_yn=Y";
	}
	
	$.ajax({
	    url : callUrl,
	    data : jsonData,
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    type : 'POST',
	
	    success : function(data) {
	        $(layerId).html(data);
	        appendHtmlAfterWork(layerId);
	        if (successFunc) {
	            successFunc();
	        }
	        if (typeof sessionTimeRefresh != "undefined") {
	            sessionTimeRefresh();
	        }
	    },
	    error : function(data) {
	        if (errFunc) {
	            errFunc();
	        }
	    },
	    complete : function(data) {
	        if (completeFunc) {
	            completeFunc();
	        }
	        if (typeof sessionTimeRefresh != "undefined") {
	            sessionTimeRefresh();
	        }
	    }
	});
}

function ajaxReplaceForm(callUrl, formId, layerId, successFunc, errFunc, completeFunc) {
	removeMask(formId);
	ajaxReplace(callUrl, $(formId).serialize(), layerId, successFunc, errFunc, function(data) {
		formatMask(formId);
		if (completeFunc) {
            completeFunc();
        }
	});
}

function appendHtmlAfterWork(layerId) {
	appendHtmlAfterWorkObj($(layerId));
	$(document).on("keydown", layerId + " input.tMONEY",function(e) {
	    return numberKeydownCheck(e);
	});
	$(document).on("keydown", layerId + " :input.tFMONEY",function(e) {
	    return floatKeydownCheck(e);
	});
}

function appendHtmlAfterWorkObj(jqueryObj) {
	jqueryObj.find(".tYMD").blur(function() {
	    $(this).val($(this).val().getFormatVal("YMD"));
	});
	jqueryObj.find(".tYMD").focus(function() {
	    $(this).val($(this).val().replaceAll("-", ""));
	    $(this).select();
	});

	jqueryObj.find(".tMONEY").blur(function() {
	    $(this).val($(this).val().getFormatVal("MONEY"));
	    $(this).css("text-align", "right");
	});
	jqueryObj.find(".tMONEY").focus(function() {
	    $(this).val($(this).val().replaceAll(",", ""));
	    $(this).select();
	});
	
	jqueryObj.find(".tFMONEY").blur(function() {
	    $(this).val($(this).val().getFormatVal("MONEY"));
	    $(this).css("text-align", "right");
	});
	jqueryObj.find(".tFMONEY").focus(function() {
	    $(this).val($(this).val().replaceAll(",", ""));
	    $(this).select();
	});
	
	jqueryObj.find(".tNUM").blur(function() {
	    $(this).css("text-align", "right");
	});
	jqueryObj.find(".tNUM").focus(function() {
	    $(this).select();
	});
	
	jqueryObj.find(".tYMD").each(function() {
        $(this).trigger("blur");
    });
	jqueryObj.find(".tMONEY").each(function() {
        $(this).trigger("blur");
    });
	jqueryObj.find(".tFMONEY").each(function() {
        $(this).trigger("blur");
    });
	jqueryObj.find(".tNUM").each(function() {
        $(this).trigger("blur");
    });
	
	jqueryObj.find(".required").each(function() {
        $(this).css("background-color", getItemColor('required'));
    });

	jqueryObj.find(".date-picker").datepicker({
        rtl: App.isRTL(),
        orientation: "left",
        format:"yyyy-mm-dd",
        language:"kr",
        todayHighlight: true,
        autoclose: true
    });
	jqueryObj.find(".date-picker input").on("change", function(ev) {
        $(this).closest(".date-picker").attr("data-date",$(this).val());
    });
	if($(".date-picker", jqueryObj).length) { orientDatePicker(jqueryObj); }
}

// ajax 데이터 처리
function ajaxJson(callurl, jsonData, successFunc, errFunc, completeFunc) {
	preventMultiClick(callurl, true);

	$.ajax({
	    url : callurl,
	    data : jsonData,
	    async : true,
	    dataType : "json",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    type : 'POST',
	
	    success : function(data) {
	    	preventMultiClick(callurl, false);
	        if (successFunc) {
	            successFunc(data);
	        }
	        if (typeof sessionTimeRefresh != "undefined") {
	            sessionTimeRefresh();
	        }
	    },
	    error : function(data) {
	    	preventMultiClick(callurl, false);
	        console.log("error ajaxJson:" + JSON.stringify(data));
	        if (errFunc) {
	            errFunc(data);
	        }
	    },
	    complete : function(data) {
	        if (completeFunc) {
	            completeFunc(data);
	        }
	        if (typeof sessionTimeRefresh != "undefined") {
	            sessionTimeRefresh();
	        }
	    }
	});
}

function ajaxJsonSync(callurl, jsonData, successFunc, errFunc, completeFunc) {
	preventMultiClick(callurl, true);
	callurl += (callurl.indexOf("?") < 0 ? "?" : "&") + "rtn_json=Y";
	
	$.ajax({
	    url : callurl,
	    data : jsonData,
	    async : false,
	    dataType : "json",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    type : 'POST',
	
	    success : function(data) {
	    	preventMultiClick(callurl, false);
	        if (successFunc) {
	            successFunc(data);
	        }
	        if (typeof sessionTimeRefresh != "undefined") {
	            sessionTimeRefresh();
	        }
	    },
	    error : function(data) {
	    	preventMultiClick(callurl, false);
	        console.log(data);
	        if (errFunc) {
	            errFunc(data);
	        }
	    },
	    complete : function(data) {
	        if (completeFunc) {
	            completeFunc(data);
	        }
	        if (typeof sessionTimeRefresh != "undefined") {
	            sessionTimeRefresh();
	        }
	    }
	});
}

function ajaxSubmitForm(submitUrl, formId, successFunc, errFunc) {
	removeMask(formId);
	preventMultiClick(submitUrl, true);
	
	$(formId).ajaxForm({
	    url : submitUrl,
	    dataType : "json",
	    crossDomain: true,        
        xhrFields: {
            withCredentials: true
        },
	    error : function(){
	    	preventMultiClick(submitUrl, false);
	    	if (errFunc) {
	            errFunc();
	        }
	    },
	    success : function(responseJson){
	    	preventMultiClick(submitUrl, false);
	    	if (successFunc) {
	            successFunc(responseJson);
	        }
	    }
	});
	
	$(formId).submit();
}

function ajaxSubmitMultipartForm(submitUrl, formId, successFunc, errFunc) {
	removeMask(formId);
	preventMultiClick(submitUrl, true);

	$(formId).ajaxForm({
	    url : submitUrl,
	    enctype : "multipart/form-data",
	    dataType : "json",
	    error : function(){
	    	preventMultiClick(submitUrl, false);
	        if (errFunc) {
	            errFunc();
	        }
	    },
	    success : function(responseJson){
	    	preventMultiClick(submitUrl, false);
	        if (successFunc) {
	            successFunc(responseJson);
	        }
	    }
	});
	
	$(formId).submit() ;
}

// ajax 프로시져 직접실행
function ajaxProcJsonBox(proc_action, jsonObj, successFunc, errFunc, completeFunc) {
	var jsonData = jsonObj;
	var arr = proc_action.split('@');
	jsonData.proc_nm = arr[0];
	jsonData.action_type = arr[1];
	ajaxJson("/com/commonProcBox.do", jsonData, successFunc, errFunc, completeFunc);
}

function ajaxProcJsonList(proc_action, jsonObj, successFunc, errFunc, completeFunc) {
	var jsonData = jsonObj;
	var arr = proc_action.split('@');
	jsonData.proc_nm = arr[0];
	jsonData.action_type = arr[1];
	ajaxJson("/com/commonProcList.do", jsonData, successFunc, errFunc, completeFunc);
}

function ajaxProcJsonUpdate(proc_action, jsonObj, successFunc, errFunc, completeFunc) {
	var jsonData = jsonObj;
	var arr = proc_action.split('@');
	jsonData.proc_nm = arr[0];
	jsonData.action_type = arr[1];
	ajaxJson("/com/commonProcUpdate.do", jsonData, successFunc, errFunc, completeFunc);
}

function ajaxProcFormList(proc_action, formId, successFunc, errFunc, completeFunc) {
	removeMask(formId);
	var arr = proc_action.split('@');
	ajaxSubmitForm("/com/commonProcList.do?proc_nm="+arr[0]+"&action_type="+arr[1], formId, successFunc, errFunc)
}

function ajaxProcFormUpdate(proc_action, formId, successFunc, errFunc, completeFunc) {
	removeMask(formId);
	var arr = proc_action.split('@');
	ajaxSubmitForm("/com/commonProcUpdate.do?proc_nm="+arr[0]+"&action_type="+arr[1], formId, successFunc, errFunc)
}

//ajax 호출 시, 중복클릭 방지
function preventMultiClick(submitUrl, bool) {
	if(submitUrl.indexOf('_select') > 0 || submitUrl.indexOf('_edit') > 0 || submitUrl.indexOf('_list') > 0) { return; }
	if(submitUrl.toLowerCase().indexOf('login') > 0 || submitUrl.toLowerCase().indexOf('logout') > 0) { return; }

	if(bool) {
		$("button").each(function() {
			if($(this).attr("disabled") == undefined) {
				$(this).addClass("ajaxPrevent").prop("disabled", true);	
			}
		});
		var msg = "처리 중입니다. 잠시만 기다려 주세요.";
		if(submitUrl.indexOf('update') > 0 || submitUrl.indexOf('request') > 0) {
			msg += "<br><span style='color:red; padding:10px;'>(주의) 진행 창이 닫힐 때까지 절대 새로고침 하지 마세요!</span>";
		}
		showServerWorking("",msg, 200, 200);
		$("#divServerWorking").center();
	}else {
		$("#divServerWorking").hide("fast",function() {
			$(".ajaxPrevent").prop("disabled", false);
			$("button").removeClass("ajaxPrevent");
		});
	}
}

// 프로시져 호출해서 콤보상자 생성
function setOptionByProc(prActionNm, optNm, defVal, param01, param02, param03, param04, param05, topRow, afterFunc) {
    ajaxJsonSync("/com/codeList.do",
        {
            "pr_action_nm" : prActionNm,
            "param01" : param01,
            "param02" : param02,
            "param03" : param03,
            "param04" : param04,
            "param05" : param05
        },
        function(rtn) {
            optNm.options.length = 0;
            if(topRow != "") {
            	pos = optNm.options.length++;
            	optNm.options[pos].value = '';
            	optNm.options[pos].text = topRow;
            }
            for(var i=0; i < rtn.codeList.length; i++) {
            	pos = optNm.options.length++;
            	optNm.options[pos].value = rtn.codeList[i].code;
            	if(rtn.codeList[i].data.indexOf('&') >= 0) { rtn.codeList[i].data = getReplaceSpecialCharacters(rtn.codeList[i].data); }
            	optNm.options[pos].text = rtn.codeList[i].data;
            	if(rtn.codeList[i].optkey != undefined && rtn.codeList[i].optkey != '') { optNm.options[pos].title = rtn.codeList[i].optkey; }
            	if(rtn.codeList[i].code == defVal) { optNm.options[pos].selected = true; }
            }
            if(afterFunc != undefined) {
                afterFunc();
            }
        });
}

//프로시져 호출해서 콤보상자 생성
function setOptionByProcDbo(prActionNm, optNm, defVal, param01, param02, param03, param04, param05, topRow, afterFunc, dbo) {
	ajaxJsonSync("/com/codeList.do",
        {
            "pr_action_nm" : prActionNm,
            "dbo" : dbo,
            "param01" : param01,
            "param02" : param02,
            "param03" : param03,
            "param04" : param04,
            "param05" : param05
        },
        function(rtn) {
            optNm.options.length = 0;
            if(topRow != "") {
            	pos = optNm.options.length++;
            	optNm.options[pos].value = '';
            	optNm.options[pos].text = topRow;
            }
            for(var i=0; i < rtn.codeList.length; i++) {
            	pos = optNm.options.length++;
            	optNm.options[pos].value = rtn.codeList[i].code;
            	if(rtn.codeList[i].data.indexOf('&') >= 0) { rtn.codeList[i].data = getReplaceSpecialCharacters(rtn.codeList[i].data); }
            	optNm.options[pos].text = rtn.codeList[i].data;
            	if(rtn.codeList[i].optkey != undefined && rtn.codeList[i].optkey != '') { optNm.options[pos].title = rtn.codeList[i].optkey; }
            	if(rtn.codeList[i].code == defVal) { optNm.options[pos].selected = true; }
            }
            if(afterFunc != undefined) {
                afterFunc();
            }
        });
}

var treeClickTime;

// 화면(Table)의 내용을 excel파일로 다운로드
function screenToExcel(id, titleNm, fileNm) {
	if (fileNm == undefined || fileNm == "") {
	    fileNm = titleNm + ".xls";
	}
	$("table[id$='_fakeHeaderTable']").remove();
	$(id).table2excel({
	    exclude : ".noExl",
	    exclude_links : true,
	    name : titleNm,
	    filename : fileNm
	});
}

// keydown 체크 숫자
function numberKeydownCheck(e) {
	var key = e.charCode || e.keyCode || 0;
	return (key == 8 || key == 9 || key == 13 || key == 35 || key == 36
	        || key == 46 || (key >= 35 && key <= 40)
	        || (key >= 48 && key <= 57 && e.shiftKey == false) || (key >= 96 && key <= 105));
}
	
function floatKeydownCheck(e) {
	var key = e.charCode || e.keyCode || 0;
	return (key == 8 || key == 9 || key == 13 || key == 35 || key == 36
	        || key == 46 || (key >= 35 && key <= 40)
	        || (key >= 48 && key <= 57 && e.shiftKey == false)
	        || (key >= 96 && key <= 105) || (key >= 109 && key <= 110) || (key >= 189 && key <= 190));
}

// keydown 체크 영문
function engNumKeydownCheck(e) {
	var keyCd = e.charCode || e.keyCode || 0;
	var regEx = /[0-9A-Za-z]/g;
	var key = String.fromCharCode(e.which);
	if (keyCd == 8 || keyCd == 9 || keyCd == 35 || keyCd == 36 || keyCd == 37
	        || keyCd == 39 || keyCd == 46 || (keyCd >= 96 && keyCd <= 105)
	        || regEx.test(key)) {
	    return true;
	} else {
	    return false;
	}
}

function engKeydownCheck(e) {
	var keyCd = e.charCode || e.keyCode || 0;
	var englishAlphabet = /[A-Za-z]/g;
	var key = String.fromCharCode(e.which);
	if (keyCd == 8 || keyCd == 9 || keyCd == 35 || keyCd == 36 || keyCd == 37 || keyCd == 39 || keyCd == 46 || englishAlphabet.test(key)) {
	    return true;
	} else {
	    return false;
	}
}

// 특정 object를 화면의 센터로 처리
jQuery.fn.center = function() {
	this.css("position", "absolute");
	this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	return this;
}

// DatePicker 위치조정
function orientDatePicker(jqueryObj) {
	var clientWidth = $(".page-content").width();
	var clientHeight = $(".page-content").height();
	if(jqueryObj == undefined) { jqueryObj = $(".page-frame"); }
	$(".date-picker", jqueryObj).each(function() {
		var calendarX = $(this).offset().left;
		var calendarY = $(this).offset().top;
		var property1 = ""; var property2 = "";
		if(calendarX + 300 > clientWidth) { property1 = "right"; }
		if(calendarY + 350 > clientHeight) { property2 = "bottom"; }
		if(property1 != "" || property2 != "") {
			$(this).data("datepicker")._process_options({ orientation: property1.nvl("auto") + " " + property2.nvl("auto") });
		}
	});
} 

// 브라우저 컨트롤 관련 함수
var frameControl = new Object({
    // 팝업 리사이징
    resize : function() {
        var winSize = this.alertSize();
        var sizeWidth = winSize[0];
        var sizeHeight = winSize[1];

        var Dwidth = 0, Dheight = 0;

        if (browser() == "IE") {
            Dwidth = document.body.scrollWidth;
            Dheight = document.body.scrollHeight;
        } else {
            Dwidth = document.compatMode == "CSS1Compat" ? document.documentElement.scrollWidth
                    : document.body.scrollWidth;
            Dheight = document.compatMode == "CSS1Compat" ? document.documentElement.scrollHeight
                    : document.body.scrollHeight;
        }

        var width = Dwidth - sizeWidth;
        var height = Dheight - sizeHeight;
        self.resizeBy(width, height);
    },

    // 윈도우 사이즈 체크
    alertSize : function() {
        var myWidth = 0, myHeight = 0;
        if (typeof (window.innerWidth) == 'number') {
            // Non-IE
            myWidth = window.innerWidth;
            myHeight = window.innerHeight;
        } else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
            // IE 6+ in 'standards compliant mode'
            myWidth = document.documentElement.clientWidth;
            myHeight = document.documentElement.clientHeight;
        } else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
            // IE 4 compatible
            myWidth = document.body.clientWidth;
            myHeight = document.body.clientHeight;
        }
        return [ myWidth, myHeight ];
    }
});

var browser = function() {
	// Return cached result if avalible, else get result then cache it.
	if (browser.prototype._cachedResult)
	    return browser.prototype._cachedResult;
	
	// Opera 8.0+ (UA detection to detect Blink/v8-powered Opera)
	var isOpera = (!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;
	
	// Firefox 1.0+
	var isFirefox = typeof InstallTrigger !== 'undefined';
	
	// At least Safari 3+: "[object HTMLElementConstructor]"
	var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0;
	
	// Chrome 1+
	var isChrome = !!window.chrome && !isOpera;
	
	// At least IE6
	var isIE = /* @cc_on!@ */false || !!document.documentMode;
	
	// Edge 20+
	var isEdge = !isIE && !!window.StyleMedia;
	
	return browser.prototype._cachedResult = isOpera ? 'Opera'
	        : isFirefox ? 'Firefox' : isSafari ? 'Safari' : isChrome ? 'Chrome'
	                : isIE ? 'IE' : isEdge ? 'Edge' : "Don't know";
};

function getType(p) {
	if (Array.isArray(p))
	    return 'array';
	else if (typeof p == 'string')
	    return 'string';
	else if (p != null && typeof p == 'object')
	    return 'object';
	else
	    return 'other';
}

function getIType(elim) {
	var itype = "";
	if (elim.className.indexOf("tENGNUM") >= 0) {
	    itype = "ENGNUM";
	} else if (elim.className.indexOf("tMONEY") >= 0) {
	    itype = "MONEY";
	} else if (elim.className.indexOf("tNUM") >= 0) {
	    itype = "NUM";
	} else if (elim.className.indexOf("tFMONEY") >= 0) {
	    itype = "FMONEY";
	} else if (elim.className.indexOf("tFLOAT") >= 0) {
	    itype = "FLOAT";
	} else if (elim.className.indexOf("tCARD") >= 0) { 
		itype = "CARD"; 
	} else if (elim.className.indexOf("tEMAIL") >= 0) {
	    itype = "EMAIL";
	} else if (elim.className.indexOf("tYMD") >= 0) {
	    itype = "YMD";
	}
	return itype;
}

function removeMask(frm) {
	$(frm).find(".tYMD").each(function() {
	    $(this).val($(this).val().replace(/-/g, ""));
	});
	$(frm).find(".tMONEY").each(function() {
	    $(this).val($(this).val().replace(/,/g, ""));
	});
	$(frm).find(".tFMONEY").each(function() {
	    $(this).val($(this).val().replace(/,/g, ""));
	});
}

function removeMaskElm(ctrl) {
	var itype = getIType(ctrl);
	switch (itype) {
		case "MONEY":
		case "FMONEY":
			ctrl.value = ctrl.value.replace(/(\,)/g,"");
		    ctrl.style.textAlign = "right";
		    break;
		case "YMD":
		case "CARD":
			ctrl.value = ctrl.value.replace(/-/g,"");
	}
}

function formatMask(frm) {
	$(frm).find(".tYMD").each(function() {
	    $(this).val($(this).val().getFormatVal("YMD"));
	});
	$(frm).find(".tMONEY").each(function() {
	    $(this).val($(this).val().getFormatVal("MONEY"));
	    $(this).css("text-align", "right");
	});
	$(frm).find(".tFMONEY").each(function() {
	    $(this).val($(this).val().getFormatVal("MONEY"));
	    $(this).css("text-align", "right");
	});
	$(frm).find(".tNUM").each(function() {
	    $(this).css("text-align", "right");
	});
}

function formatMaskElm(ctrl) {
	var itype = getIType(ctrl);
	switch (itype) {
		case "MONEY":
		case "FMONEY":
		    ctrl.value = ctrl.value.getFormatVal("MONEY");
		    ctrl.style.textAlign = "right";
		    break;
		case "NUM":
		case "FLOAT":
		    ctrl.style.textAlign = "right";
		    break;
		case "YMD":
		    ctrl.value = ctrl.value.getFormatVal("YMD");
	}

	if(ctrl.className.indexOf('required') >= 0) {
		ctrl.style.backgroundColor = getItemColor('required');
    }
}

function formatMaskElmById(id) {
	var iType = $("#"+id).attr("class");
	if(iType.indexOf("MONEY") >= 0) {
		$("#"+id).val($("#"+id).val().getFormatVal("MONEY"));
		$("#"+id).css("text-align", "right");
	}else if(iType.indexOf("NUM") >= 0 || iType.indexOf("FLOAT") >= 0) {
		$("#"+id).css("text-align", "right");
	}else if(iType.indexOf("YMD")) {
		$("#"+id).val($("#"+id).val().getFormatVal("YMD"));
	}
	
	if(iType.indexOf('required') >= 0) {
        $("#"+id).css("background-color", getItemColor('required'));
    }
}

function changeObjectProperty(input, status, bool) {
	var col_property = input.className;
	if(status == "readonly") {
	    input.readOnly = true;
	    if(col_property.indexOf('required') >= 0) { input.className = col_property.replaceAll("required", ""); }
	    input.disabled = false;
	    input.style.backgroundColor = getItemColor('readonly');
	    if(bool == undefined || bool == true) { input.value = ""; }
	}else if(status == "enabled") {
	    input.readOnly = false;
	    if(col_property.indexOf('required') >= 0) { input.className = col_property.replaceAll("required", ""); }
	    input.disabled = false;
	    input.style.backgroundColor = '#ffffff';
	}else if(status == "required") {
	    input.readOnly = false;
	    if(col_property.indexOf('required') < 0) { input.className += " required"; }
	    input.disabled = false;
	    input.style.backgroundColor = getItemColor('required');
	}else if(status == "requiredOnly") {
	    input.readOnly = true;
	    if(col_property.indexOf('required') < 0) { input.className += " required"; }
	    input.disabled = false;
	    input.style.backgroundColor = getItemColor('required');
	}else if(status == "disabled") {
	    input.disabled = true;
	    input.style.backgroundColor = getItemColor('readonly');
	}
}

function getItemColor(status) {
	if(status == 'required') {
	    return "#f7efbe";
	}else if(status == 'readonly') {
	    return "#f7f7f7";
	}
}

function parseInt2(input) {
	return input.value == '' ? 0 : parseInt(input.value.replace(/,/g, ""));
}

function parseLong2(input) {
	return input.value == '' ? 0 : parseLong(input.value.replace(/,/g, ""));
}

function parseFloat2(input) {
	return input.value == '' ? 0 : parseFloat(input.value.replace(/,/g, ""));
}

function padZero(input, cnt) { 
	if(cnt == undefined) { cnt = 2; }
	input.value = input.value.padLeft(cnt, '0');
}

function hasCheckedRadio(input) {
    if (input.length > 1) {
        for (var inx = 0; inx < input.length; inx++) {
            if (input[inx].checked) return true;
        }
    } else {
        if (input.checked) return true;
    }
    return false;
}

function getRadioValue(input) {
	try {
	    if(input.length > 1) {
	        for(var inx = 0; inx < input.length; inx++) {
	            if(input[inx].checked) { return input[inx].value; }
	        }
	    }else if(input.checked) {
	        return input.value;
	    }
	    return "";
	}catch (e) {
	    return "";
	}
}

function getSelectedText(selectObj) {
	for(var i=0; i < selectObj.options.length; i++) {
	    if(selectObj.options[i].value != '' && selectObj.options[i].selected) {
	        return selectObj.options[i].text;
	    }
	}
	return "";
}

function copyOptions(source, target, defVal) {
	target.options.length=source.options.length;
	for(var i=0; i < source.options.length; i++) {
		target.options[i].value = source.options[i].value; 
		target.options[i].text = source.options[i].text;
		if(source.options[i].value == defVal) { target.options[i].selected = true; }
	}
}

function getMethodFromUrl(pageUrl) {
	ePos = pageUrl.indexOf(".do");
	sPos = pageUrl.lastIndexOf("/", ePos);
	return pageUrl.substring(sPos+1, ePos);
}

function setBackColor(newRow, rowName) {
	if(rowName == undefined) { rowName = 'tr_'; }
	var oldRow = $("input[name='selectedRow']").val(); 
	if(oldRow != '') { $("#"+rowName+oldRow).removeClass("bg-yellow"); }
	$("#"+rowName+newRow).addClass("bg-yellow");
	$("input[name='selectedRow']").val(newRow);
}

function setCookie(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";";
}

function getCookie(name) {
	var nameOfCookie = name + "=";
	var x = 0;	
	while (x <= document.cookie.length) {
	    var y = (x + nameOfCookie.length);
	    if (document.cookie.substring(x, y) == nameOfCookie) {
	        if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
	            endOfCookie = document.cookie.length;
	        return unescape(document.cookie.substring(y, endOfCookie));
	    }
	    x = document.cookie.indexOf(" ", x) + 1;
	    if (x == 0)
	        break;
	}
	return "";
}

function DeleteCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval = GetCookie(name);
	document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
}

function isObject(object_key) {
	if($("input[name='"+object_key+"']").length) { return true; }
	if($("select[name='"+object_key+"']").length) { return true; }
	if($("textarea[name='"+object_key+"']").length) { return true; }
    return false;
}

function isEmpty(input) {
	if(input.value == null || input.value.replace(/ /gi, "") == "") {
	    return true;
	}
	return false;
}

function nvl(srcVal, defVal) {
	if(srcVal == undefined || srcVal == "") {
		return defVal == undefined ? "" : defVal;
	}else {
		return srcVal;
	}
}

function concatStr(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) {
	var rtn = nvl(arg1) + '|' + nvl(arg2);
	if(arg3 != undefined) { rtn += '|' + nvl(arg3); }
	if(arg4 != undefined) { rtn += '|' + nvl(arg4); }
	if(arg5 != undefined) { rtn += '|' + nvl(arg5); }
	if(arg6 != undefined) { rtn += '|' + nvl(arg6); }
	if(arg7 != undefined) { rtn += '|' + nvl(arg7); }
	if(arg8 != undefined) { rtn += '|' + nvl(arg8); }
	if(arg9 != undefined) { rtn += '|' + nvl(arg9); }
	
	return rtn;
}

function arrayFind(srcArray, tarVal) {
	if(srcArray == "") { return true; }
	var arr = srcArray.split('|');
	for(var i=0; i < arr.length; i++) {
		if(tarVal.indexOf(arr[i]) >= 0) { 
			return true; 
		}
	}
	return false;
}

function cloneJson(JsonObj) {
	if(JsonObj === null || typeof(JsonObj) !== "object") { return JsonObj; }
	var copyObj = JsonObj.constructor();
	for(var attr in JsonObj) {
		if(JsonObj.hasOwnProperty(attr)) {
			copyObj[attr] = JsonObj[attr];
		}
	}
	return copyObj;
}

function clearJson(JsonObj) {
	for(var key in JsonObj) {
		JsonObj[key] = "";
	}
}

function isCompareJson(oldJson, newJson) {
	for(var key in oldJson) {
		if(oldJson[key] != newJson[key]) { return false; }
	}
	return true;
}

// 특수문자 치환
function getReplaceSpecialCharacters(str) {
    str = str.replace(/&amp;/g, "&");
    str = str.replace(/&lt;/g, "<");
    str = str.replace(/&gt;/g, ">");
    str = str.replace(/&ge;/g, "≥");
    str = str.replace(/&le;/g, "≤");
    str = str.replace(/&middot;/g, "·");
    str = str.replace(/&acute;/g, "'");
    str = str.replace(/&apos;/g, "'");
    str = str.replace(/&quot;/g, "\"");
    str = str.replace(/m&sup2;/g, "m²");
    str = str.replace(/m&sup3;/g, "m³");
    return str;
}

// FORM 생성
function createElementForm(form_nm, pageUrl) {
	var form = document.createElement('form');
	form.setAttribute('id', form_nm);
	form.setAttribute('name', form_nm);
	form.setAttribute('action', pageUrl);
	form.setAttribute('target', form_nm);
	form.setAttribute('method', 'post');
	form.style.display = "none";
	return form;
}

// INPUT 생성
function createElementInput(form, input_type, input_name, input_value) {
	var input = document.createElement('input');
	input.setAttribute('type', input_type);
	input.setAttribute('name', input_name);
	input.setAttribute('value', input_value);
	input.setAttribute('class', 'dynamic-element');
	form.appendChild(input);
}

// FORM 전송
function returnFormSubmit(form, actionUrl, target) {
	for(var i=0; i < form.elements.length; i++) {
		if(form.elements[i].tagName.toLowerCase() == "input") {
			removeMaskElm(form.elements[i]);
		}
	}
	form.action = actionUrl;
	form.target = target == undefined ? '_self' : '_'+target;
	form.submit();	
}

// https 적용 페이지
function isSecurityPage(pageUrl) {
	if(pageUrl.indexOf('/') == 0 && (pageUrl.indexOf('/user/') >= 0 || pageUrl.indexOf('/myPage/') >= 0 || pageUrl.indexOf('/admenu/') >= 0)) { 
		return true;
	}
	return false;
}

// MODAL 그리기
function drawingModal(mTitle, mBody, wdt, hgt) {
	var cHtml = "<div class='modal-dialog' style='width:"+wdt+"px;'>"
			  + "	<div class='modal-content'>"	
			  + "		<div class='modal-header'>"	
			  + "			<button type='button' class='close' data-dismiss='modal' aria-hidden='true'></button>"	
			  + "			<h4 class='modal-title'>"+mTitle+"</h4>"	
			  + "		</div>"	
			  + "		<div class='modal-body' " + (hgt == undefined ? "" : "style='height:"+hgt+"px;'") + ">" + mBody + "</div>"
			  + "	</div>"	
			  + "</div>";
	$("#dialog-form").html(cHtml);
	appendHtmlAfterWork("#dialog-form");
}

// 화면 프린트 미리보기
function screenPrintPreview() {
	var browser = navigator.userAgent.toLowerCase();
	if(browser.indexOf('chrome') != -1) {
		window.print();
	}else if(browser.indexOf('trident') != -1) {
		try {
			var webBrowser = '<OBJECT ID="previewWeb" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
			document.body.insertAdjacentHTML('beforeEnd', webBrowser);
			previewWeb.ExecWB(7, 1);
			previewWeb.outerHTML = "";
		}catch(e) {}
	}
}

// 특수문자 치환
function replaceSpecial(val) {
	return val.replace(/@NEWLINE@/g,"\n").replace(/@SQUOT@/g,"'").replace(/@DQUOT@/g,"\"").replace(/@LBRACE@/g,"(").replace(/@RBRACE@/g,")");
}
function replaceSpecialHtml(val) {
	return val.replace(/@NEWLINE@/g,"<br>").replace(/@SQUOT@/g,"'").replace(/@DQUOT@/g,"\"").replace(/@LBRACE@/g,"(").replace(/@RBRACE@/g,")");
}

// 폼의 특수문자 체크
function checkSpecialChar(input_arr, chars, chkForm) {
	if(chars == undefined) { chars = "'|Ð"; } 
	if(chkForm == undefined) { chkForm = 'document.main'; }
	var arr = input_arr.split(',');
	for(var i=0; i < arr.length; i++) {
		var input = eval(chkForm + '.' + arr[i].replace(/ /g,""));
		for(var j=0; j < chars.length; j++) {
			if(input.value.indexOf(chars.charAt(j)) >= 0) { 
				alert("사용할 수 없는 문자("+chars.charAt(j)+")가 포함되어 있습니다.");
				return false; 
			}
		}
	}
	return true;
}
		
// 폼의 HTML 태그 체크
function checkHtmlTag(input) {
	if(isEmpty(input)) { return true; }
	var tag_arr = "html,head,body,form,frame,iframe,style,script,object,applet";
	var tag = tag_arr.split(',');
	for(var i=0; i < tag.length; i++) {
		if(input.value.toLowerCase().indexOf('<'+tag[i]) >= 0 || input.value.toLowerCase().indexOf('</'+tag[i]) >= 0) { 
			alert("사용할 수 없는 태그("+tag[i]+")가 포함되어 있습니다.");
			return false; 
		}
	}
	var func_arr = "onerror,onmouseover,onkeydown,alert,fromCharCode,lowsrc,dynsrc,list-style-image";
	var func = func_arr.split(',');
	for(var i=0; i < func.length; i++) {
		if(input.value.toLowerCase().indexOf(func[i]) >= 0) { 
			alert("사용할 수 없는 문자열("+func[i]+")이 포함되어 있습니다.");
			return false; 
		}
	}
	return true;
}

// 입력폼을 조회모드로 전환
function changeViewMode(id) {
	$(id + " .edit-mode").each(function() {
		$(this).remove();
	});
	$(id + " input:text").each(function() {
		$(this).parent().html($(this).val());
	});
	$(id + " select").each(function() {
		if($(this).hasClass("edit-view-mode")) { return true; }
		var optTxt = $(this).children("option:selected").val() != '' ? $(this).children("option:selected").text() : ''; 
		$(this).parent().html(optTxt);
	});
	$(id + " textarea").each(function() {
		$(this).parent().html($(this).val().replace(/\n/g,"<br>"));
	});
	$(id + " input:file").each(function() {
		$(this).remove();
	});
	$(id + " input:checkbox").each(function() {
		if($(this).is(":checked")) {
			if($(this).next().text() == "") { $(this).next().text("√"); }
		}else {
			$(this).next().text("");
		}
		$(this).parent().removeClass("mt-checkbox mt-checkbox-outline");
		$(this).remove();
	});
} 

// 테이블 틀 고정(세로)
function fixTableHeader(tableId) {
	$("#"+tableId+"_fakeHeaderTable").remove();
	$("#"+tableId).closest("div").css("overflow-y","scroll");
	$("#"+tableId).closest("div").prepend("<table id='"+tableId+"_fakeHeaderTable' class='"+$("#"+tableId).attr("class")+"'></table>");
	$("#"+tableId+"_fakeHeaderTable").append("<thead>"+$("#"+tableId+" thead").html()+"</thead>");
	$("#"+tableId+"_fakeHeaderTable").attr("style", "z-index : 100; position : fixed; width :" + $("#"+tableId).css("width") + " !important;");
	$("#"+tableId+" thead tr th").each(function(idx) {
		$("#"+tableId+"_fakeHeaderTable thead tr th").eq(idx).css("width", parseFloat($(this).css("width"))+"px");
	});
	$("#"+tableId).on('scroll', function() {
		$("#"+tableId+"_fakeHeaderTable").css("top", ($("#"+tableId).offset().top + $("#"+tableId).closest("div").scrollTop() - $(window).scrollTop())+"px");
	});
}

// 테이블 틀 고정(가로)
function fixTableColumn(tableId, colCnt) {
	$("#"+tableId).closest("div").css("position","relative");
	$("#"+tableId).closest("div").append("<table id='fakeLeftTable"+tableId+"_' class='"+$("#"+tableId).attr("class")+"'></table>");
	$("#"+tableId+"_fakeLeftTable").append($("#"+tableId).html());
	
	var maxColCnt = 0;
	$("#"+tableId+"_fakeLeftTable thead th").each(function() {
		maxColCnt += $(this).prop("colspan");
	});
	
	$("#"+tableId+"_fakeLeftTable tr").each(function(idx) {
		var removeCnt = maxColCnt - colCnt;
		for(var i=$(this).children().length-1; i >= 0; i--) {
			removeCnt -= $(this).children().eq(i).prop("colspan");
			if(removeCnt >= 0) { $(this).children().eq(i).remove(); }
		}
	});

	var tdWidths = [];
	$("#"+tableId+" tr").each(function () {
		if($(this).children().length == maxColCnt) {
			$(this).children().each(function() {
				tdWidths.push($(this).css("width"));
			});
		}
	});

	var tableWidth = 0;
	for(var i=0; i < colCnt; i++) {
		tableWidth += parseFloat(tdWidths[i]);
	}

	$("#"+tableId+"_fakeLeftTable").attr("style", "position:absolute; top:0px; width:"+tableWidth+"px !important; z-index:50;");
	$("#"+tableId+"_fakeLeftTable tr").each(function (trIdx) {
		if($(this).children().length == colCnt) {
			$(this).children().each(function(tdIdx) {
				$(this).css("width", tdWidths[tdIdx]);
			})
		}
		$(this).css("height", $("#"+tableId+" tr").eq(trIdx).css("height"));
	});

	$("#"+tableId).closest("div").on('scroll', function() {
		$("#"+tableId+"_fakeLeftTable").css("left", $("#"+tableId).closest("div").scrollLeft());
	});
}

// 업로드파일 확장자 검사
function checkUploadFile(fileName, uploadType) {
	if(fileName == '' || uploadType == undefined) { return true; }
	var fileExt = fileName.substring(fileName.lastIndexOf('.')+1).toLowerCase();
	uploadType = uploadType.replace("img","gif,jpg,jpeg,bmp,png");
	if(uploadType.indexOf(fileExt) < 0) {
		alert('파일형식이 옳바르지 않습니다.\n\n['+uploadType+' 파일만 업로드 가능]');
		return false;
   	}
	return true;
}

/********************************************************************************************/
/* 							FMS 비즈니스 로직 처리를 위한 공통 스크립트									*/
/********************************************************************************************/
// 기타코드 입력
function changeInputCode(object_key, input_type, sel_val, required, uType) {
	if(uType == undefined) { uType = 'type1'; }
	if(uType == 'type1') {
		var form_nm = 'main'; var input_nm = object_key;
		if(object_key.indexOf('.') > 0) {
			arr = object_key.split('.');
			form_nm = arr[0]; input_nm = arr[1];
		}
		
		var spanId = 'span_' + input_nm;
		if(input_type == 'select') {
			if(sel_val == 'NEW') {
				$('#'+spanId+'_txt').css("display", ""); 
				$('#'+spanId+'_sel').css("display", "none"); 
				if(required) {
					changeObjectProperty(eval('document.' + form_nm + '.' + input_nm + '_txt'), 'required');
					changeObjectProperty(eval('document.' + form_nm + '.' + input_nm + '_sel'), 'enabled');
				}
				eval('document.' + form_nm + '.' + input_nm).value = '';
				eval('document.' + form_nm + '.' + input_nm + '_txt').value = '';
				eval('document.' + form_nm + '.' + input_nm + '_txt').focus();
			}else {
				eval('document.' + form_nm + '.' + input_nm).value = sel_val;
			}
		}else {
			eval('document.' + form_nm + '.' + input_nm + '_sel').value = '';
			if(required) {
				changeObjectProperty(eval('document.' + form_nm + '.' + input_nm + '_txt'), 'enabled');
				changeObjectProperty(eval('document.' + form_nm + '.' + input_nm + '_sel'), 'required');
			}
			$('#'+spanId+'_txt').css("display", "none"); 
			$('#'+spanId+'_sel').css("display", ""); 
		}
	}else if(uType == 'type2') {
		var spanId = 'span' + object_key.substring(0,1).toUpperCase() + object_key.substring(1);
		if(input_type == 'select') {
			if(sel_val == 'x') {
				$('#'+spanId+'Txt').show(); 
				$('#'+spanId+'Sel').hide(); 
				if(required) {
					changeObjectProperty(document.all[object_key+'_nm'], 'required');
					changeObjectProperty(document.all[object_key+'_cd'], 'enabled');
				}
				document.all[object_key+'_nm'].value = '';
				document.all[object_key+'_nm'].focus();
			}else {
				document.all[object_key+'_nm'].value = sel_val;
			}
		}else {
			document.all[object_key+'_cd'].value = '';
			if(required) {
				changeObjectProperty(document.all[object_key+'_nm'], 'enabled');
				changeObjectProperty(document.all[object_key+'_cd'], 'required');
			}
			$('#'+spanId+'Txt').hide(); 
			$('#'+spanId+'Sel').show(); 
		}
	}
}

// 손상크기 입력폼 생성
function makeDefectSize(input_mask, size1, size2, size3, size4) { 
	if(input_mask == 'CRACK') {
		cHtml = "폭 &nbsp;:&nbsp; <input type='text' id='defect_val1' name='defect_val1' value='"+size1+"' maxlength='10' title='폭' class='form-control tFMONEY' style='width:40px;'> ㎜&nbsp;&nbsp;"
		      + "길이 : <input type='text' id='defect_val2' name='defect_val2' value='"+size2+"' maxlength='10' title='길이' class='form-control tFMONEY' style='width:40px;'> m&nbsp;&nbsp;"
		$('#spanDefectSize').html(cHtml);
		formatMaskElmById("defect_val1");
		formatMaskElmById("defect_val2");
	}else if(input_mask == 'AREA') {
		cHtml = "가로 : <input type='text' id='defect_val1' name='defect_val1' value='"+size1+"' maxlength='10' title='가로' class='form-control tFMONEY' style='width:40px;' onChange=\"$('#defect_val3').val(Math.round(parseFloat($('#defect_val1').val().nvl('0')) * parseFloat($('#defect_val2').val().nvl('0')) * 100) / 100);\"> m&nbsp;&nbsp;"
			  + "세로 : <input type='text' id='defect_val2' name='defect_val2' value='"+size2+"' maxlength='10' title='세로' class='form-control tFMONEY' style='width:40px;' onChange=\"$('#defect_val3').val(Math.round(parseFloat($('#defect_val1').val().nvl('0')) * parseFloat($('#defect_val2').val().nvl('0')) * 100) / 100);\"> m&nbsp;&nbsp;"
			  + "면적 : <input type='text' id='defect_val3' name='defect_val3' value='"+size3+"' maxlength='10' title='면적' class='form-control tFMONEY' style='width:60px;'> ㎡&nbsp;&nbsp;";
		$('#spanDefectSize').html(cHtml);
		formatMaskElmById("defect_val1");
		formatMaskElmById("defect_val2");
		formatMaskElmById("defect_val3");
	}else if(input_mask == 'ENV1') { // 철근부식
		var str = "1건조|2습윤|3부식성|4고부식성";
		var envArr = str.split('|');
		cHtml = "<input type='text' name='defect_size' value='"+size4+"' maxlength='50' title='손상크기' class='form-control' style='width:200px'>&nbsp;&nbsp;";
		cHtml += "부식환경 : <select name='defect_val3' title='부식환경' class='bs-select form-control' style='width:100px'><option value=''></option>";
		for(var i=0; i < envArr.length; i++) {
			cHtml += "<option value='"+envArr[i].substring(0,1)+"' "+(envArr[i].substring(0,1) == size3 ? 'selected' : '')+">"+envArr[i].substring(1)+"</option>"; 
		}
		cHtml += "</select> &nbsp;&nbsp;";
		$('#spanDefectSize').html(cHtml);
	}else {
		cHtml = "<input type='text' name='defect_size' value='"+size4+"' maxlength='50' title='손상크기' class='form-control' style='width:200px'>&nbsp;";
		$('#spanDefectSize').html(cHtml);
	}
}

// 부재명 구성항목 중, 제외할 부재트리
function exceptObjectTree(facil_no) {
	var exString = "";
	var facilKind = facil_no.substring(0,2);
	if(facilKind == "BR") { exString = "상부구조,2차부재,기타부재,난간/연석,하부구조,교대/교각,받침,기타부재"; }
	return exString;
}


// 수리시설 평가유형에 따른 영향계수
function setDefectCoef(defect_lvl, eval_grade) {
	var inf_coef = 0;
	if(defect_lvl == '1') { // 중요결함
		inf_coef = 1.0;
	}else if(defect_lvl == '2') { // 국부결함
		if	   (eval_grade == 'a') { inf_coef = 1.0; }
		else if(eval_grade == 'b') { inf_coef = 1.1; }
		else if(eval_grade == 'c') { inf_coef = 1.2; }
		else if(eval_grade == 'd') { inf_coef = 1.4; }
		else if(eval_grade == 'e') { inf_coef = 2.0; }
	}else if(defect_lvl == '3') { // 일반손상
		if	   (eval_grade == 'a') { inf_coef = 1.0; }
		else if(eval_grade == 'b') { inf_coef = 1.1; }
		else if(eval_grade == 'c') { inf_coef = 1.3; }
		else if(eval_grade == 'd') { inf_coef = 1.7; }
		else if(eval_grade == 'e') { inf_coef = 3.0; }
	}
	return inf_coef;
}

// 점검진단실시 단계별 하위메뉴 생성
function setInspectMenu(menu_id, project_no, facil_no, isEditable) {
	$("#divLeftFrame .sub-menu").find("li a").each(function() {
		if($(this).html().indexOf("any02001_list") > 0) {
			var old_height = $(".page-sidebar").height();
			var pageUrl = "/maint/any02002_evaluate.do?project_no="+project_no+"&facil_no="+facil_no;
			var cHtml = "<a href='#' class='nav-link nav-toggle inspect-step' style='background-color:#ebebeb; margin:0 20px;'><span class='title' onclick=\"goMenu('"+menu_id+"','"+pageUrl+"&eval_step=0')\">대상시설물</span></a>"
					  + "<a href='#' class='nav-link nav-toggle inspect-step' style='background-color:#ebebeb; margin:0 20px;'><span class='title' onclick=\"goMenu('"+menu_id+"','"+pageUrl+"&eval_step=1')\">부재구성</span></a>";
			if(isEditable) { cHtml = cHtml
					  + "<a href='#' class='nav-link nav-toggle inspect-step' style='background-color:#ebebeb; margin:0 20px;'><span class='title' onclick=\"goMenu('"+menu_id+"','"+pageUrl+"&eval_step=2')\">외관조사</span></a>"
					  + "<a href='#' class='nav-link nav-toggle inspect-step' style='background-color:#ebebeb; margin:0 20px;'><span class='title' onclick=\"goMenu('"+menu_id+"','"+pageUrl+"&eval_step=3')\">조사 및 재료시험</span></a>";
			}
			cHtml = cHtml
					  + "<a href='#' class='nav-link nav-toggle inspect-step' style='background-color:#ebebeb; margin:0 20px;'><span class='title' onclick=\"goMenu('"+menu_id+"','"+pageUrl+"&eval_step=4')\">종합평가/안전등급</span></a>"
					  + "<a href='#' class='nav-link nav-toggle inspect-step' style='background-color:#ebebeb; margin:0 20px;'><span class='title' onclick=\"goMenu('"+menu_id+"','"+pageUrl+"&eval_step=5')\">보수보강방안</span></a>"
					  + "<a href='#' class='nav-link nav-toggle inspect-step' style='background-color:#ebebeb; margin:0 20px;'><span class='title' onclick=\"goMenu('"+menu_id+"','"+pageUrl+"&eval_step=6')\">보고서발행</span></a>";
			$(this).after(cHtml);
			var new_height = $(".page-sidebar").height();
			$(".page-content").height($(".page-content").height() + (new_height - old_height));
			//$(".page-content").css("height", "auto");
			return false;
		}
	});
}

// 왼쪽메뉴 숨기기
function hideLeftFrame() {
	$("#divLeftFrame").hide();
	$("#divRightFrame").css("padding","0px 0px 50px 0px");
	$(".page-bar.hor-menu").css("padding","0px");
}

function changePrstOrg(formName, prst_org_cd, defVal, topRow) {
	formName.gather_org_cd.options.length = 1;
	if(isObject('mng_main_cd')) { formName.mng_main_cd.options.length = 1; }
	if(prst_org_cd != '') {
		if(topRow == '' || topRow == undefined) { topRow = '전체'; };
		setOptionByProc('PR_COMTB_ORGN01_LIST@LISTCODE', formName.gather_org_cd, defVal, 'B', prst_org_cd, '', '', '', topRow);
	}
}

function changeGatherOrg(formName, gather_org_cd, defVal, topRow) {
	formName.mng_main_cd.options.length = 1;
	if(gather_org_cd != '') {
		if(topRow == '' || topRow == undefined) { topRow = '전체'; };
		setOptionByProc('PR_COMTB_ORGN01_LIST@LISTCODE', formName.mng_main_cd, defVal, 'A', gather_org_cd, '', '', '', topRow);
	}
}
					
// 시설물구분 선택
function changeFacilGbn(formName, facil_gbn, defVal, topRow) {
	if(!isObject('facil_kind')) { return; }
	formName.facil_kind.options.length = 1;
	if(facil_gbn != '') {
		if(topRow == '' || topRow == undefined) { topRow = '전체'; };
		setOptionByProc('PR_COMTB_CODE02_LIST@LISTCODE', formName.facil_kind, defVal, 'facil_kind', facil_gbn, '', '', '', topRow);
	}
}

function isKoreanAll(input_val) {
    if (input_val.length != getByteLengthVal(input_val)) {
        return true;
    } else {
        return false;
    }
}

function getByteLengthVal(input_val) {
    var byteLength = 0;
    for (var inx = 0; inx < input_val.length; inx++) {
        var oneChar = escape(input_val.charAt(inx));
        if ( oneChar.length == 1 ) {
            byteLength ++;
        } else if (oneChar.indexOf("%u") != -1) {
            byteLength += 2;
        } else if (oneChar.indexOf("%") != -1) {
            byteLength += oneChar.length/3;
        }
    }
    return byteLength;
}

function containsCharsOnly(input_val, chars) {
    for (var inx = 0; inx < input_val.length; inx++) {
       if (chars.indexOf(input_val.charAt(inx)) < 0)
           return false;
    }
    return true;
}

function isAlphaNum(input_val) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    return containsCharsOnly(input_val, chars);
}
function isNumOnly(input_val) {
    var chars = "0123456789";
    return containsCharsOnly(input_val, chars);
}
function isNumber(input_val) {
    var chars = "0123456789";
    return containsCharsOnly(input_val, chars);
}
//주민등록번호 체크 
function chkLocFrnJuminNo(jumin1, jumin2) {
	if(jumin2.substring(1) == 'xxxxxx') {
		if(!isNumOnly(jumin1)) { return false; }
		if(!containsCharsOnly(jumin2.substring(0,1), "12345678")) { return false; }
		var date = (containsCharsOnly(jumin2.substring(0,1), "1256") ? '19' : '20') + jumin1;
		if(!isValidDate(date)) { return false; }
		return true;
	}else if(checkJuminNo(jumin1, jumin2) || checkFgnno(jumin1, jumin2) || jumin1.substring(0,4) >= '2010') {
		return true;
	}else {
		return false;
	}
}

function checkJuminNo(jumin1, jumin2) {
	var jumin = jumin1 + jumin2;
	if(jumin.length != 13) { return false; }
	
	var weight = new Array(2,3,4,5,6,7,8,9,2,3,4,5);
	var chkval = 0;
	for(var i=0; i <= 11; i++) {
		chkval += (weight[i] * parseInt(jumin.charAt(i)));
	}
	chkval = 11 - (chkval % 11);
	if(chkval >= 10) { chkval -= 10; }
	
	return chkval == jumin.charAt(12);
}

function checkFgnno(resideNo1, resideNo2) {
	var fgnno = resideNo1 + resideNo2;
    var sum=0;
    var odd=0;
    buf = new Array(13);
    for(i=0; i<13; i++) { buf[i]=parseInt(fgnno.charAt(i)); }
    odd = buf[7]*10 + buf[8];
    if(odd%2 != 0) { return false; }
    if( (buf[11]!=6) && (buf[11]!=7) && (buf[11]!=8) && (buf[11]!=9) ) {
            return false;
    }
    multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
    for(i=0, sum=0; i<12; i++) { sum += (buf[i] *= multipliers[i]); }
    sum = 11 - (sum%11);
    if(sum >= 10) { sum -= 10; }
    sum += 2;
    if(sum >= 10) { sum -= 10; }
    if(sum != buf[12]) { return false }
    return true;
}

//사업자등록번호 체크 
function checkSaupjaNo(bizID) { 
	var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
	var tmpBizID, i, chkSum=0, c2, remander; 
	
	for(i=0; i<=7; i++) { chkSum += checkID[i] * bizID.charAt(i); }
 	c2 = "0" + (checkID[8] * bizID.charAt(8)); 
 	c2 = c2.substring(c2.length - 2, c2.length); 
 	chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
	remander = (10 - (chkSum % 10)) % 10 ; 
	
	if(Math.floor(bizID.charAt(9)) == remander) return true ;
	return false; 
}

function removeComma(input) {
    return input.value.replace(/,/gi,"");
}

function insertComma(str) {
    str = str + "";
    var tmpStr = str+"";
    var underComma = "";
    
    if (str.indexOf(".") >=0) {
        tmpStr = str.substring(0,tmpStr.indexOf("."));
        underComma = "."+str.substring(str.indexOf(".")+1, str.length);
    } 
       
    
    var len = tmpStr.length;
    var resultValue = "";
    var sign = "";
    if (str.substring(0,1) == "-") {
       sign = "-";
       len = len -1;
       tmpStr = tmpStr.substring(1);
    }
    for (var i=0 ; i<len ; i++) {
        if (i > 0  && (i % 3) == 0 )
            resultValue = "," + resultValue;

        resultValue = tmpStr.charAt(len - 1 - i) + resultValue;
    }
	return sign+resultValue+underComma;
}

function containsCharsOnly(input_val, chars) {
    for (var inx = 0; inx < input_val.length; inx++) {
       if (chars.indexOf(input_val.charAt(inx)) < 0)
           return false;
    }
    return true;
}