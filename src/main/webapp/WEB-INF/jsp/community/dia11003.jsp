<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 일정 등록 -->
<script language='javascript'>
	var userCnt = <%=rsWp.getLength()%>;
	function goSave() {
		if(formValidate("#main")) {
			if((isEmpty(document.main.start_hh) && !isEmpty(document.main.end_hh)) || (!isEmpty(document.main.start_hh) && isEmpty(document.main.end_hh))) {
				alert('시작시각과 종료시각의 형식이 불일치합니다.');
				return;
			}else if((isEmpty(document.main.start_hh) && !isEmpty(document.main.start_mm)) || (isEmpty(document.main.end_hh) && !isEmpty(document.main.end_mm))) {
				alert('시작시각 또는 종료시각의 형식이 옳바르지 않습니다.');
				return;
			}
			
			if(!isEmpty(document.main.start_hh) && isEmpty(document.main.start_mm)) { document.main.start_mm.value = '00'; }
			if(!isEmpty(document.main.end_hh) && isEmpty(document.main.end_mm)) { document.main.end_mm.value = '00'; }
			
			document.main.start_hhmm.value = document.main.start_hh.value+document.main.start_mm.value;
			document.main.end_hhmm.value = document.main.end_hh.value+document.main.end_mm.value;

			var start_dt = document.main.start_ymd.value+document.main.start_hhmm.value;
			var end_dt = document.main.end_ymd.value+document.main.end_hhmm.value;
			
			if(start_dt > end_dt) {
				alert('기간범위가 잘못되었습니다.');
				return;
			}

			if(confirm('저장하시겠습니까?')) {
				removeMask("#main");
				document.main.input_cnt.value = userCnt;
			    document.main.action = 'dia11003_update.do';
			    document.main.target = '_parent';
			    document.main.submit();
			}
		}
	}
	
	function goCancel() {
		removeMask("#main");
		document.main.action = 'dia11002_select.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function change_plan_class(plan_class) {
		for(var i=0; i < 3; i++) {
			document.main.public_scope[i].checked = false;
			document.main.public_scope[i].disabled = false;
		}	
		
		if(plan_class == '1') {
			document.main.public_scope[0].checked = true;
			changeObjectProperty(document.main.userList, 'enabled');
		}else if(plan_class == '2') {
			document.main.public_scope[1].checked = true;
			document.main.public_scope[0].disabled = true;
			changeObjectProperty(document.main.userList, 'disabled');
			go_remove_all();
		}else if(plan_class == '3') {
			document.main.public_scope[2].checked = true;
			document.main.public_scope[0].disabled = true;
			document.main.public_scope[1].disabled = true;
			changeObjectProperty(document.main.userList, 'disabled');
			go_remove_all();
		}
	}

	function __Calendar_Setting_Post(target) {
		if(target == 'start_ymd') {
			document.main.end_ymd.value = document.main.start_ymd.value.replace(/-/g,"");
			formatMaskElm(document.main.end_ymd);
		}
	}
	
	$(function() {
	<% if(!box.get("plan_no").equals("")) { %>
		change_plan_class('<%=obox.get("plan_class")%>');
	<% } %>
	});
	
	$(function() {
		$(".page-logo-text").html("일정 등록");	
	});
</script>

