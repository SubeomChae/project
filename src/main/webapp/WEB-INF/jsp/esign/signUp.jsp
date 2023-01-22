<%@ page language="java"  pageEncoding="UTF-8"%>
<script language="javascript">
	// 결재선 추가
	var empl20_cnt = 0;	
	var empl40_cnt = 0;
	function findEmployeeNoPost(empl_no, empl_nm, sign_step) {
		var id = "empl"+sign_step;
		var cnt = getRow(sign_step);
		for(var i=0; i<document.saveForm.elements.length; i++) {
			if(document.saveForm.elements[i].name.substring(0,9) == 'sign_empl') { 
				if(document.saveForm.elements[i].value == empl_no) {
					alert('이미 선택된 결재자입니다.');
					return;
				}
			}
		}
		
		var tbody = document.getElementById(id+"Table").getElementsByTagName("TBODY")[0];
		var row = document.createElement("TR");
        row.id = id+"Row"+cnt; row.class="t-center";
		var td0 = document.createElement("TD"); td0.style.border="none";
		td0.innerHTML = empl_nm
					  + "<input type='hidden' name='sign_step"+sign_step+cnt+"' value='"+sign_step+"'>"
					  + "<input type='hidden' name='sign_empl"+sign_step+cnt+"' value='"+empl_no+"'>"
					  + "<a href=\"javascript:$('#"+id+"Row"+cnt+"').remove();\"><img src='/com/img/icon_tresh.png' border='0' align='absmiddle'></a>";
		row.appendChild(eval("td0"));
		tbody.appendChild(row);
		addRow(sign_step);
    }
    
	function getRow(sign_step) {
		if	   (sign_step == '20') { return empl20_cnt; }
		else if(sign_step == '40') { return empl40_cnt; }
	}
	
	function addRow(sign_step) {
		if	   (sign_step == '20') { empl20_cnt++; }
		else if(sign_step == '40') { empl40_cnt++; }
	}
	
	function changeSignEmpl(sign_step, empl_no) {
		if(empl_no == '') { return; }
		for(var i=0; i<document.saveForm.elements.length; i++) {
			if(document.saveForm.elements[i].name.substring(0,9) == 'sign_empl') { 
				if(document.saveForm.elements[i].name.substring(9,11) == sign_step) { continue; }
				if(document.saveForm.elements[i].value == empl_no) {
					alert('이미 선택된 결재자입니다.');
					document.all['sign_empl'+sign_step].value = '';
					break;
				}
			}
		}
	}
</script>
<%	RsWrapper tempWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","LIST001", "","sign_step@"+uSesEnt.dbo,"","","","",uSesEnt.dbo);
	RsWrapper stepWp = new RsWrapper();
	for(int i=0; i < tempWp.getLength(); i++) {
		if(tempWp.get("code1",i).compareTo("31") < 0 || tempWp.get("code1",i).compareTo("35") > 0) { continue; }
		stepWp.appendRs(tempWp.getRsBoxAt(i));
	}

	int colWidth = (int)(100 / (stepWp.getLength()+2));
	RsWrapper emplWp = CodeUtil.getRsWrapper("PR_INSTB_EMPL01_LIST","LIST003", "",uSesEnt.dept_cd,"","","","",uSesEnt.dbo); %>
	<table id="newLineTable" class="table table-view table-bordered table-cover marB0">
		<tr height="20">
			<th colspan="<%=stepWp.getLength()+2%>">결재선</th>
   		</tr> 
		<tr height="20">
			<td class="td-head" width="<%=colWidth%>%">
				협조&nbsp;<button type="button" class="btn btn-primary btn-table" onClick="findEmployeeNo('&empl_status=T&column=20');">추가</button>
			</td>
			<td class="td-head" width="<%=colWidth%>%">
				참조&nbsp;<button type="button" class="btn btn-primary btn-table" onClick="findEmployeeNo('&empl_status=T&column=40');">추가</button>
			</td>
		<% for(int i=0; i < stepWp.getLength(); i++) { %>	
			<td class="td-head" width="<%=colWidth%>%"><%=stepWp.get("data1",i)%></td>
		<% } %>	
        </tr> 
		<tr>
			<td class='t-center' style="padding:0 0 0 0">
				<table id="empl20Table" width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="0" style="display:none"><td width="80%"></td><td width="20%"></td></tr>
				</table>
			</td>
			<td class='t-center' style="padding:0 0 0 0">
				<table id="empl40Table" width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr height="0" style="display:none"><td width="80%"></td><td width="20%"></td></tr>
				</table>
			</td>
		<% for(int i=0; i < stepWp.getLength(); i++) { String sql_where = stepWp.get("data7",i).replaceAll("&acute;","'"); %>	
			<td align="center" valign="top" style="padding-top:4px">
				<select name="sign_empl<%=stepWp.get("code1",i)%>" title="<%=stepWp.get("data1",i)%>"  class="bs-select form-control" style="font-size:11px;width:97%" onChange="changeSignEmpl('<%=stepWp.get("code1",i)%>', this.value)">
					<option value=''></option>
				<% for(int k=0; k < emplWp.getLength(); k++) { 
					if(sql_where.indexOf("@param01") >= 0 && !emplWp.get("dept_cd",k).equals(uSesEnt.dept_cd)) { continue; }
					if(sql_where.indexOf("empl_no")  >= 0 && sql_where.substring(sql_where.indexOf("empl_no")+8).indexOf(emplWp.get("empl_no",k)) < 0) { continue; }
					if(sql_where.indexOf("bojik_cd='1'") >= 0 && !emplWp.get("bojik_cd",k).equals("1")) { continue; } 
					if(sql_where.indexOf("bojik_cd='2'") >= 0 && !emplWp.get("bojik_cd",k).equals("2")) { continue; } 
					if(sql_where.indexOf("bojik_cd='3'") >= 0 && !emplWp.get("bojik_cd",k).equals("3")) { continue; } 
					if(sql_where.indexOf("bojik_cd='4'") >= 0 && !emplWp.get("bojik_cd",k).equals("4")) { continue; } 
					if(sql_where.indexOf("bojik_cd='5'") >= 0 && !emplWp.get("bojik_cd",k).equals("5")) { continue; }
					if(sql_where.indexOf("bojik_cd='6'") >= 0 && !emplWp.get("bojik_cd",k).equals("6")) { continue; }										 
					if(sql_where.indexOf("bojik_cd='7'") >= 0 && !emplWp.get("bojik_cd",k).equals("7")) { continue; }
					if(sql_where.indexOf("bojik_cd='8'") >= 0 && !emplWp.get("bojik_cd",k).equals("8")) { continue; } 
					if(sql_where.indexOf("bojik_cd='9'") >= 0 && !emplWp.get("bojik_cd",k).equals("9")) { continue; } 
					if(sql_where.indexOf("bojik_cd='10'") >= 0 && !emplWp.get("bojik_cd",k).equals("10")) { continue; } 
					if(sql_where.indexOf("bojik_cd='11'") >= 0 && !emplWp.get("bojik_cd",k).equals("11")) { continue; }%>	
					<option value='<%=emplWp.get("empl_no",k)%>'><%=emplWp.get("empl_nm",k)%> <%=emplWp.get("position_nm",k)%></option>
				<% } %>	
				</select>
			</td>
		<% } %>	
		</tr> 
	</table>