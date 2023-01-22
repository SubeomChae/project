<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 결재권한자 위임  -->
<script language="javascript">
	function goSearch() {
		removeMask("#main");
		document.main.action = 'sgn31001_list.do';
		document.main.target = '_self';
		document.main.submit();
		fixTableHeader("MyTable");
	}
	
	function goDetail(empl_no, dlgt_seq) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		$("tr[search_key='"+empl_no+dlgt_seq+"']").addClass("bg-yellow");
		ajaxProcJsonBox("PR_COMTB_DLGT01@SELECT", {'empl_no' : empl_no, 'dlgt_seq' : dlgt_seq}, function(rtn) {
			document.saveForm.dlgt_seq.value = rtn.dlgt_seq;
			var start_dt = rtn.start_dt;
			var end_dt = rtn.end_dt;
			var current_dt = '<%=DateUtil.toString("yyyyMMddHHmmss")%>';
			if(current_dt > start_dt && current_dt < end_dt) {
				document.saveForm.dlgt_empl_no.value = rtn.dlgt_empl_no;
				document.saveForm.dlgt_empl_nm.value = rtn.dlgt_empl_nm;
				document.saveForm.dlgt_reason.value = rtn.dlgt_reason;
				document.saveForm.start_ymd.value = start_dt.substring(0,8);
				document.saveForm.start_hh.value  = start_dt.substring(8,10);
				document.saveForm.start_mm.value  = start_dt.substring(10,12);
				document.saveForm.end_ymd.value = end_dt.substring(0,8);
				document.saveForm.end_hh.value  = end_dt.substring(8,10);
				document.saveForm.end_mm.value  = end_dt.substring(10,12);
		 
				formatMaskElm(document.saveForm.start_ymd);
				formatMaskElm(document.saveForm.end_ymd);

				$("#btnUpdate").show();
				$("#btnDelete").show();
				$("#EditTable").show();
				$("#ViewTable").hide();
			}else {
				$("#divDlgtFrom").html(start_dt.substring(0,4)+"-"+start_dt.substring(4,6)+"-"+start_dt.substring(6,8)+" "+start_dt.substring(8,10)+":"+start_dt.substring(10,12));
				$("#divDlgtTo").html(end_dt.substring(0,4)+"-"+end_dt.substring(4,6)+"-"+end_dt.substring(6,8)+" "+end_dt.substring(8,10)+":"+end_dt.substring(10,12));
				$("#divDlgtEmplNm").html(rtn.dlgt_empl_nm);
				$("#divDlgtReason").html(rtn.dlgt_reason);

				$("#btnUpdate").hide();
				$("#btnDelete").hide();
				$("#EditTable").hide();
				$("#ViewTable").show();
			}
			$("#btnWrite").show();
		});
    }
	
    function goWrite() {
    	document.saveForm.reset();
    	document.saveForm.dlgt_seq.value = '';
    	formatMaskElm(document.saveForm.start_ymd);

		$("#btnUpdate").show();
		$("#btnDelete").hide();
		$("#btnWrite").hide();
		$("#EditTable").show();
		$("#ViewTable").hide();
		$("tr[id^='tr_']").removeClass("bg-yellow");
    }

	function goSave() {
		if(formValidate("#saveForm")) {
			if(document.saveForm.dlgt_empl_no.value == '<%=uSesEnt.empl_no%>') {
				alert('본인을 위임자로 지정할 수 없습니다.');
				return;
			}else {
				if(parseInt(document.saveForm.start_hh.value) < 0 || parseInt(document.saveForm.start_hh.value) > 23) {
					alert('위임시작일(시)는 0~23사이의 값으로 입력하셔야 합니다.');
					document.saveForm.start_hh.focus();
					return;
				}else if(parseInt(document.saveForm.start_mm.value) < 0 || parseInt(document.saveForm.start_mm.value) > 60) {
					alert('위임시작일(분)는 0~60사이의 값으로 입력하셔야 합니다.');
					document.saveForm.start_mm.focus();
					return;
				}else if(parseInt(document.saveForm.end_hh.value) < 0 || parseInt(document.saveForm.end_hh.value) > 23) {
					alert('위임종료일(시)는 0~23사이의 값으로 입력하셔야 합니다.');
					document.saveForm.end_hh.focus();
					return;
				}else if(parseInt(document.saveForm.end_mm.value) < 0 || parseInt(document.saveForm.end_mm.value) > 60) {
					alert('위임종료일(시)는 0~60사이의 값으로 입력하셔야 합니다.');
					document.saveForm.end_mm.focus();
					return;
				}else if((document.saveForm.start_ymd.value+document.saveForm.start_hh.value+document.saveForm.start_mm.value) >= (document.saveForm.end_ymd.value+document.saveForm.end_hh.value+document.saveForm.end_mm.value)) {
					alert('위임종료일은 위임시작일 이후이어야 합니다.');
					document.saveForm.end_hh.focus();
					return;
				}
			}
			if(confirm('저장하시겠습니까?')) {
				removeMask("#saveForm");
				document.saveForm.action = 'sgn31001_update.do';
				document.saveForm.target = "_self";
				document.saveForm.submit();
			}
		}		
	}		

	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#saveForm");
			document.saveForm.action = 'sgn31001_delete.do';
			document.saveForm.target = "_self";
			document.saveForm.submit();
		}
	}
	
	$(function(){
		fixTableHeader("MyTable");

	});