<form  id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="plan_no" 	value="<%=box.get("plan_no")%>">
<input type="hidden" name="ref_table" 	value="<%=box.get("ref_table")%>">
<input type="hidden" name="ref_pk" 		value="<%=box.get("ref_pk")%>">
<input type="hidden" name="popup_yn" 	value="<%=box.get("popup_yn")%>">
<input type="hidden" name="wrt_user_id" value="<%=uSesEnt.user_id%>">
<input type="hidden" name="wrt_dept_cd" value="<%=uSesEnt.dept_cd%>">
<input type="hidden" name="input_cnt" 	value="">


	<table class="table table-view table-bordered table-cover mar0">
  		<tr height="28">
			<th width="20%">제목</th>
			<td width="80%"><input type="text" name="subject" value="<%=obox.get("subject")%>" maxlength="50" class="form-control required" title="제목" style="width:100%; ime-mode:active;"></td>
  		</tr>
  		<tr>
			<th>구분</th>
			<td>
				<label class="mt-radio mt-radio-outline">
					<input type="radio" name="plan_class" value="1" <%=obox.get("plan_class").equals("1")?"checked":""%> style="border:none" onClick="change_plan_class(this.value)"><%=uSesEnt.user_nm%> 개인일정<span/>
				</label>
				<label class="mt-radio mt-radio-outline">
					<input type="radio" name="plan_class" value="2" <%=obox.get("plan_class").equals("2")?"checked":""%> style="border:none" onClick="change_plan_class(this.value)"><%=uSesEnt.dept_nm%> 일정<span/>
				</label>
				<label class="mt-radio mt-radio-outline">
					<input type="radio" name="plan_class" value="3" <%=obox.get("plan_class").equals("3")?"checked":""%> style="border:none" onClick="change_plan_class(this.value)">전사 일정<span/>
				</label>
			</td>
  		</tr>
  		<tr>
			<th>기간</th>
			<td>
				<div class="form-inline">
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("start_ymd")%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="start_ymd" value="<%=obox.get("start_ymd")%>" size="10" maxlength="8" class="form-control required tYMD" title="시작일" onChange="__Calendar_Setting_Post('start_ymd')">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
					<select name="start_hh" class="bs-select form-control" style="width:40px">
						<option value=''></option>
					<% for(int i=0; i < 24; i++) { %>
						<option value='<%=StringUtil.lpad(String.valueOf(i),"0",2)%>' <%=StringUtil.substr(obox.get("start_hhmm"),0,2).equals(StringUtil.lpad(String.valueOf(i),"0",2))?"selected":""%>><%=i%></option>
					<% } %>	
					</select> 시 
					<select name="start_mm" class="bs-select form-control" style="width:40px">
						<option value=''></option>
					<% String MM = "";
					   for(int i=0; i < 60; i=i+5){ 
						MM = Integer.toString(i).length() < 2 ? "0"+Integer.toString(i):Integer.toString(i);%>
						<option value=<%=MM%> <%=StringUtil.substr(obox.get("start_hhmm"),2).equals(MM)?"selected":""%>><%=MM%></option>
					<% } %>
					</select> 분 부터&nbsp;&nbsp;&nbsp;&nbsp;<%=box.get("popup_yn").equals("Y")?"<br>":""%>
				</div>
				<div class="form-inline">
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("start_ymd")%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" name="end_ymd" value="<%=obox.get("end_ymd")%>" size="10" maxlength="8" class="form-control required tYMD" title="종료일">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
					<select name="end_hh" class="bs-select form-control" style="width:40px">
					<option value=''></option>
					<% for(int i=0; i < 24; i++) { %>
						<option value='<%=StringUtil.lpad(String.valueOf(i),"0",2)%>' <%=StringUtil.substr(obox.get("end_hhmm"),0,2).equals(StringUtil.lpad(String.valueOf(i),"0",2))?"selected":""%>><%=i%></option>
					<% } %>	
					</select> 시 
					<select name="end_mm" class="bs-select form-control" style="width:40px">
						<option value=''></option>
					<% for(int i=0; i < 60; i=i+5){ 
						MM = Integer.toString(i).length() < 2 ? "0"+Integer.toString(i):Integer.toString(i);%>
						<option value=<%=MM%> <%=StringUtil.substr(obox.get("end_hhmm"),2).equals(MM)?"selected":""%>><%=MM%></option>
					<% } %>
					</select> 분 까지
				</div>
				<input type="hidden" name="start_hhmm" value="<%=obox.get("start_hhmm")%>">
				<input type="hidden" name="end_hhmm" value="<%=obox.get("end_hhmm")%>">
			</td>
  		</tr>
  		<tr height="80">
			<th>내용</th>
			<td style="padding:5 5 5 5"><textarea name="plan_memo" class="form-control" style="ime-mode:active;height:100;width:100%"><%=obox.get("plan_memo")%></textarea></td>
		</tr>
  		<tr height="28">
			<th>공개범위</th>
			<td>
				<label class="mt-radio mt-radio-outline">
					<input type="radio" name="public_scope" value="1" <%=obox.get("public_scope").equals("1")?"checked":""%> style="border:none">소유자에게만<span/>
				</label>
				<label class="mt-radio mt-radio-outline">
					<input type="radio" name="public_scope" value="2" <%=obox.get("public_scope").equals("2")?"checked":""%> style="border:none">팀원에게<span/>
				</label>
				<label class="mt-radio mt-radio-outline">
					<input type="radio" name="public_scope" value="3" <%=obox.get("public_scope").equals("3")?"checked":""%> style="border:none">전체<span/>
				</label>
			</td>
  		</tr>
	</table>
	
	<div class="table-bottom-control padR5">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
			<% if(!box.get("plan_no").equals("")) { %>
				<button type="button" class="btn dark" onClick="goCancel();"><img src="/com/img/ico_btn_cancel.png">취소</button>
			<% } %>
			</span>
		</span>
	</div>
</form>