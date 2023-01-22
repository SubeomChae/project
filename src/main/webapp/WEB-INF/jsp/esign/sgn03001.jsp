<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="msgBox"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>결재대기</title>

<script language="javascript">
	var signLineCnt = 0;
	function goSearch() {
		removeMask("#main");				
		document.main.action = 'sgn03001_list.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDetail(msg_no, sign_seq, sign_step, sign_order) {
		ifrm.location.href = '/esign/fd/sgn01002_select.do?msg_no='+msg_no;
		$('#msg_no').val(msg_no);
		$('#sign_seq').val(sign_seq);
		$('#sign_step').val(sign_step);
		$('#sign_order').val(sign_order);
		
		ajaxProcJsonList("PR_COMTB_MESG02_LIST@LIST001", {'param01' : msg_no}, function(rtn) {
			for(var i=0; i < signLineCnt; i++) { try { $('#tr_line'+i).remove(); }catch(e) {} }
			signLineCnt = 0;
			
			for(var i=0; i < rtn.data.length; i++) {
				goAddTr(rtn.data[i]);
			}
		});
	}
												
	function goAddTr(rsBox) {
		var sign_seq =  rsBox .sign_seq ;// sinjax.GetObject(rsBox, 'sign_seq');
		var cHtml = "<tr id='tr_line"+signLineCnt+"'>"
				   + "	<td class='t-center'>"+rsBox.sign_empl_nm+"</td>"
				   + "	<td class='t-center'>"+rsBox.sign_step_nm+"</td>"
				   + "	<td class='t-center'><a title='" + rsBox.opinion + "'>" +  rsBox.sign_status_nm  + "</a></td>"
				   + "	<td class='t-center'>"+rsBox.sign_date+"</td>"
				   + "</tr>";		
		$("#signLineTable").append(cHtml);
		
		if(sign_seq == $('#sign_seq').val()) {
			$("tr[id^='tr_line"+signLineCnt+"']").addClass("bg-yellow");
			document.getElementById('divSignStep').innerHTML =   rsBox.sign_step_nm;   //sinjax.GetObject(rsBox, 'sign_step_nm');
		}
		signLineCnt++;
	}
	
	function goSign(sign_status) {
		var msg = '';
		if(sign_status == '3') {
			msg = '승인';
		}else {
			if(isEmpty(document.saveForm.opinion)) {
				alert('반려의견을 입력하여 주십시오.');
				document.saveForm.opinion.focus();
				return;
			}
			msg = '반려';
		}
		if(confirm(msg+'하시겠습니까?')) {
			removeMask("#saveForm");
			ajaxSubmitForm("sgn03001_update.do?sign_status="+sign_status,"#saveForm", function(rtn) {
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
			alert('승인할 자료가 선택되지 않았습니다.');
			return;
		}
		
		if(confirm('선택한 자료를 일괄 승인처리하시겠습니까?')) {
			removeMask("#listForm");
			ajaxSubmitForm("sgn02001_update.do?sign_status=sign_all","#listForm", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('승인 처리되었습니다.');
					goSearch();
				}else {
					alert(rtn.errMsg);
				}
			});
		}	
	}
	
	function go_select_all(val) {
		for(var i=0; i < <%=rsWp.getLength()%>; i++) {
			document.all['msg_entity'+i].checked = val;
		}
	}
	
	$(function() {
		<%  if(rsWp.getLength() > 0) { 
				out.println("setBackColor(0); goDetail('"+rsWp.get("msg_no",0)+"','"+rsWp.get("sign_seq",0)+"','"+rsWp.get("sign_step",0)+"','"+rsWp.get("sign_order",0)+"');"); 
			}else{ 
				out.println("document.getElementById('signTable').style.display = 'none'");
	   		} %>
	   		
		try { parent.parent.topFrame.reload_msg_cnt(<%=msgBox.getInt("talk_cnt")%>, <%=msgBox.getInt("wait_cnt")%>, <%=msgBox.getInt("sign_cnt")%>, <%=msgBox.getInt("refer_cnt")%>); 
		} catch(e) {}
		fixTableHeader("MyTable");
		fixTableHeader("signLineTable");
	});
</script>
<input type="hidden" name="selectedRow" value="">

<h1 class="page-title">결재대기</h1>

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
					<tr height="28">
						<td class="td-head">문서구분</td> 
						<td width="75%" style="padding-left:5px">
							<select name="msg_type" class='bs-select form-control' style="width:130px;">
								<option value=''>전체</option>
								<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("msg_type"),"msg_type","","","","")%>
							</select>
						</td>
					</tr>
					<tr height="28">
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
							<select name="search_key" class='bs-select form-control' style="width:90px">
								<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>제목</option>
								<option value='4' <%=box.get("search_key").equals("4")?"selected":""%>>전표번호</option>
								<option value='5' <%=box.get("search_key").equals("5")?"selected":""%>>문서번호</option>
								<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>요청자 성명</option>
								<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>요청자 사번</option>
							</select>
						</td>
						<td style="padding-left:5px">
							<input type="text" name="search_val" value="<%=box.get("search_val")%>"  class ='form-control'  style="width:180px; " onkeydown="if(event.keyCode == 13) goSearch('N');">
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
			<form id="listForm" name="listForm" method="post" action="" style="margin:0px">
			<div class="table-scrollable scrollOptionY"" style="height:calc(100vh - 220px); ">
				<input type="hidden" name="input_cnt" value="<%=rsWp.getLength()%>">
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
					<thead>
					<tbody> 
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="4">등록된 자료가 없습니다.</td></tr>
					<% }else {
						for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>"> 
							<td>
								<label class="mt-checkbox mt-checkbox-outline" style="width:10px"> 
									<input type="checkbox" name="msg_entity<%=i%>" value="<%=rsWp.get("msg_no",i)%>Ð<%=rsWp.get("sign_seq",i)%>Ð<%=rsWp.get("sign_step",i)%>Ð<%=rsWp.get("sign_order",i)%>"><span/>
								</label>
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
			<div id="frmArea" <% if(rsWp.getLength() > 0) { %>class="border-left border-right"<%}%>  style="width:100%; height:calc(100vh - 244px); overflow-y:none; ">
				<iframe id ='ifrm' name="ifrm" marginwidth="0"  style="width:100%; height:100%;" frameborder="0" scrolling="no"></iframe>
			</div>
			<form id="saveForm" name="saveForm" method="post" action="" style="margin:0px">
			<input type="hidden" id="msg_no"	   name="msg_no"		value="">
			<input type="hidden" id="sign_seq"     name="sign_seq"		value="">
			<input type="hidden" id="sign_step"    name="sign_step" 	value="">
			<input type="hidden" id="sign_order"   name="sign_order" 	value="">
			<input type="hidden" id="real_empl_no" name="real_empl_no" 	value="<%=uSesEnt.empl_no%>">
			<div id="signTable" class="row row-set">	
				<div class="col-md-6 col-xs-6 col-sm-6 row-set-col mar0 padR0" >
					<div class="table-scrollable scrollOptionY" style="height:161px;overflow-y:auto">
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
				<div class="col-md-6 col-xs-6 col-sm-6 row-set-col mar0 pad0">
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
								<th>접수담당자</th>
								<td><div class="f-left"><%=uSesEnt.empl_nm%> <%=uSesEnt.position_nm%></div></td>
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
										<button type="button" class="btn dark" onclick="goSign('3')"><img src="/com/img/ico_btn_confirm.png">승인</button>
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
</form>