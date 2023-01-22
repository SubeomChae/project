<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>기안문</title>
</head>
<body>
<%	String msg_no = box.get("params");
	Box obox = CodeHelper.getRsBox("PR_REPORT_SQL", "SGN01002", msg_no, "","","","",request);
	if(obox.get("msg_type").equals("SLP001")) { // 일반전표
		response.sendRedirect("/com/redirect.do?reqUrl=account/report/slipDetailPDF&params="+obox.get("key02"));
	}else if(obox.get("msg_type").equals("SLP002")) {
		if(obox.get("key04").startsWith("S001")) { // 경조금
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s001PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S002")) { //의료비
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s002PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S003")) { //학자금
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s003PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S004")) { //자기개발비
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s004PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S005")) { //휴양시설이용
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s005PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S006")) { //사내동호인회
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s006PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S017")) { //상해보험지원
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s017PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S018")) { //건강증진활동지원
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s018PDF&params="+obox.get("key03"));
		}else if(obox.get("key04").startsWith("S023")) { //돌반지선물
			response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s023PDF&params="+obox.get("key03"));
		}
	}else if(obox.get("msg_type").equals("SLP003")) { // 미지급금결제
		response.sendRedirect("/com/redirect.do?reqUrl=finance/report/fin21001PDF&params="+obox.get("key02"));
	}else if(obox.get("msg_type").equals("SLP004")) { // 복지카드정산
		response.sendRedirect("/com/redirect.do?reqUrl=account/report/crd11001PDF&params="+obox.get("key02"));
	}else if(obox.get("msg_type").equals("SLP005")) { // 선물지급
		response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/wel11001PDF&params="+obox.get("key03")+"|"+obox.get("key04"));
	}else if(obox.get("msg_type").equals("SLP006")) { // 대부금신청
		response.sendRedirect("/com/redirect.do?reqUrl=loan/report/lon01002PDF&params="+obox.get("key03"));
	}else if(obox.get("msg_type").equals("SLP007")) { // 대부금상환
		if(obox.get("key03").equals("L21")) {
			response.sendRedirect("/com/redirect.do?reqUrl=loan/report/lon11001PDF&params="+obox.get("key04"));
		}else {
			response.sendRedirect("/com/redirect.do?reqUrl=loan/report/lon12002PDF&params="+obox.get("key04")+"|"+obox.get("key05"));
		}
	}else if(obox.get("msg_type").equals("SLP008")) { // 고유목적사업준비금
		response.sendRedirect("/com/redirect.do?reqUrl=account/report/gls01001PDF&params="+obox.get("key02"));
	}else if(obox.get("msg_type").equals("BOK001")) { // 목적사업지급(정기) 신청
		response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s800PDF&params="+obox.get("key01"));
	}else if(obox.get("msg_type").equals("SLP010")) { // 목적사업지급(정기) 지급
		response.sendRedirect("/com/redirect.do?reqUrl=welfare/"+uSesEnt.dbo+"/report/s800payPDF&params="+obox.get("key03")+"|"+obox.get("key04")+"|"+obox.get("key05")+"|"+obox.get("key06"));
	}else if(obox.get("msg_type").equals("ETC001")) { // 일반문서
		response.sendRedirect("/com/redirect.do?reqUrl=esign/report/sgn01002PDF&params="+msg_no);
	}
	System.out.println(obox.get("key04")+"|||"+obox.get("key05"));
%>
</body>
</html>