</script>

	<h1 class="page-title">결재권한자 위임</h1>
	
	<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
	<input type="hidden" name="selectedRow" value="">
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:13%;">
			<col style="width:22%;">
			<col style="width:13%;">
			<col style="width:17%;">
			<col style="width:13%;">
			<col style="width:22%;">
		</colgroup>
		<tbody>
			<tr height="28">
				<td class="td-head">사번/성명</td>
				<td><%=uSesEnt.empl_no%>&nbsp;&nbsp;<%=uSesEnt.empl_nm%></td>
				<td class="td-head">직위</td>
				<td><%=uSesEnt.position_nm%></td>
				<td class="td-head">부서</td>
				<td><%=uSesEnt.dept_nm%></td>
		  	</tr>
		</tbody>
	</table>
	</form>

<div id="divListData" class="contentsRow">
	<div class="row row-set">
		<div class="col-md-6 col-xs-6 col-sm-6 row-set-col padL0 padR0">
			<div class="table-top-guide">
				<font color=red>●</font> 표시는 현재 적용중에 있는 결재권한 위임을 의미합니다.
			</div>
			<div class="table-scrollable" style="width:100%; height:calc(100vh - 165px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgorup>
						<col style="width:5%">
						<col style="width:20%">
						<col style="width:20%">
						<col style="width:15%">
						<col style="width:40%">
					</colgorup>
					<thead>
						<tr>
							<th></th>
							<th>시작일시</th>
							<th>종료일시</th>
							<th>위임자</th>
							<th>위임사유</th>
						</tr> 
					</thead>
					<tbody>
					<% for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" search_key="<%=rsWp.get("empl_no",i)%><%=rsWp.get("dlgt_seq",i)%>" class="odd gradeX" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("empl_no",i)%>','<%=rsWp.get("dlgt_seq",i)%>')"> 
							<td align="center"><%if(rsWp.get("use_yn",i).equals("Y")){%><font color=red>●</font><%}%></td>
							<td align="center"><%=rsWp.get("start_dt",i,Box.DEF_DATETIME_FMT)%></td>
							<td align="center"><%=rsWp.get("end_dt",i,Box.DEF_DATETIME_FMT)%></td>
							<td align="center"><a href="javascript:goEmployeePop('<%=rsWp.get("dlgt_empl_no",i)%>')"><%=rsWp.get("dlgt_empl_nm",i)%></a></td>
							<td><%=rsWp.get("dlgt_reason",i,Box.MULTILINE_TEXT)%></td>
						</tr>
					<% } %>
					<% if(box.get("select_yn").equals("Y") && rsWp.getLength() == 0) { %>
						<tr><td colspan="5" class="t-center">검색된 자료가 없습니다.</td></tr>
					<% } %>
					</tbody>
				</table>
			</div>
		
			<%=PageUtil.makePaging(box, rsWp, request)%>
		</div>
		
		<div class="col-md-6 col-xs-6 col-sm-6 row-set-col padT20">
			<div class="table-scrollable" style="height:100%;overflow-y:auto">
				<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
				<input type="hidden" name="empl_no" 	value="<%=uSesEnt.empl_no%>">
				<input type="hidden" name="dlgt_seq" 	value="">
				<table id="EditTable" class="table table-striped table-bordered table-hover order-column">
					<tr>
					  	<td colspan="4" class="td-head">위임장</td>
	          		</tr> 
					<tr>
					  	<td width="25%" class="td-head">위임시작일시</td>
					  	<td width="75%" class="t-left">
						  	<div class="form-inline">
								<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="start_ymd" name="start_ymd" value="<%=DateUtil.toString("yyyyMMdd")%>" maxlength="8" title="위임시작일" class="form-control required tYMD">
									<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
								</div>
								<input type="text" name="start_hh" value="" maxlength="2" title="위임시작일(시)" class="form-control tMONEY required autoTab" style="width:40px" onChange="if(this.value.length==1) this.value='0'+this.value;"> : <input type="text" name="start_mm" value="" maxlength="2" title="위임시작일(분)" class="form-control tMONEY required autoTab" style="width:40px" onChange="if(this.value.length==1) this.value='0'+this.value;"> 부터 
							</div> 
					  	</td>
	          		</tr> 
					<tr>
					  	<td class="td-head">위임종료일시</td>
					  	<td class="t-left">
						  	<div class="form-inline">
								<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="end_ymd" name="end_ymd" value="" maxlength="8" title="위임종료일" class="form-control required tYMD">
									<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
								</div>
								<input type="text" name="end_hh" value="" maxlength="2" title="위임종료일(시)" class="form-control tMONEY required autoTab" style="width:40px" onChange="if(this.value.length==1) this.value='0'+this.value;"> : <input type="text" name="end_mm" value="" maxlength="2" title="위임종료일(분)" class="form-control tMONEY required autoTab" style="width:40px" onChange="if(this.value.length==1) this.value='0'+this.value;"> 까지 
							</div>
					  	</td>
	          		</tr> 
					<tr>
					  	<td class="td-head">위임자</td>
					  	<td class="t-left">
					  		<div class="form-inline">
					  			<div class="input-group">
									<input type="text" name="dlgt_empl_no" value="" title="위임자성명" class="form-control required" style="width:90px;background-color:f0f0f0;" readOnly>
									<span class="input-group-btn"><button type="button" class="btn dark" onClick="findEmployeeNo('&column=dlgt_empl_no,dlgt_empl_nm,saveForm')"><i class="fa fa-search"></i></button></span>
								</div>
								<input type="text" name="dlgt_empl_nm" value="" class="form-control" style="width:100px;background-color:f0f0f0;" readOnly>
							</div>
					  	</td>
	          		</tr> 
					<tr>
						<td class="td-head">위임사유</td>
						<td><textarea name="dlgt_reason" title="위임사유" class="form-control required" style="height:40px;width:100%;ime-mode:active;"></textarea></td>
	          		</tr> 
				</table>
				<table id="ViewTable" class="table table-striped table-bordered table-hover order-column" style="display:none">
					<tr>
					  	<td colspan="4" class="td-head">위임장</td>
	          		</tr> 
					<tr>
					  	<td width="25%" class="td-head">위임시작일시</td>
					  	<td width="75%" class="t-left"><span id="divDlgtFrom"></span> 부터</td>
	          		</tr> 
					<tr>
					  	<td class="td-head">위임종료일시</td>
					  	<td class="t-left"><span id="divDlgtTo"></span> 까지</td>
	          		</tr> 
					<tr>
					  	<td class="td-head">위임자</td>
					  	<td class="t-left"><span id="divDlgtEmplNm"></span></td>
	          		</tr> 
					<tr>
						<td class="td-head">위임사유</td>
						<td class="t-left"><span id="divDlgtReason"></span></td>
	          		</tr> 
				</table>
				</form>
			</div>
			<div class="table-bottom-control">
				<div class="form-inline f-right">
					<div class="form-group">
						<button type="button" id="btnUpdate" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
						<button type="button" id="btnDelete" class="btn dark" onClick="goDelete();"><img src="/com/img/ico_btn_delete.png" style="display:none">삭제</button>
						<button type="button" id="btnWrite" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_write.png" style="display:none">새로작성</button>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>