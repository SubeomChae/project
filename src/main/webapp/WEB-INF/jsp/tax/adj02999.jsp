<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- 전산조직운용명세서 -->
<script language="javascript">
	function goSave(action_type) {
		if (formValidate("#taxForm")) {
			if(confirm('저장하시겠습니까?')) {
				ajaxSubmitForm("adj02999_update.do","#taxForm", function(rtn) {
					if(rtn.isOk == "Y") {
						alert("저장되었습니다.");
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	$(function() {
		ajaxSubmitForm("xmlUpdate.do","#taxForm", function(rtn) {
			if(rtn.isOk == "Y") {
				hideServerWorking();
			}else {
				alert(rtn.errMsg);
			}
		});
	});
</script>

<form id="taxForm" name="taxForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="corp_cd" 	value="<%=box.get("corp_cd")%>">
<input type="hidden" name="report_id" 	value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 		value="<%=box.get("std_yy")%>">

	
	<h2 class="page-title-2depths">전산조직운용명세서</h2>
	
	<div id="divListData" class="contentsRow">
		
		<table class="table table-striped table-bordered table-hover order-column table-cover marB0">
		<%	xmlBuf += "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
				   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"
				   +  "<pgm_using>"+obox.get("pgm_using")+"</pgm_using>\n"
				   +  "<system_using>"+obox.get("system_using")+"</system_using>\n"
				   +  "<dbms>"+obox.get("dbms")+"</dbms>\n"
				   +  "<dbms_etc>"+obox.get("dbms_etc")+"</dbms_etc>\n"
				   +  "<dbms_ver>"+obox.get("dbms_ver")+"</dbms_ver>\n"
				   +  "<erp>"+obox.get("erp")+"</erp>\n"
				   +  "<erp_etc>"+obox.get("erp_etc")+"</erp_etc>\n"
				   +  "<acc_package>"+obox.get("acc_package")+"</acc_package>\n"
				   +  "<acc_package_etc>"+obox.get("acc_package_etc")+"</acc_package_etc>\n"
				   +  "<rev_pgm_maker>"+obox.get("rev_pgm_maker")+"</rev_pgm_maker>\n"
				   +  "<rev_sw_nm>"+obox.get("rev_sw_nm")+"</rev_sw_nm>\n"
				   +  "<etxn_yn>"+obox.get("etxn_yn")+"</etxn_yn>\n"
				   +  "<etxn_type>"+obox.get("etxn_type")+"</etxn_type>\n"
				   +  "<unit_system>"+obox.get("unit_system")+"</unit_system>\n"
				   +  "<unit_system_etc>"+obox.get("unit_system_etc")+"</unit_system_etc>\n"
				   +  "<record_spot>"+obox.get("record_spot")+"</record_spot>\n"
				   +  "<record_spot_etc>"+obox.get("record_spot_etc")+"</record_spot_etc>\n"
				   +  "<record_corp_nm>"+obox.get("record_corp_nm")+"</record_corp_nm>\n"
				   +  "<record_saupja_no>"+obox.get("record_system")+"</record_saupja_no>\n"
				   +  "<record_start_ymd>"+obox.get("record_start_ymd")+"</record_start_ymd>\n"
				   +  "<record_end_ymd>"+obox.get("record_end_ymd")+"</record_end_ymd>\n";
		%>
			<tr height="28">
				<td class="td-head t-left">1. 회계프로그램(시스템) 사용현황</td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("pgm_using").equals("1")){%><b><u><%}%>① 자체개발<%if(obox.get("pgm_using").equals("1")){%></u></b><%}%>
					<%if(obox.get("pgm_using").equals("2")){%><b><u><%}%>② 외주개발<%if(obox.get("pgm_using").equals("2")){%></u></b><%}%> 
					<%if(obox.get("pgm_using").equals("3")){%><b><u><%}%>③ ERP<%if(obox.get("pgm_using").equals("3")){%></u></b><%}%>
					<%if(obox.get("pgm_using").equals("4")){%><b><u><%}%>④ 상업용 회계프로그램<%if(obox.get("pgm_using").equals("4")){%></u></b><%}%>
				<% }else { %>
					<label class="mt-radio mt-radio-outline" style="width:12%">
							<input type="radio" name="pgm_using" value="1" <%=obox.get("pgm_using").equals("1")?"checked":""%> style="border:none">자체개발<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="pgm_using" value="2" <%=obox.get("pgm_using").equals("2")?"checked":""%> style="border:none">외주개발<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="pgm_using" value="3" <%=obox.get("pgm_using").equals("3")?"checked":""%> style="border:none">ERP<span/>
					</label>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="pgm_using" value="4" <%=obox.get("pgm_using").equals("4")?"checked":""%> style="border:none">상업용 회계프로그램<span/>
					</label>
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left">2. 관리(영업,판매,생산) 프로그램(시스템) 사용현황</td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("system_using").equals("1")){%><b><u><%}%>① 자체개발<%if(obox.get("system_using").equals("1")){%></u></b><%}%>
					<%if(obox.get("system_using").equals("2")){%><b><u><%}%>② 외주개발<%if(obox.get("system_using").equals("2")){%></u></b><%}%> 
					<%if(obox.get("system_using").equals("3")){%><b><u><%}%>③ ERP<%if(obox.get("system_using").equals("3")){%></u></b><%}%>
					<%if(obox.get("system_using").equals("4")){%><b><u><%}%>④ 상업용 회계프로그램<%if(obox.get("system_using").equals("4")){%></u></b><%}%>
				<% }else { %>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="system_using" value="1" <%=obox.get("system_using").equals("1")?"checked":""%> style="border:none">자체개발<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="system_using" value="2" <%=obox.get("system_using").equals("2")?"checked":""%> style="border:none">외주개발<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="system_using" value="3" <%=obox.get("system_using").equals("3")?"checked":""%> style="border:none">ERP<span/>
					</label>
					<label class="mt-radio mt-radio-outline">	
						<input type="radio" name="system_using" value="4" <%=obox.get("system_using").equals("4")?"checked":""%> style="border:none">상업용 회계프로그램<span/>
					</label>
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>3. 회계시스템 DBMS 종류</b>(1번 ①②③ 응답자만)</td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("dbms").equals("1")){%><b><u><%}%>① Oracle<%if(obox.get("dbms").equals("1")){%></u></b><%}%>
					<%if(obox.get("dbms").equals("2")){%><b><u><%}%>② MS SQL<%if(obox.get("dbms").equals("2")){%></u></b><%}%> 
					<%if(obox.get("dbms").equals("3")){%><b><u><%}%>③ DB2<%if(obox.get("dbms").equals("3")){%></u></b><%}%>
					<%if(obox.get("dbms").equals("4")){%><b><u><%}%>④ Sybase<%if(obox.get("dbms").equals("4")){%></u></b><%}%>
					<br> 
					<%if(obox.get("dbms").equals("5")){%><b><u><%}%>⑤ My SQL<%if(obox.get("dbms").equals("5")){%></u></b><%}%>
					<%if(obox.get("dbms").equals("8")){%><b><u><%}%>⑧ 기타 (<%=obox.get("dbms").equals("6")?obox.get("dbms_etc"):StringUtil.strLooping("&nbsp",20)%>)<%if(obox.get("dbms").equals("6")){%></u></b><%}%>
				<% }else { %>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="dbms" value="1" <%=obox.get("dbms").equals("1")?"checked":""%> style="border:none">Oracle<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">	
						<input type="radio" name="dbms" value="2" <%=obox.get("dbms").equals("2")?"checked":""%> style="border:none">MS SQL<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%"> 
						<input type="radio" name="dbms" value="3" <%=obox.get("dbms").equals("3")?"checked":""%> style="border:none">DB2<span/>
					</label>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="dbms" value="4" <%=obox.get("dbms").equals("4")?"checked":""%> style="border:none">Sybase<span/>
					</label>
					<br>
					<label class="mt-radio mt-radio-outline" style="width:12%"> 
						<input type="radio" name="dbms" value="5" <%=obox.get("dbms").equals("5")?"checked":""%> style="border:none">My SQL<span/>
					</label>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="dbms" value="8" <%=obox.get("dbms").equals("6")?"checked":""%> style="border:none">기타<span/>
					</label>
					(<input type="text" name="dbms_etc" size="20" maxlength="50" title="프로그램 언어" value="<%=obox.get("dbms_etc")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left">
					<b>4. 회계시스템 DBMS Version</b>(1번 ①②③ 응답자만)
						<% if(box.get("excel_yn").equals("Y")) { %>
							(<%=FormatUtil.nvl2(obox.get("dbms_ver"),StringUtil.strLooping("&nbsp",10))%>)
						<% }else { %>
							(<input type="text" name="dbms_ver" size="10" maxlength="10" title="DBMS Version" value="<%=obox.get("dbms_ver")%>" class="form-control" style="width:10%">)
						<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>5. ERP</b>(1번 ③ 응답자만)</td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("erp").equals("1")){%><b><u><%}%>① SAP<%if(obox.get("erp").equals("1")){%></u></b><%}%>
					<%if(obox.get("erp").equals("2")){%><b><u><%}%>② Oracle<%if(obox.get("erp").equals("2")){%></u></b><%}%> 
					<%if(obox.get("erp").equals("3")){%><b><u><%}%>③ Uni-ERP<%if(obox.get("erp").equals("3")){%></u></b><%}%>
					<%if(obox.get("erp").equals("4")){%><b><u><%}%>④ 더존ERP<%if(obox.get("erp").equals("4")){%></u></b><%}%>
					<%if(obox.get("erp").equals("3")){%><b><u><%}%>③ 영림원 K.System<%if(obox.get("erp").equals("5")){%></u></b><%}%>
					<%if(obox.get("erp").equals("4")){%><b><u><%}%>④ 자체개발<%if(obox.get("erp").equals("6")){%></u></b><%}%>
					<%if(obox.get("erp").equals("5")){%><b><u><%}%>⑤ 기타 (<%=obox.get("erp").equals("7")?obox.get("erp_etc"):StringUtil.strLooping("&nbsp",20)%>)<%if(obox.get("erp").equals("5")){%></u></b><%}%>
				<% }else { %>
					<label class="mt-radio mt-radio-outline" style="width:15%">
						<input type="radio" name="erp" value="1" <%=obox.get("erp").equals("1")?"checked":""%> style="border:none">SAP<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:15%">
						<input type="radio" name="erp" value="2" <%=obox.get("erp").equals("2")?"checked":""%> style="border:none">Oracle<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:15%">
						<input type="radio" name="erp" value="3" <%=obox.get("erp").equals("3")?"checked":""%> style="border:none">Uni-ERP<span/>
					</label>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="erp" value="4" <%=obox.get("erp").equals("4")?"checked":""%> style="border:none">더존ERP<span/>
					</label>
					<br>
					<label class="mt-radio mt-radio-outline" style="width:15%">
						<input type="radio" name="erp" value="5" <%=obox.get("erp").equals("5")?"checked":""%> style="border:none">영림원 K.System<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:15%">
						<input type="radio" name="erp" value="6" <%=obox.get("erp").equals("6")?"checked":""%> style="border:none">자체개발<span/>
					</label>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="erp" value="7" <%=obox.get("erp").equals("7")?"checked":""%> style="border:none">기타<span/>
					</label>
					(<input type="text" name="erp_etc" size="20" maxlength="50" title="ERP" value="<%=obox.get("erp_etc")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>6. 상업용 회계프로그램</b>(1번 ④ 응답자만)</td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("acc_package").equals("1")){%><b><u><%}%>① 더존 NEOplus<%if(obox.get("acc_package").equals("1")){%></u></b><%}%>
					<%if(obox.get("acc_package").equals("2")){%><b><u><%}%>② 세무사랑2<%if(obox.get("acc_package").equals("2")){%></u></b><%}%> 
					<%if(obox.get("acc_package").equals("3")){%><b><u><%}%>③ 키컴 SA-Win<%if(obox.get("acc_package").equals("3")){%></u></b><%}%>
					<br> 
					<%if(obox.get("acc_package").equals("4")){%><b><u><%}%>④ 얼마에요<%if(obox.get("acc_package").equals("4")){%></u></b><%}%>
					<%if(obox.get("acc_package").equals("5")){%><b><u><%}%>④ Micro Win<%if(obox.get("acc_package").equals("5")){%></u></b><%}%>
					<%if(obox.get("acc_package").equals("6")){%><b><u><%}%>⑤ 기타 (<%=obox.get("acc_package").equals("6")?obox.get("acc_package_etc"):StringUtil.strLooping("&nbsp",20)%>)<%if(obox.get("acc_package").equals("6")){%></u></b><%}%>
				<% }else { %>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="acc_package" value="1" <%=obox.get("acc_package").equals("1")?"checked":""%> style="border:none">더존 Smart A<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="acc_package" value="2" <%=obox.get("acc_package").equals("2")?"checked":""%> style="border:none">세무사랑2<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="acc_package" value="3" <%=obox.get("acc_package").equals("3")?"checked":""%> style="border:none">키컴 SA-Win<span/>
					</label>
					<br>
					<label class="mt-radio mt-radio-outline" style="width:12%"> 
						<input type="radio" name="acc_package" value="4" <%=obox.get("acc_package").equals("4")?"checked":""%> style="border:none">얼마에요<span/>
					</label>
					<label class="mt-radio mt-radio-outline" style="width:12%">
						<input type="radio" name="acc_package" value="5" <%=obox.get("acc_package").equals("5")?"checked":""%> style="border:none">Micro Win<span/>
					</label>
					<label class="mt-radio mt-radio-outline">
						<input type="radio" name="acc_package" value="6" <%=obox.get("acc_package").equals("5")?"checked":""%> style="border:none">기타<span/>
					</label>
					(<input type="text" name="acc_package_etc" size="20" maxlength="50" title="상업용 회계프로그램" value="<%=obox.get("acc_package_etc")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>7. 상용 수입금액관리 프로그램</b></td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					제조회사(<%=obox.get("rev_pgm_maker").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("rev_pgm_maker")%>) 
					S/W 명칭(<%=obox.get("rev_sw_nm").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("rev_sw_nm")%>) 
				<% }else { %>
					제조회사 (<input type="text" name="rev_pgm_maker" size="20" maxlength="50" title="수입금액관리프로그램 제조사" value="<%=obox.get("rev_pgm_maker")%>" class="form-control" style="width:15%">)
					S/W 명칭(<input type="text" name="rev_sw_nm" size="20" maxlength="50" title="수입금액관리프로그램  S/W 명칭" value="<%=obox.get("rev_sw_nm")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>8. 전자거래 유무</b></td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("etxn_yn").equals("1")){%><b><u><%}%>있음<%if(obox.get("etxn_yn").equals("1")){%></u></b><%}%>
					<%if(obox.get("etxn_yn").equals("2")){%><b><u><%}%>없음<%if(obox.get("etxn_yn").equals("2")){%></u></b><%}%> 
				<% }else { %>
				<label class="mt-radio mt-radio-outline" style="width:12%">
					<input type="radio" name="etxn_yn" value="1" <%=obox.get("etxn_yn").equals("1")?"checked":""%> style="border:none">있음<span/>
				</label>
				<label class="mt-radio mt-radio-outline">
					<input type="radio" name="etxn_yn" value="2" <%=obox.get("etxn_yn").equals("2")?"checked":""%> style="border:none">없음<span/>
				</label> 
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>9. 전자거래 유형(복수 선택 가능)(8번 ① 응답자만)</b></td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("etxn_type").indexOf("1,")>=0){%><b><u><%}%>① 영수증<%if(obox.get("etxn_type").indexOf("1,")>=0){%></u></b><%}%>
					<%if(obox.get("etxn_type").indexOf("2,")>=0){%><b><u><%}%>② 청구서<%if(obox.get("etxn_type").indexOf("2,")>=0){%></u></b><%}%> 
					<%if(obox.get("etxn_type").indexOf("3,")>=0){%><b><u><%}%>③ 견적서<%if(obox.get("etxn_type").indexOf("3,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("etxn_type").indexOf("4,")>=0){%><b><u><%}%>④ 주문서<%if(obox.get("etxn_type").indexOf("4,")>=0){%></u></b><%}%>
					<%if(obox.get("etxn_type").indexOf("5,")>=0){%><b><u><%}%>⑤ 계약서<%if(obox.get("etxn_type").indexOf("5,")>=0){%></u></b><%}%>
					<%if(obox.get("etxn_type").indexOf("6,")>=0){%><b><u><%}%>⑥ 기타 (<%=obox.get("etxn_type").indexOf("9,")>=0?obox.get("etxn_type_etc"):StringUtil.strLooping("&nbsp",20)%>)<%if(obox.get("etxn_type").indexOf("9")>=0){%></u></b><%}%>
				<% }else { %>
					<label class="mt-checkbox mt-checkbox-outline" style="width:12%">
						<input type="checkbox" name="etxn_type" value="1," <%=obox.get("etxn_type").indexOf("1,")>=0?"checked":""%> style="border:none">영수증<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:12%">
						<input type="checkbox" name="etxn_type" value="2," <%=obox.get("etxn_type").indexOf("2,")>=0?"checked":""%> style="border:none">청구서<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:12%">							 
						<input type="checkbox" name="etxn_type" value="3," <%=obox.get("etxn_type").indexOf("3,")>=0?"checked":""%> style="border:none">견적서<span/>
					</label>	
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:12%">
						<input type="checkbox" name="etxn_type" value="4," <%=obox.get("etxn_type").indexOf("4,")>=0?"checked":""%> style="border:none">주문서<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:12%">
						<input type="checkbox" name="etxn_type" value="5," <%=obox.get("etxn_type").indexOf("5,")>=0?"checked":""%> style="border:none">계약서<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline">	
						<input type="checkbox" name="etxn_type" value="6," <%=obox.get("etxn_type").indexOf("9,")>=0?"checked":""%> style="border:none">기타<span/>
					</label>							
					(<input type="text" name="etxn_type_etc" size="20" maxlength="50" title="전자거래 유형" value="<%=obox.get("etxn_type_etc")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>10. 단위업무시스템 종류(복수선택 가능)</b></td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("unit_system").indexOf("1,")>=0){%><b><u><%}%>① 재무회계(원장, 재무제표, 채권&#8231;채무)<%if(obox.get("unit_system").indexOf("1,")>=0){%></u></b><%}%>
					<%if(obox.get("unit_system").indexOf("2,")>=0){%><b><u><%}%>② 관리회계(원가, 성과)<%if(obox.get("unit_system").indexOf("2,")>=0){%></u></b><%}%> 
					<br>
					<%if(obox.get("unit_system").indexOf("3,")>=0){%><b><u><%}%>③ 재무관리(자금, 예산)<%if(obox.get("unit_system").indexOf("3,")>=0){%></u></b><%}%>
					<%if(obox.get("unit_system").indexOf("4,")>=0){%><b><u><%}%>④ 판매관리(고객, 주문, 출하, 배송, 청구)<%if(obox.get("unit_system").indexOf("4,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("unit_system").indexOf("5,")>=0){%><b><u><%}%>⑤ 자재관리(구매, 검수, 입출고, 재고)<%if(obox.get("unit_system").indexOf("5,")>=0){%></u></b><%}%>
					<%if(obox.get("unit_system").indexOf("6")>=0){%><b><u><%}%>⑥ 생산관리(생산계획, 생산실적)<%if(obox.get("unit_system").indexOf("6,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("unit_system").indexOf("7,")>=0){%><b><u><%}%>⑦ 품질관리(품질계획, 품질검사)<%if(obox.get("unit_system").indexOf("7,")>=0){%></u></b><%}%>
					<%if(obox.get("unit_system").indexOf("8,")>=0){%><b><u><%}%>⑧ 인사관리(급여, 복지후생, 채용)<%if(obox.get("unit_system").indexOf("8,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("unit_system").indexOf("9,")>=0){%><b><u><%}%>⑨ 기타 (<%=obox.get("unit_system").indexOf("9,")>=0?obox.get("unit_system_etc"):StringUtil.strLooping("&nbsp",20)%>)<%if(obox.get("unit_system").indexOf("9")>=0){%></u></b><%}%>
				<% }else { %>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="unit_system" value="1," <%=obox.get("unit_system").indexOf("1,")>=0?"checked":""%> style="border:none">재무회계(원장, 재무제표, 채권&#8231;채무)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="unit_system" value="2," <%=obox.get("unit_system").indexOf("2,")>=0?"checked":""%> style="border:none">관리회계(원가, 성과)<span/>
					</label> 
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="unit_system" value="3," <%=obox.get("unit_system").indexOf("3,")>=0?"checked":""%> style="border:none">재무관리(자금, 예산)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="unit_system" value="4," <%=obox.get("unit_system").indexOf("4,")>=0?"checked":""%> style="border:none">판매관리(고객, 주문, 출하, 배송, 청구)<span/>
					</label>
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="unit_system" value="5," <%=obox.get("unit_system").indexOf("5,")>=0?"checked":""%> style="border:none">자재관리(구매, 검수, 입출고, 재고)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="unit_system" value="6," <%=obox.get("unit_system").indexOf("6,")>=0?"checked":""%> style="border:none">생산관리(생산계획, 생산실적)<span/>
					</label>
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="unit_system" value="7," <%=obox.get("unit_system").indexOf("7,")>=0?"checked":""%> style="border:none">품질관리(품질계획, 품질검사)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">	
						<input type="checkbox" name="unit_system" value="8," <%=obox.get("unit_system").indexOf("8,")>=0?"checked":""%> style="border:none">인사관리(급여, 복지후생, 채용)<span/>
					</label>
					<br>
					<label class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="unit_system" value="9," <%=obox.get("unit_system").indexOf("9,")>=0?"checked":""%> style="border:none">기타<span/>
					</label>
					(<input type="text" name="unit_system_etc" size="20" maxlength="50" title="단위업무시스템 종류" value="<%=obox.get("unit_system_etc")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>11. 전자기록의 보관 장소 (복수선택 가능)</b></td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("record_spot").indexOf("1,")>=0){%><b><u><%}%>① 회사 내<%if(obox.get("record_spot").indexOf("1,")>=0){%></u></b><%}%>
					<%if(obox.get("record_spot").indexOf("2,")>=0){%><b><u><%}%>② 외부용역업체<%if(obox.get("record_spot").indexOf("2,")>=0){%></u></b><%}%>
					<%if(obox.get("record_spot").indexOf("3,")>=0){%><b><u><%}%>③ IDC센터<%if(obox.get("record_spot").indexOf("3,")>=0){%></u></b><%}%>
					<%if(obox.get("record_spot").indexOf("4,")>=0){%><b><u><%}%>④ 클라우드 시스템<%if(obox.get("record_spot").indexOf("4,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("record_spot").indexOf("5,")>=0){%><b><u><%}%>⑤ 웹호스팅<%if(obox.get("record_spot").indexOf("5,")>=0){%></u></b><%}%>
					<%if(obox.get("record_spot").indexOf("6,")>=0){%><b><u><%}%>⑥ 기타(계열회사 등) (<%=obox.get("record_spot").indexOf("6,")>=0?obox.get("record_spot_etc"):StringUtil.strLooping("&nbsp",20)%>)<%if(obox.get("record_spot").indexOf("6")>=0){%></u></b><%}%>
				<% }else { %>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_spot" value="1," <%=obox.get("record_spot").indexOf("1,")>=0?"checked":""%> style="border:none">회사 내<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_spot" value="2," <%=obox.get("record_spot").indexOf("2,")>=0?"checked":""%> style="border:none">외부용역업체<span/>
					</label>
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_spot" value="3," <%=obox.get("record_spot").indexOf("3,")>=0?"checked":""%> style="border:none">IDC센터<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">	
						<input type="checkbox" name="record_spot" value="4," <%=obox.get("record_spot").indexOf("4,")>=0?"checked":""%> style="border:none">클라우드 시스템<span/>
					</label>	
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_spot" value="5," <%=obox.get("record_spot").indexOf("5,")>=0?"checked":""%> style="border:none">웹호스팅<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="record_spot" value="6," <%=obox.get("record_spot").indexOf("9,")>=0?"checked":""%> style="border:none">기타(계열회사 등)<span/>
					</label>
					(<input type="text" name="record_spot_etc" size="20" maxlength="50" title="전자기록의 보관 장소" value="<%=obox.get("record_spot_etc")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>12. 전자기록을 관리하는 외부 전산조직 사업자  (11번 ②,③,④,⑤,⑥ 응답자만)</b></td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					상호(<%=obox.get("record_corp_nm").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("record_corp_nm")%>) 
					사업자등록번호(<%=obox.get("record_saupja_no").equals("")?StringUtil.strLooping("&nbsp",10):obox.get("record_system")%>)
					전자기록 관리 기간(<%=obox.get("record_start_ymd")%> ~ <%=obox.get("record_end_ymd")%>)
				<% }else { %>
					<div class="form-inline">
					상호(<input type="text" name="record_corp_nm" size="20" maxlength="50" title="상호" value="<%=obox.get("record_corp_nm")%>" class="form-control" style="width:15%">)
					사업자등록번호(<input type="text" name="record_saupja_no" size="20" maxlength="50" title="사업자등록번호" value="<%=obox.get("record_saupja_no")%>" class="form-control" style="width:15%">)
						
			전자기록 관리 기간(<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="record_start_ymd" name="record_start_ymd" value="<%=box.get("record_start_ymd")%>" maxlength="8" title="전자기록 관리 기간(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="record_end_ymd" name="record_end_ymd" value="<%=box.get("record_end_ymd")%>" maxlength="8" title="전자기록 관리 기간(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>)
					</div>
				<% } %>
				</td>
			</tr>
			<tr height="28">
				<td class="td-head t-left"><b>13. 전자기록 외부 운용 업무 종류 (복수선택 가능) (11번 ②,③,④,⑤,⑥ 응답자만)</b></td>
			</tr>
			<tr height="28">
				<td class="t-left">
				<% if(box.get("excel_yn").equals("Y")) { %>
					<%if(obox.get("record_type").indexOf("1,")>=0){%><b><u><%}%>① 재무회계(원장, 재무제표, 채권&#8231;채무)<%if(obox.get("unit_system").indexOf("1,")>=0){%></u></b><%}%>
					<%if(obox.get("record_type").indexOf("2,")>=0){%><b><u><%}%>② 관리회계(원가, 성과)<%if(obox.get("record_type").indexOf("2,")>=0){%></u></b><%}%> 
					<br>
					<%if(obox.get("record_type").indexOf("3,")>=0){%><b><u><%}%>③ 재무관리(자금, 예산)<%if(obox.get("record_type").indexOf("3,")>=0){%></u></b><%}%>
					<%if(obox.get("record_type").indexOf("4,")>=0){%><b><u><%}%>④ 판매관리(고객, 주문, 출하, 배송, 청구)<%if(obox.get("record_type").indexOf("4,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("record_type").indexOf("5,")>=0){%><b><u><%}%>⑤ 자재관리(구매, 검수, 입출고, 재고)<%if(obox.get("record_type").indexOf("5,")>=0){%></u></b><%}%>
					<%if(obox.get("record_type").indexOf("6")>=0){%><b><u><%}%>⑥ 생산관리(생산계획, 생산실적)<%if(obox.get("unit_system").indexOf("6,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("record_type").indexOf("7,")>=0){%><b><u><%}%>⑦ 품질관리(품질계획, 품질검사)<%if(obox.get("record_type").indexOf("7,")>=0){%></u></b><%}%>
					<%if(obox.get("record_type").indexOf("8,")>=0){%><b><u><%}%>⑧ 인사관리(급여, 복지후생, 채용)<%if(obox.get("record_type").indexOf("8,")>=0){%></u></b><%}%>
					<br>
					<%if(obox.get("record_type").indexOf("9,")>=0){%><b><u><%}%>⑨ 기타 (<%=obox.get("record_type").indexOf("9,")>=0?obox.get("record_type_etc"):StringUtil.strLooping("&nbsp",20)%>)<%if(obox.get("record_type").indexOf("9")>=0){%></u></b><%}%>
				<% }else { %>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="1," <%=obox.get("record_type").indexOf("1,")>=0?"checked":""%> style="border:none">재무회계(원장, 재무제표, 채권&#8231;채무)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="2," <%=obox.get("record_type").indexOf("2,")>=0?"checked":""%> style="border:none">관리회계(원가, 성과)<span/>
					</label> 
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="3," <%=obox.get("record_type").indexOf("3,")>=0?"checked":""%> style="border:none">재무관리(자금, 예산)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="4," <%=obox.get("record_type").indexOf("4,")>=0?"checked":""%> style="border:none">판매관리(고객, 주문, 출하, 배송, 청구)<span/>
					</label>
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="5," <%=obox.get("record_type").indexOf("5,")>=0?"checked":""%> style="border:none">자재관리(구매, 검수, 입출고, 재고)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="6," <%=obox.get("record_type").indexOf("6,")>=0?"checked":""%> style="border:none">생산관리(생산계획, 생산실적)<span/>
					</label>
					<br>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="7," <%=obox.get("record_type").indexOf("7,")>=0?"checked":""%> style="border:none">품질관리(품질계획, 품질검사)<span/>
					</label>
					<label class="mt-checkbox mt-checkbox-outline" style="width:30%">
						<input type="checkbox" name="record_type" value="8," <%=obox.get("record_type").indexOf("8,")>=0?"checked":""%> style="border:none">인사관리(급여, 복지후생, 채용)<span/>
					</label>
					<br>
					<label class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="record_type" value="9," <%=obox.get("record_type").indexOf("9,")>=0?"checked":""%> style="border:none">기타<span/>
					</label>
					(<input type="text" name="record_type_etc" size="20" maxlength="50" title="단위업무시스템 종류" value="<%=obox.get("record_type_etc")%>" class="form-control" style="width:15%">)
				<% } %>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">	
				<button type="button" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
			</span>
		</span>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>