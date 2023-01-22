<%@page import="org.apache.poi.ss.formula.functions.Replace"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%
	String msg_no = box.get("msg_no");
	Box obox = CodeUtil.getRsBox("PR_REPORT_SQL", "SGN01002", msg_no, "", "", "", "", uSesEnt.dbo);
	Box msgBox = CodeUtil.getRsBox("PR_REPORT_SQL", "SIGNLINE", obox.get("msg_type"), "", msg_no,"","", uSesEnt.dbo);

%>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script language="javascript">

	$(function() {
		var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
	    var isIE = /(MSIE|Trident\/|Edge\/)/i.test(navigator.userAgent);
		
	    if (isIE) { 
	    	var ieActiveX = "<OBJECT id=IEPageSetupX classid='clsid:41C5BC45-1BE8-42C5-AD9F-495D6C8D7586' codebase='/com/htmlReport/IEPageSetupX.cab#version=1,4,0,3' width=0 height=0> "	
							+ "<param name='copyright' value='http://isulnara.com'> "
							+ "<div style='position:absolute;top:200;left:220;width:350;height:80;border:solid 1 #99B3A0;background:#D8D7C4;overflow:hidden;z-index:1;visibility:visible;'><FONT style='font-family: '굴림', 'Verdana'; font-size: 9pt; font-style: normal;'> "
							+ "<BR>  인쇄 여백제어 컨트롤이 설치되지 않았습니다.  <BR>  <a href='/com/htmlReport/IEPageSetupX.exe'><font color=red>이곳</font></a>을 클릭하여 수동으로 설치하시기 바랍니다.  </FONT> "
							+ "</div> "
							+ "</OBJECT> "
							+ "<script type='text/javascript'>"
							+ "function Installed()  { "
							+ "	try { "
							+ "		return (new ActiveXObject('IEPageSetupX.IEPageSetup')); "
							+ "	} catch (e) { "
							+ "		return false; "
							+ "	} "
							+ "} "
							+ "<" + "/script" + ">";
			$("body").append(ieActiveX);
	    }
	});
	
	function printBefore() {
		$("#printHeader").hide();
		$("#printBody").css("height","");
		$("#printBody").css("overflow-y","");
		$("#printBody").css("overflow-x","");
		$("#printBody").css("padding","");
		$("#printBody").css("background-color","");
		$("#divHtml").css("border","0px solid gray");
	}
	
	function printAfter() {
		$("#printHeader").show();
		$("#printBody").css("height","630px");
		$("#printBody").css("overflow-y","auto");
		$("#printBody").css("overflow-x","hidden");
		$("#printBody").css("padding","30 0 20 0");
		$("#printBody").css("background-color","#f3f3f3");
		$("#divHtml").css("border","1px solid gray");
	}
	
	function goIEPrt() {
		IEPageSetupX.topMargin=0;
		IEPageSetupX.header="";
		IEPageSetupX.footer="";
		IEPageSetupX.PrintBackground=true;
		IEPageSetupX.print(true);
		//IEPageSetupX.Preview();
	}

	// 인쇄 클릭시 iframe으로 html을 전송하여 인쇄 처리
	function goPrint() {
		var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
	    var isIE = /(MSIE|Trident\/|Edge\/)/i.test(navigator.userAgent);
	    
		
		if (isIE) {
			setTimeout(function() { printBefore(); goIEPrt(); printAfter(); } , 500);	
		} else {
			$("#ifrmPrint").prop("src","about:blank");
			var printHtml = "";
			printHtml +="<style>";
			printHtml +="@page { size:A4;margin:0mm;}";
			if (isChrome) {
			    printHtml +="body{-webkit-print-color-adjust: exact; margin:28mm 20mm 0mm 20mm;}";
			    printHtml +=".divBottom { position:absolute; bottom:10mm; left:5mm;}";
			} else if (isIE) { 
			    printHtml +="body{-webkit-print-color-adjust: exact; margin:20mm 20mm 0mm 20mm;}";
			    printHtml +=".divBottom { position:absolute; bottom:10mm; left:5mm;}";
			}
			printHtml +="</style>";
			printHtml +="<link rel='stylesheet' type='text/css' href='/com/viewer/htmlPrint.css'>";
			printHtml +='</head><body >';
			printHtml +='<div id="divHtml">';
			printHtml +=$("#divHtml").html();
			printHtml +='</div>';
			
			printHtml +='<' + 'script  type=\"text/javascript\" ' + '>'
			   + 'window.print(); '
			   + '<' + '/script' + '>';
			var target = $("#ifrmPrint").contents()[0];
			target.write(printHtml);	
		}
		//target.close();
		//$("#ifrmPrint").contents().html(printHtml);
	}

