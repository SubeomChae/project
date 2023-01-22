<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script language="javascript">
	function set_dynamic_object(acct_cd, cust_cd_flag, cost_dept_flag, empl_no_flag, rel_no_flag, rel_no_type, issue_ymd_flag, finish_ymd_flag, intr_rate_flag, tax_rate_flag, vat_cd_flag, bugt_arr) {
		for(var i=0; i < item_cnt; i++) { $("#slipItem"+i).remove(); }
		item_cnt = 0;
		if(cust_cd_flag >= '1')	{ go_add_item('거래처', cust_cd_flag); }
		if(cost_dept_flag >= '1')	{ go_add_item('비용귀속부서', cost_dept_flag); }
		if(empl_no_flag >= '1')	{ go_add_item('사번', empl_no_flag); }
		if(rel_no_flag >= '1') { 
			if(rel_no_type == '11') { 
				go_add_item('계좌번호', rel_no_flag); 
				setOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.main.account_no, '', document.main.acct_cd.value, '', '', '', '', '직접입력');
			}else if(rel_no_type == '12') { 
				go_add_item('카드번호', rel_no_flag); 
				var dept_cd = '<%=uSesEnt.dept_cd%>';
				try { if(!isEmpty(document.main.dept_cd)) dept_cd = document.main.dept_cd.value; } catch(e) {}
				setOptionByProc('PR_FINTB_CARD01_LIST@LISTCODE', document.main.card_no, '', (acct_cd=='2100103'?'B':'A'), '', '', '', '', '직접입력');
			} 
			else if(rel_no_type == '13') { go_add_item('어음번호', rel_no_flag); } 
			else if(rel_no_type == '14') { go_add_item('유가증권번호', rel_no_flag); }
			else if(rel_no_type == '15') { go_add_item('사업자번호', rel_no_flag); }
			else if(rel_no_type == '16') { go_add_item('주민등록번호', rel_no_flag); } 
			else if(rel_no_type == '17') { go_add_item('자산번호', rel_no_flag); } 
			else { go_add_item('관련번호', rel_no_flag); } 
		}
		if(issue_ymd_flag >= '1') { go_add_item('발생일자', issue_ymd_flag); }
		if(finish_ymd_flag >= '1') { go_add_item('만기일자', finish_ymd_flag); }
		if(intr_rate_flag >= '1') { go_add_item('이자율', intr_rate_flag); }
		if(tax_rate_flag >= '1') { go_add_item('세율', tax_rate_flag); }
		if(vat_cd_flag >= '1') { go_add_item('증빙구분', vat_cd_flag); }
		if(acct_cd.substring(0,5) == '11111' || acct_cd.substring(0,5) == '21011') { // 매입부가세, 매출부가
			go_add_item('공급가액',	'1'); 
		}else if(acct_cd.substring(0,5) == '11109') { // 선급법인세
			go_add_item('이자금액',	'2');
		}else {
			go_add_item('관련금액',	'1');
		}
		
		var arr = bugt_arr.split(',');
		if(arr.length == '1' && bugt_arr != '') { 
			if(arr[0].charAt(6) == '') {
				go_add_item('목적사업', bugt_arr); 
				document.all['bugt_cd'].value = arr[0];
			}else {
				go_add_item('세부사업', bugt_arr); 
				setOptionByProc('PR_BUDTB_CODE01_LIST@LISTCODE', document.main.bugt_cd, arr[0], '2', arr[0].substring(0,5), '', '', '', '선택');
			}
		}else if(arr.length > '1') {
			go_add_item('세부사업', bugt_arr); 
			<% if(box.get("dbo").equals("SABOK28")) { %>
				setOptionByProc('PR_BUDTB_CODE01_LIST@LISTCODE', document.main.bugt_cd, '', '2', arr[0].substring(0,5), '', '', '', '선택');
			<% }else { %>
				setOptionByProc('PR_BUDTB_CODE01_LIST@LISTCODE', document.main.bugt_cd, '', '2', arr[0], '', '', '', '선택');
			<% } %>
		}
		go_add_item('증빙일자', '2'); formatMaskElm(document.main.proof_ymd);
	}
	
	function go_add_item(item_nm, item_property) {
		var dbo = "<%=box.get("dbo")%>";
		var cHtml = "";
		var required = dbo == 'SABOK55' || dbo == 'SABOK22' ? '' : (item_property >= '2' ? 'required' : '');
		var bgcolor  = required == 'required' ? '#f7efbe' : '#ffffff';
		
		var cHtml = "<tr id='slipItem"+item_cnt+"'>"
				  + "	<th>"+item_nm+"</th>";
		if(item_nm == '거래처') {
			cHtml +="<td>"
				  + "	<div class='input-group'>"
				  + "		<input type='text' name='cust_nm' value='' class='form-control "+required+"' title='거래처' style='width:300px;background-color:"+bgcolor+";' readOnly>"
				  + "		<button type='button' class='btn dark' onClick=\"findCustCode('');\"><i class='fa fa-search'></i></button>"
				  + "		<input type='hidden' name='cust_cd' value=''>"
				  + "	</div>"
				  + "</td>";
		}else if(item_nm == '비용귀속부서') {
			var deptOpt = "<%=CodeUtil.optList("PR_INSTB_DEPT01_LIST","LISTCODE",uSesEnt.dept_cd,"","","","","Y",uSesEnt.dbo)%>";
			cHtml +="<td>"
				  + "	<select name='cost_dept' class='bs-select form-control "+required+"' title='비용귀속부서' style='background-color:"+bgcolor+";width:180px'><option value=''>선택</option>"+deptOpt+"</select>"
				  + "</td>";
		}else if(item_nm == '계좌번호') {
			cHtml +="<td>"
				  + "	<div class='input-group'>"
				  + "		<select name='account_no' title='계좌번호' class='bs-select form-control' style='background-color:"+bgcolor+";width:180px;' onChange=\"document.main.rel_no.value=this.value;\"></select>"
				  + "		<input type='text' name='rel_no' value='' maxlength='20' class='form-control "+required+"' title='계좌번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "		<input type='hidden' name='rel_no_type' value='11'>"
				  + "	</div>"
				  + "</td>";
		}else if(item_nm == '카드번호') {
			cHtml +="<td>"
				  + "	<select name='card_no' title='카드번호' class='bs-select form-control' style='background-color:"+bgcolor+";width:180px;' onChange=\"document.main.rel_no.value=this.value; formatMaskElm(document.main.rel_no);\"></select>"
				  + "	<input type='text' name='rel_no' value='' maxlength='16' class='form-control "+required+" tCARD' title='카드번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "	<input type='hidden' name='rel_no_type' value='12'>"
				  + "</td>";
		}else if(item_nm == '어음번호') {
			cHtml +="<td>"
				  + "	<input type='text' name='rel_no' value='' maxlength='20' class='"+required+"' title='어음번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "	<input type='hidden' name='rel_no_type' value='13'>"
				  + "</td>";
		}else if(item_nm == '유가증권번호') {
			cHtml +="<td>"
				  + "	<select name='account_no' title='유가증권번호' class='bs-select form-control' style='background-color:"+bgcolor+";width:180px;' onChange=\"document.main.rel_no.value=this.value;\"></select>"
				  + "	<input type='text' name='rel_no' value='' maxlength='20' class='form-control "+required+"' title='유가증권번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "	<input type='hidden' name='rel_no_type' value='14'>"
				  + "</td>";
		}else if(item_nm == '사업자번호') {
			cHtml +="<td>"
				  + "	<input type='text' name='rel_no' value='' maxlength='10' class='form-control "+required+"' title='사업자번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "	<input type='hidden' name='rel_no_type' value='15'>"
				  + "</td>";
		}else if(item_nm == '주민등록번호') {
			cHtml +="<td>"
				  + "	<input type='text' name='rel_no' value='' maxlength='13' class='form-control "+required+"' title='주민등록번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "	<input type='hidden' name='rel_no_type' value='16'>"
				  + "</td>";
		}else if(item_nm == '자산번호') {
			cHtml +="<td>"
				  + "	<input type='text' name='rel_no' value='' maxlength='13' class='form-control "+required+"' title='자산번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "	<input type='hidden' name='rel_no_type' value='17'>"
				  + "</td>";
		}else if(item_nm == '관련번호') {
			cHtml +="<td>"
				  + "	<input type='text' name='rel_no' value='' maxlength='20' class='form-control "+required+"' title='관련번호' style='width:180px;background-color:"+bgcolor+";'>"
				  + "	<input type='hidden' name='rel_no_type' value='99'>"
				  + "</td>";
		}else if(item_nm == '사번') {
			cHtml +="<td>"
				  + "	<div class='form-inline'>"
				  + "		<div class='input-group'>"
				  + "			<input type='text' name='empl_no' value='' class='form-control "+required+"' title='거래사번처' style='width:100px;background-color:"+bgcolor+";' readOnly>"
				  + "			<button type='button' class='btn dark' onClick=\"findEmployeeNo('');\"><i class='fa fa-search'></i></button>"
				  + "		</div>"
				  + "		<input type='text' name='empl_nm' value='' class='form-control "+required+"' title='성명' style='width:80px;background-color:f6f6f6;' readOnly>"
				  + "	</div>"
				  + "</td>";
		}else if(item_nm == '발생일자') {
			cHtml +="<td>"
				  + "	<div class='input-group input-medium date date-picker' data-date='' data-date-format='yyyy-mm-dd' data-date-viewmode='years'>"
				  + "		<input type='text' id='issue_ymd' name='issue_ymd' value='' maxlength='8' title='발생일자' class='form-control tYMD'>"
				  + "		<span class='input-group-btn'><button class='btn dark' type='button'><i class='fa fa-calendar'></i></button></span>"
				  + "	</div>"
				  + "</td>";
		}else if(item_nm == '만기일자') {
			cHtml +="<td>"
				  + "	<div class='input-group input-medium date date-picker' data-date='' data-date-format='yyyy-mm-dd' data-date-viewmode='years'>"
				  + "		<input type='text' id='finish_ymd' name='finish_ymd' value='' maxlength='8' title='만기일자' class='form-control tYMD'>"
				  + "		<span class='input-group-btn'><button class='btn dark' type='button'><i class='fa fa-calendar'></i></button></span>"
				  + "	</div>"
				  + "</td>";
		}else if(item_nm == '이자율') {
			cHtml +="<td>"
				  + "	<input type='text' name='intr_rate' value='' maxlength='7' class='form-control "+required+" tFMONEY' title='이자율' style='width:60px;background-color:"+bgcolor+";'> %"
				  + "</td>";
		}else if(item_nm == '세율') {
			cHtml +="<td>"
				  + "	<input type='text' name='tax_rate' value='' maxlength='7' class='form-control "+required+" tFMONEY' title='세율' style='width:60px;background-color:"+bgcolor+";'> %"
				  + "</td>";
		}else if(item_nm == '목적사업') {
			cHtml +="<td>"
				  + "	<input type='hidden' name='bugt_cd' value=''><input type='hidden' name='bugt_yy' value=''>"
				  + "</td>";
			$("#slipItem"+item_cnt).hide();
		}else if(item_nm == '세부사업') {
			cHtml +="<td>"
				  + "	<select name='bugt_cd' class='bs-select form-control "+required+"' title='사업코드' style='background-color:"+bgcolor+";width:150px'><option value=''>선택</option></select>"
				  + "	<input type='hidden' name='bugt_yy' value=''>"
				  + "</td>";
		}else if(item_nm == '증빙구분') {
			var codeOpt = "<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE","","vat_cd","","","","",uSesEnt.dbo)%>";
			cHtml +="<td>"
				  + "	<select name='vat_cd' class='bs-select form-control "+required+"' title='증빙구분' style='background-color:"+bgcolor+";width:130px' onChange=\"change_vat_cd(this.value);\"><option value=''>선택</option>"+codeOpt+"</select>"
				  + "	<span id='spanVatAmt' style='display:none'>&nbsp;(부가세 : <input type='text' name='vat_amt' value='' class='form-control tMONEY' maxlength='13' title='부가세' style='width:120px;'> 원)</span>"
				  + "</td>";
		}else if(item_nm == '공급가액' || item_nm == '이자금액' || item_nm == '관련금액') {
			cHtml +="<td>"
				  + "	<input type='text' name='rel_amt' value='' maxlength='13' class='form-control "+required+" tMONEY' title='"+item_nm+"' style='width:120px;background-color:"+bgcolor+";'> 원"
				  + "</td>";
		}else if(item_nm == '증빙일자') {
			cHtml +="<td>"
				  + "	<div class='input-group input-medium date date-picker' data-date='' data-date-format='yyyy-mm-dd' data-date-viewmode='years'>"
				  + "		<input type='text' id='proof_ymd' name='proof_ymd' value='"+proof_ymd+"' maxlength='8' title='증빙일자' class='form-control required tYMD'>"
				  + "		<span class='input-group-btn'><button class='btn dark' type='button'><i class='fa fa-calendar'></i></button></span>"
				  + "	</div>"
				  + "</td>";
		}
		cHtml += "</tr>";
		$("#slipItemTable").append(cHtml);
		appendHtmlAfterWorkObj($("#slipItemTable"));
		item_cnt++;
	}
	
	function change_vat_cd(vat_cd) {
		if(vat_cd == '11' || vat_cd == '20') {
			$("#spanVatAmt").show();
		}else {
			$("#spanVatAmt").hide();
		}
	}

	function entity(p1, p2) {
		var key = ''; var val = '';
		this.key = p1; this.val = p2;
	}
</script>
