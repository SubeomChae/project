<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 계정과목코드 등록/수정화면 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				ajaxSubmitForm("acc01002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						alert('저장되었습니다.');
						goSearch();
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}

	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("acc01002_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					alert('삭제되었습니다.');
					goSearch();
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

	function goCopy() {
		if (formValidate("#form1")) {
			if(confirm('생성하시겠습니까?')) {
				ajaxSubmitForm("acc01002_copy.do","#form1", function(rtn) {
					if(rtn.isOk == "Y") {
						alert('복사되었습니다.');
						goSearch();
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
</script>

<% if(uSesEnt.use_auth.equals("SA")) { %>
<form id="form1" name="form1" method="post" action="" class="fType">
	<table class="table table-view table-bordered table-cover marB5" style="display:<%=box.get("acct_cd").equals("")?"":"none"%>">
		<tr>
			<th width="17%">코드복사</th>
			<td width="*" class="form-inline">
				<div class="input-group">
					<input type="text" name="old_acct_cd" title="계정과목코드" class="form-control required" style="width:90px" readOnly>
					<span class="input-group-btn">
						<button type="button" class="btn dark marR5" onclick="findAccountCode();"><i class="fa fa-search"></i></button>
						<img src="/com/img/bullet_e.gif" border="0" class="absmiddle"><img src="/com/img/bullet_e.gif" border="0" class="absmiddle"><img src="/com/img/bullet_e.gif" border="0" class="absmiddle">
					</span>
					<input type="text" name="new_acct_cd" maxlength="7" title="계정과목코드" class="form-control required marL5" style="width:100px">
					<input type="text" name="new_acct_nm" maxlength="50" title="계정과목명" class="form-control required marL5" style="width:150px">
					<span class="input-group-btn">
						<button type='button' class='btn btn-primary btn-table marL5' onClick="goCopy();">복사</button>
					</span>
				</div>
			</td>
		</tr>
	</table>
</form>
<% } %>
<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="action_type" value="<%=box.get("acct_cd").equals("")?"INSERT":"UPDATE"%>">
	
	<table class="table table-view table-bordered table-cover marB5">
		<tr>
			<th>계정과목코드</th>
			<td colspan="3"><input type="text" name="acct_cd" value="<%=obox.get("acct_cd")%>" maxlength="7" title="계정과목코드" class="form-control required" style="width:40%" <%=box.get("acct_cd").equals("")?"":"readonly"%>></td>
		</tr>
		<tr>
			<th width="17%">계정과목명</th>
			<td width="33%"><input type="text" name="acct_nm" value="<%=obox.get("acct_nm")%>" maxlength="50" title="계정과목명" class="form-control required" onChange="if(isEmpty(document.main.abbr_nm)) document.main.abbr_nm.value=this.value;" style="width:60%"></td>
			<th width="17%">약칭</th>
			<td width="33%"><input type="text" name="abbr_nm" value="<%=obox.get("abbr_nm")%>" maxlength="30" title="계정과목명(약칭)" class="form-control required" style="width:60%"></td>
		</tr>
		<tr>
			<th style="height:100px">계정과목설명</th>
			<td colspan="3"><textarea name="acct_desc" class="form-control" style="height:90px;width:100%"><%=obox.get("acct_desc")%></textarea></td>
		</tr>
		<tr>
			<th>계정과목구분</th>
			<td>
				<select name="acct_class" title="계정과목구분" class="bs-select form-control required" style="width:120px;">
					<option value='1' <%=obox.get("acct_class").equals("1")?"selected":""%>>자산</option>
					<option value='2' <%=obox.get("acct_class").equals("2")?"selected":""%>>부채</option>
					<option value='3' <%=obox.get("acct_class").equals("3")?"selected":""%>>자본</option>
					<option value='6' <%=obox.get("acct_class").equals("6")?"selected":""%>>수익</option>
					<option value='7' <%=obox.get("acct_class").equals("7")?"selected":""%>>비용</option>
				</select>
			</td>
			<th>차대구분</th>
			<td>
				<select name="cd_flag" title="차대구분" class="bs-select form-control required" style="width:120px">
					<option value='1' <%=obox.get("cd_flag").equals("1")?"selected":""%>>차변</option>
					<option value='2' <%=obox.get("cd_flag").equals("2")?"selected":""%>>대변</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>잔액관리</th>
			<td>
				<select name="balance_flag" class="bs-select form-control" style="<%=obox.get("balance_flag").compareTo("1")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("balance_flag").equals("1")?"selected":""%>>차변</option>
					<option value='2' <%=obox.get("balance_flag").equals("2")?"selected":""%>>대변</option>
				</select>
			</td>
			<th>비용귀속부서</th>
			<td>
				<select name=cost_dept_flag class="bs-select form-control" style="<%=obox.get("cost_dept_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("cost_dept_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("cost_dept_flag").equals("2")?"selected":""%>>필수입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>거래처</th>
			<td>
				<select name="cust_cd_flag" class="bs-select form-control" style="<%=obox.get("cust_cd_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("cust_cd_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("cust_cd_flag").equals("2")?"selected":""%>>필수입력</option>
					<option value='3' <%=obox.get("cust_cd_flag").equals("3")?"selected":""%>>잔액관리</option>
				</select>
			</td>
			<th>은행관리</th>
			<td>
				<select name="bank_cd_flag" class="bs-select form-control" style="<%=obox.get("bank_cd_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("bank_cd_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("bank_cd_flag").equals("2")?"selected":""%>>필수입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>사번</th>
			<td>
				<select name="empl_no_flag" class="bs-select form-control" style="<%=obox.get("empl_no_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("empl_no_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("empl_no_flag").equals("2")?"selected":""%>>필수입력</option>
					<option value='3' <%=obox.get("empl_no_flag").equals("3")?"selected":""%>>잔액관리</option>
				</select>
			</td>
			<th>
				<select name="rel_no_type" class="bs-select form-control" style="width:80%">
					<option value=''>:: 관련번호 ::</option>
		            <%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",obox.get("rel_no_type"),"rel_no_type","","","","")%>
				</select>
			</th>
			<td>
				<select name="rel_no_flag" class="bs-select form-control" style="<%=obox.get("rel_no_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("rel_no_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("rel_no_flag").equals("2")?"selected":""%>>필수입력</option>
					<option value='3' <%=obox.get("rel_no_flag").equals("3")?"selected":""%>>잔액관리</option>
				</select>
			</td>
		</tr>
		<tr height="28">
			<th>발생일</th>
			<td>
				<select name="issue_ymd_flag" class="bs-select form-control" style="<%=obox.get("issue_ymd_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("issue_ymd_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("issue_ymd_flag").equals("2")?"selected":""%>>필수입력</option>
				</select>
			</td>
			<th>만기일</th>
			<td>
				<select name="finish_ymd_flag" class="bs-select form-control" style="<%=obox.get("finish_ymd_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("finish_ymd_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("finish_ymd_flag").equals("2")?"selected":""%>>필수입력</option>
				</select>
			</td>
		</tr>
		<tr height="28">
			<th>이자율</th>
			<td>
				<select name="intr_rate_flag" class="bs-select form-control" style="<%=obox.get("intr_rate_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("intr_rate_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("intr_rate_flag").equals("2")?"selected":""%>>필수입력</option>
				</select>
			</td>
			<th>세율</th>
			<td>
				<select name="tax_rate_flag" class="bs-select form-control" style="<%=obox.get("tax_rate_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("tax_rate_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("tax_rate_flag").equals("2")?"selected":""%>>필수입력</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>증빙유형</th>
			<td>
				<select name="vat_cd_flag" class="bs-select form-control" style="<%=obox.get("vat_cd_flag").compareTo("2")>=0?"background-color:#ffff00;":""%>;width:120px">
					<option value=''>해당없음</option>
					<option value='1' <%=obox.get("vat_cd_flag").equals("1")?"selected":""%>>선택입력</option>
					<option value='2' <%=obox.get("vat_cd_flag").equals("2")?"selected":""%>>필수입력</option>
				</select>
			</td>
			<th>일반전표사용</th>
			<td>
			<% if(uSesEnt.use_auth.equals("SA")) { %>
				<select name="edit_yn" class="bs-select form-control" style="width:120px">
					<option value="Y" <%=obox.get("edit_yn").equals("Y")?"selected":""%>>Yes</option>
					<option value="N" <%=obox.get("edit_yn").equals("N")?"selected":""%>>No</option>
				</select>
			<% }else { %>
				<input type="hidden" name="edit_yn" value="<%=obox.get("edit_yn")%>">
				<%=obox.get("edit_yn").equals("Y")?"Yes":"No"%>
			<% } %>
			</td>
		</tr>
		<tr>
			<th>사용구분</th>
			<td>
				<select name="use_flag" class="bs-select form-control" style="width:120px" onChange="changeObjectProperty(document.saveForm.del_reason, this.value=='X'?'enabled':'readonly')">
					<option value="A1" <%=obox.get("use_flag").equals("A1")?"selected":""%>>주요계정</option>
					<option value="A2" <%=obox.get("use_flag").equals("A2")?"selected":""%>>일반계정</option>
					<option value="B" <%=obox.get("use_flag").equals("B")?"selected":""%>>내부관리계정</option>
					<option value="X" <%=obox.get("use_flag").equals("X")?"selected":""%>>사용금지(폐지)</option>
				</select>		
			</td>
			<th>폐지사유</th>
			<td><input type="text" class="form-control" name="del_reason" value="<%=obox.get("del_reason")%>" size="30" maxlength="40" title="폐지사유" class="form-control" <%if(!obox.get("use_flag").equals("X")){%>readOnly<%}%>></td>
		</tr>
	<% if(!box.get("acct_cd").equals("")) { %>
		<tr>
			<th>적요코드</th>
			<td><%=obox.get("remark_cnt")%> 건&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary btn-table" onClick="findRemarkCode(document.saveForm.acct_cd.value, document.saveForm.acct_nm.value);">상세보기</button>
			</td>
			<th>최초등록일시</th>
			<td><%=obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM)%></td>
		</tr>
	<% } %>
	</table>
	
<% if(uSesEnt.use_auth.equals("SA")) { %>
  	<div class="table-bottom-control">
  		<span style="width:100%;">
  			<span style="float:right;">
  				<button type="button" class="btn dark" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
		  		<button type="button" class="btn dark" onClick="goDelete();" style="display:<%=!box.get("acct_cd").equals("")?"":"none"%>"><img src="/com/img/ico_btn_delete.png">삭제</button>
		    </span>
	   </span>
	</div>		 
<% } %>
</form>