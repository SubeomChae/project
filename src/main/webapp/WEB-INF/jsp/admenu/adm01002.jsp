<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		 class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="obox"		 class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="uSesEnt" 	 class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 회사정보 수정-->
<script language="javascript">
	function goEdit(corp_cd) {
		if(formValidate("#saveForm")) {
			ajaxReplaceForm("adm01003_edit.do", "#saveForm", "#divFrame");
		}
	}
	
	function goDelete() {
		if (formValidate("#saveForm")) {
			if (confirm('삭제하시겠습니까?')) {
				document.saveForm.action = 'adm01002_delete.do';
				document.saveForm.target = '_self';
				document.saveForm.submit();
			}
		}
	}
	
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="corp_cd" value="<%=obox.get("corp_cd")%>">

	<table class="table table-view table-bordered table-cover mar0">
		<tr>
			<th width="16%">회사코드</th>
			<td width="35%"><b><%=obox.get("corp_cd")%></b></td>
			<th width="16%">회사명</th>
			<td><%=obox.get("corp_nm")%></td>
		</tr>
		<tr>
			<th>사업자등록번호</th>
			<td><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
			<th>법인등록번호</th>
			<td><%=obox.get("corp_reg_no",Box.JUMIN_NO)%></td>
		</tr>
		<tr>
			<th>인가번호</th>
			<td><%=obox.get("license_no")%></td>
			<th>기금등기일</th>
			<td><%=obox.get("reg_ymd",Box.DEF_DATE_FMT)%></td>
		</tr>
		<tr>
			<th>업태</th>
			<td><%=obox.get("uptae")%></td>
			<th>종목</th>
			<td><%=obox.get("upjong")%></td>
		</tr>
		<tr>
			<th>대표자 성명</th>
			<td><%=obox.get("rep_person_nm")%></td>
			<th>대표자 주민번호</th>
			<td><%=FormatUtil.juminNo(obox.get("rep_reside_no"),"x")%></td>
		</tr>
	</table>
    <table class="table table-view table-bordered mar0">
		<tr> 
			<th style="width:16%">회사로고이미지</th>
			<td>
			<% if(!obox.get("file_nm").equals("")){ %>
		 		<a href="#" title="이미지뷰어로 열기" onClick="popupOpen('/popup/imgPopup.do?imgPath=photo&file_nm=<%=obox.get("logo_file")%>','imgPopup', 200, 200);">
		 	<% } %>
			 <img src="/com/img/ico_disk.png" border="0" align="absmiddle"><%=FormatUtil.nvl2(obox.get("file_nm"),"미등록")%>
			</td>
       		
       	</tr>
    </table>
	<table class="table table-view table-bordered mar0">
		<tr>
			<th>사업장소재지</th>
			<td colspan="3"><%if(!obox.get("zip_no").equals("")){%>[<%=obox.get("zip_no")%>] <%}%><%=obox.get("addr")%></td>
		</tr>
		<tr>
			<th style="width:16%">사업장전화번호</th>
			<td width="35%"><%=obox.get("tel_no")%></td>
			<th style="width:16%">전자우편주소</th>
			<td width="35%"><%=obox.get("email_id")%></td>
		</tr>
		<tr>
			<th>사업체 대표자</th>
			<td><%=obox.get("mo_rep_person")%></td>
			<th>사업체 업종</th>
			<td><%=obox.get("mo_upjong")%></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td colspan="3"><a href="<%=obox.get("site_addr")%>" style="letter-spacing:0px"><%=obox.get("site_addr")%></a></td>
		</tr>
		<tr>
			<th>근로자수</th>
			<td><%if(!obox.get("empl_cnt").equals("")){%><%=obox.get("empl_cnt",Box.THOUSAND_COMMA)%> 명<%}%></td>
			<th>노동조합원수</th>
			<td><%if(!obox.get("nojo_entry_cnt").equals("")){%><%=obox.get("nojo_entry_cnt",Box.THOUSAND_COMMA)%> 명<%}%></td>
		</tr>
		<tr>
			<th>납입자본금</th>
			<td><%if(!obox.get("capital_amt").equals("")){%><%=obox.get("capital_amt",Box.THOUSAND_COMMA)%> 원<%}%></td>
			<th>관할세무서</th>
			<td><%if(!obox.get("tax_office").equals("")){%><%=obox.get("tax_office")%> 세무서<%}%></td>
		</tr>
		<tr>
			<th style="width:16%">국세환급금계좌신고</th>
			<td colspan="3">
				<%if(!obox.get("bank_nm").equals("")){%><b>예입처</b> : <%=obox.get("bank_nm")%>&nbsp;&nbsp;<%}%>
				<%if(!obox.get("account_type").equals("")){%><b>예금종류</b> : <%=obox.get("account_type")%>&nbsp;&nbsp;<%}%>
				<%if(!obox.get("account_no").equals("")){%><b>계좌번호</b> : <%=obox.get("account_no")%><%}%>
			</td>
		</tr>
		<tr>
			<th>결산기</th>
			<td><%if(!obox.get("account_closing").equals("")){%><%=obox.get("account_closing")%>월결산<%}%></td>
			<th>회사규모</th>
			<td><%=obox.get("corp_scale_nm")%></td>
		</tr>
		<tr>
			<th>대변결제계정</th>
			<td><%=obox.get("debit_acct_nm")%></td>
			<th>수입대체주기</th>
			<td><%=obox.get("repl_cycle_nm")%></td>
		</tr>
		<tr>
			<th>결산반영방식</th>
			<td colspan="3"><%=obox.get("accounting_flag_nm")%></td>
		</tr>
		<tr>
			<th>가동일자</th>
			<td><%=obox.get("open_ymd",Box.DEF_DATE_FMT)%></td>
			<th rowspan="3" width="15%">접속허용IP</th>
			<td><%=StringUtil.arrayCol(obox.get("permit_ip"),1,";")%></td>
		</tr>
		<tr>
			<th>폐쇄일자</th>
			<td><%=obox.get("close_ymd",Box.DEF_DATE_FMT)%></td>
			<td><%=StringUtil.arrayCol(obox.get("permit_ip"),2,";")%></td>
		</tr>
		<tr>
			<th>설치서버</th>
			<td><%=obox.get("server_ip").startsWith("1")?"자체":"임대"%><%if(obox.get("server_ip").startsWith("1") && !StringUtil.arrayCol(obox.get("server_ip"),2,"|").equals("")){%>(IP주소 : <%=StringUtil.arrayCol(obox.get("server_ip"),2,"|")%>)<%}%></td>
			<td><%=StringUtil.arrayCol(obox.get("permit_ip"),3,";")%></td>
		</tr>
	</table>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
			<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
		  		<button type="button" id="btnModify" class="btn dark" onclick="goEdit('');"><img src="/com/img/ico_btn_edit.png">수정</button>
		  	<% } %>
		  	<% if(uSesEnt.use_auth.equals("SA")) { %>
		  		<button type="button" id="btnDelete" class="btn dark" onclick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
		  	<% } %>
		  	</span>
		</span>
	</div>
	
	<div id="divFrame">
			
	</div>
</form>	
