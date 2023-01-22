<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*,
				 wsfw.lib.util.*,
				 wsfw.lib.CD, wsfw.lib.config.Config,
                 wsfw.comsvc.CodeHelper,
                 wsfw.lib.dao.RsWrapper" %>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"		class="wsfw.lib.util.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="wsfw.biz.com.SesUserEntity" scope="session" />
<%
	String wait_no = box.get("wait_no");
	Box obox = CodeHelper.getRsBox("PR_COMTB_MESG11_LIST", "LIST001", wait_no, "", "", "", "", request);

%>
<html>
<head>
<title>리포트뷰어</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=11" />
<style>
	body, td, button {
		color:#123456;
		font-size:10pt;
		font-family:"바탕체",Gulim,Arial,Helvetica,sans-serif;
		line-height:1.5;
		letter-spacing:0px;
	}
	
	.tblHead {
		border-collapse: collapse;
		border: 1px solid black;
		width:630px;
	}
	
	.tblHead tr {
		height:25px;
	}
	
	.tblHead th {
		font-size:10pt;
		font-family:"바탕체",Gulim,Arial,Helvetica,sans-serif;
		text-align:center;
		vertical-align:middle;
		background-color:#efefef;
		border: 1px solid black;
	}
	
	.tleft {
		text-align:left !important;
		padding-left:2pt;
	}
	
	.tblHead td {
		font-size:10pt;
		font-family:"바탕체",Gulim,Arial,Helvetica,sans-serif;
		text-align:center;
		vertical-align:middle;
		border: 1px solid black;
	}
	
	#divHtml table {
		white-space:normal
	}
	
	#divHtml p {
		margin: 0px;
		padding: 0px;
		word-break:break-all;
	}
	
	#divCont {
		width:620px;
		margin-top:20px;
		padding:5px;
		min-height:100px;
		border: 1px solid black;
	}
	
	#pDocTitle {
		font-size:22pt;
		font-weight:bold;
		width:630px;
		text-align:center;
	}
</style>
</head>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script language="javascript">

	
	$(function() {
		var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
	    var isIE = /(MSIE|Trident\/|Edge\/)/i.test(navigator.userAgent);
		
	    if (isIE) { 
	    	var ieActiveX = "<OBJECT id=IEPageSetupX classid='clsid:41C5BC45-1BE8-42C5-AD9F-495D6C8D7586' codebase='/com/viewer/htmlReport/IEPageSetupX.cab#version=1,4,0,3' width=0 height=0> "	
							+ "<param name='copyright' value='http://isulnara.com'> "
							+ "<div style='position:absolute;top:200;left:220;width:350;height:80;border:solid 1 #99B3A0;background:#D8D7C4;overflow:hidden;z-index:1;visibility:visible;'><FONT style='font-family: '굴림', 'Verdana'; font-size: 9pt; font-style: normal;'> "
							+ "<BR>  인쇄 여백제어 컨트롤이 설치되지 않았습니다.  <BR>  <a href='/com/viewer/htmlReport/IEPageSetupX.exe'><font color=red>이곳</font></a>을 클릭하여 수동으로 설치하시기 바랍니다.  </FONT> "
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
			printHtml +='<html><head><title>인쇄</title>';
			printHtml +="<head>";
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
			printHtml +='</body></html>';
			var target = $("#ifrmPrint").contents()[0];
			target.write(printHtml);	
		}
		//target.close();
		//$("#ifrmPrint").contents().html(printHtml);
	}

</script>
<body>
<div id="printHeader" style="width:100%; height:44px; background-color:rgb(144,144,144); border-bottom:1px solid gray;">
	<div style="float:left; padding-left:5px; cursor:pointer;"><img src="/com/img/report_print.gif" onclick="javascript:goPrint();"></div>
	<div style="float:right; padding-right:5px; cursor:pointer;"><img src="/com/img/report_close.gif" onclick="self.close();"></div>
</div>
<div id="printBody" style="height:630px;overflow-y:auto; overflow-x:hidden; padding:30 0 20 0; background-color:#f3f3f3;">
	<div id="divHtml" style="width:620px; border:1px solid gray; background:white; padding:80 60 80 50; margin-left:50%; transform:translateX(-50%);">
		<p id="pDocTitle">일반문서</p>
		문서번호 : 
		<table class="tblHead" border="1">
		    <col width="10%">
		    <col width="*">
		    <col width="4%">
		    <col width="12%">
		    <col width="12%">
		    <col width="12%">
		    <col width="12%">
		    <tr>
		    	<th rowspan="2">발의부서</th>
		    	<td rowspan="2" class="tleft"><%=obox.get("send_dept_nm") %></td>
		    	<th rowspan="3">발<br/>의<br/>부<br/>서</th>
		    	<th>발의자</th>
		    	<th></th>
		    	<th></th>
		    	<th></th>
		    </tr>
		    <tr>
		    	<td rowspan="2"><%=obox.get("send_empl_nm") %></td>
		    	<td rowspan="2"></td>
		    	<td rowspan="2"></td>
		    	<td rowspan="2"></td>
		    </tr>
		    <tr style="height:50px">
		    	<th>발의자</th>
		    	<td class="tleft">관리자</td>
		    </tr>
		    <tr>
		    	<th rowspan="2">발의일자</th>
		    	<td rowspan="2" class="tleft"><%=obox.get("send_date") %></td>
		    	<th rowspan="3">접<br/>수<br/>부<br/>서</th>
		    	<th></th>
		    	<th></th>
		    	<th></th>
		    	<th></th>
		    </tr>
		    <tr>
		    	<td rowspan="2"></td>
		    	<td rowspan="2"></td>
		    	<td rowspan="2"></td>
		    	<td rowspan="2"></td>
		    </tr>
		    <tr style="height:50px">
		    	<th>제목</th>
		    	<td class="tleft"><%=obox.get("subject") %></td>
		    </tr>
		</table>
		
		<div id="divCont"><%=obox.get("opinion") %></div>
	</div>
</div>
<iframe src="about:blank" frameborder="0" scrolling="no" id="ifrmPrint" width="100%" height="0px" ></iframe>
</body>
</html>