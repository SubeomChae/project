<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% 	String biz_nm = ""; 
	if(box.get("biz_id").substring(0,1).equals("2")) { biz_nm = "결재진행"; }
	else if(box.get("biz_id").substring(0,1).equals("3")) { biz_nm = "결재완료"; }
	else if(box.get("biz_id").substring(0,1).equals("4")) { biz_nm = "반려문서"; }
%>

<title><%=biz_nm%></title>

<script language="javascript">
	var signLineCnt = 0;
	function goSearch() {
		removeMask("#main");				
		document.main.action = 'sgn11001_list.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDetail(msg_no, send_empl_no, sign_order, msg_type) {
		ifrm.location.href = '/esign/fd/sgn01002_select.do?msg_no='+msg_no;

		$('#msg_no').val(msg_no);
		ajaxProcJsonList("PR_COMTB_MESG02_LIST@LIST001", {'param01' : msg_no}, function(rtn) {
			if(msg_type.substring(0,3) != 'ETC' && send_empl_no == '<%=uSesEnt.empl_no%>' && sign_order == '1') {
				document.getElementById('imgSignRemove').style.display = '';
			}else {
				document.getElementById('imgSignRemove').style.display = 'none';
			}
			
			for(var i=0; i < signLineCnt; i++) { try { $('#tr_line'+i).remove(); }catch(e) {} }
			signLineCnt = 0;
			
			for(var i=0; i < rtn.data.length; i++) {
				goAddTr(rtn.data[i]);
			}
			$("tr[id^='tr_line']").removeClass("bg-yellow");
    		$("tr[id^='tr_line0']").addClass("bg-yellow");
		});
	}
	
	function goAddTr(rsBox) {
		var signEnt = rsBox.sign_step_nm + 'Ð' + rsBox.sign_empl_nm + 'Ð' + rsBox.sign_status_nm + 'Ð' + rsBox.opinion;
		var cHtml = "<tr id='tr_line"+signLineCnt+"' onclick='goSignDetail("+signLineCnt+");'>"
				   + "	<td class='t-center'>"+rsBox.sign_empl_nm+"</td>"
				   + "	<td class='t-center'>"+rsBox.sign_step_nm+"</td>"
				   + "	<td class='t-center'><a title='" + rsBox.opinion + "'>" +  rsBox.sign_status_nm  + "</a></td>"
				   + "	<td class='t-center'>"
				   + "		"+rsBox.sign_date+""
				   + "		<input type='hidden' id='signEnt"+signLineCnt+"' name='signEnt"+signLineCnt+"' value='"+signEnt+"'></td>"
				   + "</tr>";
		$("#signLineTable").append(cHtml);
		goSignDetail(signLineCnt);
		signLineCnt++;
    }
    
    function goSignDetail(inx) {
    	if(inx == null  ||  inx == undefined) {
			document.main.tr_lineRow.value = '';
			document.getElementById('divSignStep').innerHTML = '';
			document.getElementById('divSignEmplNm').innerHTML = '';
			document.getElementById('divSignStatus').innerHTML = '';
			document.getElementById('divOpinion').innerHTML = '';
    	}else {
    		$("tr[id^='tr_line']").removeClass("bg-yellow");
    		$("tr[id^='tr_line"+inx+"']").addClass("bg-yellow");
	    	var singdata = $("#signEnt"+inx).val();
	    	singarr = singdata.split('Ð');
			document.getElementById('divSignStep').innerHTML = singarr[0];
			document.getElementById('divSignEmplNm').innerHTML = singarr[1];
			document.getElementById('divSignStatus').innerHTML = singarr[2];
			document.getElementById('divOpinion').innerHTML = singarr[3];
    	}
    }
	
	function goSignRemove() {
		if(confirm('작성중 상태로 회수하시겠습니까?')) {
			removeMask("#saveForm");
			ajaxSubmitForm("sgn11001_update.do?sign_status=0","#saveForm", function(rtn) {
				debugger;
				if(rtn.isOk == "Y") {
					toastPop1('작성중회수 처리되었습니다.');
					goSearch();
				}else {
					alert(rtn.errMsg);
				}
			});
		}	
	}
	
	$(function() {
		<% if(rsWp.getLength() > 0) { 
				out.println("setBackColor(0); goDetail('"+rsWp.get("msg_no",0)+"','"+rsWp.get("send_empl_no",0)+"','"+rsWp.get("sign_order",0)+"','"+rsWp.get("msg_type",0)+"');"); 
		   }else{ 
				out.println("document.getElementById('signTable').style.display = 'none'");
		   } %>
		fixTableHeader("MyTable");
		fixTableHeader("signLineTable");
	})
