<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "cong_class@"+uSesEnt.dbo+"|bank_cd@@@@A|","","","","");
	String pro_status = ("1,4".indexOf(obox.get("sign_status")) >= 0 ? "1" : obox.get("sign_status")) + FormatUtil.nvl2(obox.get("finish_flag"),"0");
%>
<!-- 대부금 신청서 작성  -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(document.saveForm.sign_status.value == '3' && isEmpty(document.saveForm.finish_flag)) {
				document.saveForm.finish_flag.value = '0';
			}
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("lon01003_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch(document.saveForm.loan_no.value);
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}		
	}
			
 	function goCancel() {
		ajaxReplaceForm("lon01002_select.do", "#saveForm", "#divFrame");
	}
	
	function goChange(bugt_cd) {
		ajaxProcJsonBox("PR_BUDTB_CODE01@SELECT", {'bugt_cd' : bugt_cd}, function(rtn) {
			document.saveForm.refund_method.value = rtn.refund_method;
			document.saveForm.intr_rate.value = rtn.intr_rate;
			document.saveForm.defer_year.value = rtn.defer_year;
			document.saveForm.refund_year.value = rtn.refund_year;
			changeColumn('defer_year',rtn.defer_year);
			changeColumn('refund_year',rtn.refund_year);

			if(rtn.refund_cnt > 0) {
				document.saveForm.refund_cnt.value = rtn.refund_cnt;
				changeColumn('refund_cnt',rtn.refund_cnt);
			}else {
				document.saveForm.unit_amt.value = '';
			}
		});
	}
	
