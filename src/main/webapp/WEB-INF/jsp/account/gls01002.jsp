<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 고유목적사업준비금 회계처리 -->

<script language="javascript">
 	function goSave() {
		var biz_flag = $("input:radio[name=biz_flag]:checked").val();
		var basis_law = $("input:radio[name=basis_law]:checked").val();
		var flag_law = biz_flag+basis_law;
		if(formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
		 		if(flag_law == "A1" || flag_law == "A2") {
					document.saveForm.slip_ymd.value = document.saveForm.slip_ymd1.value
		 		}else {
					document.saveForm.slip_ymd.value = document.saveForm.slip_ymd2.value
		 		}
		 		document.saveForm.search_key.value = flag_law;
				ajaxSubmitForm("gls01002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						alert('전표가 생성되었습니다.');
						$('#dialog-form').modal('hide');
						returnFormSubmit(document.saveForm, 'gls01001_list.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function changeFlag() {
		var biz_flag = $("input:radio[name=biz_flag]:checked").val();
		var basis_law = $("input:radio[name=basis_law]:checked").val();
		var flag_law = biz_flag+basis_law;
 		if(flag_law == "A1" || flag_law == "A2") {
			$('#mojeok_setting').show();
			$('#mojeok_inout1').hide();
			$('#slip_ymd2').removeClass("required");
			$('#cha_slip_amt').removeClass("required");
			$('#mojeok_inout2').hide();
			$('#mojeok_inout3').hide();
			$('#dae_acct_cd').removeClass("required");
			$('#account_no').removeClass("required");
		}else if(flag_law == "B1"){
			$('#mojeok_setting').hide();
			$('#slip_ymd1').removeClass("required");
			$('#slip_amt').removeClass("required");
			$('#mojeok_inout1').show();
			$('#slip_ymd2').addClass("required");
			$('#cha_slip_amt').addClass("required");
			$('#mojeok_inout2').show();
			$('#mojeok_inout3').show();
			$('#dae_acct_cd').addClass("required");
			$('#account_no').addClass("required");
		}else if(flag_law == "B2"){
			$('#mojeok_setting').hide();
			$('#slip_ymd1').removeClass("required");
			$('#slip_amt').removeClass("required");
			$('#mojeok_inout1').show();
			$('#slip_ymd2').addClass("required");
			$('#cha_slip_amt').addClass("required");
			$('#mojeok_inout2').hide();
			$('#mojeok_inout3').show();
			$('#dae_acct_cd').addClass("required");
			$('#account_no').addClass("required");
		}
	}
	
	function changeAcctCd(acct_cd) {
		document.saveForm.account_no.options.length=0;
		if(acct_cd != '') {
			setOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.saveForm.account_no, '', acct_cd, '', '', '', '', ':: 계좌번호 선택 ::');
		}
	}
	
	function changeSlipAmt() {
		document.saveForm.dae_slip_amt.value = parseInt2(document.saveForm.cha_slip_amt) - parseInt2(document.saveForm.tax_slip_amt)
		formatMaskElm(document.saveForm.dae_slip_amt);
	}

	function goTaxDetail() {
		var params = '&start_ymd='+$("#slip_ymd").val().substring(0,4)+'0101'
				   + '&end_ymd='+$("#slip_ymd").val().substring(0,4)+'1231'
				   + '&acc_unit=20&acct_cd=1110901&acct_nm=선급법인세&select_yn=Y&popup_yn=Y';
		popupOpen("/account/pd/rpt01001_list.do?1=1"+encodeURI(params), "acctCode", 1200, 830);
	}
</script>

<div class="modal-dialog">
	<div class="modal-content" style="width:600px">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">고유목적사업준비금 설정/전출입</h4>
		</div>
		<div class="modal-body">
			<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="search_key" 	value="">
			<input type="hidden" id="slip_ymd" name="slip_ymd" value="">
			<table class="table table-bordered">
				<colgroup>
					<col style="width:18%;"/>
					<col style="width:25%;"/>
					<col style="width:18%;"/>
					<col style="width:39%;"/>
				</colgroup>
				<tbody>
					<tr>
						<th>구분</th>
						<td colspan="3" class="t-left">
							<label class="mt-radio mt-radio-outline">
								<input type="radio" name="biz_flag" value="A" <%=box.get("biz_flag").equals("A")?"checked":""%> style="border:none" onClick="changeFlag()"><%if(box.get("biz_flag").equals("A")){%><font color=red><b><%}%>고유목적사업준비금 설정<%if(box.get("biz_flag").equals("A")){%></font></b><%}%>&nbsp;&nbsp;<span></span>
							</label>
							<label class="mt-radio mt-radio-outline">
								<input type="radio" name="biz_flag" value="B" <%=box.get("biz_flag").equals("B")?"checked":""%> style="border:none" onClick="changeFlag()"><%if(box.get("biz_flag").equals("B")){%><font color=red><b><%}%>고유목적사업준비금 전출입(구분경리)<%if(box.get("biz_flag").equals("B")){%></font></b><%}%><span></span>
							</label>
						</td>
					</tr>
					<tr>
						<th>준비금유형</th>
						<td colspan="3" class="t-left">
							<label class="mt-radio mt-radio-outline">
								<input type="radio" name="basis_law" value="1" <%=box.get("basis_law").equals("1")?"checked":""%> style="border:none" onClick="changeFlag()"><%if(box.get("basis_law").equals("1")){%><font color=red><b><%}%>법인세법(준비금1)<%if(box.get("basis_law").equals("1")){%></font></b><%}%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span></span>
							</label>
							<label class="mt-radio mt-radio-outline">
								<input type="radio" name="basis_law" value="2" <%=box.get("basis_law").equals("2")?"checked":""%> style="border:none" onClick="changeFlag()"><%if(box.get("basis_law").equals("2")){%><font color=red><b><%}%>근로복지기본법(준비금2)<%if(box.get("basis_law").equals("2")){%></font></b><%}%><span></span>
							</label>
						</td>
					</tr>
					<tr id="mojeok_setting">
						<th>설정일자</th>
						<td>
							<div class="form-inline t-left">
								<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="slip_ymd1" name="slip_ymd1" value="<%=DateUtil.toString("yyyyMMdd")%>" maxlength="8" title="설정일자" class="form-control required tYMD">
									<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
								</div>
							</div>
						</td>
						<th>고유목적사업<br>준비금</th>
						<td>
							<div class="form-inline t-left">
								<input type="text" id="slip_amt" name="slip_amt" value="" style="width:90px" class="form-control required tMONEY" title="금액" style="border:1 solid gray"> 원
							</div>
						</td>
					</tr>
					<tr id="mojeok_inout1" style="display:none">
						<th>전출입일자</th>
						<td>
							<div class="form-inline t-left">
								<div>
									<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
										<input type="text" id="slip_ymd2" name="slip_ymd2" value="<%=DateUtil.toString("yyyyMMdd")%>" maxlength="8" title="전출입일자" class="form-control tYMD">
										<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
									</div>
								</div>
							</div>
						</td>
						<th>고유목적사업<br>준비금</th>
						<td>
							<div class="form-inline t-left">
								<input type="text" id="cha_slip_amt" name="cha_slip_amt" value="" class="form-control tMONEY" title="고유목적사업준비금" style="width:90px" onChange="changeSlipAmt()"> 원
							</div>
						</td>
					</tr>	
					<tr id="mojeok_inout2" style="display:none">
						<th>전출액</th>
						<td>
							<div class="form-inline t-left">
								<input type="text" name="dae_slip_amt" value="" style="width:90px" class="bs-select form-control tMONEY" title="금액" readOnly> 원
							</div>
						</td>
						<th>선급법인세 <a href="javascript:goTaxDetail();"><img id="imgHelp" src="/com/img/icon_help_01.gif" border="0" align="absmiddle" alt="보조부 검색"></a></th>
						<td>
							<div class="form-inline t-left">
								<input type="text" name="tax_slip_amt" value="" style="width:90px" class="form-control tMONEY" title="선급법인세" onChange="changeSlipAmt()"> 원
							    (세율 : <input type="text" name="tax_rate" value="14" style="width:30px" class="form-control tFMONEY" title="세율"> %)
							</div>
						</td>
					</tr>	
					<tr id="mojeok_inout3" style="display:none">
						<th>입출금계정</th>
						<td colspan="3">
							<div class="form-inline t-left">
								<select id="dae_acct_cd" name="dae_acct_cd" title="입출금계정과목" style="width:44%" class="bs-select" onChange="changeAcctCd(this.value)">
									<option value=''>:: 입출금 계정과목 선택 ::</option>
						            <option value="1110103">보통예금</option> 
									<option value="1110105">기업자유예금</option>
									<option value="1110107">MMF</option>
									<option value="1110108">RP</option>
								</select>
								<select id="account_no" name="account_no" title="계좌번호" style="width:55%" class="bs-select">
									<option value=''>:: 계좌번호 선택 ::</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>적요</th>
						<td colspan="3">
							<input type="text" name="etc_remark" value="" size="50" maxlength="50" style="width:100%" class="form-control required" title="적요" style="border:1 solid gray;ime-mode:active">
						</td>	
					</tr>
				</tbody>
			</table>
			</form>
			
			<div class="table-bottom-control">
				<div class="form-inline f-right">
					<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
					<button type="button" class="btn dark" onClick="$('button.close').trigger('click');"><img src="/com/img/ico_btn_cancel.png">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>

	