</script>
<h1 class="page-title"><%=biz_nm%></h1>

<div class="contentsRow">
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
			<input type="hidden" name="signListRow" value="">
			<input type="hidden" name="tr_lineRow" 	value="">
			<input type="hidden" name="biz_id" 		value="<%=box.get("biz_id")%>">
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
							<select name="msg_type" class='bs-select form-control' style="width:130px;">
								<option value=''>전체</option>
								<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("msg_type"),"msg_type","","","","")%>
							</select>
						</td>
					</tr>
					<tr>
						<td class="td-head">요청일자</td>
						<td nowrap style="padding-left: 5px">
							<div class="form-inline">
								<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd", Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="결산반영일(부터)" class="form-control required tYMD">
									<span class="input-group-btn">
										<button class="btn dark" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
								<span> ~ </span>
								<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd", Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
									<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="결산반영일(까지)" class="form-control required tYMD">
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
						<td>
							<input type="text" name="search_val" value="<%=box.get("search_val")%>"  class ='form-control'  style="width:180px; " onkeydown="if(event.keyCode == 13) goSearch('N');">
							<button type="button" class="btn btn-primary" onClick="goSearch('N');"><img src="/com/img/ico_btn_search.png">검색</button>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="table-scrollable scrollOptionY" style="height:calc(100vh - 200px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:10%;">
						<col style="width:*;">
						<col style="width:14%;">
						<col style="width:18%;">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
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
							<td><%=rsWp.get("row_num",i)%></td>
							<td><a href="#" title="<%=rsWp.get("opinion",i)%>" onClick="setBackColor('<%=i%>');goDetail('<%=rsWp.get("msg_no",i)%>','<%=rsWp.get("send_empl_no",i)%>','<%=rsWp.get("sign_order",i)%>','<%=rsWp.get("msg_type",i)%>')"><%=rsWp.get("subject",i)%></a></td>
							<td><a href="javascript:go_employee_info('<%=rsWp.get("send_empl_no",i)%>')"><%=rsWp.get("send_empl_nm",i)%></a></td>
							<td><%=StringUtil.replace(rsWp.get("send_date",i,Box.DEF_DATETIME_FMT_APM),"오","<br>오")%></td>
						</tr>	
						<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
			<% if(rsWp.getLength() > 0) { %>	
			<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
			<% } %>		
		</div>
		
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="frmArea" <% if(rsWp.getLength() > 0) { %>class="border-left border-right"<%}%> style="width:100%; height:calc(100vh - 196px);overflow-y:none; ">
				<iframe id ='ifrm' name="ifrm" marginwidth="0"  style="width:100%; height:100%;" frameborder="0" scrolling="no"></iframe>
			</div>
			<form id="saveForm" name="saveForm" method="post" action="" style="margin:0px">
			<input type="hidden" id="signListRow" name="signListRow" 	value="">
			<input type="hidden" id="tr_lineRow"  name="tr_lineRow" 	value="">
			<input type="hidden" id="biz_id"	  name="biz_id" 		value="<%=box.get("biz_id")%>">
			<input type="hidden" id="msg_no"	  name="msg_no" 		value="">
			<div id="signTable" class="row row-set">	
				<div class="col-md-6 col-xs-6 col-sm-6 row-set-col mar0 padR0" >
					<div class="table-scrollable scrollOptionY" style="height:105px;overflow-y:auto">
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
					<table class="table table-bordered table-cover">
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
								<td><div id="divOpinion" class="f-left"></div></td>
							</tr> 
							<tr>
								<th>결재상태</th>
								<td>
									<span style="width:100%;">
										<span id="divSignStatus" class="f-left"></span>
										<span id="imgSignRemove" class="f-left" style="display:none"><button type="button" class="btn btn-primary btn-table" onclick="goSignRemove('3')">작성중회수</button></span>
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