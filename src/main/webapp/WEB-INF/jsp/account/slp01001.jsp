<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>일반전표</title> 

<script language="javascript">
	var slip_cnt=0; var cha_cnt=0; var dae_cnt=0; var item_cnt=0;
	function goSlipList(frm) {
		ajaxProcJsonList("PR_ACCTB_SLIP01_LIST@LIST002", {'param01': frm.start_ymd.value.replace(/-/g,""), 'param02': frm.end_ymd.value.replace(/-/g,""), 'param03': 'A', 'param04':'<%=uSesEnt.dept_cd%>'}, function(rtn){
			__goSlipList_post(rtn);
		});	
	}
	
	function __goSlipList_post(rtn) {
		for(var i=0; i < slip_cnt; i++) { $("#slipList"+i).remove(); }
		slip_cnt = 0;
		for(var i=0; i < rtn.data.length; i++) { add_slip_list(rtn.data[i]); }
	}
	
	function add_slip_list(rsBox) {
		var slip_no = rsBox.slip_no;
		var empl_no = rsBox.empl_no;
		var empl_nm = rsBox.empl_nm;
		var dept_nm = rsBox.dept_nm;
		var sys_reg_dt = rsBox.sys_reg_dt;
		var sign_status = rsBox.sign_status;
		var sign_status_nm = rsBox.sign_status_nm;
		var subject = rsBox.subject;
		
		var cHtml = "<tr id='slipList"+slip_cnt+"'>"
				  + "	<td class='t-center'>"+slip_no.substring(0,8) + '-' + slip_no.substring(8)+"</td>"
				  + "	<td class='t-left'>"+subject+"</td>"
				  + "	<td class='t-center'>"+sign_status_nm+"</td>"
				  + "	<td class='t-center'>"
				  + "		<button type='button' class='btn btn-primary btn-table' onClick=\"goMaster('"+slip_no+"','"+empl_no+"','"+empl_nm+"','"+dept_nm+"','"+sys_reg_dt+"','"+sign_status+"','"+sign_status_nm+"','"+subject+"'); go_chadae_list('"+slip_no+"');\">선택</button>"
				  + "	</td>"
				  + "</tr>";
		$("#slipListTable").append(cHtml);
		slip_cnt++;
    }
    
	function go_chadae_list(slip_no) {
		document.main.slip_no.value = slip_no;
		goAdd();
		ajaxProcJsonList("PR_ACCTB_SLIP02_LIST@LIST001", {'param01': slip_no}, function(rtn){
			__go_chadae_list_post(rtn);
		});	
	}
	
	function __go_chadae_list_post(rtn) {
		for(var i=0; i < cha_cnt; i++) { $("#chaList"+i).remove(); }
		for(var i=0; i < dae_cnt; i++) { $("#daeList"+i).remove(); }
		cha_cnt = 0; dae_cnt = 0;
		for(var i=0; i < rtn.data.length; i++) { add_chadae_list(rtn.data[i]); }
		summary_slip_amt('1');
		summary_slip_amt('2');
	}

	var proof_ymd = '<%=DateUtil.toString("yyyyMMdd")%>';
	function add_chadae_list(rsBox) {
		var cd_flag = rsBox.cd_flag; 
		var acct_cd = rsBox.acct_cd; 
		var slip_amt = rsBox.slip_amt; 
		proof_ymd = rsBox.proof_ymd; 
		var rid = cd_flag == '1' ? 'chaList' : 'daeList';
		var cnt = cd_flag == '1' ? cha_cnt : dae_cnt;
		
		var cHtml = "<tr id='"+rid+cnt+"' style='cursor:pointer' onClick=\"reset_highlight(); setBackColor('"+cnt+"','"+rid+"'); go_slip_detail('"+cd_flag+"','"+rsBox.slip_seq+"');\">"
				  + "	<td id='"+rid+cnt+"_td0' =class='t-center'>"+rsBox.acct_nm+"<input type='hidden' name='acct_cd"+cnt+"' value='"+acct_cd+"'></td>"
				  + "	<td id='"+rid+cnt+"_td1' class='t-right' class='padR5'>"+insertComma(slip_amt)+"<input type='hidden' name='slip_amt"+cnt+"' value='"+slip_amt+"'></td>"
				  + "	<td id='"+rid+cnt+"_td2' class='t-center'>"+rsBox.etc_remark+"</td>"
				  + "</tr>";
		$("#"+rid+"Table").append(cHtml);
		if(cd_flag == '1') { cha_cnt ++; }
		else { dae_cnt ++; }
    }

	function add_chadae_list2(box) {
		var cd_flag = box[2].val; 
		var slip_seq = box[1].val; 
		var acct_nm = box[4].val; 
		var slip_amt = box[3].val; 
		var etc_remark = box[5].val; 
		proof_ymd = box[6].val; 
		var rid = cd_flag == '1' ? 'chaList' : 'daeList';
		var cnt = cd_flag == '1' ? cha_cnt : dae_cnt;
		
		var cHtml = "<tr id='"+rid+cnt+"' style='cursor:pointer' onClick=\"reset_highlight(); setBackColor('"+cnt+"','"+rid+"'); go_slip_detail('"+cd_flag+"','"+slip_seq+"');\">"
				  + "	<td id='"+rid+cnt+"_td0' =class='t-center'>"+acct_nm+"</td>"
				  + "	<td id='"+rid+cnt+"_td1' class='t-right' class='padR5'>"+insertComma(slip_amt)+"<input type='hidden' name='slip_amt"+cnt+"' value='"+slip_amt+"'></td>"
				  + "	<td id='"+rid+cnt+"_td2' class='t-center'>"+etc_remark+"</td>"
				  + "</tr>";
		$("#"+rid+"Table").append(cHtml);
		if(cd_flag == '1') { cha_cnt ++; }
		else { dae_cnt ++; }
    }
	
    function goMaster(slip_no, empl_no, empl_nm, dept_nm, sys_reg_dt, sign_status, sign_status_nm, subject) {
    	$('#divSearchTable').modal('hide');
		document.search.slip_no.value = slip_no.substring(0,8)+'-'+slip_no.substring(8);
    	$("#divDeptNm").html(dept_nm);
    	$("#divEmplNm").html(empl_nm);
    	$("#divSysRegDt").html(sys_reg_dt);
    	var signHtml = '<b><font color=red>' + sign_status_nm + '</font></b>';
    	if(sign_status == '1' || sign_status == '4') {
			signHtml += "&nbsp;<button type='button' class='btn btn-primary btn-table' onClick=\"goSign();\">기안문작성</button>";
		}
		if(sign_status > '1') {
			signHtml += "&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-table' onClick=\"goSignLine('','SLP001','ACCTB_SLIP01|"+slip_no+"');\">결재라인</button>";
		}
		document.main.sign_status.value = sign_status; 
		document.signForm.subject.value = subject; 
		$("#divSignStatus").html(signHtml); 
		if(sign_status == '1' || sign_status == '4') { 
			$("#btnUpdate").show();
			$("#btnDeleteAll").show();
		}else {
			$("#btnUpdate").hide();
			$("#btnDeleteAll").hide();
		}
		$("#btnPrint").show();
    }

	function go_slip_detail(cd_flag, slip_seq) {
		document.main.slip_seq.value = slip_seq;
		document.main.cd_flag[cd_flag-1].checked = true;
		document.main.old_flag.value = cd_flag;
		change_cd_flag(cd_flag);
		ajaxProcJsonBox("PR_ACCTB_SLIP02@SELECT", {'slip_no': document.main.slip_no.value, 'slip_seq': slip_seq}, function(rtn){
			__go_slip_detail_post(rtn);
		});			
		
		if(document.main.sign_status.value == '1' || document.main.sign_status.value == '4') { 
			$("#btnDelete").show();
			$("#btnInsert").show();
		}else {
			$("#btnDelete").hide();
			$("#btnInsert").hide();
		}
	}

	function __go_slip_detail_post(rtn) {
		var acct_cd = rtn.acct_cd;
		document.main.acct_cd.value = acct_cd;
		document.main.acct_nm.value = rtn.acct_nm;
		document.main.slip_amt.value = rtn.slip_amt;
		document.main.etc_remark.value = rtn.etc_remark;
		
		var cust_cd_flag = rtn.cust_cd_flag;
		var cost_dept_flag = rtn.cost_dept_flag;
		var empl_no_flag = rtn.empl_no_flag;
		var rel_no_type = rtn.rel_no_type;
		var rel_no_flag = rtn.rel_no_flag;
		var issue_ymd_flag = rtn.issue_ymd_flag;
		var finish_ymd_flag = rtn.finish_ymd_flag;
		var intr_rate_flag = rtn.intr_rate_flag;
		var tax_rate_flag = rtn.tax_rate_flag;
		var vat_cd_flag = rtn.vat_cd_flag;
		var bugt_arr = rtn.bugt_cd;
		set_dynamic_object(acct_cd, cust_cd_flag, cost_dept_flag, empl_no_flag, rel_no_flag, rel_no_type, issue_ymd_flag, finish_ymd_flag, intr_rate_flag, tax_rate_flag, vat_cd_flag, bugt_arr)
		if(isObject('cust_cd')) { document.main.cust_cd.value = rtn.cust_cd; }
		if(isObject('cust_nm')) { document.main.cust_nm.value = rtn.cust_nm; }
		var cost_dept = rtn.cost_dept;
		if(isObject('cost_dept')) { document.main.cost_dept.value = cost_dept; }
		if(isObject('empl_no')) { document.main.empl_no.value = rtn.empl_no; }
		if(isObject('empl_nm')) { document.main.empl_nm.value = rtn.empl_nm; }
		if(isObject('rel_no_type')) { document.main.rel_no_type.value = rtn.rel_no_type; }
		if(isObject('rel_no')) { document.main.rel_no.value = rtn.rel_no; }
		if(isObject('rel_amt')) { document.main.rel_amt.value = rtn.rel_amt; }
		if(isObject('issue_ymd')) { document.main.issue_ymd.value = rtn.issue_ymd; }
		if(isObject('finish_ymd')) { document.main.finish_ymd.value = rtn.finish_ymd; }
		if(isObject('intr_rate')) { document.main.intr_rate.value = rtn.intr_rate; }
		if(isObject('tax_rate')) { document.main.tax_rate.value = rtn.tax_rate; }
		if(isObject('proof_ymd')) { document.main.proof_ymd.value = rtn.proof_ymd; }
		if(isObject('vat_cd')) { 
			var vat_cd = rtn.vat_cd; 
			document.main.vat_cd.value = vat_cd; 
			if(vat_cd == '11' || vat_cd == '20') {
				document.main.vat_amt.value = rtn.vat_amt; 
				$("#spanVatAmt").show();
			}
		}
		input_initialize();
	}

	function _changeAcctCodePost(acct_cd, cust_cd_flag, cost_dept_flag, empl_no_flag, rel_no_type, rel_no_flag, issue_ymd_flag, finish_ymd_flag, intr_rate_flag, tax_rate_flag, vat_cd_flag, bugt_arr) {
		set_dynamic_object(acct_cd, cust_cd_flag, cost_dept_flag, empl_no_flag, rel_no_flag, rel_no_type, issue_ymd_flag, finish_ymd_flag, intr_rate_flag, tax_rate_flag, vat_cd_flag, bugt_arr);
		input_initialize();
	}
	
	function goSave() {
		if(formValidate("#main")) {
			if(parseInt(document.main.slip_amt.value) == 0) {
				alert('금액은 0원을 입력할 수 없습니다.');
				document.main.slip_amt.focus();
				return;
			} 

			removeMask('#main');
			if(isObject('bugt_yy')) { document.main.bugt_yy.value = document.main.proof_ymd.value.substring(0,4); }
			document.search.action_type.value = isEmpty(document.main.slip_seq) ? 'INSERT' : 'UPDATE';
			if(isEmpty(document.main.slip_no)) { document.main.slip_no.value = document.main.proof_ymd.value + 'A'; }

			ajaxSubmitForm("slp01001_update.do?action_type="+document.search.action_type.value,"#main", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					__goSave_post(rtn);
				}else {
					alert(rtn.errMsg);
				}
			});
		}	
	}

	function goDelete() {
		var row_count = parseInt2(document.chaForm.cha_cnt) + parseInt2(document.daeForm.dae_cnt);
		if(row_count <= 1) {
			if(confirm("전표를 삭제하시겠습니까?")) {
				removeMask("#search");
				ajaxSubmitForm("slp01001_delete.do","#search", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						alert('삭제되었습니다.');
						document.search.slip_no.value = '';
						returnFormSubmit(document.search, 'slp01001.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}else {
			if(confirm("삭제하시겠습니까?")) {
				removeMask("#main");
				document.search.action_type.value = 'DELETE';
				ajaxSubmitForm("slp01001_update.do?action_type="+document.search.action_type.value,"#main", function(rtn) {
					hideServerWorking();
					if(rtn.isOk == "Y") {
						__goSave_post(rtn);
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function __goSave_post(rtn) {
		var cd_flag = document.main.cd_flag[0].checked ? '1' : '2';
		if(document.search.action_type.value == 'INSERT') {
			var box = new Array();
			var slip_no  = rtn.slip_no; 
			var slip_seq = rtn.slip_seq; 
			box[0] = new entity('slip_no', 	slip_no);
			box[1] = new entity('slip_seq',	slip_seq);
			box[2] = new entity('cd_flag', 	cd_flag);
			box[3] = new entity('slip_amt', document.main.slip_amt.value);
			box[4] = new entity('acct_nm', 	document.main.acct_nm.value);
			box[5] = new entity('etc_remark', document.main.etc_remark.value);
			box[6] = new entity('proof_ymd', document.main.proof_ymd.value);
			
			if(document.main.slip_no.value.length < 13) {
				document.main.slip_no.value = slip_no;
				goMaster(slip_no, '<%=uSesEnt.empl_no%>', '<%=uSesEnt.empl_nm%>', '<%=uSesEnt.dept_nm%>', '<%=DateUtil.defFmtDateTimeAPM(DateUtil.toString("yyyyMMddHHmmss"))%>', '1', '작성중', document.main.etc_remark.value);
			}
			add_chadae_list2(box);
			
		}else if(document.search.action_type.value == 'UPDATE') {
			if(cd_flag == document.main.old_flag.value) {
				if(cd_flag == '1') {
					var chaRow = document.search.chaListRow.value;
					$("#chaList"+chaRow+"_td0").html(document.main.acct_nm.value);
					$("#chaList"+chaRow+"_td1").html(insertComma(document.main.slip_amt.value) + "<input type='hidden' name='slip_amt"+chaRow+"' value='"+document.main.slip_amt.value+"'>");
					$("#chaList"+chaRow+"_td2").html(document.main.etc_remark.value);
				}else {
					var daeRow = document.search.daeListRow.value;
					$("#daeList"+daeRow+"_td0").html(document.main.acct_nm.value);
					$("#daeList"+daeRow+"_td1").html(insertComma(document.main.slip_amt.value) + "<input type='hidden' name='slip_amt"+daeRow+"' value='"+document.main.slip_amt.value+"'>");
					$("#daeList"+daeRow+"_td2").html(document.main.etc_remark.value);
				}
			}else {
				if(document.main.old_flag.value == '1') {
					var chaRow = document.search.chaListRow.value;
					$("#chaList"+chaRow).remove();
					document.search.chaListRow.value = '';
					cha_cnt--;
				}else {
					var daeRow = document.search.daeListRow.value;
					$("#daeList"+daeRow).remove();
					document.search.daeListRow.value = '';
					dae_cnt--;
				}

				var box = new Array();
				var slip_no  = document.main.slip_no.value;
				var slip_seq = document.main.slip_seq.value;
				box[0] = new entity('slip_no', 		slip_no);
				box[1] = new entity('slip_seq',		slip_seq);
				box[2] = new entity('cd_flag', 		cd_flag);
				box[3] = new entity('slip_amt', 	document.main.slip_amt.value);
				box[4] = new entity('acct_nm', 		document.main.acct_nm.value);
				box[5] = new entity('etc_remark', 	document.main.etc_remark.value);
				box[6] = new entity('proof_ymd', 	document.main.proof_ymd.value);
				add_chadae_list(box);
				summary_slip_amt(document.main.old_flag.value);
			}

		}else if(document.search.action_type.value == 'DELETE') {
			if(cd_flag == '1') {
				var chaRow = document.search.chaListRow.value;
				$("#chaList"+chaRow).remove();
				document.search.chaListRow.value = '';
				cha_cnt--;
			}else {
				var daeRow = document.search.daeListRow.value;
				$("#daeList"+daeRow).remove();
				document.search.daeListRow.value = '';
				dae_cnt--;
			}
		}
		summary_slip_amt(cd_flag);
		goAdd();
	}

	function goAdd() {
		for(var i=0; i < item_cnt; i++) { $("#slipItem"+i).remove(); }
		item_cnt = 0;
		document.main.slip_seq.value = '';
		document.main.acct_cd.value = '';
		document.main.acct_nm.value = '';
		document.main.etc_remark.value = document.signForm.subject.value;

		var amt = parseInt2(document.chaForm.cha_amt) - parseInt2(document.daeForm.dae_amt);
		var cd_flag = '';
		if((parseInt2(document.chaForm.cha_amt) > 0 && amt > 0) || (parseInt2(document.chaForm.cha_amt) < 0 && amt < 0)) {
			cd_flag = '2';
		}else{
			cd_flag = '1';
			amt = -1 * amt;
		}
		document.main.cd_flag[cd_flag-1].checked = true;
		document.main.slip_amt.value = amt;
		change_cd_flag(cd_flag);
		formatMaskElm(document.main.slip_amt);
		
		$("#btnDelete").hide();
		$("#btnInsert").hide();
		reset_highlight();
	}

	function goNewSlip() {
		if(confirm("새 전표를 작성하시겠습니까?")) {
			document.search.slip_no.value = '';
			document.search.action = "slp01001.do"; 
			document.search.target = "_self";
			document.search.submit();
		}
	}

	function goDeleteAll() {
		if(confirm("전표를 삭제하시겠습니까?")) {
			removeMask("#search");
			ajaxSubmitForm("slp01001_delete.do","#search", function(rtn) {
				hideServerWorking();
				if(rtn.isOk == "Y") {
					alert('삭제되었습니다.');
					document.search.slip_no.value = '';
					returnFormSubmit(document.search, 'slp01001.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

	function goSign() {
		if(parseInt2(document.chaForm.cha_amt) != parseInt2(document.daeForm.dae_amt)) {
			alert('차변합계와 대변합계가 불일치하므로 승인요청할 수 없습니다.'); 
			return;
		}
		document.signForm.search_key.value = 'ACCTB_SLIP01|' + document.main.slip_no.value;
		document.signForm.etc_remark.value = '';
		goSignRequest(document.signForm);
	}

	function signRequestPost() {
		document.search.slip_no.value = '';
		document.search.action = "slp01001.do"; 
		document.search.target = "_self";
		document.search.submit();
	}

	function summary_slip_amt(cd_flag) {
		var amt_tot = 0;
		if(cd_flag == '1') {
			for(var i=0; i <= cha_cnt; i++) { try{amt_tot += parseInt(eval("document.chaForm.slip_amt"+i).value);}catch(e){} }
			document.chaForm.cha_cnt.value = cha_cnt;
			document.chaForm.cha_amt.value = amt_tot;
			formatMaskElm(document.chaForm.cha_cnt);
			formatMaskElm(document.chaForm.cha_amt);
		}else {
			for(var i=0; i <= dae_cnt; i++) { try{amt_tot += parseInt(eval("document.daeForm.slip_amt"+i).value);}catch(e){} }
			document.daeForm.dae_cnt.value = dae_cnt;
			document.daeForm.dae_amt.value = amt_tot;
			formatMaskElm(document.daeForm.dae_cnt);
			formatMaskElm(document.daeForm.dae_amt);
		}
	}
	
	function setBackColor(newRow, id) {
		var oldRow = document.all[id+"Row"].value;
		if(oldRow != '') { document.getElementById(id+oldRow).style.background = 'white'; }
		document.getElementById(id+newRow).style.background = 'yellow';
		document.all[id+"Row"].value = newRow;
	}
	
	function reset_highlight() {
		var chaRow = document.search.chaListRow.value;
		var daeRow = document.search.daeListRow.value;
		if(chaRow != '') { document.getElementById("chaList"+chaRow).style.background = 'white'; document.search.chaListRow.value = ''; }
		if(daeRow != '') { document.getElementById("daeList"+daeRow).style.background = 'white'; document.search.daeListRow.value = ''; }
	}
	
	function change_cd_flag(cd_flag) {
		$("#divChaTxt").html(cd_flag == '1' ? '<font color=red><b>차변</b></font>' : '차변');
		$("#divDaeTxt").html(cd_flag == '2' ? '<font color=red><b>대변</b></font>' : '대변');
	}
	
	function go_report() {
		var params = 'P_PARAM01!SLP001,'+document.main.slip_no.value+'!P_PARAM02!,ACCTB_SLIP01|'+document.main.slip_no.value+'!';
		goUbiViewer('WEB-INF/jsp/account/report/slp01001.jrf', params);
	}

	function input_initialize() {
		for(i=0; i < document.forms.length; i++) {
			var form = document.forms[i];
			if(form.className != 'fType') { continue; }
			for(k=0; k < form.elements.length; k++) {
				try {
					var elim = form.elements[k];
					var elim_full_nm = "document." + form.name + "." + elim.name;
					var elim_id = elim_full_nm + k;
					switch (elim.tagName.toLowerCase()) {
						case "textarea" :
						case "select" :
							if(elim.className.indexOf("required") >= 0) {
								elim.style.backgroundColor='#f7efbe';
							}
							if(elim.className.indexOf("setFocus") >= 0) {
								elim.focus();
	            			}
							break;
						case "input"  :
							if(elim.value != '') { formatMaskElm(elim); }
							break;
					}
				} catch(e) {}
			}
		}
		pageInitEnd = "end";
	}

	$(function() {
		if(document.search.select_yn.value == 'N') {
			var slip_no = '<%=box.get("slip_no")%>';
			if(slip_no == '') {
				goSlipList(document.search);
			}else {
				goMaster(slip_no,'<%=obox.get("empl_no")%>','<%=obox.get("empl_nm")%>','<%=obox.get("dept_nm")%>','<%=obox.get("sys_upd_date",Box.DEF_DATETIME_FMT_APM)%>','<%=obox.get("sign_status")%>','<%=obox.get("sign_status_nm")%>','<%=obox.get("etc_remark")%>');
				go_chadae_list(slip_no);
			}
		}
		document.search.select_yn.value = 'Y';
	});
</script>
<%@ include file="slp01001i.jsp" %>

<h1 class="page-title">일반전표</h1>

<form id="search" name="search" method="post" action="" style="margin:0px">
<input type="hidden" name="action_type"	value="">
<input type="hidden" name="chaListRow" 	value="">
<input type="hidden" name="daeListRow" 	value="">
<input type="hidden" name="biz_type" 	value="A">
<input type="hidden" name="select_yn" 	value="N">
<table class="search-panel table table-bordered">
	<colgroup>
		<col style="width:10%">
		<col style="width:25%">
		<col style="width:10%">
		<col style="width:25%">
		<col style="width:10%">
		<col style="width:20%">
	</colgroup>
	<tbody>
  		<tr>
			<td class="td-head">전표번호</td>
			<td>
				<div class="input-group">
					<input type="text" name="slip_no" value="" title="전표번호" class="form-control" style="width:200px; border:1 solid gray" readOnly>
					<button type="button" class="btn dark" onClick="$('#divSearchTable').modal('show');"><i class="fa fa-search"></i></button>
				</div>
			</td>
			<td class="td-head">작성부서</td>
			<td><div id="divDeptNm"><%=uSesEnt.dept_nm%></div></td>
			<td class="td-head">작성자</td>
			<td><div id="divEmplNm"><%=uSesEnt.empl_nm%></div></td>
  		</tr>
  		<tr>
			<td class="td-head">승인상태</td>
			<td><div id="divSignStatus">작성중</div></td>
			<td class="td-head">작성일시</td>
			<td colspan="3" nowrap>
				<div class="form-inline">
					<div id="divSysRegDt" class="input-group marT5"><%=DateUtil.defFmtDateTimeAPM(DateUtil.toString("yyyyMMddHHmmss"))%></div>
					<span class="f-right marR60">
						<button id="btnNew" type="button" class="btn dark" onClick="goNewSlip();"><img src="/com/img/ico_btn_refresh_edit.png">신규</button>
						<button id="btnDeleteAll" type="button" class="btn btn-primary" onClick="goDeleteAll();" style="display:none"><img src="/com/img/ico_btn_delete.png">전체삭제</button>
						<button id="btnPrint" type="button" class="btn btn-primary" onClick="go_report();" style="display:none"><img src="/com/img/ico_btn_print.png">인쇄</button>
					</span>
	  			</div>
			</td>
  		</tr>
	</tbody>
</table>

<div id="divSearchTable" class="modal fade" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog" style="width:550px;height:400px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">전표번호 조회</h4>
			</div>
			<div class="modal-body">
				<div class="form-inline marB5">
					<b>작성일 : </b>
					<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd").equals("") ? DateUtil.toString("yyyyMMdd") : box.get("start_ymd")%>" maxlength="8" title="작성일(부터)" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
					<span> ~ </span>
					<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd").equals("") ? DateUtil.toString("yyyyMMdd") : box.get("end_ymd")%>" maxlength="8" title="작성일(까지)" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
					<span>
						<button type="button" class="btn btn-primary" onClick="goSlipList(document.search)"><img src="/com/img/ico_btn_search.png">검색</button>
					</span>
				</div>
				<div id="divArea" class="table-scrollable scrollOptionY" style="height:330px">
					<table id="slipListTable" class="table table-view table-bordered">
						<tr>
							<th width="30%">전표번호</th>
							<th width="45%">적요</th>
							<th width="20%">승인상태</th>
							<th width="5%"></th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<div id="divListData" class="contentsRow">
	<div class="row row-set">
		<div class="col-md-6 col-xs-6 col-sm-6 row-set-col padL0 padR0">
			<div id="divChaArea" class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 500px);">
				<form id="chaForm" name="chaForm">
				<table id="chaListTable" class="table table-striped table-bordered table-hover order-column">
					<tr>
						<th><span style="font-weight:bold; color:#01a1db;">차&nbsp;&nbsp;&nbsp;변</span></th>
						<th colspan="2" nowrap>
							[<input type="text" name="cha_cnt" value="" class="form-control acc-border tFMONEY" style="width:30px;height:16px" readOnly>건],&nbsp;&nbsp;
							[<input type="text" name="cha_amt" value="" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly>원]
						</th>
					</tr>
					<tr>
						<th width="30%">계정과목</th>
						<th width="20%">금액</th>
						<th width="50%">적요</th>
		         	</tr> 
				</table>
				</form>
			</div><br>
			
			<div id="divDaeArea" class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 500px);">
				<form id="daeForm" name="daeForm">
				<table id="daeListTable" class="table table-striped table-bordered table-hover order-column">
					<tr>
						<th><span style="font-weight:bold; color:#01a1db;">대&nbsp;&nbsp;&nbsp;변</span></th>
						<th colspan="2" nowrap>
							[<input type="text" name="dae_cnt" value="" class="form-control acc-border tFMONEY" style="width:30px;height:16px" readOnly> 건],&nbsp;&nbsp;
							[<input type="text" name="dae_amt" value="" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
						</th>
					</tr>
					<tr>
						<th width="30%">계정과목</th>
						<th width="20%">금액</th>
						<th width="50%">적요</th>
			        </tr>
		        </table>
		       	</form> 
			</div>
		</div>
		<div class="col-md-6 col-xs-6 col-sm-6 row-set-col">
	    	<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="slip_no"		value="">
			<input type="hidden" name="slip_seq"	value="">
			<input type="hidden" name="sign_status" value="">
			<input type="hidden" name="acc_unit" 	value="">
			<input type="hidden" name="old_flag" 	value="">
			<div class="table-scrollable">
				<table id="slipItemTable" class="table table-view table-bordered">
					<tr>
						<th width="25%"><span style="font-weight:bold; color:#01a1db;">세부항목</span></th>
						<td width="75%">
							<div class="mt-radio-inline">
								<label class="mt-radio mt-radio-outline">
									<input type="radio" name="cd_flag" value="1" checked onClick="change_cd_flag('1');"> <font color=red><b>차변</b></font><span></span>
								</label>
								<label class="mt-radio mt-radio-outline">
									<input type="radio" name="cd_flag" value="2" onClick="change_cd_flag('2');"> 대변<span></span>
								</label>
							</div>
						</td>
					</tr>	
					<tr>
						<th>계정과목</th>
						<td>
							<div class="input-group">
								<input type="text" name="acct_nm" value="" title="계정과목" class="form-control required" style="width:300px" readOnly>
								<button type="button" class="btn dark" onClick="findAccountCode('&edit_yn=Y')"><i class="fa fa-search"></i></button>
								<input type="hidden" name="acct_cd" value="">
							</div>
						</td>
					</tr>	
					<tr>
						<th>금액</th>
						<td><input type="text" name="slip_amt" value="" class="form-control required tMONEY" title="금액" style="width:120px"> 원</td>
					</tr>	
					<tr>
						<th>적요</th>
						<td>
							<div class="input-group">
								<input type="text" name="etc_remark" value="" maxlength="50" title="적요" class="form-control required" style="width:300px;ime-mode:active;">
								<button type="button" class="btn dark" onClick="findRemarkCode(document.main.acct_cd.value, document.main.acct_nm.value)"><i class="fa fa-search"></i></button>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="table-bottom-control">
				<span style="width:100%;">
					<span class="f-right">
						<button id="btnUpdate" type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
						<button id="btnDelete" type="button" class="btn dark" onClick="goDelete()" style="display:none"><img src="/com/img/ico_btn_cancel.png">행삭제</button>
						<button id="btnInsert" type="button" class="btn dark" onClick="goAdd()" style="display:none"><img src="/com/img/ico_btn_plus.png">행추가</button>
					</span>
				</span>
			</div>
			</form>
		</div>
	</div>
</div>

<form id="signForm" name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="subject" 		value="">
<input type="hidden" name="msg_type" 		value="SLP001">
<input type="hidden" name="search_key" 		value="">
<input type="hidden" name="etc_remark" 		value="">
<input type="hidden" name="nextUrl" 		value="">
</form>
