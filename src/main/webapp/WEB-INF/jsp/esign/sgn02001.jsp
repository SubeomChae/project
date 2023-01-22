<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="msgBox"	class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>접수대기</title>
<script language="javascript">
	var signLineCnt = 0;
	function goSearch() {
		removeMask("#mian");				
		document.main.action = 'sgn02001_list.do';
		document.main.target = '_self';
		document.main.submit();
	}

	function goDetail(msg_no, sign_seq, sign_step, sign_order, msg_type) {
		ifrm.location.href = '/esign/fd/sgn01002_select.do?msg_no='+msg_no+'&isEditable=Y';
		$('#msg_no').val(msg_no);
		$('#sign_seq').val(sign_seq);
		$('#sign_step').val(sign_step);
		$('#sign_order').val(sign_order);
		$('#msg_type').val(msg_type);
		
		ajaxProcJsonList("PR_COMTB_MESG02_LIST@LIST001", {'param01' : msg_no}, function(rtn) {
			for(var i=0; i < signLineCnt; i++) { try { $('#tr_line'+i).remove(); }catch(e) {} }
			signLineCnt = 0;
			
			for(var i=0; i < rtn.data.length; i++) {
				goAddTr(rtn.data[i]);
			}
		});
	} 
	
	function goAddTr(rsBox) {
		var sign_seq = rsBox.sign_seq
		if(sign_seq == $('#sign_seq').val()) {
			document.getElementById('divSignStep').innerHTML = rsBox.sign_step_nm 
			<% Box corpBox = CodeUtil.getRsBox("PR_DUAL", "EXEC_QUERY", "COMTB_CORP01", "accounting_flag", "corp_cd='"+uSesEnt.dbo+"'", "","",uSesEnt.dbo);
			   if(corpBox.get("accounting_flag").equals("2")) { // 결산반영방식(최종결재자 승인) : 접수 시, 결산반영일 업데이아트 %>	
				var sign_step = rsBox.sign_step;
				if(sign_step == '30' && $('#msg_type').val().substring(0,3) == 'SLP') {
					document.getElementById('divSignStep').innerHTML =  " <div class='form-inline'>"
																	 +  " 	(결산반영일 : <div id='date-top' class='input-group input-medium date date-picker' data-date='<%=box.get("acc_sign_ymd",Box.DEF_DATE_FMT)%>' data-date-format='yyyy-mm-dd' data-date-viewmode='years'>" 
																	 +  "	 <input type='text' id='acc_sign_ymd' name='acc_sign_ymd' value='<%=DateUtil.toString("yyyy-MM-dd")%>' maxlength='8' title='결산반영일' class='form-control tYMD'>"
																	 +  "	 <span class='input-group-btn'><button class='btn dark' type='button'><i class='fa fa-calendar'></i></button></span></div>)"
																	 +  " </div>";
				}
				appendHtmlAfterWorkObj($("#divSignStep"));
				$("#date-top").data("datepicker")._process_options({ orientation: "auto" + " " + "top" });
			<% } %>	
		}
		var cHtml2 = "<tr id='tr_line"+signLineCnt+"'>"
				  + "	<td class='t-center'>"+rsBox.sign_empl_nm+"</td>"
				  + "	<td class='t-center'>"+rsBox.sign_step_nm+"</td>"
				  + "	<td class='t-center'><a title='" + rsBox.opinion + "'>" +  rsBox.sign_status_nm  + "</a></td>"
				  + "	<td class='t-center'>";
				  if(sign_seq == $('#sign_seq').val()) {
					cHtml2 += "<label class='mt-checkbox mt-checkbox-outline marL5'>"
						  + "<input type='checkbox' id='new_line' name='new_line' value='Y' checked onClick=\"check_new_line()\">결재선지정<span/></label>";
						$('#opinion').val(rsBox.opinion);
				}else {
					cHtml2 =+ rsBox.sign_date; 
				}
			cHtml2  += "	</td>"
				    + "</tr>";		
		$("#signLineTable").append(cHtml2);
		$("tr[id^='tr_line"+signLineCnt+"']").addClass("bg-yellow");
		check_new_line();
		signLineCnt++;
    }
    
	function goSign(sign_status) {
		if((sign_status == '3' || sign_status == 'recieve_all') && $("input:checkbox[id='new_line']").is(":checked")) {
			var signWp = new Array();
			var lineCnt = 0;
			var max_step = '';
			
			// 협조(20)
			for(var i=0; i < empl20_cnt; i++) {
				try {
					signWp[lineCnt++] = '20'+document.all['sign_empl20'+i].value;
				}catch(e) {}
			}
		
			// 선임,팀장,임원,대표이사(31~35)
			for(var i=31; i <= 35; i++) {
				try {
					var empl_no = eval('document.saveForm.sign_empl'+i).value;
					if(empl_no != '') {
						signWp[lineCnt++] = i + empl_no;
						if(i > max_step) { max_step = i; }
					}
				}catch(e) {}
			}
			if(max_step == '' || max_step < 32) {
				alert('최종 결재권자는 팀장 이상으로 지정해야 합니다.');
				return;
			}

			// 참조(40)
			for(var i=0; i < empl40_cnt; i++) {
				try {
					signWp[lineCnt++] = '40'+document.all['sign_empl40'+i].value;
				}catch(e) {}
			}
				
			// 순위매기기
			var sign_step = '';
			var sign_empl_no = '';
			var sign_order = '';
			var rank = 1;
			var cnt20 = 0;
			for(var i=0; i < signWp.length; i++) {
				sign_step += signWp[i].substring(0,2) + 'Ð';
				sign_empl_no += signWp[i].substring(2) + 'Ð';
				if(signWp[i].substring(0,2) == '20') { 
					cnt20++; if(cnt20 == 1) { rank++; }
					sign_order += (rank < 10 ? '0' : '') + rank + 'Ð';
				}else if(signWp[i].substring(0,2) == '40') { 
					sign_order += '00' + 'Ð';
				}else { 
					rank++; 
					sign_order += (rank < 10 ? '0' : '') + rank + 'Ð';
				}
			}
			$('#new_sign_step').val(sign_step);
			$('#new_sign_empl_no').val(sign_empl_no);
			$('#new_sign_order').val(sign_order);
		}
	
		var msg = '';
		if(sign_status == '3') {
			msg = '접수';
		}else if(sign_status == 'recieve_all') {
			msg = '일괄 접수';
		}else {
			msg = '반려';
			if(isEmpty(document.saveForm.opinion)) {
				alert('반려의견을 입력하여 주십시오.');
				document.saveForm.opinion.focus();
				return;
			}else {
				var lth = getByteLengthVal(document.saveForm.opinion);
				if(lth > 500) {
					alert('반려의견은 500Byte 이내로 입력하시기 바랍니다.(현재 '+lth+'Byte)');
					document.saveForm.opinion.focus();
					return;
				}
			}
		}
		if(confirm(msg+'하시겠습니까?')) {
			removeMask("#saveForm");
			ajaxSubmitForm("sgn02001_update.do?sign_status="+sign_status,"#saveForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('저장되었습니다.');
					goSearch();
				}else {
					alert(rtn.errMsg);
				}
			});
		}	
	}
	
	function goSignAll() {
		var isOK = false;
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			if(document.all['msg_entity'+i].checked) {
				isOK = true;
				break;
			}
		}
		if(!isOK) {
			alert('접수할 자료가 선택되지 않았습니다.');
			return;
		}
		
		var msg_entity = '';
		<% for(int i=0; i < rsWp.getLength(); i++) { %> 
			if(document.all['msg_entity<%=i%>'].checked){ 
				msg_entity += document.listForm.msg_entity<%=i%>.value + 'Ð';
			}
		<% } %>
		document.saveForm.msg_entity.value = msg_entity;
		
		goSign('recieve_all');
	}
	
	function go_select_all(val) {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			document.all['msg_entity'+i].checked = val;
		}
	}

    function check_new_line() {
    	if($("input:checkbox[id='new_line']").is(":checked")) {
    		document.getElementById('newLineTable').style.display = '';
    		document.getElementById("frmArea").style.height = "calc(100vh - 334px)";
    	}else {
    		document.getElementById('newLineTable').style.display = 'none';
    		document.getElementById("frmArea").style.height = "calc(100vh - 250px)";
    	}
    }

	function goTabpage(tabIdx) {
		var account_no =	$("[name='account_no']").val();
		var theUrl = "";
		if(tabIdx == 0) {
			theUrl = "fin11002_edit.do";
		}else if(tabIdx == 1) {
			theUrl = "fin12001_list.do";
		}
		document.ifrm.location.href = theUrl+"?account_no="+ account_no;		 
	} 
	
	$(function() {
		<%  if(rsWp.getLength() > 0) { 
				out.println("setBackColor(0); goDetail('"+rsWp.get("msg_no",0)+"','"+rsWp.get("sign_seq",0)+"','"+rsWp.get("sign_step",0)+"','"+rsWp.get("sign_order",0)+"','"+rsWp.get("msg_type",0)+"');"); 
			}else{ 
				out.println("document.getElementById('signTable').style.display = 'none'");
			}%>
		try { parent.parent.topFrame.reload_msg_cnt(<%=msgBox.getInt("talk_cnt")%>, <%=msgBox.getInt("wait_cnt")%>, <%=msgBox.getInt("sign_cnt")%>, <%=msgBox.getInt("refer_cnt")%>); 
		} catch(e) {}
		fixTableHeader("MyTable");
		fixTableHeader("signLineTable");
	});
