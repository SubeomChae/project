<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 예적금이체 -->
<%	RsWrapper chaWp = new RsWrapper();
	RsWrapper daeWp = new RsWrapper();
	Box daeBox = null;
	int row_index = -1;
	for(int i=0; i < rsWp.getLength(); i++) {
		if(rsWp.get("acct_cd",i).startsWith("11101") || rsWp.get("acct_cd",i).startsWith("11103") || rsWp.get("acct_cd",i).startsWith("11105")) { // 예금
			if(daeBox != null) { 
				daeWp.appendRs(daeBox); 
				daeBox = null;
			}
			
			if(rsWp.get("cd_flag",i).equals("1")) {
				chaWp.appendRs(rsWp.getRsBoxAt(i));
			}else if(rsWp.get("cd_flag",i).equals("2")) {
				daeBox = rsWp.getRsBoxAt(i);
			}
		}else if(rsWp.get("acct_cd",i).startsWith("61")) { // 이자수익 
			daeBox.put("intr_amt", rsWp.get("slip_amt",i));
		}else if(rsWp.get("acct_cd",i).startsWith("1110901")) { // 선급법인세
			daeBox.put("ltax_amt", rsWp.get("slip_amt",i));
			daeBox.put("tax_rate", rsWp.get("tax_rate",i));
		}else if(rsWp.get("acct_cd",i).startsWith("1110902")) { // 선급법인세
			daeBox.put("ljum_amt", rsWp.get("slip_amt",i));
		}
	}
	if(daeBox != null) { daeWp.appendRs(daeBox); }
