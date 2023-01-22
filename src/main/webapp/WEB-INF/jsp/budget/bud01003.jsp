<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>사업코드</title>

<script language="javascript">
	var rownum = <%=rsWp.getLength()%>;
	function goAddtr() {
		var cHtml = "<tr id='tr_"+rownum+"'>"
				  + "	<td class='t-center'>자동부여</td>"
				  + "	<td class='t-center'><input type='text' name='bugt_nm"+rownum+"' value='' maxlength='20' title='세부사업명칭' class='form-control' style='width:95%;ime-mode:active'></td>"
				  + "	<td class='t-center'><input type='text' name='bugt_purpose"+rownum+"' value='' maxlength='50' title='비고' class='form-control' style='width:95%;ime-mode:active'></td>"
				  + "	<td class='t-center'><select name='use_yn"+rownum+"' class='bs-select form-control' style='width:95%'><option value='Y'>예</option><option value='N'>아니오</option></select></td>"
				  + "	<td><button type='button' class='btn btn-primary btn-table' onClick=\"$('#tr_"+rownum+"').remove();\">삭제</button></td>"
				  + "</tr>";
		$("#MyTable").append(cHtml);
		rownum++;
	}
	
	function goSave() {
		if(confirm('저장하시겠습니까?')) {
			if(formValidate("#main")) {
				document.main.input_cnt.value = rownum;
				ajaxSubmitForm("bud01003_update.do","#main", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						parent.goSearch('<%=box.get("bugt_cd")%>');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goDelete(bugt_cd, row_id) {
		if(confirm('세부코드를 삭제하시겠습니까?')) {
			document.temp.bugt_cd.value = bugt_cd;
			document.temp.row_id.value = row_id;
			
    		ajaxSubmitForm("bud01003_delete.do","#temp", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					$("#"+row_id).remove();
				}else {
					alert(rtn.errMsg);
				}
			});
    	}
	}
	
	function goChange(val) {
		document.main.refund_cnt.value = parseInt(val) * 12;
	}
		
	function goCancel() {
		removeMask("#main");
		document.main.action = 'bud01002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}
	$(function() {
	<% if(obox.get("sub_yn").equals("Y")) { %>
		if(rownum == 0) { goAddtr(); }
	<% } %>
	});
</script>

<form id="temp" name="temp" method="post" action="" style="margin:0px">
<input type="hidden" name="bugt_cd" value="">
<input type="hidden" name="row_id" 	value="">
</form>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd" 	value="<%=obox.get("bugt_cd")%>">
<input type="hidden" name="input_cnt" 	value="">
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th>사업코드</th>
				<td width="26%"><b><%=box.get("bugt_cd").equals("") ? "자동부여" : box.get("bugt_cd")%></b></td>
				<th>사업명</th>
				<td width="38%">
				<% if(uSesEnt.use_auth.equals("SA")) { %>
					<input type="text" name="bugt_nm" value="<%=obox.get("bugt_nm")%>" maxlength="50" title="사업명" class="form-control required" style="width:100%">
				<% }else { %>
					<%=obox.get("bugt_nm")%>
					<input type="hidden" name="bugt_nm" value="<%=obox.get("bugt_nm")%>">
				<% } %>
				</td>
			</tr>
			<tr>
				<th>사업구분</th>
				<td class="form-inline">
				<% if(box.get("bugt_cd").equals("")) { %>
					<select name="bugt_class" title="사업구분" class="required form-control" style="width:100px">
						<option value=''>선택</option>
						<option value='S' <%=obox.get("bugt_class").equals("S")?"selected":""%>>목적사업</option>
						<option value='L' <%=obox.get("bugt_class").equals("L")?"selected":""%>>대부사업</option>
					</select>
				<% }else { %>
					<%=obox.get("bugt_class_nm")%>
					<input type="hidden" name="bugt_class" value="<%=obox.get("bugt_class")%>">
				<% } %>
				</td>
				<th>계정과목명</th>
				<td>
				<% if(uSesEnt.use_auth.equals("SA")) { %>
					<div class="input-group input-medium">
						<input type="text" name="acct_nm" value="<%=obox.get("acct_nm")%>"  title="계정과목" class="form-control required" style=" width:223px; background-color:f6f6f6;" readOnly>
						<span class="input-group-btn"><button type="button" class="btn dark" onClick="findAccountCode('')"><i class="fa fa-search"></i></button></span>
						<input type="hidden" name="acct_cd" value="<%=obox.get("acct_cd")%>">
					</div>
				<% }else { %>
					<%=obox.get("acct_nm")%>
					<input type="hidden" name="acct_cd" value="<%=obox.get("acct_cd")%>">
					<input type="hidden" name="acct_nm" value="<%=obox.get("acct_nm")%>">
				<% } %>
				</td>
			</tr>
			<tr height="70">
				<th>사업목적</th>
				<td colspan="3"><textarea name="bugt_purpose" style="border:1 solid gray;height:60;width:100%;ime-mode:active"><%=obox.get("bugt_purpose")%></textarea></td>
			</tr>
			<tr height="50">
				<th>지급기준</th>
				<td colspan="3"><textarea name="pay_guide" style="border:1 solid gray;height:40;width:100%;ime-mode:active"><%=obox.get("pay_guide")%></textarea></td>
			</tr>
		<% if(obox.get("bugt_class").endsWith("L")){ %>
			<tr>
				<th>상환방법</th>
				<td>
					<select name="refund_method" style="width:150px" class="bs-select form-control">
			        	<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("refund_method"), "refund_method", "", "", "", "", uSesEnt.dbo)%>
					</select>
				</td>
				<th>이자계산 방식</th>
				<td>
					<select name="calculation" style="width:150px" class="bs-select form-control">
			           <%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("calculation"), "calculation", "", "", "", "", uSesEnt.dbo)%>
					</select>
				</td>
			</tr>
			<tr>
				<th>이자율</th>
				<td><input type="text" name="intr_rate" value="<%=obox.get("intr_rate")%>" title="이자율" class="form-control required tFMONEY" style="width:50px"> %</td>
				<th>거치년수</th>
				<td><input type="text" name="defer_year" value="<%=obox.get("defer_year")%>" maxlength="2" title="거치년수" class="form-control required tMONEY" style="width:50px"> 년</td>
			</tr>
			<tr>
				<th>상환년수</th>
				<td><input type="text" name="refund_year" value="<%=obox.get("refund_year")%>" maxlength="2" title="상환년수" class="form-control required tMONEY" style="width:50px" onChange="goChange(document.main.refund_year.value)"> 년</td>
				<th>상환횟수</th>
				<td><input type="text" name="refund_cnt" value="<%=obox.get("refund_cnt")%>" maxlength="3" title="상환회수" class="form-control required tMONEY" style="width:50px"> 회</td>
			</tr>
		<% } %>
			<tr>
				<th>세부사업관리</th>
				<td>
				<% if(uSesEnt.use_auth.equals("SA") && box.get("bugt_cd").equals("")) { %>
					<select name="sub_yn"  style="width:80px" class="bs-select form-control" >
						<option value="Y" <%=obox.get("sub_yn").equals("Y")?"selected":""%>>예</option>
						<option value="N" <%=obox.get("sub_yn").equals("Y")?"":"selected"%>>아니오</option>
					</select>
				<% }else { %>
					<%=obox.get("sub_yn").equals("Y")?"예":"아니오"%>
					<input type="hidden" name="sub_yn" value="<%=obox.get("sub_yn")%>">
				<% } %>
				</td>
				<th>사용여부</th>
				<td>
				<% if(uSesEnt.use_auth.equals("SA")) { %>
					<select name="use_yn"  style="width:80px" class="bs-select form-control" >
						<option value="Y" <%=obox.get("use_yn").equals("Y")?"selected":""%>>예</option>
						<option value="N" <%=obox.get("use_yn").equals("N")?"selected":""%>>아니오</option>
					</select>
				<% }else { %>
					<%=obox.get("use_yn").equals("N")?"아니오":"예"%>
					<input type="hidden" name="use_yn" value="<%=obox.get("use_yn")%>">
				<% } %>
				</td>
			</tr>
		</table>
	</div>

<% if(obox.get("sub_yn").equals("Y")) { %>
	<h1 class="page-title-2depth"><%=obox.get("bugt_nm")%> 세부사업</h1>
	<div class="table-scrollable">		
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<tr align="center" class="table01_title">
				<th width="10%">코드</th>
				<th width="30%">명칭</th>
				<th width="40%">비고</th>
				<th width="15%">사용여부</th>
				<th width="10%"><button id="btnSave" type="button" class="btn btn-primary btn-table" onClick="goAddtr()">추가</button></th>
			</tr>
		<% for(int i=0; i < rsWp.getLength(); i++) { %>
			<tr id="tr_<%=i%>" class="odd gradeX">
				<td align="center"><%=rsWp.get("sub_cd",i)%><input type="hidden" name="bugt_cd<%=i%>" value="<%=rsWp.get("bugt_cd",i)%>"></td>
				<td align="center"><input type="text" name="bugt_nm<%=i%>" value="<%=rsWp.get("bugt_nm",i)%>" maxlength="50" title="세부사업명칭" class="required form-control" style="width:95%;border:1 solid gray;ime-mode:active"></td>
				<td align="center"><input type="text" name="bugt_purpose<%=i%>" value="<%=rsWp.get("bugt_purpose",i)%>" maxlength="50" title="비고" style="width:95%;" class="form-control"></td>
			    <td align="center">
			    	<select name="use_yn<%=i%>" style="width:95%" class="form-control" >
	          			<option value='Y' <%=rsWp.get("use_yn",i).equals("Y")?"selected":""%>>예</option>
	          			<option value='N' <%=rsWp.get("use_yn",i).equals("N")?"selected":""%>>아니오</option>
	          	 	</select>
			    </td>
			    <td><button type="button" class="btn btn-primary btn-table" onClick="goDelete('<%=rsWp.get("bugt_cd",i)%>','tr_<%=i%>')">삭제</button></td>
			</tr>
		<% } %>
		</table>
	</div>
<% } %>
	<div class="table-bottom-control">
	<% if(uSesEnt.use_auth.equals("S2") || uSesEnt.use_auth.equals("SA")) { %>
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
			<%if(!box.get("bugt_cd").equals("")){%>
				<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_cancel.png">취소</button>
			<% } %>
			</span>
		</span>
		<% } %> 
	</div>	
</form>