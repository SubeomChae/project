<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box" class="egovframework.cbiz.Box" scope="request" />
<jsp:useBean id="obox" class="egovframework.cbiz.Box" scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE", "", "tel_no|","","","",""); %>
<!-- 부서정보 등록 -->
<script language="javascript">
	function goSave() {
		if (formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask('#saveForm');
				ajaxSubmitForm("ins21003_update.do","#saveForm", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						parent.goSearch('<%=box.get("dept_cd")%>');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}

	function goCancel() {
		document.saveForm.action = 'ins21002_select.do';
		document.saveForm.target = '_self';
		document.saveForm.submit();
	}
	
	function changeRegionCd(region_cd1, defVal) {
		document.saveForm.region_cd2.options.length = 0;
		if(region_cd1 != '') {
			setOptionByProc('PR_COMTB_REGN01_LIST@LISTCODE', document.saveForm.region_cd2, defVal, '2', '', region_cd1, '', '', '선택');
		}
	}
	
	$(function() {
		if(!isEmpty(document.saveForm.region_cd1)) { 
			setOptionByProc('PR_COMTB_REGN01_LIST@LISTCODE', document.saveForm.region_cd2, '<%=obox.get("region_cd")%>', '2', '', document.saveForm.region_cd1.value, '', '', '선택');
		}
	});
</script>


<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin: 0px">
<input type="hidden" id="action_type" 	name="action_type" 	value="<%=box.get("dept_cd").equals("")?"INSERT":"UPDATE"%>">
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
			<tr>
				<th>부서코드</th>
				<td colspan="3">
				<% if(box.get("dept_cd").equals("")) { %>
					<input type="text" name="dept_cd" value="<%=obox.get("dept_cd")%>" size="8" maxlength="7" title="부서코드" class="form-control required">
				<% }else { %>
					<b><%=obox.get("dept_cd")%></b> <input type="hidden" name="dept_cd" value="<%=obox.get("dept_cd")%>">
				<% } %>
			</tr>
			<tr>
				<th>부서명</th>
				<td colspan="3">
					<input type="text" name="dept_nm" value="<%=obox.get("dept_nm")%>" size="30" maxlength="40" title="부서명" class="form-control required" onChange="if(isEmpty(document.saveForm.abbr_nm)) document.saveForm.abbr_nm.value=this.value;">
				</td>
			</tr>
			<tr>
				<th>약칭</th>
				<td colspan="3">
					<input type="text"  name="abbr_nm" value="<%=obox.get("abbr_nm")%>" size="30" maxlength="20" title="부서명(약칭)" class="required form-control" style="border: 1 solid gray">
				</td>
			</tr>
			<tr>
				<th>부서설명</th>
				<td colspan="3" style="padding: 5 5 5 5">
					<textarea class="form-control" name="dept_desc" style="height:70; width:100%"><%=obox.get("dept_desc")%></textarea>
				</td>
			</tr>
			<tr>
				<th>소재지</th>
				<td colspan="3">
					<select name="region_cd1" class="bs-select form-control" title="광역시도" style="width:150px" onChange="changeRegionCd(this.value, '')">
						<option value=''>선택</option>
						<%=CodeUtil.optList("PR_COMTB_REGN01_LIST","LISTCODE",StringUtil.substr(obox.get("region_cd"),0,2),"1","","","","")%>
					</select>
					<select name="region_cd2" class="bs-select form-control" title="시군구" style="width: 170px">
						<option value=''>선택</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="18%">전화번호</th>
				<td width="32%" class="form-inline">
					<select name="tel_no1" class="bs-select form-control" style="width:60px">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "tel_no", StringUtil.arrayCol(obox.get("tel_no"),1,"-"))%>
					</select>
					- <input type="text" name="tel_no2" value="<%=StringUtil.arrayCol(obox.get("tel_no"),2,"-")%>" maxlength="4" title="전화번호" class="autoTab form-control" style="width:60px"> 
					- <input type="text" name="tel_no3" value="<%=StringUtil.arrayCol(obox.get("tel_no"),3,"-")%>" maxlength="4" title="전화번호" class="autoTab form-control" style="width:60px">
				</td>
				<th width="18%">팩스번호</th>
				<td width="32%" class="form-inline">
					<select name="fax_no1" class="bs-select form-control" style="width:60px">
						<option value=''>선택</option>
						<%=CodeUtil.optList(codeWp, "tel_no", StringUtil.arrayCol(obox.get("fax_no"),1,"-"))%>
					</select>
					- <input type="text" name="fax_no2" value="<%=StringUtil.arrayCol(obox.get("fax_no"),2,"-")%>" maxlength="4" title="팩스번호" class="autoTab form-control" style="width:60px"> 
					- <input type="text" name="fax_no3" value="<%=StringUtil.arrayCol(obox.get("fax_no"),3,"-")%>" maxlength="4" title="팩스번호" class="autoTab form-control" style="width:60px">
				</td>
			</tr>
			<tr>
				<th>개설일자</th>
				<td class="form-inline">
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("open_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="open_ymd" name="open_ymd" value="<%=obox.get("open_ymd")%>" maxlength="8" title="개설일자" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>
				</td>
				<th>폐지일자</th>
				<td class="form-inline">
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("close_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="close_ymd" name="close_ymd" value="<%=obox.get("close_ymd")%>" maxlength="8" title="폐지일자" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>	
				</td>
			</tr>
			<tr>
				<th>상위부서</th>
				<td class="form-inline">
					<select name="upper_cd" class="bs-select form-control" style="width: 120px">
						<option value=''>선택</option>
						<%=CodeUtil.optList("PR_INSTB_DEPT01_LIST","LISTCODE",obox.get("upper_cd"),"","","1,2,3,4","","",uSesEnt.dbo)%>
					</select>
				</td>
				<th>부서레벨</th>
				<td>
					<select name="dept_lvl" class="bs-select form-control" style="width:80px">
						<option value=""></option>
						<option value="1" <%=obox.get("dept_lvl").equals("1")?"selected":""%>>1레벨</option>
						<option value="2" <%=obox.get("dept_lvl").equals("2")?"selected":""%>>2레벨</option>
						<option value="3" <%=obox.get("dept_lvl").equals("3")?"selected":""%>>3레벨</option>
						<option value="4" <%=obox.get("dept_lvl").equals("4")?"selected":""%>>4레벨</option>
						<option value="5" <%=obox.get("dept_lvl").equals("5")?"selected":""%>>5레벨</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td>
					<select name="use_yn" class="bs-select form-control" style="width:80px">
						<option value="Y" <%=obox.get("use_yn").equals("Y")?"selected":""%>>예</option>
						<option value="N" <%=obox.get("use_yn").equals("N")?"selected":""%>>아니오</option>
					</select>
				</td>
				<th>정렬순서</th>
				<td class="form-inline">
					<input type="text"  name="sort_order" value="<%=obox.get("sort_order")%>" size="3" maxlength="4" class="tMONEY form-control" title="정렬순서">
				</td>
			</tr>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
			<% if(!box.get("dept_cd").equals("")) { %>	
			    <button type="button" class="btn dark" onClick="goCancel()"><img src="/com/img/ico_btn_cancel.png">취소</button>
			<% } %>
			</span>
		</span>
	</div>
</form>