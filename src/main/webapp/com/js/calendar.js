var target;
var stime;
var calendar;
var event_elim="";

document.writeln('<div id="divCalendar" onmouseover="Calendar_Over()" onmouseout="Calendar_Out()" style="background: buttonface; margin:2; border: 1 solid buttonshadow; width:160; display:none; position:absolute; z-index:99">');
document.writeln('<iframe id="Cal_iFrame" name="Cal_iFrame" src="'+contextRoot+'/com/calendar/cal.html" width=160 height=100% scrolling=no frameborder=0 border=1 bordercolor=red></iframe>');
document.writeln('</div>');
 
function Calendar_Over() {
	window.clearTimeout(stime);
} 

function Calendar_Out() {
	stime=window.setTimeout("calendar.style.display='none';", 200);
}

function Calendar_Click(e) {
	Calendar_Setting(e.title);
}
 
function Calendar_Setting(cal_Day) {
	if (cal_Day.length > 6) {
		target.value = cal_Day
		try { __Calendar_Setting_Post(target.name); } catch (e) {}
	}	
	try {calendar.style.display='none';} catch (e) {}
}

function Calendar_D(obj) {
	var now = obj.value.split("-");
	target = obj;				
		
	var top = document.body.clientTop + GetObjectTop(obj);
	var left = document.body.clientLeft + GetObjectLeft(obj);
	if (top > parseInt(document.body.clientHeight) - 150) {
		top = top - 170;
	}
	if (left > parseInt(document.body.clientWidth) - 170) {	
		left = document.body.clientWidth - 170;
	}
	calendar = document.getElementById('divCalendar');
	
	if(document.all) {
		calendar.style.pixelTop = top + obj.offsetHeight;
		calendar.style.pixelLeft = left;
	}else {
		calendar.style.top = top + obj.offsetHeight;
		calendar.style.left = left;
	}
	calendar.style.display = '';

	if (now.length == 3) {											
		Cal_iFrame.Show_cal(now[0],now[1],now[2]);					
	} else {
		now = new Date();
		Cal_iFrame.Show_cal(now.getFullYear(), now.getMonth()+1, now.getDate());
	}
}

function GetObjectTop(obj) {
	if (obj.offsetParent == document.body)
		return obj.offsetTop;
	else
		return obj.offsetTop + GetObjectTop(obj.offsetParent);
}

function GetObjectLeft(obj) {
	if (obj.offsetParent == document.body)
		return obj.offsetLeft;
	else
		return obj.offsetLeft + GetObjectLeft(obj.offsetParent);
}
