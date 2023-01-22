var MINUS = '-';
var keys = new Array (8, 9, 13, 33, 34, 35, 36, 37, 39, 45, 46, 95, 190, 109, 110, 188, 189);
var controlkeys = new Array (8, 9, 13, 33, 34, 35, 36, 37, 39, 45, 46, 95, 109, 110);

document.writeln("<div id='divAlert' style='height:22px;width:300px;background: buttonface; margin:2; border: 1 solid buttonshadow; display:none; position:absolute; z-index:1'>");
document.writeln("<table cellpadding=2 cellspacing=1 bgcolor=#DFDFDF align=center height=20 width=298><tr><td id=divAlertContent style='font-size:12px;'>&nbsp;</td></tr></table>");
document.writeln("</div>");

function f_onkeydown(evt) {
    var ctrl = Event.element(evt);
    var rtn = isKeyValid (ctrl, evt.keyCode);
    if(rtn == false) {
        if(document.all)
            evt.returnValue = rtn;
        else
            evt.preventDefault();
    }
}

function f_onfocus(evt) {
	var ctrl = Event.element(evt);
	if(!ctrl.readOnly) {
		_f_remove_format(ctrl);
		ctrl.style.textAlign="left";
		if(document.all) {		
			if(ctrl.select) {
				try { ctrl.select(); } catch (ee) {}
			}
		}
	}
}

function f_onblur(evt) {
    var ctrl = Event.element(evt);
    _f_format(ctrl);
    if(pageInitEnd == "end") {
        chkValueAlert(ctrl);
    }
}

function chkValueAlert(ctrl) {
    var msg = itemCheck(ctrl, false, "");
    if(msg.length >0) {
        if(document.all) {
            var top = document.body.clientTop + GetObjectTop(ctrl)+0;
            var left = document.body.clientLeft + GetObjectLeft(ctrl)+100;
            document.getElementById("divAlert").style.pixelTop = top;
            document.getElementById("divAlert").style.pixelLeft = left;
        }else {
            var top = GetObjectTop(ctrl)+0;
            var left = GetObjectLeft(ctrl)+100;
            document.getElementById("divAlert").style.top = top + "px";
            document.getElementById("divAlert").style.left = left + "px";
        }

		document.getElementById("divAlertContent").innerHTML = msg;
        document.getElementById("divAlert").style.display = '';
        stime=window.setTimeout("document.getElementById('divAlert').style.display='none';", 1000);
    }
}

function isKeyValid(ctrl, keyCode) {
	var itype = getIType(ctrl);
	if(itype == "") {return true;}
	chk = true;
	if(itype != "EMAIL" && itype != "ENGNUM") {
		chk = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <=105) || isAuxKey (keyCode));
	}

	switch(itype){
		case "NUM" :
		case "MONEY" :
		case "YMD" :
						if(keyCode == "190" || keyCode == "188") return false;
						break;
		case "FLOAT" :
		case "FMONEY" :
						if(keyCode == "188" || (keyCode == "190" && ctrl.value.indexOf('.') >= 0)) return false;
						break;
		case "EMAIL" :
						break;
	}
	return chk;
}

function isAuxKey (keyCode) {
    for (i=0; i<keys.length; i++)
        if(keyCode == keys[i])
            return true;
    return false;
}

function isControlKey (keyCode) {
    for (i=0; i<controlkeys.length; i++)
        if(keyCode == controlkeys[i])
            return true;
    return false;
}

function autoTab(evt) {
    var ctrl = Event.element(evt);
    if(isNaN(ctrl.maxLength)) {
        return;
    }else {
        if(ctrl.maxLength <= ctrl.value.length) {
            var index = -1, i = 0, found = false;
            for (var i=0; ctrl.form.length; i++) {
                if(ctrl.form[i] == ctrl) {
                    if(i-1 == ctrl.form.length) {
                        return;
                    } else {
                        ctrl.form[i+1].focus();
                        return false;
                    }
                }
            }
        }
    }
}