</script>

<div id="printHeader" style="width:100%; height:44px; background-color:rgb(144,144,144); border-bottom:1px solid gray;">
	<div style="float:left; padding-left:5px; cursor:pointer;"><img src="/com/img/report_print.gif" onclick="javascript:goPrint();"></div>
	<div style="float:right; padding-right:5px; cursor:pointer;"><img src="/com/img/report_close.gif" onclick="self.close();"></div>
</div>
<div id="printBody" style="height:630px;overflow-y:auto; overflow-x:hidden; padding:30 0 20 0; background-color:#f3f3f3;">
	<div id="divHtml" style="width:100%; border:1px solid gray; background:white; padding:80 60 80 50; margin-left:50%; transform:translateX(-50%);">
		<h3 id="pDocTitle" class="t-center">일반문서</h3>
		문서번호 : <%=msgBox.get("docu_no_x") %>
		<table class="table table-view table-bordered">
		    <col width="12%">
		    <col width="*">
		    <col width="4%">
		    <col width="12%">
		    <col width="12%">
		    <col width="12%">
		    <col width="12%">
		    <tr>
		    	<th rowspan="2">발의부서</th>
		    	<td rowspan="2" class="tleft"><%=msgBox.get("send_dept_nm") %></td>
		    	<th rowspan="3">발<br/>의<br/>부<br/>서</th>
		    	<th>발의자</th>
		    	<th><%=StringUtil.arrayCol(msgBox.get("sign21"),1,"|") %></th>
		    	<th><%=StringUtil.arrayCol(msgBox.get("sign22"),1,"|") %></th>
		    	<th><%=StringUtil.arrayCol(msgBox.get("sign23"),1,"|") %></th>
		    </tr>
		    <tr>
		    	<td rowspan="2" class="t-center"><%=msgBox.get("send_empl_nm") %></td>
		    	<td rowspan="2" class="t-center"><%=StringUtil.arrayCol(msgBox.get("sign21"),2,"|") %></td>
		    	<td rowspan="2" class="t-center"><%=StringUtil.arrayCol(msgBox.get("sign22"),2,"|") %></td>
		    	<td rowspan="2" class="t-center"><%=StringUtil.arrayCol(msgBox.get("sign23"),2,"|") %></td>
		    </tr>
		    <tr style="height:50px">
		    	<th>발의자</th>
		    	<td class="tleft">관리자</td>
		    </tr>
		    <tr>
		    	<th rowspan="2">발의일자</th>
		    	<td rowspan="2" class="tleft"><%=msgBox.get("send_date") %></td>
		    	<th rowspan="3">접<br/>수<br/>부<br/>서</th>
		    	<th><%=StringUtil.arrayCol(msgBox.get("sign30"),1,"|") %></th>
		    	<th><%=StringUtil.arrayCol(msgBox.get("sign31"),1,"|") %></th>
		    	<th><%=StringUtil.arrayCol(msgBox.get("sign32"),1,"|") %></th>
		    	<th><%=StringUtil.arrayCol(msgBox.get("sign33"),1,"|") %></th>
		    </tr>
		    <tr>
		    	<td rowspan="2" class="t-center"><%=StringUtil.arrayCol(msgBox.get("sign30"),2,"|") %></td>
		    	<td rowspan="2" class="t-center"><%=StringUtil.arrayCol(msgBox.get("sign31"),2,"|") %></td>
		    	<td rowspan="2" class="t-center"><%=StringUtil.arrayCol(msgBox.get("sign32"),2,"|") %></td>
		    	<td rowspan="2" class="t-center"><%=StringUtil.arrayCol(msgBox.get("sign33"),2,"|") %></td>
		    </tr>
		    <tr style="height:50px">
		    	<th>제목</th>
		    	<td class="tleft"><%=msgBox.get("subject") %></td>
		    </tr>
		</table>
		
		<div id="divCont"><%=obox.get("opinion") %></div>
	</div>
</div>
<iframe src="about:blank" frameborder="0" scrolling="no" id="ifrmPrint" width="100%" height="0px" ></iframe>