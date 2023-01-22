<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% 	int cha_cnt = 0;
	for(int i=0; i < rsWp.getLength(); i++) { 
		if(rsWp.get("cd_flag",i).equals("1")) { cha_cnt++; } 
	}
	obox.put("cha_cnt", String.valueOf(cha_cnt));	
%>
<!-- 지출결의서 -->
<script language="javascript">
	var rownum = <%=rsWp.getLength()%>;
	function goAddTr() {
		
<%	String vatCdOpt = "<option value=''></option>";
	RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE", "", "vat_cd","","","","",uSesEnt.dbo);
	RsWrapper vatCdWp = new RsWrapper();
	for(int i=0; i < codeWp.getLength(); i++) {
		if(codeWp.get("code",i).startsWith("3")) { continue; } // 신용카드 제외
		vatCdOpt += "<option value='"+codeWp.get("code",i)+"'>"+codeWp.get("data",i)+"</option>";
		vatCdWp.appendRs(codeWp.getRsBoxAt(i));
	}

	String acctCdOpt = "<option value=''>선택</option>";
	RsWrapper accWp = CodeUtil.getRsWrapper("PR_ACCTB_CODE01_LIST","LISTCODE", "", "722","A","","","",uSesEnt.dbo);
	for(int i=0; i < accWp.getLength(); i++) {
		acctCdOpt += "<option value='"+accWp.get("code",i)+"'>"+accWp.get("data",i)+"</option>";
	}
%>
		var cHtml = "<tr id='cha_tr_"+rownum+"'>"
				  + "	<td class='t-center'>"
				  + "   	<select name='acct_cd"+rownum+"' title='계정과목' class='bs-select required form-control' style='width:95%'>"
				  + "			<%=acctCdOpt%>"
				  + "		</select>"
				  + "   </td>"
				  + "	<td class='t-center'>"
				  + "		<input type='text' name='gong_amt"+rownum+"' value='' maxlength='13' title='공급가액' class='form-control required tMONEY' style='width:95%;ime-mode:active' onBlur=\"formatMaskElm(document.all['vat_amt"+rownum+"']); summarySlipAmt();\">"
				  + "	</td>"
				  + "	<td class='t-center'>"
				  + "		<select name='vat_cd"+rownum+"' title='증빙구분' class='bs-select form-control' style='width:95%' onChange=\"changeVatCd('"+rownum+"',this.value);\">"
				  + "			<%=vatCdOpt%>"
				  + "	 	</select>"
				  + "	</td>"
				  + "	<td class='t-center'>"
				  + "		<input type='text' name='vat_amt"+rownum+"' value='' maxlength='13' title='부가세' class='form-control tMONEY' style='width:95%' readOnly onBlur=\"formatMaskElm(document.all['vat_amt"+rownum+"']); summarySlipAmt();\">"
				  + "	</td>"
				  + "	<td class='t-center'>"
				  + " 		<div class='input-group'>"
				  + "			<input type='text' name='cust_nm"+rownum+"' value='' title='거래처' class='form-control' style='width:160px' readOnly>"
				  + "   		<button type='button' class='btn dark' onClick=\"javascript:findCustCode('&object_id="+rownum+"');\"><i class='fa fa-search'></i></button>"
				  + "   		<input type='hidden' name='cust_cd"+rownum+"' value=''>"
				  + "		</div>"
				  + "	</td>"
				  + "	<td class='t-center'>"
				  + "		<div class='input-group input-medium date date-picker' data-date='' data-date-format='yyyy-mm-dd' data-date-viewmode='years'>"
				  + "			<input type='text' name='proof_ymd"+rownum+"' value='<%=DateUtil.toString("yyyyMMdd")%>' maxlength='8' title='증빙일자' class='form-control required tYMD'>"
				  + "			<span class='input-group-btn'><button class='btn dark' type='button'><i class='fa fa-calendar'></i></button></span>"
				  + "		</div>"
				  + "	</td>"
				  + "	<td class='t-center'>"
				  + "		<button type='button' class='btn btn-primary btn-table' onClick=\"$('#cha_tr_"+rownum+"').remove();summarySlipAmt()\">삭제</button>"
				  + "		<input type='hidden' name='slip_seq"+rownum+"'	value=''>"
				  + "		<input type='hidden' name='cd_flag"+rownum+"' 	value='1'>";
				  + "	</td>"
				  + "</tr>";
		$("#chaTable").append(cHtml);
		appendHtmlAfterWork("#cha_tr_"+rownum);
		rownum++;
	}
	
	function goSave() {
		if(formValidate("#saveForm")) {
			var cnt = 0;
			for(var i=0; i < rownum; i++) {
				if(isObject('slip_seq'+i)) {
					if(document.all['cd_flag'+i].value == '1' && formatMaskElm(document.all['gong_amt'+i]) == 0) {
						alert('공급가액은 0원을 입력할 수 없습니다.');
						document.all['gong_amt'+i].focus();
						return;
					}else if(isEmpty(document.all['cust_cd'+i])) {
						alert('거래처가 입력되지 않았습니다.');
						return;
					}
					cnt++; 
				}
			}
			if(cnt == 0) {
				alert('지출내용이 입력되지 않았습니다.');
				return;
			}
			
			if(confirm("저장하시겠습니까?")) {
				removeMask("#saveForm");
				document.saveForm.input_cnt.value = rownum;
				ajaxSubmitForm("slp02002_update.do","#saveForm", function(rtn) {
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
		if(confirm("지출결의서를 삭제하시겠습니까?")) {
			removeMask("#saveForm");
			ajaxSubmitForm("slp02002_delete.do","#saveForm", function(rtn) {
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
		if(<%=obox.getLong("cha_amt")%> != <%=obox.getLong("dae_amt")%>) {
			alert('차변합계와 대변합계가 불일치하므로 승인요청할 수 없습니다.'); 
			return;
		}
		
		document.signForm.subject.value = document.saveForm.subject.value;
		document.signForm.msg_type.value = 'SLP009';
		document.signForm.search_key.value = 'ACCTB_SLIP01|' + document.saveForm.slip_no.value;
	<% 	String cust_nm = ""; String acct_nm = "";
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(!rsWp.get("cd_flag",i).equals("1")) { continue; }
			if(!rsWp.get("cust_nm",i).equals("")) { cust_nm = rsWp.get("cust_nm",i); }
			if(!rsWp.get("acct_nm",i).equals("")) { acct_nm = rsWp.get("acct_nm",i); }
			if(!cust_nm.equals("") && !acct_nm.equals("")) { break; }
		}
	%>	
		var opinion = document.saveForm.subject.value+"을(를) 위해 다음과 같이 지출하고자 합니다.\n"
					 + " - 금액 : <%=obox.get("cha_amt",Box.THOUSAND_COMMA)%>\n"
					 <%if(!cust_nm.equals("")){%>+ " - 거래처 : <%=cust_nm%>\n"<%}%>
					 <%if(!acct_nm.equals("")){%>+ " - 계정과목 : <%=acct_nm%>"<%}%>;
		document.signForm.opinion.value = opinion;
		document.signForm.send_empl_no.value = '<%=uSesEnt.empl_no%>';
		goSignRequest(document.signForm);
	}
	
	function signRequestPost() { goSearch(document.saveForm.slip_no.value); }
	
	function changeAcctCd(acct_cd) {
		if(acct_cd == '2100101') { // 미지급금
			changeObjectProperty(document.saveForm.rel_no, 'disabled');
			document.saveForm.rel_no.value = '';
			document.saveForm.rel_no_type.value = '';
			$("select[name='rel_no']").removeClass('required');
		}else {
			changeObjectProperty(document.saveForm.rel_no, 'required');
			document.saveForm.rel_no_type.value = '11';
			document.saveForm.rel_no.options.length=0;
			setOptionByProc('PR_FINTB_ACNO01_LIST@LISTCODE', document.saveForm.rel_no, '', acct_cd, '', '', '', '', '선택');
			$("select[name='rel_no']").addClass('required');
		}
	}
	
	function changeVatCd(inx, vat_cd) {
		if(vat_cd == '10' || vat_cd == '11' || vat_cd == '12') { // 세금계산서
			changeObjectProperty(document.all['vat_amt'+inx], 'required');
			changeObjectProperty(document.all['cust_nm'+inx], 'requiredOnly');
			document.all['proof_ymd'+inx].value = '';
		}else if(vat_cd == '40') { // 현금영수증
			changeObjectProperty(document.all['vat_amt'+inx], 'required');
			changeObjectProperty(document.all['cust_nm'+inx], 'readonly', false);
			document.all['proof_ymd'+inx].value = '';
		}else if(vat_cd == '' || vat_cd == '20' || vat_cd == '99') { // 계산서, 간이영수증
			changeObjectProperty(document.all['vat_amt'+inx], 'readonly', false);
			changeObjectProperty(document.all['cust_nm'+inx], 'readonly', false);
			document.all['vat_amt'+inx].value = '';
			summarySlipAmt();
		}else {
			changeObjectProperty(document.all['vat_amt'+inx], 'enabled');
			changeObjectProperty(document.all['cust_nm'+inx], 'readonly', false);
			document.all['proof_ymd'+inx].value = '';
		}
	}
	
	function summarySlipAmt() {
		var cha_cnt = 0; var cha_amt = 0;
		for(var i=0; i < rownum; i++) {
			if(!isObject('slip_seq'+i)) { continue; }
			cha_cnt++;
			cha_amt += parseInt(document.all['gong_amt'+i].value.replace(/,/g,""));
			if(!isEmpty(document.all['vat_amt'+i])) {
				cha_cnt++;
				cha_amt += parseInt(document.all['vat_amt'+i].value.replace(/,/g,""));
			}
		}    
		if(isNaN(cha_amt)) { cha_amt = 0; }
		document.saveForm.cha_cnt.value = cha_cnt;
		document.saveForm.cha_amt.value = cha_amt;
		document.saveForm.slip_amt.value = cha_amt;
		formatMaskElm(document.saveForm.cha_amt);
		formatMaskElm(document.saveForm.slip_amt);
	}

	$(function() {
	<% if(box.get("method").endsWith("write")) { %>
		goAddTr();
	<% } %>
	});
</script>

<form id="saveForm" name="saveForm" method="post" class="fType" action="" style="margin:0px">
<input type="hidden" name="slip_no"		value="<%=obox.get("slip_no")%>">
<input type="hidden" name="input_cnt" 	value="">

	<div class="table-scrollable">
		<table class="table table-view table-bordered">
	  		<tr>
				<th width="17%">사용목적</th>
				<td colspan="3"><input type="text" name="subject" value="<%=obox.get("subject")%>" maxlength="100" title="사용목적" class="form-control required" style="width:400px;ime-mode:active;"></td>
	  		</tr>
	  	<% if(box.get("method").endsWith("edit")) { %>
	  		<tr>
				<th width="17%">결재상태</th>
				<td width="35%" nowrap><b><font color=red><%=obox.get("sign_status_nm")%></font></b>&nbsp;&nbsp;
				<% if(obox.get("sign_status").equals("1")) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSign('2');">기안문작성</button>
				<% }else if(obox.get("sign_status").compareTo("2") > 0) { %>
					<button type="button" class="btn btn-primary btn-table" onClick="goSignLine('','SLP009','ACCTB_SLIP01|<%=obox.get("slip_no")%>');">결재라인</button>
				<% } %>
				</td>
				<th width="17%">전표번호</th>
				<td width="31%" nowrap>
					<a href="javascript:goSlipViewer('&slip_no=<%=obox.get("slip_no")%>');"><%=obox.get("slip_no",Box.SLIP_NO)%></a>
				</td>
	  		</tr>
	  	<% } %>
		</table>
	</div>
	
	<h2 class="page-title-2depth form-inline">
		지출내용
		<span id="cha_summary" class="marB5">
			[<input type="text" id="cha_cnt" name="cha_cnt" value="<%=obox.get("cha_cnt")%>" class="form-control acc-border tNUM" style="width:27px;height:16px;" readOnly>건],&nbsp;&nbsp;
			[<input type="text" id="cha_amt" name="cha_amt" value="<%=obox.get("cha_amt")%>" class="form-control acc-border tMONEY" style="width:120px;height:16px;" readOnly>원]
		</span>
	</h2>
	
	<div class="table-scrollable scrollOptionY" style="height:calc(200px)">
		<table id="chaTable" class="table table-view table-bordered">
			<colgroup>
				<col style="width:20%;">
				<col style="width:12%;">
				<col style="width:16%;">
				<col style="width:10%;">
				<col style="width:25%;">
				<col style="width:11%;">
				<col style="width:6%;">
			</colgroup>
			<thead>	
				<tr>
					<th>계정과목</th>
					<th>공급가액</th>
					<th>증빙구분</th>
					<th>부가세</th>
					<th>거래처</th>
					<th>증빙일자</th>
					<th><button type="button" class="btn btn-primary btn-table" onClick="goAddTr()">추가</button></th>
	         	</tr>
			</thead>
			<tbody>
	         <% for(int i=0; i < rsWp.getLength(); i++) { if(!rsWp.get("cd_flag",i).equals("1")) { continue; } %>
				<tr id="cha_tr_<%=i%>" class="t-center">
					<td class="t-center" nowrap>
						<select name="acct_cd<%=i%>" title="계정과목" class="bs-select form-control required" style="width:95%">
							<option value=''>선택</option>
							<%=CodeUtil.optList(accWp,rsWp.get("acct_cd",i))%>
						</select>
					</td>
					<td class="t-center">
						<input type="text" name="gong_amt<%=i%>" value="<%=rsWp.get("slip_amt",i)%>" maxlength="13" title="공급가액" class="form-control required tMONEY" style="width:95%;" onBlur="summarySlipAmt()">
					</td>
					<td class="t-center">
						<select name="vat_cd<%=i%>" title="증빙구분" class="bs-select form-control" style="width:95%" onChange="changeVatCd('<%=i%>',this.value)">
							<option value=''>선택</option>
							<%=CodeUtil.optList(vatCdWp,rsWp.get("vat_cd",i))%>
						</select>
					</td>
					<td class="t-center">
						<input type="text" name="vat_amt<%=i%>" value="<%=rsWp.get("vat_amt",i)%>" maxlength="13" title="부가세" class="form-control tMONEY <%=rsWp.get("vat_cd",i).startsWith("1")||rsWp.get("vat_cd",i).startsWith("2")?"required ":""%>" style="width:95%;" onBlur="summarySlipAmt()">
					</td>
					<td class="t-center">
						<div class="input-group">
							<input type="text" name="cust_nm<%=i%>" value="<%=rsWp.get("cust_nm",i)%>" maxlength="50" title="거래처" class="form-control <%=rsWp.get("vat_cd",i).startsWith("1")||rsWp.get("vat_cd",i).startsWith("2")?"required":""%>"  style="width:160px" readOnly>
							<button type="button" class="btn dark" onClick="javascript:findCustCode('&object_id=<%=i%>')"><i class="fa fa-search"></i></button>
							<input type="hidden" name="cust_cd<%=i%>" value="<%=rsWp.get("cust_cd",i)%>">
						</div>
					</td>
					<td class="t-center" nowrap>
						<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="proof_ymd<%=i%>" value="<%=rsWp.get("proof_ymd",i)%>" maxlength="8" title="증빙일자" class="form-control required tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</td>
					<td class="t-center"><button type="button" class="btn btn-primary btn-table" onClick="$('#cha_tr_<%=i%>').remove(); summarySlipAmt()">삭제</button></td>
					<input type="hidden" name="slip_seq<%=i%>" 	value="<%=rsWp.get("slip_seq",i)%>">
					<input type="hidden" name="cd_flag<%=i%>" 	value="1">
	         	</tr> 
	         <% } %>
         	</tbody>
		</table>
	</div>
	
	<h2 class="page-title-2depth form-inline">결제방법</h2>
	
	<div class="table-scrollable">
       	<% Box daeBox = new Box("");
       	   for(int i=0; i < rsWp.getLength(); i++) { 
       			if(rsWp.get("cd_flag",i).equals("2")) { 
       				daeBox = rsWp.getRsBoxAt(i);
       				break; 
       			}
       	   } 
       	   // 보통예금(1110103)
       	   String dae_acct_cd = FormatUtil.nvl2(daeBox.get("acct_cd"),"1110103");
       	   String dae_rel_no  = FormatUtil.nvl2(daeBox.get("rel_no"), "io_account_no");
       	   /* String dae_rel_no  = FormatUtil.nvl2(daeBox.get("rel_no"), wsfw.lib.config.Config.getInstance().getProperty("io_account_no")); */
       	%>
		<table id="daeTable" class="table table-view table-bordered">
			<colgroup>
				<col style="width:40%;">
				<col style="width:40%;">
				<col style="width:20%;">
			</colgroup>
			<thead>		
				<tr>
					<th>계정과목</th>
					<th>계좌번호</th>
					<th>결제금액</th>
	         	</tr> 
	        </thead>
	        <tbody>
				<tr>
					<td>
						<select name="dae_acct_cd" title="계정과목" class="bs-select form-control required" style="width:100%" onChange="changeAcctCd(this.value)">
							<option value=''>선택</option>
						<%	RsWrapper acctWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE", "","sign_acct_cd","","","","",uSesEnt.dbo);
							for(int i=0; i < acctWp.getLength(); i++) {
								if(acctWp.get("code",i).equals("2100401")) { continue; } // 미지급금(법인카드) 제외 %>
							<option value='<%=acctWp.get("code",i)%>' <%=acctWp.get("code",i).equals(dae_acct_cd)?"selected":""%>><%=acctWp.get("data",i)%></option>
						<%  } %>
						</select>
					</td>
					<td>
						<select name="rel_no" title="계좌번호" class="bs-select form-control <%=!dae_acct_cd.equals("2100101")?"required":""%>" style="width:100%" <%=!dae_acct_cd.equals("2100101")?"":"disabled"%>>
							<option value=''>선택</option>
							<%=CodeUtil.optList("PR_FINTB_ACNO01_LIST","LISTCODE",dae_rel_no, dae_acct_cd,"","","","",uSesEnt.dbo)%>
						</select>
						<input type="hidden" name="rel_no_type" value="<%=FormatUtil.nvl2(daeBox.get("rel_no_type"),"11")%>">
					</td>
					<td>
						<input type="text" id="slip_amt" name="slip_amt" value="<%=daeBox.get("slip_amt")%>" maxlength="13" class="form-control required tMONEY" title="결제" style="width:100%; border:1 solid gray;" readOnly>
					</td>
	         	</tr> 
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
				<button type="button" class="btn dark" onClick="goUbiViewer('WEB-INF/jsp/account/report/slp01001.jrf','P_PARAM01!SLP009,<%=obox.get("slip_no")%>!P_PARAM02!,ACCTB_SLIP01|<%=obox.get("slip_no")%>!')"><img src="/com/img/ico_btn_print.png">인쇄</button>
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

<form name="report" method="post" action="/com/redirect.do?reqUrl=report/report" style="display:none">
<input type="hidden" name="report_head"	value="">
<input type="hidden" name="report_id"	value="slp01001R">
<input type="hidden" name="param01"		value="">
</form>