%>
<script language="javascript">
	var rownum = <%=chaWp.getLength()+daeWp.getLength()%>;
	function goAddTr(id) {
		var cd_flag = id == 'chaTable' ? '1' : '2';
					
<%	String acctOpt = "<option value=''></option>";
	RsWrapper acctWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE", "", "account_type","","","","",uSesEnt.dbo);
	for(int i=0; i < acctWp.getLength(); i++) {
		acctOpt += "<option value='"+acctWp.get("code",i)+"'>"+acctWp.get("data",i)+"</option>";
    }
    
    RsWrapper custWp = CodeUtil.getRsWrapper("PR_FINTB_ACNO01_LIST","LISTCODE", "", "","","","","",uSesEnt.dbo);
%>			
		if(cd_flag == '2') {
			var cHtml = "<tr id='dae_tr_"+rownum+"'>"
					  + "	<td class='t-center'>"
					  + "  		<select name='acct_cd"+rownum+"' title='예적금유형' class='bs-select form-control required' style='width:95%' onChange=\"changeAcctCd('"+rownum+"',this.value);\">"
					  + " 			<%=acctOpt%>"
					  + " 		</select>"
					  + "   </td>"
					  + "	<td class='t-center'>"
					  + "		<select name='rel_no"+rownum+"' title='계좌번호' class='bs-select form-control required' style='width:95%' onChange=\"changeAcctNo('"+rownum+"');\"></select>"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "		<input type='text' name='slip_amt"+rownum+"' value='' maxlength='13' class='form-control required t-right tMONEY' title='금액' style='width:95%' onFocus=\"this.select();\" onBlur=\"formatMaskElm(document.saveForm.slip_amt"+rownum+"); auto_calc();\">"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "		<input type='text' name='intr_amt"+rownum+"' value='' maxlength='13' title='이자수익' class='form-control t-right tMONEY' style='width:95%' onFocus=\"this.select();\" onBlur=\"formatMaskElm(document.saveForm.intr_amt"+rownum+"); auto_calc();\">"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + " 		<input type='text' name='tax_rate"+rownum+"' value='' maxlength='2' title='세율' class='form-control t-right tNUM' style='width:95%' onFocus=\"this.select();\" onBlur=\"formatMaskElm(document.saveForm.tax_rate"+rownum+");\">"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "		<input type='text' name='ltax_amt"+rownum+"' value='' maxlength='13' title='선급법인세(법인세)' class='form-control t-right tMONEY' style='width:95%' onFocus=\"this.select();\" onBlur=\"formatMaskElm(document.saveForm.ltax_amt"+rownum+"); auto_calc();\">"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "		<input type='text' name='ljum_amt"+rownum+"' value='' maxlength='13' title='선급법인세(지방세)' class='form-control t-right tMONEY' style='width:95%' onFocus=\"this.select();\" onBlur=\"formatMaskElm(document.saveForm.ljum_amt"+rownum+"); auto_calc();\">"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "		<button type='button' class='btn btn-primary btn-table' onClick=\"$('#dae_tr_"+rownum+"').remove(); auto_calc();\">삭제</button>"
					  + "		<input type='hidden' name='slip_seq"+rownum+"' value=''>"
					  + "		<input type='hidden' name='cd_flag"+rownum+"'  value='"+cd_flag+"'>"
					  + "		<input type='hidden' name='cust_cd"+rownum+"'  value=''>"
					  + "		<input type='hidden' name='cust_nm"+rownum+"'  value=''>"
					  + "	</td>"
					  + "</tr>";
			$("#daeTable").append(cHtml);
			appendHtmlAfterWork("#dae_tr_"+rownum);
		} else {
			var cHtml = "<tr id='cha_tr_"+rownum+"'>"
			  		  + "	<td class='t-center'>"
			  		  + "  		<select name='acct_cd"+rownum+"' title='예적금유형' class='bs-select form-control required' style='width:95%' onChange=\"changeAcctCd('"+rownum+"',this.value);\">"
			  		  + " 			<%=acctOpt%>"
					  + " 		</select>"
					  + "   </td>"
					  + "	<td class='t-center'>"
					  + "		<select name='rel_no"+rownum+"' title='계좌번호' class='bs-select form-control required' style='width:95%' onChange=\"changeAcctNo('"+rownum+"');\"></select>"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "		<input type='text' name='slip_amt"+rownum+"' value='' maxlength='13' class='form-control required t-right tMONEY' title='금액' style='width:95%' onFocus=\"this.select();\" onBlur=\"formatMaskElm(document.saveForm.slip_amt"+rownum+"); auto_calc();\">"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + " 	</td>"
					  + "	<td class='t-center'>"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "	</td>"
					  + "	<td class='t-center'>"
					  + "		<button type='button' class='btn btn-primary btn-table' onClick=\"$('#cha_tr_"+rownum+"').remove(); auto_calc();\">삭제</button>"
					  + "		<input type='hidden' name='slip_seq"+rownum+"' value=''>"
					  + "		<input type='hidden' name='cd_flag"+rownum+"'  value='"+cd_flag+"'>"
					  + "		<input type='hidden' name='cust_cd"+rownum+"'  value=''>"
					  + "		<input type='hidden' name='cust_nm"+rownum+"'  value=''>"
					  + "	</td>"
					  + "</tr>";
			$("#chaTable").append(cHtml);
			appendHtmlAfterWork("#cha_tr_"+rownum);
		}
		rownum++;
    }
	
	function goSave() {
		if(formValidate("#saveForm")) {
			if(parseInt2(document.saveForm.cha_cnt) == 0 || parseInt2(document.saveForm.dae_cnt) == 0) {
				alert('입금내역 및 출금내역은 적어도 1건 이상 입력해야 합니다.');
				return;
			}else if(parseInt2(document.saveForm.cha_amt) != parseInt2(document.saveForm.dae_amt)) {
				alert('입금내역과 출금내역의 금액합계가 불일치합니다.');
				return;
			}
			
			if(confirm("저장하시겠습니까?")) {
				removeMask("#saveForm");
				document.saveForm.input_cnt.value = rownum;
				ajaxSubmitForm("fin13002_update.do","#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						goSearch(document.saveForm.slip_no.value);
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}	
	}

	function goDeleteAll() {
		if(confirm("예적금 이체내역을 삭제하시겠습니까?")) {
			removeMask("#saveForm");
			ajaxSubmitForm("fin13002_delete.do","#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					goSearch('');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function goSign(sign_status) {
		document.signForm.subject.value = document.saveForm.subject.value;
		document.signForm.msg_type.value = 'SLP011';
		document.signForm.search_key.value = 'ACCTB_SLIP01|' + document.saveForm.slip_no.value;
		document.signForm.send_empl_no.value = '<%=uSesEnt.empl_no%>';
		goSignRequest(document.signForm);
	}
	
	function signRequestPost() { goSearch(document.saveForm.slip_no.value); }
				
	function changeAcctCd(inx, acct_cd) {
		var opt_inx = 0;
		document.all['rel_no'+inx].options.length = 1;
		document.all['rel_no'+inx].options[opt_inx].text = '선택';
		
		<% for(int i=0; i < custWp.getLength(); i++) { %>
			var arr = '<%=custWp.get("optkey",i)%>'.split('|');
			if(acct_cd == arr[0]) {
				opt_inx = document.all['rel_no'+inx].options.length;
				document.all['rel_no'+inx].options.length++
				document.all['rel_no'+inx].options[opt_inx].value = '<%=custWp.get("code",i)%>';
				document.all['rel_no'+inx].options[opt_inx].text = '<%=custWp.get("data",i)%>';
				document.all['rel_no'+inx].options[opt_inx].title = '<%=custWp.get("optkey",i)%>';
			}
		<% } %>
	}
	
	function changeAcctNo(inx) {
		var arr = document.all['rel_no'+inx].options[document.all['rel_no'+inx].selectedIndex].title.split('|');
		if(arr.length < 1) {
			document.all['cust_cd'+inx].value = '';
			document.all['cust_nm'+inx].value = '';
		}else {
			if(arr[1] == '') { 
				alert('거래처가 등록되지 않은 계좌번호입니다.\n예적금관리에서 거래처 등록 후 사용 가능합니다.');
				document.all['rel_no'+inx].value = '';
				return;
			}
			document.all['cust_cd'+inx].value = arr[1];
			document.all['cust_nm'+inx].value = arr[2];
		}
	}
	
	function auto_calc() {
		var cha_cnt = 0; var cha_amt = 0;
		var dae_cnt = 0; var dae_amt = 0;
		for(var i=0; i < rownum; i++) {
			if(!isObject('slip_seq'+i)) { continue; }
			
			if(document.all['cd_flag'+i].value == '1') {
				cha_cnt++;
				cha_amt += parseInt2(document.all['slip_amt'+i]);
			}else {
				dae_cnt++;
				dae_amt += parseInt2(document.all['slip_amt'+i]);
				dae_amt += parseInt2(document.all['intr_amt'+i]);
				dae_amt -= parseInt2(document.all['ltax_amt'+i]);
				dae_amt -= parseInt2(document.all['ljum_amt'+i]);
			}
		}
		
		document.saveForm.cha_cnt.value = cha_cnt;
		document.saveForm.cha_amt.value = cha_amt;
		document.saveForm.dae_cnt.value = dae_cnt;
		document.saveForm.dae_amt.value = dae_amt;
		formatMaskElm(document.saveForm.cha_cnt);
		formatMaskElm(document.saveForm.cha_amt);
		formatMaskElm(document.saveForm.dae_cnt);
		formatMaskElm(document.saveForm.dae_amt);
	}

	$(function() {
	<% if(box.get("method").endsWith("write")) { %>
		goAddTr('daeTable');
		goAddTr('chaTable');
	<% } %>
	});
</script>

<form id="saveForm" name="saveForm" method="post" class="fType" action="">
<input type="hidden" name="slip_no"		value="<%=box.get("slip_no")%>">
<input type="hidden" name="input_cnt" 	value="">
  
	<div class="table-scrollable">
		<table class="table table-view table-bordered">
	  		<tr height="28">
				<th width="17%">적요</th>
				<td width="41%" nowrap>
					<input type="text" name="subject" value="<%=obox.get("subject")%>" maxlength="100" title="적요" class="form-control required" style="width:98%;ime-mode:active;">
				</td>
				<th width="17%">이체일자</th>
				<td width="25%">
					<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="proof_ymd" name="proof_ymd" value="<%=box.get("method").endsWith("write") ? DateUtil.toString("yyyyMMdd") : obox.get("proof_ymd")%>" maxlength="8" title="이체일자" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</td>
	  		</tr>
	  	<% if(box.get("method").endsWith("edit")) { %>
	  		<tr height="28">
				<th width="17%">결재상태</th>
				<td width="41%" nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").equals("1")) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSign();">기안문작성</button>
				<% }else { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('','SLP011','ACCTB_SLIP01|<%=obox.get("slip_no")%>');">결재라인</button>
				<% } %>
				</td>
				<th width="17%">전표번호</th>
				<td width="25%" nowrap>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
				</td>
	  		</tr>
	  	<% } %>
		</table>
	</div>
	
	<h2 class="page-title-2depth form-inline">출금내역
		<span id="dae_summary" class="marL10">
		[<input type="text" name="dae_cnt" value="<%=daeWp.getLength()%>" class="form-control acc-border tNUM" style="width:24px;height:16px" readOnly> 건],&nbsp;&nbsp;
		[<input type="text" name="dae_amt" value="<%=obox.getLong("dae_amt")%>" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
		</span>
	</h2>
	
	<div class="table-scrollable scrollOptionY" style="height:calc(200px)">
		<table id="daeTable" class="table table-view table-bordered">
			<colgroup>
				<col style="width:18%;">
				<col style="width:23%;">
				<col style="width:12%;">
				<col style="width:12%;">
				<col style="width:6%;">
				<col style="width:12%;">
				<col style="width:12%;">
				<col style="width:5%;">
			</colgroup>
			<thead>
				<tr>
					<th>예적금유형</th>
					<th>계좌번호</th>
					<th>출금액</th>
					<th>이자수익</th>
					<th>세율<br>(%)</th>
					<th>선급법인세<br>(법인세)</th>
					<th>선급법인세<br>(지방세)</th>
					<th>
					<% if(box.get("method").endsWith("write") || obox.get("sign_status").equals("1")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goAddTr('daeTable')">추가</button>
					<% } %>
					</th>
	         	</tr>
	         </thead>
	         <tbody> 
	         <% for(int i=0; i < daeWp.getLength(); i++) { row_index++; %>
				<tr id="dae_tr_<%=row_index%>">
					<td class="t-center">
						<select name="acct_cd<%=row_index%>" class="bs-select form-control required" title="예적금유형" style="width:95%" onChange="changeAcctCd('<%=row_index%>',this.value)">
							<option value=''>선택</option>
							<%=CodeUtil.optList(acctWp, daeWp.get("acct_cd",i))%>
						</select>
					</td>
					<td class="t-center">
						<select name="rel_no<%=row_index%>" class="bs-select form-control required" title="계좌번호" style="width:95%" onChange="changeAcctNo('<%=row_index%>')">
							<option value=''>선택</option>
							<%=CodeUtil.optList("PR_FINTB_ACNO01_LIST","LISTCODE",daeWp.get("rel_no",i),daeWp.get("acct_cd",i),"","","","",uSesEnt.dbo)%>
						</select>
					</td>
					<td class="t-center"><input type="text" name="slip_amt<%=row_index%>" value="<%=daeWp.get("slip_amt",i)%>" maxlength="13" title="출금액" class="form-control required tMONEY" style="width:95%" onBlur="auto_calc()"></td>
					<td class="t-center"><input type="text" name="intr_amt<%=row_index%>" value="<%=daeWp.get("intr_amt",i)%>" maxlength="13" title="이자수익" class="form-control tMONEY" style="width:95%" onBlur="auto_calc()"></td>
					<td class="t-center"><input type="text" name="tax_rate<%=row_index%>" value="<%=daeWp.get("tax_rate",i)%>" maxlength="2" title="세율" class="form-control tNUM" style="width:95%"></td>
					<td class="t-center"><input type="text" name="ltax_amt<%=row_index%>" value="<%=daeWp.get("ltax_amt",i)%>" maxlength="13" title="선급법인세(법인세)" class="form-control tMONEY" style="width:95%" onBlur="auto_calc()"></td>
					<td class="t-center"><input type="text" name="ljum_amt<%=row_index%>" value="<%=daeWp.get("ljum_amt",i)%>" maxlength="13" title="선급법인세(지방세)" class="form-control tMONEY" style="width:95%" onBlur="auto_calc()"></td>
					<td class="t-center"><button type="button" class="btn btn-primary btn-table" onClick="$('#dae_tr_<%=row_index%>').remove(); auto_calc();">삭제</button></td>
					<input type="hidden" name="slip_seq<%=row_index%>" 	value="<%=daeWp.get("slip_seq",i)%>">
					<input type="hidden" name="cd_flag<%=row_index%>" 	value="2">
					<input type="hidden" name="cust_cd<%=row_index%>" 	value="<%=daeWp.get("cust_cd",i)%>">
					<input type="hidden" name="cust_nm<%=row_index%>" 	value="<%=daeWp.get("cust_nm",i)%>">
	         	</tr> 
	         <% } %>
	         </tbody>
		</table>
	</div>			
	
	<h2 class="page-title-2depth form-inline">입금내역
		<span id="cha_summary" class="marL10">
		[<input type="text" name="cha_cnt" value="<%=chaWp.getLength()%>" class="form-control acc-border tNUM" style="width:24px;height:16px" readOnly> 건],&nbsp;&nbsp;
		[<input type="text" name="cha_amt" value="<%=obox.getLong("cha_amt")%>" class="form-control acc-border tMONEY" style="width:100px;height:16px" readOnly> 원]
		</span>
	</h2>			
	
	<div class="table-scrollable scrollOptionY" style="height:calc(200px)">
		<table id="chaTable" class="table table-view table-bordered">
			<colgroup>
				<col style="width:18%;">
				<col style="width:23%;">
				<col style="width:12%;">
				<col style="width:12%;">
				<col style="width:6%;">
				<col style="width:12%;">
				<col style="width:12%;">
				<col style="width:5%;">
			</colgroup>
			<thead>
				<tr>
					<th>예적금유형</th>
					<th>계좌번호</th>
					<th>입금액</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th>
					<% if(box.get("method").endsWith("write") || obox.get("sign_status").equals("1")) { %>
						<button type="button" class="btn btn-primary btn-table" onClick="goAddTr('chaTable')">추가</button>
					<% } %>
					</th>
	         	</tr>
	         </thead>
	         <tbody> 
	         <% for(int i=0; i < chaWp.getLength(); i++) { row_index++; %>
				<tr id="cha_tr_<%=row_index%>">
					<td class="t-center">
						<select name="acct_cd<%=row_index%>" title="예적금유형" class="bs-select form-control required" style="width:95%" onChange="changeAcctCd('<%=row_index%>',this.value)">
							<option value=''>선택</option>
							<%=CodeUtil.optList(acctWp, chaWp.get("acct_cd",i))%>
						</select>
					</td>
					<td class="t-center">
						<select name="rel_no<%=row_index%>" title="계좌번호" class="bs-select form-control required" style="width:95%" onChange="changeAcctNo('<%=row_index%>')">
							<option value=''>선택</option>
							<%=CodeUtil.optList("PR_FINTB_ACNO01_LIST","LISTCODE",chaWp.get("rel_no",i),chaWp.get("acct_cd",i),"","","","",uSesEnt.dbo)%>
						</select>
					</td>
					<td class="t-center"><input type="text" name="slip_amt<%=row_index%>" value="<%=chaWp.get("slip_amt",i)%>" maxlength="13" title="입금액" class="form-control required tMONEY" style="width:95%" onBlur="auto_calc()"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"></td>
					<td class="t-center"><button type="button" class="btn btn-primary btn-table" onClick="$('#cha_tr_<%=row_index%>').remove(); auto_calc();">삭제</button></td>
					<input type="hidden" name="slip_seq<%=row_index%>" 	value="<%=chaWp.get("slip_seq",i)%>">
					<input type="hidden" name="cd_flag<%=row_index%>" 	value="1">
					<input type="hidden" name="cust_cd<%=row_index%>" 	value="<%=chaWp.get("cust_cd",i)%>">
					<input type="hidden" name="cust_nm<%=row_index%>" 	value="<%=chaWp.get("cust_nm",i)%>">
	         	</tr> 
	         <% } %>
	         </tbody>
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
			<% if(box.get("method").endsWith("write") || obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { %>
				<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
	  		<% } %>
			<% if(obox.get("sign_status").equals("1") || obox.get("sign_status").equals("4")) { %>
				<button type="button" class="btn dark" onClick="goDeleteAll()"><img src="/com/img/ico_btn_delete.png">전체삭제</button>
	  		<% } %>
			<% if(box.get("method").endsWith("edit")) { %>
				<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/account/report/slp01001.jrf','P_PARAM01!SLP011,<%=obox.get("slip_no")%>!P_PARAM02!,ACCTB_SLIP01|<%=obox.get("slip_no")%>!')"><img src="/com/img/ico_btn_print.png">인쇄</button>
			<% } %>
			</span>
		</span>
	</div>
</form>

<form name="signForm" method="post" action="" style="display:none">
<input type="hidden" name="send_empl_no" 	value="">
<input type="hidden" name="subject" 		value="">
<input type="hidden" name="msg_type" 		value="">
<input type="hidden" name="search_key" 		value="">
<input type="hidden" name="opinion" 		value="">
<input type="hidden" name="nextUrl" 		value="">
</form>
