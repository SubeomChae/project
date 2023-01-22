<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="vbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 세금계산서 합계표 -->

<script language='javascript'>
	function goDownload() {
		var nTaxFileNm = 'I105.200';
		nTaxFileNm = 'I105.200';
		document.main.file_nm.value = nTaxFileNm;
		document.main.file_path.value = nTaxFileNm;
		document.main.action='downFile.do';
		document.main.submit();
	}
	
	function goCreate() {
		var theURL = 'ntx13001.do';
		var data_flag = 'I105200';
		
		if(confirm('파일을 생성하시겠습니까?')) {
			removeMask("#main");	
			document.main.action = theURL+'&data_flag='+data_flag;
			document.main.target = '_self';
			document.main.submit();
		}
	} 
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="file_nm"  	value="">
<input type="hidden" name="file_path"	value="">

	<table class="table table-view table-bordered table-cover marB5">
		<tr height="40">
			<th width="15%">①사업자등록번호</th>
			<td width="35%"><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
			<th width="15%">②상호(법인명)</th>
			<td width="35%" style="padding:0 5 0 5"><%=obox.get("corp_nm")%></td>
		</tr>
		<tr height="40">
			<th>③성명(대표자)</th>
			<td><%=obox.get("rep_person_nm")%></td>
			<th>④사업장 소재지</th>
			<td><%=obox.get("addr")%></td>
		</tr>
		<tr height="40">
			<th>⑤거래기간</th>
			<td><%=obox.get("tax_ymd_from")%>~<%=obox.get("tax_ymd_to")%></td>
			<th>⑥작성일자</th>
			<td><%=obox.get("tax_ymd_to")%></td>
		</tr>
	</table>
	
	<table class="table table-view table-bordered table-cover marB5">
		<tr height="28">
			<th colspan="2">구분</th>
			<th width="10%">⑦ 매입처수</th>
			<th width="10%">⑧ 매수</th>
			<th width="20%">⑨ 공  급  가  액</th>
			<th width="20%">⑩ 세  액</th>
		</tr>
		<tr height="28">
			<th colspan="2">합계</th>
			<td class="t-center"><%=vbox.get("cust_cnt")%></td>
			<td class="t-center"><%=vbox.get("cust_slip_cnt")%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("cust_gong_amt")))%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("cust_vat_amt")))%></td>
		</tr>
		<tr height="30">
			<th rowspan="3" width="20%">과세기간 종료일 다음달 11일까지 <br>전송된 전자 세금계산서발급받은 분</th>
			<th width="20%">사업자등록번호 발급받은분</th>
			<td class="t-center"><%=vbox.get("saupja_cnt_y")%></td>
			<td class="t-center"><%=vbox.get("saupja_slip_cnt_y")%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("saupja_gong_amt_y"))) %></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("saupja_vat_amt_y")))%></td>
		</tr>
		<tr height="30">
			<th class="t-center">주민등록번호 발급받은분</hd>
			<td class="t-center"><%=vbox.get("reside_cnt_y")%></td>
			<td class="t-center"><%=vbox.get("reside_slip_cnt_y")%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("reside_gong_amt_y")))%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("reside_vat_amt_y")))%></td>
		</tr>
		<tr height="30">
			<th class="t-center">소계</th>
			<td class="t-center"><%=vbox.get("cust_cnt_y")%></td>
			<td class="t-center"><%=vbox.get("cust_slip_cnt_y")%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("cust_gong_amt_y")))%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("cust_vat_amt_y")))%></td>
		</tr>
		<tr height="30">
			<th rowspan="3" class="t-center">위 전자 세금계산서 외의 발급받은분</th>
			<th class="t-center">사업자등록번호 발급받은분</th>
			<td class="t-center"><%=vbox.get("saupja_cnt_n")%></td>
			<td class="t-center"><%=vbox.get("saupja_slip_cnt_n")%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("saupja_gong_amt_n")))%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("saupja_vat_amt_n")))%></td>
		</tr>
		<tr height="30">
			<th class="t-center">주민등록번호 발급받은분</th>
			<td class="t-center"><%=vbox.get("reside_cnt_n")%></td>
			<td class="t-center"><%=vbox.get("reside_slip_cnt_n")%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("reside_gong_amt_n")))%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("reside_vat_amt_n")))%></td>
		</tr>
		<tr height="30">
			<th class="t-center">소계</th>
			<td class="t-center"><%=vbox.get("cust_cnt_n")%></td>
			<td class="t-center"><%=vbox.get("cust_slip_cnt_n")%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("cust_gong_amt_n")))%></td>
			<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(vbox.get("cust_vat_amt_n")))%></td>
		</tr>
	</table>
	
	<table class="table table-view table-bordered table-cover marB5">
		<tr height="28">
			<th style="width:5%">⑪ 번호</th>
			<th style="width:5%">⑫ 사업자>등록번호</th>
			<th style="width:5%">⑬ 상호(법인명)</th>
			<th style="width:5%">⑭ 매수</th>
			<th style="width:5%">⑮ 공  급  가  액</th>
			<th style="width:5%">? 세  액</th>
			<th style="width:5%">비고</th>
		</tr>
	<% if(rsWp.getLength() == 0) { %>
		<tr height="28"><td colspan="15" class="t-center">검색된 자료가 없습니다.</td></tr>
	<% }else{ 
		for(int i=0; i < rsWp.getLength(); i++) { %>
		<tr height="28">
			<td class="t-center"><%=rsWp.get("rn",i)%></td>
			<td class="t-center"><%=rsWp.get("saupja_no_x",i)%></td>
			<td class="t-center"><%=rsWp.get("cust_nm",i)%></td>
			<td class="t-center"><%=rsWp.get("slip_cnt",i)%></td>
			<td width="6%" class="t-right"><%=rsWp.get("gong_amt",i,Box.THOUSAND_COMMA)%></td>
			<td width="6%" class="t-right"><%=rsWp.get("vat_amt",i,Box.THOUSAND_COMMA)%></td>
			<td class="t-center"><%=rsWp.get("",i)%></td>
		</tr>
		<% } %>
   <% } %>
   </table>
   
   	<table class="table table-view table-bordered marB5" style="width:30%">
   		<tr height="35">
			<td class="t-center" width="30%">관리번호(매입)</td>
			<td width="70%"></td>
			<span style="width:100%;">
				<span id="nTaxSpan" class="f-right marR5">
					<button type="button" class="btn dark marL5" onclick="goCreate();"><img src="/com/img/ico_btn_edit.png">전산매체생성</button>
					<button type="button" class="btn dark marL5" onclick="goDownload();"><img src="/com/img/ico_btn_edit.png">다운로드</button>
				</span>
			</span>
		</tr>
	</table>
	
	
</form>