</script>


<h1 class="page-title">접수대기</h1>

<div class="contentsRow">
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
		<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
		<input type="hidden" name="selectedRow" value="">
			<table class="search-panel table table-bordered">
				<colgroup>
					<col style="width: 25%;"/>
					<col style="width: 75%;"/>
				</colgroup>
				<tbody>
					<tr>
						<td class="td-head">문서구분</td> 
						<td>
							<select name="msg_gbn" class='bs-select form-control' style="width:130px;">
								<option value=''>전체</option>
								<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("msg_gbn"),"msg_type","","","","")%>
							</select>
						</td>
					</tr>
					<tr>
						<td class="td-head">요청일자</td>
						<td nowrap style="padding-left: 5px">
							<div class="form-inline">
								<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd", Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="결산반영일(부터)" class="form-control tYMD">
									<span class="input-group-btn">
										<button class="btn dark" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<span> ~ </span>
								<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd", Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="결산반영일(까지)" class="form-control tYMD">
									<span class="input-group-btn">
										<button class="btn dark" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
						</td>
					</tr>	
					<tr>
						<td class="td-head">
							<select name="search_key" class='bs-select form-control' style="width:90%">
								<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>제목</option>
								<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>전표번호</option>
								<option value='5' <%=box.get("search_key").equals("5")?"selected":""%>>문서번호</option>
								<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>요청자 성명</option>
								<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>요청자 사번</option>
							</select>
						</td>
						<td style="padding-left:5px">
							<input type="text" name="search_val" value="<%=box.get("search_val")%>"  class ='form-control'  style="width:180px;" onkeydown="if(event.keyCode == 13) goSearch('N');">
							<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="table-top-control">
				<span style="width: 100%;">
					<span style="float: left;">
						<button id="btnSave" type="button" class="btn btn-primary btn-table" onClick="go_select_all(true)">전체선택</button>
						<button id="btnSave" type="button" class="btn btn-primary btn-table" onClick="go_select_all(false)">선택해제</button>
					</span>
					<span style="float: right;">
						<button id="btnSave" type="button" class="btn dark" onClick="goSignAll()">일괄승인</button>
					</span>
				</span>
			</div>	
			
			<form name="listForm" method="post" action="" style="margin:0px">
			<div class="table-scrollable scrollOptionY" style="height:calc(100vh - 220px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:10%;">
						<col style="width:*;">
						<col style="width:14%;">
						<col style="width:18%;">
					</colgroup>
					<thead>
						<tr>
							<th>선택</th>
							<th>제목</th>
							<th>요청자</th>
							<th>요청일시</th>
						</tr> 
					</thead>
					<tbody>
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="4" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else {
						for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>"> 
							<td>
								<label class="mt-checkbox mt-checkbox-outline" style="width:10px"> 
									<input type="checkbox" name="msg_entity<%=i%>" value="<%=rsWp.get("msg_no",i)%>"><span/>
								</label>
							</td>
							<td><a href="#" title="<%=rsWp.get("opinion",i)%>" onClick="setBackColor('<%=i%>');goDetail('<%=rsWp.get("msg_no",i)%>','<%=rsWp.get("sign_seq",i)%>','<%=rsWp.get("sign_step",i)%>','<%=rsWp.get("sign_order",i)%>','<%=rsWp.get("msg_type",i)%>')"><%=rsWp.get("subject",i)%></a></td>
							<td><a href="javascript:goEmployeePop('<%=rsWp.get("send_empl_no",i)%>')"><%=rsWp.get("send_empl_nm",i)%></a></td>
							<td><%=StringUtil.replace(rsWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM),"오","<br>오")%></td>
						</tr>	
						<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
			</form>
			<% if(rsWp.getLength() > 0) { %>	
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
			<% } %>		
		</div>
		
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="frmArea" <% if(rsWp.getLength() > 0) { %>class="border-left border-right"<%}%>  style="width:100%; height:calc(100vh - 330px); overflow-y:none; ">
				<iframe id ='ifrm' name="ifrm" marginwidth="0"  style="width:100%; height:100%;" frameborder="0" scrolling="no"></iframe>
			</div>
			<form id="saveForm" name="saveForm" method="post" action="" style="margin:0px">
			<input type="hidden" id="msg_no"           name="msg_no" 			value="">
			<input type="hidden" id="sign_seq"         name="sign_seq"			value="">
			<input type="hidden" id="sign_step"        name="sign_step" 		value="">
			<input type="hidden" id="sign_order"       name="sign_order" 		value="">
			<input type="hidden" id="msg_type"         name="msg_type" 			value="">
			<input type="hidden" id="real_empl_no"     name="real_empl_no" 		value="<%=uSesEnt.empl_no%>">
			<input type="hidden" id="new_sign_step"    name="new_sign_step" 	value="">
			<input type="hidden" id="new_sign_order"   name="new_sign_order" 	value="">
			<input type="hidden" id="new_sign_empl_no" name="new_sign_empl_no" 	value="">
			<input type="hidden" id="msg_entity"       name="msg_entity" 		value="">	
			<%@ include file="signUp.jsp" %>
			<div id="signTable" class="row row-set">	
				<div class="col-md-6 col-xs-6 col-sm-6 row-set-col mar0 padR0" >
					<div class="table-scrollable scrollOptionY" style="height:165px;overflow-y:auto">
					<table id="signLineTable" class="table table-bordered">
						<colgroup>
							<col style="width:20%;">
							<col style="width:25%;">
							<col style="width:20%;">
							<col style="width:35%;">
						</colgroup>
						<thead>
							<tr>
								<th>결재자</th>
								<th>결재단계</th>
								<th>결재상태</th>
								<th>결재일시</th>
							</tr>
						</thead>
					</table>
					</div>
				</div>	
				<div class="col-md-6 col-xs-6 col-sm-6 row-set-col mar0 padL0">
					<table class="table table-bordered table-cover mar0">
						<colgroup>
							<col style="width:30%;">
							<col style="width:70%;">
						</colgroup>
						<thead>
							<tr>
								<th>결재단계</th>
								<td><div id="divSignStep" class="f-left"></div></td>
							</tr> 
							<tr>
								<th>결재자</th>
								<td><div id="divSignEmplNm" class="f-left"></div></td>
							</tr> 
							<tr>
								<th>의견</th>
								<td>
									<textarea name="opinion" style="height:70px;width:100%;"></textarea>
								</td>
							</tr> 
							<tr>
								<th>결재상태</th>
								<td>
									<span style="width:100%;">
										<button type="button" class="btn dark" onclick="goSign('3')"><img src="/com/img/ico_btn_confirm.png">접수</button>
										<button type="button" class="btn dark" onClick="goSign('4')"><img src="/com/img/ico_btn_cancel.png">반려</button>
									</span>
								</td>
							</tr> 
						<thead>
					</table>
				</div>
			</div>
			</form>
		</div>
	</div>
</div> 