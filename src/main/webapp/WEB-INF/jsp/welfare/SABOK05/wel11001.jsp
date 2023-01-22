<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="pbox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	boolean isEditable = false;
	if(box.get("action_type").equals("edit") && rsWp.getLength() > 0) { isEditable = true; }
	if(box.get("excel_yn").equals("Y")) { isEditable = false; }
%>
<% if(box.get("excel_yn").equals("Y")) { box.put("ajax_yn", "Y"); %>
<%@ include file="/WEB-INF/jsp/com/include/excel_header.jsp" %>
<% } %>
<!-- 연금지급 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language='javascript'>
	function goSearch(gbn) {
		if(formValidate("#main")) {				
			var theURL = 'wel11001_list.do';
			if(gbn == 'E') { theURL = theURL + '?excel_yn=Y'; }
	
			removeMask("#main");
			document.main.page_count.value = '';
			document.main.pay_cond.value = concatPayCond();
			document.main.action = theURL;
			document.main.target = '_self';
			document.main.submit();
			fixTableHeader("MyTable");
		}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("wel11001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goSave() {
		if(formValidate("#main")) {
			var empl_no = '';
			for(var i=0; i < <%=rsWp.getLength()%>; i++) {
				if(document.all['empl_no'+i].checked) { empl_no += document.all['empl_no'+i].value; }
			}
			if(empl_no == '') {
				alert('지급대상자가 선택되지 않았습니다.');
				return;
			}
	
			if(confirm('연금지급 대상자를 일괄 저장하시겠습니까?')) {
				removeMask("#main");		
				document.main.empl_no.value = empl_no;
				document.main.discount_amt.value = parseInt2(document.form1.discount_amt);
				document.main.pay_cond.value = concatPayCond();
				document.main.action = 'wel11001_update.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goCreateSlip() {
		if(formValidate("#main")) {
			if(confirm('전표를 생성하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'wel11001_create_slip.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function goDelete() {
		if(formValidate("#main")) {
			if(confirm('연금지급 대상자를 일괄 삭제하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'wel11001_delete.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}

	function signRequestPost() { goSearch('N'); }
	
	function concatPayCond() {
		var pay_cond = document.form1.entry_ymd1.value.replace(/-/g,"") + "|" + document.form1.entry_ymd2.value.replace(/-/g,"") + "|";
		for(var i=0; i < document.form1.empl_class.length; i++) {
			if(document.form1.empl_class[i].checked) { pay_cond += document.form1.empl_class[i].value; }
		}	
		pay_cond += "|";			  
		for(var i=0; i < document.form1.empl_status.length; i++) {
			if(document.form1.empl_status[i].checked) { pay_cond += document.form1.empl_status[i].value; }
		}	
		document.main.pay_cond.value = pay_cond;
		return pay_cond;			  
	}

	function clickCheckAll(bool) {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			try { 
				$("input:checkbox[name^='new_empl_no']").prop("checked", bool);
			} catch(e) {}
		}
		autoCalc('');
	}
	
	function autoCalc(inx) {
	<%  int cnt = obox.getInt("member_cnt");
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(rsWp.get("exist_yn",i).equals("Y")) { cnt--; }
		}
	%>
		if(inx == '') {
			document.form1.member_cnt.value = $("#checkAll").prop("checked") ? <%=cnt+rsWp.getLength()%> : <%=cnt%>;
		}else {
			document.form1.member_cnt.value = parseInt2(document.form1.member_cnt) + (document.all['new_empl_no'+inx].checked ? 1 : -1);
		}
		document.form1.pay_amt_tot.value = parseInt2(document.form1.member_cnt) * parseInt2(document.form1.pay_amt) - parseInt2(document.form1.discount_amt);
		formatMaskElm(document.form1.member_cnt);
		formatMaskElm(document.form1.pay_amt_tot);
	}
	
	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('Y');
	}
	
	function changeBugtCd(formName, std_yy, defVal, topRow) {
		if(!isObject('bugt_cd')) { return; }
		if(defVal == '') { defVal = '<%=box.get("bugt_cd")%>' };
		formName.bugt_cd.options.length = 1;
		if(std_yy != '') {
			if(topRow == '' || topRow == undefined) { topRow = '선택'; };
			setOptionByProcDbo('PR_BUDTB_BUGT01_LIST@LISTCODE', formName.bugt_cd, defVal, std_yy, '<%=StringUtil.substr(box.get("bugt_cd"),0,6)%>', '2', '', '', topRow, '', '<%=uSesEnt.dbo%>');
		}
	}
	
	$(function() {
		fixTableHeader("MyTable");
		changeBugtCd(document.main, '<%=box.get("std_yy")%>', '')
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="empl_no" 		value="">
<input type="hidden" name="pay_cond" 		value="<%=obox.get("pay_cond")%>">
<input type="hidden" name="discount_amt" 	value="<%=pbox.getInt("discount_amt")%>">
<input type="hidden" name="sort_order" 		value="">
<input type="hidden" name="page_count"		value="">
<input type="hidden" name="excel_file_nm" 	value="연금지급">

<% if(!box.get("msg_popup").equals("Y")) { %>
	<h1 class="page-title">연금지급</h1>
<% } %>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:13%;">
			<col style="width:17%;">
			<col style="width:13%;">
			<col style="width:27%;">
		</colgroup>
		<% if(!box.get("msg_popup").equals("Y")) { %>
  			<tr>
				<td class="td-head" width="13%">기준년도</td>
				<td>
					<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:120px" onChange="changeBugtCd(document.main, this.value, '');goSearch('N')">
						<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
				</td>
				<td class="td-head">세부사업명</td>
				<td>
					<div class="form-inline">
						<select name="bugt_cd" class="bs-select form-control required" title="세부사업명" style="width:170px" onChange="goSearch('N')">
							<option value=''>선택</option>
							<%=CodeUtil.optList("PR_BUDTB_BUGT01_LIST","LISTCODE",box.get("bugt_cd"),box.get("std_yy"),StringUtil.substr(box.get("bugt_cd"),0,6),"2","","", uSesEnt.dbo)%>
						</select>
						<span class="f-right marR50">
							<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
							<button type="button" id="btnExcel" class="btn btn-primary" onclick="goSearch('E');"><img src="/com/img/ico_btn_excel.png">엑셀</button>
						</span>
					</div>
				</td>
	  		</tr>
	  	<% } %>	
		<% if(!box.get("bugt_cd").equals("")) { %>
	  		<tr>
				<td class="td-head">지급일자</td>
				<td>
				<% if(box.get("action_type").equals("edit")) { %>
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="pay_ymd" value="<%=DateUtil.toString("yyyyMMdd")%>" maxlength="8" title="지급일자" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				<% }else { %>
					<%=obox.get("pay_ymd",Box.DEF_DATE_FMT)%>
				<% } %>
				<td class="td-head">지급기준</td>
				<td colspan="2" nowrap style="padding-left:5px">
					<%=pbox.getInt("member_cnt")%> 명 x <%=FormatUtil.insertComma(String.valueOf(pbox.getLong("unit_amt")))%> 원 = 소요예산(<%=FormatUtil.insertComma(String.valueOf(pbox.getLong("bugt_amt")))%> 원)
				<% if(box.get("action_type").equals("edit")) { %>
					<button type="button" class="btn btn-primary btn-table" onclick="$('#divEditModal').modal('show');">대상자추출</button>
					<%if(rsWp.getLength() > 0){ %>
						<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
					<% } %>
				<% }else if(!obox.get("sign_status").equals("2") && !obox.get("sign_status").equals("3")) { %>
					<button type="button" class="btn btn-primary btn-table" onclick="goDelete();">전체삭제</button>
				<% } %>
				</td>
	  		</tr>
		<% } %>
		<% if(box.get("action_type").equals("view")) { %>
			<tr>
				<td class="td-head">전표번호</td>
				<td colspan="5">
				<% if(obox.get("slip_no").equals("")) { %>
					미작성&nbsp;<button type="button" class="btn btn-primary btn-table" onClick="goCreateSlip();">전표분개</button>
				<% }else { %>
					<input type="hidden" name="slip_no" value="<%=obox.get("slip_no")%>">
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><b><%=obox.get("slip_no",Box.SLIP_NO)%></b></a>
					&nbsp;(<font color=red><b><%=obox.get("sign_status_nm")%></b></font>)
					<% if(obox.get("sign_status").equals("1")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignRequest(document.signForm);">기안문작성</button>
					<% }else if(obox.get("sign_status").equals("2") || obox.get("sign_status").equals("4")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('', document.signForm.msg_type.value, document.signForm.search_key.value);">결재라인</button>
					<% } %>
				<% } %>
				</td>
			</tr>
		<% } %>
	</table>
</form>

<form name="form1" method="post" action="" class="fType" style="margin:0px">
	<div id="divListData" class="contentsRow">
		<div class="table-top-control">
<% } %>
			<% if(!box.get("excel_yn").equals("Y")) { %>
			<div class="notice-view">
			  	<span style="color:#01a1db;">성명을 클릭</span>하면 해당 사원의 상세정보를 검색할 수 있습니다.
			  	<% if(obox.getInt("member_cnt") > 0) { %>
					<b>총 지급액</b> : <%=obox.getInt("member_cnt")%> 명 x <%=pbox.get("unit_amt",Box.THOUSAND_COMMA)%> 원 
					<%if(obox.getInt("discount_amt") > 0){%>- (할인액 : <%=obox.get("discount_amt",Box.THOUSAND_COMMA)%> 원)<%}%>
					= <span style="font-weight:bold; color:#01a1db;"><%=FormatUtil.insertComma(String.valueOf(obox.getInt("pay_amt") - obox.getInt("discount_amt")))%></span> 원
			  	<% }else if(isEditable) { %>
			  		<b>총 지급액</b> : 
					<input type="text" name="member_cnt" value="<%=rsWp.getLength()%>" size="4" title="인원수" class="tMONEY" style="border:1 solid #c9c9c9" readOnly> 명 x 
					<input type="text" name="pay_amt" value="<%=pbox.get("unit_amt")%>" size="10" title="지원금액" class="tMONEY" style="border:1 solid #c9c9c9" readOnly> 원   
					- (할인액 : <input type="text" name="discount_amt" value="<%=pbox.getInt("discount_amt")%>" size="10" title="할인액" class="tMONEY" style="border:1 solid #c9c9c9" onChange="document.form1.pay_amt_tot.value = parseInt2(document.form1.pay_amt_tot) - parseInt(this.value); formatMaskElm(document.form1.pay_amt_tot);"> 원) 
					= <input type="text" name="pay_amt_tot" value="<%=rsWp.getLength()*pbox.getLong("unit_amt")%>" size="13" title="합계" class="tMONEY" style="border:1 solid #c9c9c9" readOnly> 원
			  	<% } %>
			</div>
		</div>
		<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 270px)">
		<% } %>
			<table id="MyTable" class="table table-bordered table-hover order-column">
				<colgroup>
					<col style="width:4%;">
					<col style="width:8%;">
					<col style="width:8%;">
					<col style="width:15%">
					<col style="width:10%;">
					<col style="width:10%;">
					<col style="width:13%;">
					<col style="width:13%;">
					<col style="width:8%;">
					<col style="width:10%;">
				<%if(isEditable){%>
					<col style="width:4%;">
				<% } %>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>사번</th>
						<th>성명</th>
						<th>부서</th>
						<th>직위</th>
						<th>입사일자</th>
						<th>주민번호</th>
						<th>사원구분</th>
						<th>재직상태</th>
						<th>지급액</th>
					<%if(isEditable && !box.get("excel_yn").equals("Y")){%>
						<th>
							<label class="mt-checkbox mt-checkbox-outline">
								<input type="checkbox" name="checkbox" value="Y" style="border:none" checked onClick="clickCheckAll(this.checked)"><span/>
							</label>
						</th>
					<% } %>
		         		</tr>
		        		</thead>
		        		<tbody> 
				<% if(!box.get("bugt_cd").equals("") && rsWp.getLength() == 0) { %>
						<tr><td colspan="<%=isEditable ? 11 : 10%>" class="t-center">등록된 자료가 없습니다.</td></tr>
				<% }else if(rsWp.getLength() > 0) {
				   	   for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr> 
							<td class="t-center"><%=String.valueOf(i+1)%></td>
							<td class="t-center"><%=rsWp.get("empl_no",i)%></td>
							<td class="t-center"><%if(!box.get("excel_yn").equals("Y")){%>
								<a href="javascript:goEmployeePop('<%=rsWp.get("empl_no",i)%>')">
							<% } %><%=rsWp.get("empl_nm",i)%></a>
							</td>
							<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("position_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("entry_ymd",i, Box.DEF_DATE_FMT)%></td>
							<td class="t-center"><%=FormatUtil.juminNo(rsWp.get("reside_no",i),"x")%></td>
							<td class="t-center"><%=rsWp.get("empl_class_nm",i)%></td>
							<td class="t-center"><%=rsWp.get("empl_status_nm",i)%></td>
							<td class="t-center"><%=obox.getInt("member_cnt") > 0 ? rsWp.get("pay_amt",i,Box.THOUSAND_COMMA) : pbox.get("unit_amt",Box.THOUSAND_COMMA)%></td>
							<%if(isEditable && !box.get("excel_yn").equals("Y")){%>
								<td class="t-center">
									<label class="mt-checkbox mt-checkbox-outline">
										<input type="checkbox" name="empl_no<%=i%>" value="<%=rsWp.get("empl_no",i)%>," style="border:none" checked onClick="autoCalc('<%=i%>')"><span/>
									</label>
								</td>
							<% } %>
						</tr>	
					<% } %>
				 <% } %>
				 </tbody>
			 </table>
<% if(!box.get("excel_yn").equals("Y")) { %>			
		</div>
		<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
	</div>
<!-- 대상자추출  -->
	<div class="modal fade" id="divEditModal" tabindex="-1" role="basic" aria-hidden="true">
		<div class="modal-dialog" style="width:412px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h4 class="modal-title">연금지급 대상자 추출 조건설정</h4>
				</div>
				<div class="modal-body">
					<table class="table table-view table-bordered">
					<%	String arr[] = StringUtil.split(obox.get("pay_cond")+"||||||||||","|",true); %>
						<tbody>
							<tr>	
								<td width="25%" class="td-head">입사일자</td>																										
								<td width="75%">
									<div class="form-inline">
										<div class="input-group input-medium date date-picker" data-date="<%=obox.get("entry_ymd1",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
											<input type="text" name="entry_ymd1" value="<%=obox.get("entry_ymd1")%>" maxlength="8" title="입사일자(부터)" class="form-control required tYMD">
											<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
										</div>
										<span> ~ </span>
										<div class="input-group input-medium date date-picker" data-date="<%=obox.get("entry_ymd2",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
											<input type="text" name="entry_ymd2" value="<%=obox.get("entry_ymd2")%>" maxlength="8" title="입사일자(까지)" class="form-control required tYMD">
											<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>																											
								<td class="td-head">사원구분</td>																										
								<td>
								<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE","","empl_class@"+uSesEnt.dbo,"","","","","");
									for(int i=0; i < codeWp.getLength(); i++) { %>
									<label class="mt-checkbox mt-checkbox-outline">
										<input type="checkbox" name="empl_class" value="<%=codeWp.get("code",i)%>," <%=arr[2].indexOf(codeWp.get("code",i)) >= 0 ? "checked":""%> style="border:none"><%=codeWp.get("data",i)%>&nbsp;<span/>
										<%if(i%2==1){ %>
											<br>
										<% } %>
									</label>
								<%	} %>	
								</td>
							</tr>
							<tr>																											
								<td class="td-head">재직구분</td>																										
								<td>
									<label class="mt-checkbox mt-checkbox-outline">
										<input type="checkbox" name="empl_status" value="S" <%=arr[3].indexOf("S") >= 0 ? "checked":""%> style="border:none">재직자<span/>
									</label>
									<label class="mt-checkbox mt-checkbox-outline">
										<input type="checkbox" name="empl_status" value="H" <%=arr[3].indexOf("H") >= 0 ? "checked":""%> style="border:none">휴직자<span/>
									</label>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<div class="table-bottom-control">
						<span style="width:100%;">
							<span style="float:right;">
								<button type="button" id="btnSearch" class="btn dark" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">저장</button>
								<button type="button" id="btnCancel" class="btn dark" onClick="$('#divEditModal button.close').trigger('click');"><img src="/com/img/ico_btn_cancel.png">취소</button>
							</span>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</form>
<% } %>
<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="연금지급(<%=obox.get("bugt_nm")%>)">
<input type="hidden" name="msg_type" 		value="SLP005">
<input type="hidden" name="search_key" 		value="ACCTB_SLIP01|<%=obox.get("slip_no")%>|<%=obox.get("std_yy")%>|<%=obox.get("bugt_cd")%>">
<input type="hidden" name="etc_remark"		value="">
<input type="hidden" name="pay_ymd"			value="<%=obox.get("pay_ymd",Box.DEF_DATE_FMT)%>">
<input type="hidden" name="member_cnt"		value="<%=obox.get("member_cnt",Box.THOUSAND_COMMA)%>">
<input type="hidden" name="pay_amt"			value="<%=FormatUtil.insertComma(String.valueOf(obox.getInt("pay_amt") - obox.getInt("discount_amt")))%>">
<input type="hidden" name="nextUrl" 		value="">
</form>
<% } %>
