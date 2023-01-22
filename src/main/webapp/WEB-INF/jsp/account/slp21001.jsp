<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 회계전표 수정 -->	

<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		removeMask("#main");
		document.main.action = "slp21001.do"; 
		document.main.target = "_self";
		document.main.submit();
	}
	
	function goDetail(slip_seq) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(slip_seq != '') { $("tr[slip_seq='"+slip_seq+"']").addClass("bg-yellow"); }
		var pageUrl = 'slp21002_edit.do?slip_seq='+slip_seq;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}
	
	function goSave() {
		if(formValidate("#main")) {
			if(confirm('결산반영일 또는 회계단위를 수정하시겠습니까?')) {
				ajaxSubmitForm('slp21001_update.do',"#main", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						alert('수정되었습니다');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}		
	}

	function __Calendar_Setting_Post(target) {
		if(target == 'p_slip_ymd' && !isEmpty(document.main.p_slip_ymd)) {
			document.main.p_slip_no.options.length = 0;
			var slip_ymd = document.main.p_slip_ymd.value.replace(/-/g,"");
			setOptionByProc('PR_ACCTB_SLIP01_LIST@LISTCODE', document.main.p_slip_no, '', slip_ymd, '', '', '', '', '선택');
		}
	}

	$(function() {
	<% if(rsWp.getLength() > 0) { %>
		goDetail('<%=rsWp.get("slip_seq",0)%>');
	<% } %>
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="slip_no" 	value="<%=obox.get("slip_no")%>">
<input type="hidden" name="biz_type" 	value="<%=obox.get("biz_type")%>">
<input type="hidden" name="selectedRow" value="">

	<h1 class="page-title">회계전표 수정</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:30%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">전표번호</td>
				<td nowrap>
					<div class="form-inline"><!-- onBlur="__Calendar_Setting_Post('')" -->
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("p_slip_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="p_slip_ymd" name="p_slip_ymd" value="<%=box.get("p_slip_ymd")%>" maxlength="8" title="전표일자" class="form-control required tYMD" onchange="__Calendar_Setting_Post('p_slip_ymd')">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div> ~
						<select name="p_slip_no" title="전표번호" class="bs-select form-control required" style="width:90px" onChange="goSearch();">
							<option value=''>선택</option>
							<%=CodeUtil.optList("PR_ACCTB_SLIP01_LIST","LISTCODE",box.get("p_slip_no"),box.get("p_slip_ymd"),"","","","",uSesEnt.dbo)%>
						</select>
					</div>
				</td>
				<td class="td-head">작성부서</td>
				<td nowrap><%=obox.get("dept_nm")%></td>
				<td class="td-head">작성자</td>
				<td nowrap><%=obox.get("empl_nm")%></td>
	  		</tr>
	  		<tr>
				<td class="td-head">결재상태</td>
				<td nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").compareTo("1") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goDocuViewer('<%=obox.get("msg_no")%>');">기안문보기</button>
				<% } %>
				</td>
			<% if(obox.get("sign_status").equals("3") && !obox.get("sign_ymd").equals("")) { %>
				<td class="td-head">회계전표번호</td>
				<td colspan="3" nowrap>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=obox.get("sign_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="sign_ymd" value="<%=obox.get("sign_ymd")%>" maxlength="8" title="결산반영일" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div> -
						<select name="p_acc_unit" class="bs-select form-control required" title="회계단위" style="width:97px">
							<option value='00' <%=obox.get("acc_unit").equals("00")?"selected":""%>>목적사업</option>
							<option value='20' <%=obox.get("acc_unit").equals("20")?"selected":""%>>기금관리</option>
						</select> - 
						<input type="text" name="p_sign_no" value="<%=obox.get("sign_no")%>" class="form-control" style="width:45px" readOnly>
						<button type="button" class="btn btn-primary btn-table" onClick="goSave()">수정</button>
			<% }else { %>
				<td class="td-head">작성일자</td>
				<td colspan="3" nowrap>
					<div class="form-inline"><%=obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM)%>
			<% } %>
						<span class="f-right marR60">
							<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/account/report/slp01001.jrf','P_PARAM01!<%=obox.get("msg_type")%>,<%=obox.get("slip_no")%>!P_PARAM02!,ACCTB_SLIP01|<%=obox.get("slip_no")%>!')"><img src="/com/img/ico_btn_print.png">인쇄</button>
						</span>
					</div>
				</td>
			</tr>
	  	</tbody>
	</table>	
</form>	

<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-6 col-xs-6 col-sm-6 row-set-col padL0 padR0">
			<div id="divChaArea" class="table-scrollable scrollOptionY" style="height:300px">
				<table id="chaListTable" class="table table-striped table-bordered table-hover order-column">
					<tr>
						<th><span style="color:#01a1db;">차&nbsp;&nbsp;&nbsp;변</span></th>
						<th colspan="2">
							[<input type="text" name="cha_cnt" value="<%=obox.get("cha_cnt")%>" class="form-control acc-border tMONEY" style="width:30px;height:16px" readOnly> 건],&nbsp;&nbsp;
							[<input type="text" name="cha_amt" value="<%=obox.get("cha_amt")%>" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
						</th>
					</tr>
					<tr>
						<th width="30%">계정과목</th>
						<th width="20%">금액</th>
						<th width="50%">적요</th>
	          		</tr> 
				<% if(rsWp.getLength() == 0) { %>
					<tr><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
				<% }else {
			   		for(int i=0; i < rsWp.getLength(); i++) { if(!rsWp.get("cd_flag",i).equals("1")) { continue; } %>
					<tr id="tr_<%=i%>" slip_seq="<%=rsWp.get("slip_seq",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("slip_seq",i)%>')"> 
						<td><%=rsWp.get("acct_nm",i)%></td>
						<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
						<td><%=rsWp.get("etc_remark",i)%></td>
					</tr>	
					<% } %>
			    <% } %>
				</table>
			</div><br>
			
			<div id="divDaeArea" class="table-scrollable scrollOptionY" style="height:300px">
				<table id="daeListTable" class="table table-striped table-bordered table-hover order-column">
					<tr>
						<th><span style="color:#01a1db;">대&nbsp;&nbsp;&nbsp;변</span></th>
						<th colspan="2">
							[<input type="text" name="dae_cnt" value="<%=obox.get("dae_cnt")%>" class="form-control acc-border tMONEY" style="width:30px;height:16px" readOnly> 건],&nbsp;&nbsp;
							[<input type="text" name="dae_amt" value="<%=obox.get("dae_amt")%>" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
						</th>
					</tr>
					<tr>
						<th width="30%">계정과목</th>
						<th width="20%">금액</th>
						<th width="50%">적요</th>
	          		</tr> 
				<% if(rsWp.getLength() == 0) { %>
					<tr><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
				<% }else {
			   		for(int i=0; i < rsWp.getLength(); i++) { if(!rsWp.get("cd_flag",i).equals("2")) { continue; } %>
					<tr id="tr_<%=i%>" slip_seq="<%=rsWp.get("slip_seq",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("slip_seq",i)%>')"> 
						<td><%=rsWp.get("acct_nm",i)%></td>
						<td class="t-right"><%=rsWp.get("slip_amt",i,Box.THOUSAND_COMMA)%></td>
						<td><%=rsWp.get("etc_remark",i)%></td>
					</tr>	
					<% } %>
				<% } %>
				</table>
			</div>
		</div>
		<div class="col-md-6 col-xs-6 col-sm-6 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>