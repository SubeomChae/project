<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 대부금 일시상환 -->
<script language="javascript">
	function goSave() {
		if(formValidate("#saveForm")) {
			var refund_amt = document.saveForm.refund_amt.value.replace(/,/g, "");
			if(parseInt(refund_amt) > parseInt(document.saveForm.remain_amt.value)) {
				alert('상환원금이 대부잔액을 초과할 수 없습니다.');
				document.saveForm.refund_amt.focus();
				return;
			}
			
			var gongje_cnt = parseInt(refund_amt) / <%=obox.getInt("unit_amt")%>;
			document.saveForm.gongje_cnt.value = parseInt(gongje_cnt);
			if(document.saveForm.refund_flag.value == '2') {
				if(parseInt(refund_amt) == parseInt(document.saveForm.remain_amt.value)) {
					alert('대부잔액 전부를 상환하는 경우에는 상환구분을 [중도상환]을 선택하시기 바랍니다.');
					document.saveForm.refund_flag.focus();
					return;
				}
				
				if((gongje_cnt - parseInt(gongje_cnt)) != 0) {
					//alert('일부상환은 1회 상환금액(<%=obox.get("unit_amt",Box.THOUSAND_COMMA)%>원)의 배수로만 입력이 가능합니다.');
					//document.main.refund_amt.focus();
					//return;
				}
			}
			
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("lon12002_update.do","#saveForm", function(rtn) {
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
			
	function goDelete(refund_seq, slip_no) {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#saveForm");
			document.saveForm.slip_no.value = slip_no;
			ajaxSubmitForm("lon12002_delete.do?refund_seq="+refund_seq,"#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					goSearch(document.saveForm.loan_no.value);
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goTabpage(tab_index) {
		document.viewForm.tab_index.value = tab_index;
		
		$("#loanTabMenu li").removeClass('active');
		$("#loanTabMenu #tabMenu"+tab_index).addClass('active');
		if(tab_index == 1) {
			$('#divArea1').show();
			$('#divArea2').hide();
			$('#btnSave').hide();
			fixTableHeader("MyTable1");
		}else {
			$('#divArea1').hide();
			$('#divArea2').show();
			$('#btnSave').show();
		}
	}
	
	function changeRefundFlag(refund_flag) {
		if(refund_flag == '2') {
			changeObjectProperty(document.saveForm.refund_amt, 'required', false);
			changeObjectProperty(document.saveForm.intr_amt, 'enabled', false);
			document.getElementById("spanIntrCalcYn").style.display = '';
		}else {
			document.saveForm.refund_amt.value = document.saveForm.remain_amt.value;
			formatMaskElm(document.saveForm.refund_amt);
			changeObjectProperty(document.saveForm.refund_amt, 'readonly', false);
			changeObjectProperty(document.saveForm.intr_amt, 'enabled', false);
		}
		
		document.saveForm.intr_calc_yn.checked = true;
		if(!isEmpty(document.saveForm.refund_ymd)) {
			calcIntrAmt();
		}
	}
	
	function changeRefundYmd() {
		if(!isEmpty(document.saveForm.refund_ymd)) {
			if(document.saveForm.refund_ymd.value.replace(/-/g, "") < document.saveForm.start_ymd.value.replace(/-/g, "")) {
				alert('상환일자는 마지막 이자기산일보다 이후이어야 합니다.');
				document.saveForm.refund_ymd.value = '';
				return;
			}
			calcIntrAmt();
		}
	}
	
	function calcIntrAmt() {
		var intr_ilsu = 0;
		var intr_amt = 0;
		if(document.saveForm.intr_calc_yn.checked) {
			document.saveForm.start_ymd.value = document.saveForm.intr_base_ymd.value;
			document.saveForm.end_ymd.value = document.saveForm.refund_ymd.value.replace(/-/g, "");
			intr_ilsu = getDayInterval(document.saveForm.start_ymd.value.replace(/-/g,""), document.saveForm.end_ymd.value.replace(/-/g,""));
			intr_amt = Math.floor((parseFloat(document.saveForm.remain_amt.value) * <%=obox.getFloat("intr_rate")%> / 100.0) * (parseFloat(intr_ilsu) / 365.0)); 
		}else {
			document.saveForm.start_ymd.value = '';
			document.saveForm.end_ymd.value = '';
		}
		setTotAmt();
		document.saveForm.intr_ilsu.value = intr_ilsu;
		document.saveForm.intr_amt.value = intr_amt;
		formatMaskElm(document.saveForm.start_ymd);
		formatMaskElm(document.saveForm.end_ymd);
		formatMaskElm(document.saveForm.intr_ilsu);
		formatMaskElm(document.saveForm.intr_amt);
	}
	
	function setTotAmt() {
		document.saveForm.tot_amt.value = parseInt2(document.saveForm.refund_amt) + parseInt2(document.saveForm.intr_amt);
		formatMaskElm(document.saveForm.tot_amt);
	}

	function goSign(subject, search_key, etc_remark, refund_ymd, refund_amt, intr_amt) {
		document.signForm.subject.value = subject;
		document.signForm.search_key.value = search_key;
		document.signForm.etc_remark.value = etc_remark;
		document.signForm.refund_ymd.value = refund_ymd;
		document.signForm.refund_amt.value = refund_amt;
		document.signForm.intr_amt.value = intr_amt;
		goSignRequest(document.signForm);
	}
	
	function changeAcctCd(acct_cd) {
		document.saveForm.account_no.options.length=0;
		if(acct_cd != '') {
			setOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.saveForm.account_no, '', acct_cd, '', '', '', '', ':: 계좌번호 선택 ::');
		}
	}
	
	function signRequestPost() {
		goSearch(document.saveForm.loan_no.value);
	}

	$(function() {
		fixTableHeader("MyTable1");
		goTabpage('1');
	});
</script>

<form id="viewForm" name="viewForm" method="post" action="" class="fType">
<input type="hidden" name="loan_no" 	value="<%=box.get("loan_no")%>">
<input type="hidden" name="tab_index"	value="<%=FormatUtil.nvl2(box.get("tab_index"),"1")%>">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="popup_yn" 	value="<%=box.get("popup_yn")%>">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr height="28">
				<th width="15%">사번/성명</th>
				<td width="35%"><%=obox.get("empl_no")%>&nbsp;&nbsp;&nbsp;
					<a href="javascript:goEmployeePop('<%=obox.get("empl_no")%>')"><%=obox.get("empl_nm")%></a>
					<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
				</td>
				<th width="15%">대부종류</th>
				<td width="35%">
					<a href="javascript:go_loan_detail('<%=obox.get("loan_no")%>')"><%=obox.get("bugt_nm")%></a>
				</td>
			</tr>
			<tr height="28">
				<th>대부일자</th>
				<td><%=obox.get("loan_ymd",Box.DEF_DATE_FMT)%></td>
				<th>대부금액</th>
				<td><%=obox.get("loan_amt",Box.THOUSAND_COMMA)%> 원</td>
			</tr>
			<tr height="28">
				<th>최종상환일</th>
				<td><%=obox.get("last_refund_ymd",Box.DEF_DATE_FMT)%></td>
				<th>대부잔액</th>
				<td><%if(!obox.get("remain_amt").equals("")){%><%=obox.get("remain_amt",Box.THOUSAND_COMMA)%> 원<%}%></td>
			</tr>
		</table>
	</div>
	<ul id="loanTabMenu" class="nav nav-tabs">
		<li class="active">
			<li id="tabMenu1" onClick="goTabpage('1')"><a data-toggle="tab">대부금 상환내역</a></li>
			<li id="tabMenu2" onClick="goTabpage('2')"><a data-toggle="tab">대부금 상환등록</a></li>
		</li>
	</ul>	
	<div id="divArea1" class="table-scrollable scrollOptionY" style="height:calc(100vh - 277px)">
		<table id="MyTable1" class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
					<th width="30px">No</th>
					<th width="50px">구분</th>
					<th width="85px">상환일자</th>
					<th width="80px">원금상환</th>
					<th width="80px">이자상환</th>
					<th width="80px">대부잔액</th>
					<th width="85px">이자기산일</th>
					<th width="80px">전표번호</th>
					<th width="80px">문서번호</th>
					<th width="100px">결재상태</th>
					<th width="*">비고</th>
					<th width="30px"></th>
				</tr> 
			</thead>
			<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="12" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
	   	   		for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>"> 
					<td class="t-center"><%=String.valueOf(i+1)%></td>
					<td class="t-center"><%=rsWp.get("refund_flag_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("refund_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-right"><%=rsWp.get("refund_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=rsWp.get("intr_amt",i,Box.THOUSAND_COMMA)%></td>
					<td class="t-right"><%=FormatUtil.insertComma(String.valueOf(obox.getLong("loan_amt")-rsWp.getLong("refund_sum",i)))%></td>
					<td class="t-center"><%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center">
						<%if(!rsWp.get("slip_no",i).equals("")){%>
							<a href="javascript:goSlipViewer('&slip_no=<%=rsWp.get("slip_no",i)%>');"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></a>
						<%}%>
					</td>
					<td class="t-center">
						<%if(!rsWp.get("msg_no",i).equals("")){%>
							<a href="javascript:goDocuViewer('<%=rsWp.get("msg_no",i)%>');"><%=FormatUtil.msgNo(rsWp.get("msg_no",i))%></a>
						<%}%>
					</td>
					<td class="t-center"><%=rsWp.get("sign_status_nm",i)%>
					<% if(!rsWp.get("refund_flag",i).equals("1") && rsWp.get("sign_status",i).equals("1")) { %>
						<br><button type="button" class="btn btn-primary btn-table" onClick="goSign('<%=obox.get("bugt_nm")%> <%=rsWp.get("refund_flag_nm",i)%>상환(<%=obox.get("empl_nm")%>)','ACCTB_SLIP01|<%=rsWp.get("slip_no",i)%>|L22|<%=obox.get("loan_no")%>|<%=rsWp.get("refund_seq",i)%>','<%=StringUtil.replace(rsWp.get("etc_remark",i),"'","")%>','<%=rsWp.get("refund_ymd",i,Box.DEF_DATE_FMT)%>','<%=rsWp.get("refund_amt",i,Box.THOUSAND_COMMA)%>','<%=rsWp.get("intr_amt",i,Box.THOUSAND_COMMA)%>')">기안문작성</button>
					<% } %>
					</td>
					<td><%=rsWp.get("etc_remark",i)%></td>
					<td class="t-center">
					<% if(!rsWp.get("refund_flag",i).equals("1") && !rsWp.get("sign_status",i).equals("2") && !rsWp.get("sign_status",i).equals("3")) { %>
						<a href="javascript:goDelete('<%=rsWp.get("refund_seq",i)%>','<%=rsWp.get("slip_no",i)%>')"><img src="/com/img/icon_tresh.png"></a>
					<% } %>
					</td>
				</tr>
				<% } %>
			<% } %>
			</tbody>
		</table>
	</div>
</form>

<form id="saveForm" name="saveForm" method="post" action="" class="fType">
<input type="hidden" name="remain_amt" 		value="<%=obox.get("remain_amt")%>">
<input type="hidden" name="intr_base_ymd"  	value="<%=obox.get("intr_base_ymd")%>">
<input type="hidden" name="loan_no" 		value="<%=box.get("loan_no")%>">
<input type="hidden" name="gongje_cnt"  	value="">
<input type="hidden" name="slip_no" 		value="">
<input type="hidden" name="sign_status" 	value="">

	<div id="divArea2" class="table-scrollable scrollOptionY" style="display:none">
		<table id="MyTable2" class="table table-view table-bordered">
			<tr>
				<th>상환구분</th>
				<td>
					<select name="refund_flag"title="상환구분" class="bs-select form-control required" style="width:100px" onChange="changeRefundFlag(this.value)">
						<option value=''>선택</option>
						<option value='2'>일부상환</option>
						<option value='3'>중도상환</option>
						<option value='4'>퇴직상환</option>
					</select>
				</td>
         	</tr> 
			<tr>
				<th>상환일자</th>
				<td>
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="refund_ymd" name="refund_ymd" value="" maxlength="8" title="상환일자" class="form-control required tYMD" onChange="changeRefundYmd()">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
         	</tr> 
			<tr>
				<th width="16%">상환금액</th>
				<td width="84%" nowrap>
					<b>원금</b> <input type="text" name="refund_amt" value="" title="원금" class="form-control tMONEY" style="width:90px" readOnly onChange="setTotAmt()"> +
					<b>이자</b> <input type="text" name="intr_amt" value="" title="이자" class="form-control tMONEY" style="width:90px" readOnly onChange="setTotAmt()">
					= <input type="text" name="tot_amt" value="" title="합계" class="form-control tMONEY" style="width:100px" readOnly> 원
				</td>
         	</tr> 
			<tr>
				<th>이자기산일</th>
				<td nowrap>
					<div class="form-inline">
						<input type="text" name="start_ymd" value="" maxlength="8" title="기산일(부터)" class="form-control tYMD" style="width:80px" readOnly> ~ 
						<input type="text" name="end_ymd" value="" maxlength="8" title="기산일(까지)" class="form-control tYMD" style="width:80px" readOnly>
						(일수 : <input type="text" name="intr_ilsu" maxlength="4" value="" title="일수" class="form-control tNUM" style="width:40px" readOnly>)&nbsp;
						<span id="spanIntrCalcYn">
							<label class="mt-checkbox mt-checkbox-outline">
								<input type="checkbox" name="intr_calc_yn" value="Y" onClick="calcIntrAmt();">이자계산<span/>
							</label>
						</span>
					</div>
				</td>
         	</tr> 
			<tr>
				<th>입금방법</th>
				<td nowrap>
					<select name="cha_acct_cd" title="입금계정" class="bs-select form-control required" style="width:120px" onChange="changeAcctCd(this.value);">
						<option value=''>:: 입금계정 ::</option>
						<option value='1110103'>보통예금</option>
						<option value='1110105'>기업자유예금</option>
					</select>
					<select name="account_no" title="계좌번호" class="bs-select form-control required" style="width:200px">
						<option value=''>:: 계좌번호 선택 ::</option>
					</select>
				</td>
         	</tr> 
			<tr>
				<th>비고</th>
				<td><input type="text" name="etc_remark" value="" maxlength="60" title="비고" class="form-control" style="width:99%;ime-mode:active"></td>
         	</tr> 
		</table>
	</div>
</form>

	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button id="btnSave" type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
			</span>
		</span>
	</div>
	

<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="">
<input type="hidden" name="msg_type" 		value="SLP007">
<input type="hidden" name="search_key" 		value="">
<input type="hidden" name="etc_remark" 		value="">
<input type="hidden" name="refund_ymd" 		value="">
<input type="hidden" name="refund_amt" 		value="">
<input type="hidden" name="intr_amt" 		value="">
<input type="hidden" name="nextUrl" 		value="">
</form>