/* 	function auto_cong_amt() {
		document.saveForm.apply_amt.value = '';
		for(var i=0; i < congWp.length; i++) {
			var arr = congWp[i].split('|');
			if(arr[0] == document.saveForm.cong_class.value && arr[1] == document.saveForm.family_rel_cd.value) {
				document.saveForm.apply_amt.value = arr[2];
				formatMaskElm(document.saveForm.apply_amt);
				break;
			}
		}
	} */
	
	function findEmployeeNoPost(empl_no, empl_nm) {
		document.saveForm.loan_no.value = '';
		document.saveForm.empl_no.value = empl_no;
		document.saveForm.empl_nm.value = empl_nm;
		ajaxReplaceForm("lon01003_edit.do", "#saveForm", "#divFrame");
	}
	
	function changeColumn(object_nm, val) {
		if(object_nm == 'loan_amt') {
			if(parseInt(document.saveForm.refund_cnt.value) > 0 && parseInt(document.saveForm.loan_amt.value) >= 0) {
				if(document.saveForm.refund_method.value == '20'){
					var loan_amt = parseInt(document.saveForm.loan_amt.value.replace(/,/g, ""));
					var intr_rate = parseInt(document.saveForm.intr_rate.value*100) / 10000;
					var refund_cnt = parseInt(document.saveForm.refund_cnt.value);
					document.saveForm.unit_amt.value = parseInt((loan_amt*(intr_rate/12)*Math.pow((1+intr_rate/12),refund_cnt))/(Math.pow((1+intr_rate/12),refund_cnt)-1));	
				}else{
					document.saveForm.unit_amt.value = (parseInt(val) / parseInt(document.saveForm.refund_cnt.value)).toFixed(0);		
				}
				formatMaskElm(document.saveForm.unit_amt);
			}
		}else if(object_nm == 'loan_ymd') {
			if(parseInt(document.saveForm.defer_year.value) >= 0) {
				document.saveForm.defer_end_ymd.value = shiftTime(val+'000', parseInt(document.saveForm.defer_year.value), 0, -1, 0).substring(0,8);
				formatMaskElm(document.saveForm.defer_end_ymd);
			}else {
				document.saveForm.defer_end_ymd.value = '';
			}
		}else if(object_nm == 'defer_year') {
			changeColumn('loan_ymd', document.saveForm.loan_ymd.value.replace(/-/g, ""));
		}else if(object_nm == 'refund_year') {
			if(parseInt(document.saveForm.refund_year.value) > 0) {
				document.saveForm.refund_cnt.value = parseInt(val) * 12;
				changeColumn('refund_cnt', document.saveForm.refund_cnt.value);
			}else {
				document.saveForm.refund_cnt.value = '';
			}
		}else if(object_nm == 'refund_cnt') {
			changeColumn('loan_amt', document.saveForm.loan_amt.value.replace(/,/g, ""));
		}
	}

	$(function() {
		var property = '<%=uSesEnt.use_auth.startsWith("S") && pro_status.equals("30") ? "required" : "readonly"%>';
		var visible = '<%=uSesEnt.use_auth.startsWith("S") && pro_status.equals("30") ? "" : "none"%>';
		changeObjectProperty(document.saveForm.defer_year, property, false);
		changeObjectProperty(document.saveForm.refund_year, property, false);
		changeObjectProperty(document.saveForm.refund_cnt, property, false);
		changeObjectProperty(document.saveForm.defer_end_ymd, property, false);
		changeObjectProperty(document.saveForm.unit_amt, property, false);
		changeObjectProperty(document.saveForm.intr_rate, property, false);
		document.getElementById('imgDeferEndYmd').style.display = visible;
	});
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType">
<input type="hidden" name="loan_no" 	value="<%=box.get("loan_no")%>">
<input type="hidden" name="finish_flag" value="<%=obox.get("finish_flag")%>">
<input type="hidden" name="sign_status" value="<%=obox.get("sign_status")%>">
<input type="hidden" name="refund_method" value="">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
		<% if(uSesEnt.use_auth.startsWith("S") && box.get("loan_no").equals("")) { %>
			<tr>
				<th>사원선택</th>
				<td colspan="3">
					<div class="input-group input-medium">
						<input type="text" name="empl_nm" value="<%=obox.get("empl_nm",Box.SPECIAL_CHAR)%>" class="form-control" style="width:90px;"readOnly>
						<span class="input-group-btn"><button type="button" class="btn dark" onClick="findEmployeeNo('')"><i class="fa fa-search"></i></button></span>
					</div>
				</td>
			</tr>
		<% } %>
			<tr>
				<th>사번/성명</th>
				<td><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
					<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><%=obox.get("empl_nm")%></a>
					<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
				</td>
				<th>부서</th>
				<td><%=obox.get("dept_nm")%></td>
			</tr>
			<tr>
				<th width="15%">주민번호</th>
				<td width="35%"><%=FormatUtil.juminNo(obox.get("reside_no"),"x")%></td>
				<th width="15%">직위</th>
				<td width="35%"><%=obox.get("position_nm")%></td>
			</tr>
			<tr>
				<th>입사일자</th>
				<td><%=obox.get("entry_ymd",Box.DEF_DATE_FMT)%></td>
				<th>사원구분</th>
				<td><%=obox.get("empl_class_nm")%></td>
			</tr>
		</table>
	</div>
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th>대부종류</th>
				<td colspan="3">
				<% if(pro_status.equals("10")) { %>	
					<select name="bugt_cd" title="대부종류" class="form-control required" style="width:150px" onchange="goChange(this.value)">
						<option value=''>선택</option>
			            <%=CodeUtil.optList("PR_BUDTB_CODE01_LIST","LISTCODE",obox.get("bugt_cd"),"1","L","","","",uSesEnt.dbo)%>
					</select>
				<% }else { %>
					<%=obox.get("bugt_nm")%>
					<input type="hidden" name="bugt_cd" value="<%=obox.get("bugt_cd")%>">
				<% } %>	
				</td>
			</tr>
			<tr>
				<th width="15%">신청일자</th>
				<td width="35%" nowrap>
				<% if(pro_status.equals("10")) { %>	
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="apply_ymd" name="apply_ymd" value="<%=box.get("loan_no").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("apply_ymd")%>" maxlength="8" title="신청일자" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				<% }else { %>
					<%=obox.get("apply_ymd",Box.DEF_DATE_FMT)%>	
					<input type="hidden" name="apply_ymd" value="<%=obox.get("apply_ymd")%>">
				<% } %>	
				</td>
				<th width="15%"><%if(obox.getInt("sign_status") > 1 && !obox.get("sign_status").equals("4")){%>대부일자<%}else{%>대부요청일<%}%></th>
				<td width="35%">
				<% if(pro_status.compareTo("30") <= 0) { %>	
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="loan_ymd" name="loan_ymd" value="<%=obox.get("loan_ymd").equals("") ? DateUtil.toString("yyyyMMdd") : obox.get("loan_ymd")%>" maxlength="8" title="대부일자" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				<% }else { %>
					<%=obox.get("loan_ymd",Box.DEF_DATE_FMT)%>	
					<input type="hidden" name="loan_ymd" value="<%=obox.get("loan_ymd")%>">
				<% } %>	
				</td>
			</tr>
			<tr>
				<th>대부금액</th>
				<td colspan="3">
				<% if(pro_status.equals("10")) { %>	
					<input type="text" name="loan_amt" value="<%=obox.get("loan_amt")%>" title="대부금액"  class="form-control required tMONEY" style="width:90px;" onChange="goChange(document.saveForm.bugt_cd.value)"> 원
				<% }else { %>
					<%=obox.get("loan_amt",Box.THOUSAND_COMMA)%> 원
					<input type="hidden" name="loan_amt" value="<%=obox.get("loan_amt")%>">
				<% } %>	
				</td>
			</tr>
			<tr>
				<th>대부용도</th>
				<td colspan="3">
				<% if(pro_status.equals("10")) { %>		
					<input type="text" name="loan_usage" value="<%=obox.get("loan_usage")%>" maxlength="100" title="대부용도"  class="form-control required" style="width:250px;ime-mode:active">
				<% }else { %>
					<%=obox.get("loan_usage")%>	
					<input type="hidden" name="loan_usage" value="<%=obox.get("loan_usage")%>">
				<% } %>	
				</td>
			</tr>
			<tr>
				<th>상환방법</th>
				<td colspan="3" nowrap>
				<% if(pro_status.compareTo("30") <= 0) { %>	
					<input type="text" name="defer_year" value="<%=obox.get("defer_year")%>" maxlength="2" title="거치년수"  class="form-control tMONEY" style="width:30px" onChange="changeColumn('defer_year', this.value)"> 년 거치
					<input type="text" name="refund_year" value="<%=obox.get("refund_year")%>" maxlength="2" title="상환년수"  class="form-control tMONEY" style="width:30px" onChange="changeColumn('refund_year', this.value)"> 년 상환
					(상환횟수 : <input type="text" name="refund_cnt" value="<%=obox.get("refund_cnt")%>" maxlength="3" title="상환회수"  class="form-control tMONEY" style="width:40px" onChange="changeColumn('refund_cnt', this.value)"> 회)
				<% }else { %>
					<%=FormatUtil.nvl2(obox.get("defer_year"),"__")%> 년 거치 &nbsp;<%=FormatUtil.nvl2(obox.get("refund_year"),"__")%> 년 상환(상환횟수 : <%=FormatUtil.nvl2(obox.get("refund_cnt"),"__")%> 회)
					<input type="hidden" name="defer_year" value="<%=obox.get("defer_year")%>">
					<input type="hidden" name="refund_year" value="<%=obox.get("refund_year")%>">
					<input type="hidden" name="refund_cnt" value="<%=obox.get("refund_cnt")%>">
				<% } %>	
				</td>
			</tr>
			<tr>
				<th>거치만료일</th>
				<td nowrap>
				<% if(pro_status.compareTo("30") <= 0) { %>	
					<div id="imgDeferEndYmd" class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="defer_end_ymd" name="defer_end_ymd" value="<%=obox.get("defer_end_ymd")%>" maxlength="8" title="거치만료일" class="form-control tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				<% }else { %>
					<%=obox.get("defer_end_ymd",Box.DEF_DATE_FMT)%>	
					<input type="hidden" name="defer_end_ymd" value="<%=obox.get("defer_end_ymd")%>">
				<% } %>	
				</td>
				<th>1회상환금액</th>
				<td nowrap>
				<% if(pro_status.compareTo("30") <= 0) { %>	
					<input type="text" name="unit_amt" value="<%=obox.get("unit_amt")%>" maxlength="15" title="1회상환금액"  class="form-control tMONEY" style="width:90px;"> 원
				<% }else { %>
					<%=obox.get("unit_amt",Box.THOUSAND_COMMA)%> 원
					<input type="hidden" name="unit_amt" value="<%=obox.get("unit_amt")%>">
				<% } %>	
				</td>
			</tr>
			<tr>
				<th>이자율</th>
				<td colspan="3">
				<% if(pro_status.compareTo("30") <= 0) { %>	
					<input type="text" name="intr_rate" value="<%=obox.get("intr_rate")%>" title="이자율"  class="form-control tFMONEY" style="width:50px"> %
				<% }else { %>
					<%=obox.get("intr_rate")%> %
					<input type="hidden" name="intr_rate" value="<%=obox.get("intr_rate")%>">
				<% } %>	
				</td>
			</tr>
		<% if(pro_status.compareTo("30") >= 0) { %>
			<tr>
				<th>대부잔액</th>
				<td><%if(!obox.get("remain_amt").equals("")){%><%=obox.get("remain_amt",Box.THOUSAND_COMMA)%> 원<%}%></td>
				<th>최종상환일</th>
				<td><%=obox.get("refund_ymd",Box.DEF_DATE_FMT)%></td>
			</tr>
		<% } %>
			<tr>
				<th>계좌번호</th>
				<td colspan="3">
				<% if(pro_status.equals("10")) { %>	
					<select name="bank_cd" class="bs-select form-control required" title="금융기관" style="width:150px">
						<option value=''>:: 금융기관 선택 ::</option>
			            <%=CodeUtil.optList(codeWp, "bank_cd", obox.get("bank_cd"))%>
					</select>
					<input type="text" name="account_no" value="<%=obox.get("account_no")%>" title="계좌번호" class="form-control required" style="width:120px">&nbsp;예금주&nbsp;:&nbsp;
					<input type="text" name="account_owner" value="<%=obox.get("account_owner")%>" maxlength="15" title="예금주" class="form-control required" style="width:90px">
				<% }else { %>
					<%=obox.get("bank_nm")%> <%=obox.get("account_no")%> (예금주 : <%=obox.get("account_owner")%>)
					<input type="hidden" name="bank_cd" value="<%=obox.get("bank_cd")%>">
					<input type="hidden" name="account_no" value="<%=obox.get("account_no")%>">
					<input type="hidden" name="account_owner" value="<%=obox.get("account_owner")%>">
				<% } %>	
				</td>
			</tr>
			<tr>
				<th>비고</th>
				<td colspan="3"><input type="text" name="etc_remark" value="<%=obox.get("etc_remark")%>" maxlength="120" title="비고" class="form-control" style="border:ime-mode:active"></td>
			</tr>
		<% if(!box.get("loan_no").equals("")) { %>
	  		<tr>
				<th>전표번호</th>
				<td>
					<%if(!obox.get("slip_no").equals("")){%>&nbsp;
						<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
					<%}%>
					<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
					<input type="hidden" name="slip_status" value="<%=obox.get("slip_status")%>">
				</td>
				<th>결재상태</th>
				<td><b><font color=red><%=obox.get("pro_status_nm")%></font></b></td>
	  		</tr>
		<% } %>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
			<%if(!box.get("loan_no").equals("")){%>
				<button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_refresh_edit.png">취소</button>
			<% } %>
			</span>
		</span>
	</div>
</form>
