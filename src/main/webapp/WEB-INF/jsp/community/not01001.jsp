<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 쪽지목록 -->  
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(search_flag) {
		if(formValidate("#main")) {
			document.main.page_count.value = '';
			ajaxReplaceForm("not01001_list.do", "#main", "#divListData", function() {
				fixTableHeader("MyTable");	
			});
		}
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("not01001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goSend(send_id, send_nm, talk_body) {
			$('#send_id').val(send_id);
			$('#send_nm').val(send_nm);
			$('#talk_body').val(talk_body);
			$('#divEditModal').modal('show');
			$('#send_nm1').text($('#send_nm').val());
			$('#talk_body1').text($('#talk_body').val());
	}
	
	function go_send(receive_id, receive_nm, talk_body) {
		document.viewForm.receive_id.value = receive_id;
		document.viewForm.receive_nm.value = receive_nm;
		document.viewForm.talk_body.value = talk_body;
		$('#divViewModal').modal('show');
		$('#receive_nm').text(document.viewForm.receive_nm.value);
		$('#talk_body2').text(document.viewForm.talk_body.value);
	}
	
	function goDelete(talk_no, receive_id) {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("not01001_delete.do?talk_no="+talk_no+'&receive_id='+receive_id,"#main", function(rtn) {
				if(rtn.isOk == "Y") {
					returnFormSubmit(document.main, 'not01001_list.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	$(function(){
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">쪽지</h1>
	
	<table class="search-panel table table-bordered">
		<tbody>
			<colgroup>
				<col style="width:140px;">
				<col style="width:120px;">
				<col style="width:auto;">
			</colgroup>
			<tr>
				<td class="t-center">
					<select name="search_flag" class="bs-select form-control" style="width:90%" onChange="goSearch(this.value)">
						<option value="1" <%=box.get("search_flag").equals("1")?"selected":""%>>받은 쪽지함</option>
						<option value="2" <%=box.get("search_flag").equals("2")?"selected":""%>>보낸 쪽지함</option>
					</select>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:90%">
						<option value="1" <%=box.get("search_key").equals("1")?"selected":""%>>제목</option>
						<option value="2" <%=box.get("search_key").equals("2")?"selected":""%>>발신자</option>
						<option value="3" <%=box.get("search_key").equals("3")?"selected":""%>>수신자</option>
					</select>
				</td>
				<td width="180" style="padding-left:5px"><input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:150px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');"></td>
				<td class="td-head">기준일자</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("talk_ymd_from",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="talk_ymd_from" name="talk_ymd_from" value="<%=box.get("talk_ymd_from")%>" maxlength="8" title="기준일자(부터)" class="bs-select form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("talk_ymd_to",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="note_ymd_to" name="talk_ymd_to" value="<%=box.get("talk_ymd_to")%>" maxlength="8" title="기준일자(까지)" class="bs-select form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
							<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button></span>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</form>	

<div id="divListData" class="contentsRow">
<% } %>
			
	<div class="table-top-control">
		<div class="notice-view">
			<span style="color:#01a1db;">제목을 클릭</span>하면 해당 쪽지 세부내용을 검색할 수 있습니다.
		</div>
	</div>
	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 175px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<thead>
			<% if(box.get("search_flag").equals("1")) { // 받은 쪽지함 %>
				<tr class="t-center">
					<th>No</th>
					<th width="55%">제목</th>
					<th width="20%">보낸사람</th>
					<th width="20%">보낸시각</th>
	       		</tr>
	       	</thead>
	       	<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr><td colspan="4" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
		   	   for(int i=0; i < rsWp.getLength(); i++) {	
		   	   	String talk_body = rsWp.get("talk_body",i,Box.MULTILINE_TEXT); 
		   	   	talk_body = talk_body.indexOf("<br>") > 2 ? talk_body.substring(0, talk_body.indexOf("<br>")) : StringUtil.fixLength(talk_body, 30); 
		   	   	String show_body = StringUtil.replace(rsWp.get("talk_body",i),"\r\n","<br>");
		   	   	show_body = StringUtil.replace(show_body,"'",""); 
		   	   	show_body = StringUtil.replace(StringUtil.replace(show_body,"(","["),")","]"); %>
				<tr> 
					<td class="t-center"><%=rsWp.get("row_num",i)%></td>
					<td class="t-left"><a style='cursor:pointer' onClick="goSend('<%=rsWp.get("send_id", i)%>','<%=rsWp.get("send_nm", i)%>','<%=rsWp.get("talk_body", i)%>')"><%=talk_body%></a>
						<%if(rsWp.get("receive_date",i).equals("")){%><img src="/com/img/ico_new.gif" border="0"><%}%>
					</td>
					<td class="t-center"><%=rsWp.get("send_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
				</tr>
				<input type="hidden" name="talk_no"		value="<%=rsWp.get("talk_no",i)%>">
				<input type="hidden" name="receive_id"	value="<%=uSesEnt.empl_no%>">
				<% } %>
		  	<% } %>
		  	</tbody>
	  	</table>
	<% }else {  // 보낸 쪽지함 %>
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr class="t-center">
					<th width="5%">No</th>
					<th width="43%">제목</th>
					<th width="20%">보낸시각</th>
					<th width="10%">받은사람</th>
					<th width="20%">받은시각</th>
					<th width="30"></th>
          		</tr>
         		</thead> 
         		<tbody>
			<% if(rsWp.getLength() == 0) { %>
				<tr height="25"><td colspan="6" class="t-center">등록된 자료가 없습니다.</td></tr>
			<% }else {
			   	   for(int i=0; i < rsWp.getLength(); i++) {	
			   	   	String talk_body = rsWp.get("talk_body",i,Box.MULTILINE_TEXT); 
			   	   	talk_body = talk_body.indexOf("<br>") > 2 ? talk_body.substring(0, talk_body.indexOf("<br>")) : StringUtil.fixLength(talk_body, 30); 
			   	   	String show_body = StringUtil.replace(rsWp.get("talk_body",i),"\r\n","<br>"); 
			   	   	show_body = StringUtil.replace(StringUtil.replace(show_body,"(","["),")","]"); %>
					<tr height="25"> 
						<td><%=rsWp.get("row_num",i)%></td>
						<td class="t-left"><a style='cursor:pointer' onClick="go_send('<%=rsWp.get("receive_id", i)%>','<%=rsWp.get("receive_nm", i)%>','<%=rsWp.get("talk_body", i)%>')"><%=talk_body%></a>
						<td><%=rsWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
						<td><%=rsWp.get("receive_nm",i)%></td>
						<td><%=rsWp.get("receive_date",i,Box.DEF_DATETIME_FMT_APM)%></td>
						<td>
						<% if(rsWp.get("receive_date",i).equals("")) { %>
							<a href="#" onClick="javascript:goDelete('<%=rsWp.get("talk_no",i)%>','<%=rsWp.get("receive_id",i)%>');"><img src="/com/img/icon_tresh.png" border="0" align="absmiddle"></a>
						<% } %>
						</td>
					</tr>	
					<% } %>
	   			<% } %>
   			</tbody>
		</table>
		<% } %>
	</div>		
	<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>

<% if(box.get("search_flag").equals("1")) { %>
<div class="modal fade" id="divEditModal" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">답장보내기</h4>
			</div>
			<div class="modal-body">
			<form id="sendForm" name="sendForm" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" id="send_id"   name="send_id"      value="">
			<input type="hidden" id="send_nm"   name="send_nm"      value="">
			<input type="hidden" id="talk_body" name="talk_body"    value="">
				<table class="table table-view table-bordered table-cover marB5">
					<tbody>
						<tr>
							<th style="width:12%">보낸사람</th>
							<td><div id="send_nm1"></div></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><div id="talk_body1"></div></td>
							
						</tr>
					</tbody>
				</table>
				<div class="table-bottom-control">
					<span style="width:100%;">
						<span style="float:right;">
							<button type="button" class="btn dark" onclick="sendNote($('#send_id').val());"><img src="/com/img/ico_btn_confirm.png">답장보내기</button></a>
						</span>
					</span>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<% } else { %>
<div class="modal fade" id="divViewModal" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">답장보내기</h4>
			</div>
			<div class="modal-body">
			<form id="viewForm" name="viewForm" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden"   name="receive_id"   value="">
			<input type="hidden"   name="receive_nm"   value="">
			<input type="hidden"   name="talk_body"    value="">
				<table class="table table-view table-bordered table-cover marB5">
					<tbody>
						<tr>
							<th style="width:12%">보낸사람</th>
							<td><div id="receive_nm"></div></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><div id="talk_body2"></div></td>
							
						</tr>
					</tbody>
				</table>
				<div class="table-bottom-control">
					<span style="width:100%;">
						<span style="float:right;">
							<button type="button" class="btn dark" onclick="sendNote(document.viewForm.receive_id.value);"><img src="/com/img/ico_btn_confirm.png">답장보내기</button></a>
						</span>
					</span>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<% } %>