function _f_remove_format(ctrl) {
    var itype = getIType(ctrl);
	switch(itype){
		case "MONEY" :
		case "FMONEY" :
						ctrl.value = ctrl.value.replace(/(\,)/g,"");
						break;
		case "YMD" :
		case "CARD" :
						ctrl.value = ctrl.value.replace(/-/g,"");
						break;
		case "NUM" :
		case "FLOAT" :
		case "EMAIL" :
						break;
	}
}

function _f_remove_value(ctrl) {
    var itype = getIType(ctrl);
	switch(itype){
		case "MONEY" :
		case "FMONEY" :
						return ctrl.value.replace(/(\,)/g,"");
						break;
		case "YMD" :
		case "CARD" :
						return ctrl.value.replace(/-/g,"");
						break;
		case "NUM" :
		case "FLOAT" :
		case "EMAIL" :
						return ctrl.value;
						break;
		default :
						return ctrl.value;
	}
}

function _f_format(ctrl) {
    var itype = getIType(ctrl);
    var isNegative= false;
    if(ctrl.value.charAt(0) == MINUS) {
        isNegative = true;
    }

	switch(itype){
		case "MONEY" :
		case "FMONEY" :
						ctrl.style.textAlign="right";
						var sMoney = ctrl.value.replace(/(\,)/g,"");
						if(isNegative) {
							sMoney = sMoney.replace(/-/g, "");
						}

						if(sMoney.length <= 2) return sMoney;

						var fir_sMoney = "";
						var sec_sMoney = "";
						var flag= true;
						for(i=0;i<sMoney.length;i++){
							if('.' == sMoney.charAt(i)) {
								flag= false;
								continue;
							}
							if(flag==true)
								fir_sMoney +=sMoney.charAt(i);
							else
								sec_sMoney +=sMoney.charAt(i);
						}
						var tMoney="";
						var i;
						var j=0;
						var tLen = fir_sMoney.length;
						if(sec_sMoney.length > 0) {
							sec_sMoney = "." + sec_sMoney;
						}

						if(fir_sMoney.length <= 3 ) return fir_sMoney + sec_sMoney;
						for(i=0;i<tLen;i++){
							if(i!=0 && ( i % 3 == tLen % 3) ) tMoney += ",";
							if(i < fir_sMoney.length ) tMoney += fir_sMoney.charAt(i);
						}
						ctrl.value = (isNegative ? MINUS + tMoney :tMoney) + sec_sMoney;
						break;
		case "NUM" :
		case "FLOAT" :
						ctrl.style.textAlign="right";
						break;
		case "YMD" :
						var value = _f_format_mask(ctrl.value, "9999-99-99");
						if(value != "" && value.substring(value.length-1, value.length0) == "-") {
							value = value.substring(0, value.length-1);
						}
						ctrl.value = value;
						break;
		case "CARD" :
						var value = _f_format_mask(ctrl.value, "9999-9999-9999-9999");
						if(value != "" && value.substring(value.length-1, value.length0) == "-") {
							value = value.substring(0, value.length-1);
						}
						ctrl.value = value;
						break;
		case "EMAIL" :
						break;
	}
}

function _f_format_mask(str, mask) {
	var sStr = str.replace( /(\$|\^|\*|\(|\)|\+|\.|\?|\\|\{|\}|\||\[|\]|-|:)/g,"");
	var tStr="";
	var i;
	var j=0;
	var tLen = sStr.length +1 ;

	for(i=0; i< sStr.length; i++){
		tStr += sStr.charAt(i);
		j++;
		if(j < mask.length && mask.charAt(j)!="9" && (i+1)< sStr.length) tStr += mask.charAt(j++);
	}
	return tStr;
}

function removeMask(form) {
	for(var i=0; i < form.elements.length; i++) {
		switch (form.elements[i].tagName.toLowerCase()) {
			case "input"  : 
				  if (form.elements[i].maskin != "yes") {
				  	_f_remove_format(form.elements[i]);
				  }						  
				  break;
		}
	}
}
