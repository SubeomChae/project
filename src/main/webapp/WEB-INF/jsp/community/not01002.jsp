<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 새 쪽지 쓰기  -->
<script language='javascript'>
	var emplCnt = 0;
	function goAddEmpl(id) {
		var arr = id.split('|');
		if(isEmpty(document.main.emplList)) {
			alert('받는사람이 선택되지 않았습니다.');
			document.main.emplList.focus();
			return;
		}else {
			if(document.main.send_id.value == arr[0]) {
				alert('본인을 수신자로 지정할 수 없습니다.');
				return;
			}
			
			for(var i=0; i <= emplCnt; i++) {
				if(isObject('receive_id'+i)) {
					if(document.all['receive_id'+i].value == arr[0]) {
						alert('이미 지정된 수신자입니다.');
						document.main.emplList.focus();
						return;
					}
				}
			}
		}
		
		var tbody = document.getElementById('MyTable').getElementsByTagName("TBODY")[0];
		var row = document.createElement("TR");
        row.id = "receiveEmpRow"+emplCnt;  row.align="left";
		var td0 = document.createElement("TD"); td0.style.border="none"; td0.style.fontSize="12px";
		td0.innerHTML = getSelectedText(document.main.emplList) + ' ' + arr[1] + '  '
					  + "<button type=button class=btn btn-primary btn-table marR0 onclick=removeNode('receiveEmpRow"+emplCnt+"');>삭제</button>"
					  + "<input type='hidden' name='receive_id"+emplCnt+"' value='"+arr[0]+"'>";
		row.appendChild(eval("td0"));
		tbody.appendChild(row);
		emplCnt++;
    }

	function goSend() {
		if(formValidate("#main")) {
			var receive_id = '';
			for(var i=0; i < emplCnt; i++) {
				if(isObject('receive_id'+i) && !isEmpty(document.all['receive_id'+i])) {
					receive_id += document.all['receive_id'+i].value + ';';
				}
			}
			
			if(receive_id == '') {
				alert('받는사람이 지정되지 않았습니다.');
				return;
			}

			if(document.main.talk_body.value.length < 10) {
				alert('쪽지 내용은 10자 이상으로 입력하셔야 합니다.');
				return;
			}
			
			if(confirm('발송하시겠습니까?')) {
				removeMask("#main");
				document.main.receive_id.value = receive_id;
				document.main.action = 'not01002_insert.do';
				document.main.target = "_self";
				document.main.submit();
				self.close();
				alert("발송되었습니다");
				
			}
		}		
	}
	
	function removeNode(id) {
		var cNode = document.getElementById(id);
		cNode.parentNode.removeChild(cNode);
	}
	
	function changeDeptCd(dept_cd) {
		document.main.emplList.options.length = 1;
		if(dept_cd != '') {
			ajaxProcJsonList("PR_INSTB_EMPL01_LIST@LIST004", {'param01' : dept_cd}, function(rtn) {
				for(var i=0; i < rtn.data.length; i++) {
		       		var pos = document.main.emplList.options.length++;
		       		document.main.emplList.options[pos].value = rtn.data[i].empl_no + '|' + rtn.data[i].position_nm;
		       		document.main.emplList.options[pos].text = rtn.data[i].empl_nm;
				}
			});	
		}
	}
	
	$(function() {
	<% if(!obox.get("empl_no").equals("")) { %>
		var tbody = document.getElementById('MyTable').getElementsByTagName("TBODY")[0];
		var row = document.createElement("TR");
        row.id = "receiveEmpRow"+emplCnt;  row.align="left";
		var td0 = document.createElement("TD"); td0.style.border="none"; td0.style.fontSize="12px";
		td0.innerHTML = "<%=obox.get("dept_nm")%> <%=obox.get("empl_nm")%> <%=obox.get("position_nm")%> "
					  + "<button type=button class=btn btn-primary btn-table marR0 onclick=removeNode('receiveEmpRow"+emplCnt+"');>삭제</button>"
					  + "<input type='hidden' name='receive_id"+emplCnt+"' value='<%=obox.get("empl_no")%>'>";
		row.appendChild(eval("td0"));
		tbody.appendChild(row);
		emplCnt++;
	<% } %>
	});
	
	$(function() {
		$(".page-logo-text").html("쪽지");	
	});
</script>

<form  id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="send_id" 	value="<%=uSesEnt.empl_no%>">
<input type="hidden" name="receive_id" 	value="">
	
	<table class="search-panel table table-bordered table-cover marB0">
		<tr height="180"> 
			<th>쪽지내용<br>(10자 이상)</th>
			<td colspan="3"><textarea name="talk_body" class="form-control" style="width:100%;height:220;border:none;"></textarea></td>
		</tr>
		<tr height="28"> 
			<th>받는사람</th>
			<td colspan="3">
				<select name="deptList" title="부서명" class="bs-select form-control" style="width:140px;"" onChange="changeDeptCd(this.value)">
					<option value=''>선택</option>
						<%=CodeUtil.optList("PR_INSTB_DEPT01_LIST","LISTCODE","","","","","","", uSesEnt.dbo)%>
				</select>
		  		<select name="emplList" title="성명" class="bs-select form-control" style="width:80px;" onChange="goAddEmpl(this.value)">
					<option value=''>선택</option>
				</select>
				<div style='width:100%;height:100px;overflow-y:scroll;'>
					<table id='MyTable' width="100%" border="0">
						<tr><td style="border:none"></td></tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
			    
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark marR5" onclick="goSend();"><img src="/com/img/ico_btn_confirm.png">보내기</button>
			</span>
		</span>
	</div>
</form>