<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	    class="egovframework.cbiz.Box"		  scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>시스템도입현황</title>

<script language="javascript">
	function goSearch() {
		document.main.action = "adm95001_list.do";
		document.main.target = "_self";
		document.main.submit();
	}
	
	function goDetail(corp_cd) {
		var theURL = '';
		if	   (document.main.tab_index.value == '1') { theURL = 'adm95002_select.do'; }
		else if(document.main.tab_index.value == '2') { theURL = 'adm96001_list.do'; }			
		ifrm.location.href = theURL + '&corp_cd='+corp_cd; 
		
	}
	
	function goWrite() {
		var oldRow = document.main.selectedRow.value;
		if(oldRow != '') { document.getElementById("tr_"+oldRow).style.background = 'white'; }
		
		document.ifrm.location.href = 'adm95003_edit.do';
	}
	
	function page_init() {
	<% if(!box.get("corp_cd").equals("")) { 
			out.println("goDetail('"+box.get("corp_cd")+"');");
   		}else if(rsWp.getLength() > 0) {
			out.println("set_backColor(0); goDetail('"+rsWp.get("corp_cd",0)+"');");
		} %>
	}
	
</script>
</head>
<body>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden"  name="selectedRow"	value="">
<input type="hidden" name="tab_index" 	value="1">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr> 
		<td style="padding:10 10 0 10">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
	        	<tr><td height="35" class="cont_title">시스템 도입현황</td></tr>
			</table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="10%" class="table01_title">회사명</td>
					<td style="padding-left:5px">
						<input type="text" name="corp_nm" value="<%=box.get("corp_nm")%>" style="width:150px;border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
					</td>
					<td width="10%" class="table01_title">설치유형</td>
					<td style="padding-left:5px">
						<select name="server_type" style="width:80px">
							<option value=''>전체</option>							
							<option value='자체' <%=box.get("server_type").equals("자체")?"selected":"" %>>자체서버</option>
							<option value='임대' <%=box.get("server_type").equals("임대")?"selected":"" %>>임대서버</option>
						</select>
					</td>
					<td width="10%" class="table01_title">책임자</td>
					<td style="padding-left:5px">
						<select name="charge_person" style="width:80px">
							<option value=''>전체</option>							
							<option value='임치형' <%=box.get("charge_person").equals("임치형")?"selected":"" %>>임치형</option>
							<option value='채수범' <%=box.get("charge_person").equals("채수범")?"selected":"" %>>채수범</option>
							<option value='이우진' <%=box.get("charge_person").equals("이우진")?"selected":"" %>>이우진</option>
							<option value='문경남' <%=box.get("charge_person").equals("문경남")?"selected":"" %>>문경남</option>
							<option value='변상민' <%=box.get("charge_person").equals("변상민")?"selected":"" %>>변상민</option>
						</select>
					</td>
					<td width="10%" style="padding-left:5px" class="table01_title">상태</td>
					<td style="padding-left:5px">
						<select name="sign_status" style="width:100px">
							<option value=''>전체</option>
							<option value='도입문의' <%=box.get("sign_status").equals("도입문의")?"selected":"" %>>도입문의</option>
							<option value='견적발송' <%=box.get("sign_status").equals("견적발송")?"selected":"" %>>견적발송</option>
							<option value='계약서발송' <%=box.get("sign_status").equals("계약서발송")?"selected":"" %>>계약서발송</option>
							<option value='진행중' <%=box.get("sign_status").equals("진행중")?"selected":"" %>>진행중</option>
							<option value='완료' <%=box.get("sign_status").equals("완료")?"selected":"" %>>완료</option>
						</select>
					</td>
					<td align="center">
			  			<a href="javascript:goSearch();"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  		<% if(uSesEnt.use_auth.equals("SA")) { %>
			  			<a href="javascript:goWrite();"><img src="/com/img/btn_new.gif" border=0 align="absmiddle"></a>			  	
			  		<% } %>
					</td>
		  		</tr>
			</table>		    
			<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
          		<tr><td colspan="2" height="10"></td></tr>
          		<tr>
					<td width="33%" valign="top">
						<div id="divArea" style='width:100%;height:300px;overflow-y:auto'>
						<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table02">
							<tr height="28" align="center" class="table01_title">
								<td width="10%">No</td>
								<td width="40%">회사명</td>
								<td width="15%">설치유형</td>
								<td width="15%">책임자</td>
								<td width="20%">상태</td>
			          		</tr>
					<% if(rsWp.getLength() == 0) { %>
							<tr height="25"><td colspan="5" align="center">등록된 자료가 없습니다.</td></tr>
					<% }else { 
						for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand" onClick="set_backColor('<%=i%>');goDetail('<%=rsWp.get("corp_cd",i)%>')"> 
								<td align="center"><%= i+1 %></td>
								<td align="center"><%=rsWp.get("corp_nm",i)%></td>
								<td align="center"><%=rsWp.get("server_type",i)%></td>
								<td align="center"><%=rsWp.get("charge_person",i)%></td>
								<td align="center"><%=rsWp.get("sign_status",i)%></td>									
							</tr>
					 <% } 
					   } %>
						</table>
						</div>
					<% if(rsWp.getLength() > 0) { %>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
		        			<tr>
								<td align="center" style="padding-top:5px"><%=rsWp.getPageLine(request, 30, 5)%></td>
							</tr>
		    			</table>
					<% } %>
					</td>
					<td id="frmArea" width="*" height="*" valign="top" style="padding-left:10px">
				    	<iframe name="ifrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="100%" scrolling="yes"></iframe>
				    </td>
				</tr>
			</table>
		</td>
  	</tr>
</table>
</form>
