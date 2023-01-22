<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>사업코드</title>

<script language="javascript">
	function goEdit() {
		document.viewForm.action = '/budget/fd/bud01003_edit.do';
		document.viewForm.target = '_self';
		document.viewForm.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("bud01002_delete.do","#viewForm", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					alert('삭제되었습니다.');
					parent.goSearch('');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
	<table class="table table-view table-bordered table-cover">
		<tr height="28">
			<th>사업코드</th>
			<td width="26%" style="padding-left:5px"><b><%=obox.get("bugt_cd")%></b></td>
			<th>사업명</th>
			<td width="38%" style="padding-left:5px"><%=obox.get("bugt_nm")%></td>
		</tr>
		<tr height="28">
			<th>사업구분</th>
			<td style="padding-left:5px"><%=obox.get("bugt_class_nm")%></td>
			<th>계정과목명</th>
			<td style="padding-left:5px"><%=obox.get("acct_nm")%></td>
		</tr>
		<tr height="50">
			<th>사업목적</th>
			<td colspan="3" style="padding:5 5 5 5"><%=obox.get("bugt_purpose",Box.MULTILINE_TEXT)%></td>
		</tr>
		<tr height="50">
			<th>지급기준</th>
			<td colspan="3" style="padding:5 5 5 5"><%=obox.get("pay_guide",Box.MULTILINE_TEXT)%></td>
		</tr>
	<% if(obox.get("bugt_class").endsWith("L")){ %>
		<tr height="28">
			<th>상환방법</th>
			<td style="padding-left:5px"><%=obox.get("refund_nm")%></td>
			<th>이자계산 방식</th>
			<td style="padding-left:5px"><%=obox.get("calc_nm")%></td>
		</tr>
		<tr height="28">
			<th>이자율</th>
			<td style="padding-left:5px"><%=obox.get("intr_rate")%> %</td>
			<th>거치년수</th>
			<td style="padding-left:5px"><%=obox.get("defer_year")%> 년</td>
		</tr>
		<tr height="28">
			<th>상환년수</th>
			<td style="padding-left:5px"><%=obox.get("refund_year")%> 년</td>
			<th>상환횟수</th>
			<td style="padding-left:5px"><%=obox.get("refund_cnt")%> 회</td>
		</tr>
	<% } %>
		<tr height="28">
			<th>세부사업관리</th>
			<td style="padding-left:5px"><%=obox.get("sub_yn").equals("Y")?"예":"아니오"%></td>
			<th>사용여부</th>
			<td style="padding-left:5px"><%=obox.get("use_yn").equals("N")?"아니오":"예"%></td>
		</tr>
	</table>

<% if(rsWp.getLength() > 0) { %>
	<h1 class="page-title-2depth"><%=obox.get("bugt_nm")%> 세부사업</h1>
	<div id="divListData" class="contentsRow"> 
		<div class="row row-set">
			<div class="col-md-12 col-xs-12 col-sm-12 row-set-col">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column table-cover">
					<colgroup>
						<col style='width:10%'/>
						<col style='width:30%'/>
						<col style='width:40%'/>
						<col style='width:15%'/>
					</colgroup>
					<thead>
						<tr height="28" align="center" class="table01_title">
							<th>코드</th>
							<th>명칭</th>
							<th>비고</th>
							<th>사용여부 </th>
						</tr>
					</thead>
					<tbody>
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="4">등록된 자료가 없습니다.</td></tr>
					<%}else { 
						  for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr>
								<td><%=rsWp.get("sub_cd",i)%></td>
								<td><%=rsWp.get("bugt_nm",i)%></td>
								<td><%=rsWp.get("bugt_purpose",i)%></td>
							    <td><%=rsWp.get("use_yn",i).equals("N")?"아니오":"예"%></td>
							</tr>
						<% } %>
					<% } %>
					</tbody>
				 </table>
			</div>
		</div>
	</div>
<% } %>	
	<div class="table-bottom-control">
	<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goEdit()"><img src="/com/img/ico_btn_edit.png">수정</button>
			<% if(uSesEnt.use_auth.equals("SA") && rsWp.getLength() == 0) { %>	
				<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
			<% } %>	
			</span>
		</span>
	<% } %>	
	</div>
</form>
