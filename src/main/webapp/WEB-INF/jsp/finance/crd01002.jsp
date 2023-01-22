<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 법인(복지)카드관리 -->

<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("crd01002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch(document.saveForm.card_no.value);
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}		
	}

	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("crd01002_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function changeUseYn(use_yn) {
		if(use_yn == 'N'){
			$('#close_ymd').show();
		}else {
			$('#close_ymd').hide();
		}
		changeObjectProperty(document.saveForm.close_ymd, use_yn == 'N' ? 'required' : 'readonly');
	}
	
	$(function() {
		changeUseYn('<%=obox.get("use_yn")%>');
	});
</script>

<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="card_type"	value="<%=box.get("card_type")%>">
<input type="hidden" name="action_type"	value="<%=box.get("card_no").equals("")?"INSERT":"UPDATE"%>">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th>카드번호</th>
				<td colspan="3">
				<% if(box.get("card_no").equals("")) { %>
					<input type="text" name="card_no" value="<%=obox.get("card_no")%>" maxlength="16" class="form-control required tCARD" title="카드번호" style="width:180px;"> ('-'없이 16자리로 입력)
				<% }else { %>
					<b><%=obox.get("card_no_x")%></b>
					<input type="hidden" name="card_no" value="<%=obox.get("card_no")%>">
				<% } %>
				</td>
			</tr>
			<tr>
				<th width="18%">카드소지자</th>
				<td width="32%">
					<div class="input-group" style="width:19%">
						<input type="text" name="empl_nm" value="<%=obox.get("empl_nm")%>" title="카드소지자" class="form-control required" style="width:89px;" readOnly>
						<span class="input-group-btn"><button type="button" class="btn dark" onClick="findEmployeeNo('')"><i class="fa fa-search"></i></button></span>
						<input type="hidden" name="empl_no" value="<%=obox.get("empl_no")%>">
					</div>
				</td>
				<th width="18%">발급은행</th>
				<td width="32%">
					<select name="bank_cd" class="bs-select form-control required" title="발급은행" style="width:158px">
						<option value=''>선택</option>
			            <%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("bank_cd"),"bank_cd","","","","A",uSesEnt.dbo)%>
			            
					</select>
				</td>
			</tr>
			<tr>
				<th>발급일자</th>
				<td>
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="open_ymd" value="<%=obox.get("open_ymd")%>" maxlength="8" title="신청일자" class="form-control tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
				<th>유효기간</th>
				<td>
					<select name="finish_yy" title="유효기간(년도)" class="bs-select form-control required" style="width:80px">
		          		<%=DateUtil.getYearOptionTag(obox.get("finish_yy"),"2010",DateUtil.nextYear(10),"desc","년")%>
					</select>&nbsp;
					<select name="finish_mm" title="유효기간(월)" class="bs-select form-control required" style="width:70px">
		          		<%=DateUtil.getMonthOptionTag(obox.get("finish_mm"),"월")%>
					</select>
				</td>
			</tr>
			<tr>
				<th>결제계좌번호</th>
				<td>
					<select name="sign_account_no" class="bs-select form-control required" title="결제계좌번호" style="width:180px">
						<option value=''>선택</option>
			            <%=CodeUtil.optList("PR_FINTB_ACNO01_LIST","LISTCODE",obox.get("sign_account_no"),"1","","11","","",uSesEnt.dbo)%>
					</select>
				</td>
				<th>결제일</th>
				<td>
					<select name="sign_day" title="결제일" class="bs-select form-control required" style="width:80px">
		          		<%=DateUtil.getDayOptionTag(obox.get("sign_day"),"일")%>
					</select>
				</td>
			</tr>
			<tr style="height:80px;">
				<th>비고</th>
				<td colspan="3">
					<textarea name="etc_remark" class="form-control" style="width:100%;height:70px;ime-mode:active;"><%=obox.get("etc_remark")%></textarea>
				</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td>
					<select name="use_yn" class="bs-select form-control" style="width:80px" onChange="changeUseYn(this.value);">
						<option value="Y" <%=obox.get("use_yn").equals("Y")?"selected":""%>>예</option>
						<option value="N" <%=obox.get("use_yn").equals("N")?"selected":""%>>아니오</option>
					</select>		
				</td>
				<th>폐기일자</th>
				<td>
					<div id="close_ymd" class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="close_ymd" value="<%=obox.get("close_ymd")%>" maxlength="8" title="신청일자" class="form-control tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
					<%-- <input type="text" name="close_ymd" value="<%=obox.get("close_ymd")%>" title="폐기일자" size="10" maxlength="8" <%if(obox.get("use_yn").equals("N")){%>style="border:1 solid gray" class="required tYMD"<%}else{%>style="background-color:f6f6f6;border:1 solid gray" class="tYMD" readOnly<%}%>><img src="/com/img/calender_icon.gif" align="absmiddle" border="0" style="cursor:hand" onClick="if(document.saveForm.use_yn.value=='N') Calendar_D(document.saveForm.close_ymd)"> --%>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
			<%if(!box.get("card_no").equals("")){%>
				<button type="button" class="btn dark" onClick="goDelete()"><img src="/com/img/ico_btn_delete.png">삭제</button>
			<% } %>
			</span>
		</span>
	</div>
</form>