<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="wsfw.lib.util.*,
				 wsfw.lib.CD,
                 wsfw.comsvc.CodeHelper,
				 wsfw.lib.dao.RsWrapper,
				 java.util.*" %>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"     	class="wsfw.lib.util.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="wsfw.lib.dao.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" 	class="wsfw.biz.com.SesUserEntity" scope="session" />
<html>
<head>
<title>우편번호 찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/com/include/css/style.css" id="style_css">
<script language="javascript">	
	function go_search() {
		document.main.action = "/com/other.do?method=zipFinder";
		document.main.target = "_self";
		document.main.submit();
	}	
	
	function go_detail(zip_no, sido, gugun, dong, addr_detail) {	
		document.main.zip_no.value = zip_no;
		document.main.addr.value = sido + ' ' + gugun + ' ' + dong;
		document.main.addr_detail.value = addr_detail;
		document.main.addr_sido.value = sido;
		document.main.addr_gugun.value = gugun;
		document.main.addr_dong.value = dong;
		document.main.addr_detail.focus();
	}
	
	function go_select() {	
		if(isEmpty(document.main.zip_no)) {
			alert('주소를 먼저 선택하시기 바랍니다.');
			return;
		}

		var addr = document.main.addr.value;
		if(!isEmpty(document.main.addr_detail)) { addr += ' ' + document.main.addr_detail.value; }

		if(!isEmpty(document.main.column)) {
			arr = document.main.column.value.split(',');
			target_nm = arr[0]; 
			form_nm = arr.length > 1 ? arr[1] : 'main';
			eval('opener.document.'+form_nm+'.'+target_nm+'_sido').value = document.main.addr_sido.value;
			eval('opener.document.'+form_nm+'.'+target_nm+'_gugun').value = document.main.addr_gugun.value;
			eval('opener.document.'+form_nm+'.'+target_nm+'_dong').value = document.main.addr_dong.value;
			eval('opener.document.'+form_nm+'.'+target_nm+'_detail').value = document.main.addr_detail.value;
			if(target_nm.indexOf('addr') >= 0) {
				eval('opener.document.'+form_nm+'.'+target_nm).value = addr;
			}else {
				eval('opener.document.'+form_nm+'.'+target_nm+'_addr').value = addr;
			}
		}else {
			openURL = opener.location.href;
			start_pos = openURL.lastIndexOf("?method=");
			openURL = openURL.substring(start_pos + 8, start_pos + 16);
			if(openURL == '') {
			}else {
				opener.document.all["addr"].value = addr;
			}
		}
		try {opener.document.main.zip_no1.value = document.main.zip_no.value.substring(0,3);} catch(e){}
		try {opener.document.main.zip_no2.value = document.main.zip_no.value.substring(3,6);} catch(e){}
		parent.window.close();
	}
</script>
<style type="text/css">html{overflow:hidden;}</style>
</head>
<body>
<form name="main" method="post" action="" class="fType" style="margin:0px;">
<input type="hidden" name="column" value="<%=box.get("column")%>">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="10" bgcolor="d3d0c7"></td>
  	<td height="5" bgcolor="d3d0c7"></td>
	<td width="10" bgcolor="d3d0c7"></td>
  </tr>
  <tr> 
    <td width="10" height="35" bgcolor="d3d0c7"></td>
	<td valign="top" height="35"> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr> 
				<td width="15"></td>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr><td height="5"></td></tr>
						<tr> 
							<td height="35" class="sub_cont_title" vAlign="middle">
								<IMG height="13" src="/com/img/title_bullet.gif" width="17" border="0" align="absmiddle"> 우편번호 찾기
							</td>
						</tr>
					</table>
				</td>
				<td width="7"></td>
			</tr>
		</table>
	</td>
	<td width="10" bgcolor="d3d0c7"></td>
  </tr>
  <tr>
    <td width="10" bgcolor="d3d0c7"></td>
	<td height="1" bgcolor="BBCBEB"></td>
	<td width="10" bgcolor="d3d0c7"></td>
  </tr>
  <tr> 
    <td width="10" bgcolor="d3d0c7"></td>
	<td height="10"></td>
	<td width="10" bgcolor="d3d0c7"></td>
  </tr>
  
  <tr>
    <td width="10" bgcolor="d3d0c7" style="padding-left:5px"></td>
    <td align="center" valign="top">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr> 
			<td style="padding-left:5px">
			<% if(box.get("addr_flag").equals("1")) { %>
				검색하고자 하는 주소의 읍·면·동 이름을 기재하세요.<br><br>예) 경기도 고양시 대화동이면 '<b>대화</b>' 또는 '<b>대화동</b>'을 입력합니다.
			<% }else { %>
				검색하고자 하는 주소의 도로명을 기재하세요. 예) '<b>고양대로</b>' 또는 '<b>중앙로</b>'<br><br>검색결과가 너무 많으면 시·도, 구·군을 입력해서 검색해보세요.
			<% } %>
			</td>
		  </tr>
		  <tr height="30"> 
			<td nowrap style="padding-left:5px">
				<select name="addr_flag" onChange="go_search()">
					<option value="2" <%=box.get("addr_flag").equals("2")?"selected":""%>>도로명주소</option>
					<option value="1" <%=box.get("addr_flag").equals("1")?"selected":""%>>지번주소</option>
				</select>
			<% if(box.get("addr_flag").equals("1")) { %>
				<input type="text" name="dong" value="<%=box.get("dong")%>" size="10" class="setFocus" style="border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) go_search();">
			<% }else { %>
				<select name="sido">
					<option value=''>:: 광역시·도 ::</option>
				<% RsWrapper sidoWp = CodeHelper.getRsWrapper("PR_COMTB_CODE02_LIST","LISTCODE","","addr_sido","","","","","",request);
				   for(int i=0; i < sidoWp.getLength(); i++) { %>
				   	<option value="<%=sidoWp.get("data",i)%>" <%=sidoWp.get("data",i).equals(box.get("sido"))?"selected":""%>><%=sidoWp.get("data",i)%></option>
				<% } %>
				</select>
				<b>구·군</b> <input type="text" name="gugun" value="<%=box.get("gugun")%>" size="10" style="border:1 solid gray;ime-mode:active;"> 
				<b>도로명</b> <input type="text" name="road_nm" value="<%=box.get("road_nm")%>" size="10" class="setFocus" style="border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) go_search();">
			<% } %>
				<a href="javascript:go_search();"><img src="/com/img/icon_search.gif" border="0" align="absmiddle"></a></td>
		  </tr>
      </table>
	  <table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
  		<tr><td colspan="5" height="6"></td></tr>
  		<tr>
		  <td width="100%">
		    <div style='width:100%;height:250px;overflow-x:auto;overflow-y:auto'>
	          <table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="25" align="center" class="table01_title">
				  <td width="20%">우편번호</td>
				  <td width="80%">주소</td>
				</tr>
   			<% for(int i=0; i < rsWp.getLength(); i++) {  %>
                <tr height="20" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase">
				  <td align="center"><%=rsWp.get("zipcode",i,Box.ZIP_CODE)%></td>
				  <td><a href="javascript:go_detail('<%=rsWp.get("zipcode",i)%>','<%=rsWp.get("sido",i)%>','<%=rsWp.get("gugun",i)%>','<%=rsWp.get("dong",i)%>','<%=rsWp.get("addr_detail",i)%>');"><%=rsWp.get("addr",i)%></a></td>
				</tr>
   			<% } %>               
			  </table>
			</div>
		  </td>
	    </tr>
	  </table>
  <% if(rsWp.getLength() > 0) {  %>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr><td align="center" style="padding-top:5px"><%=rsWp.getPageLine(request, 50, 10)%></td></tr>
        <tr><td align="center" style="padding-top:20px">주소를 선택하신 후, 상세주소를 입력하세요</td></tr>
        <tr>
        	<td style="padding:10 5 0 30">
        		선택주소 : <input type="text" name="addr" value="" size="50" style="background-color:f6f6f6;border:1 solid gray" readOnly><br>
        		상세주소 : <input type="text" name="addr_detail" value="" size="50" maxlength="30" style="border:1 solid gray;ime-mode:active"> 
        		<a href="javascript:go_select();"><img src="/com/img/icon_select02.gif" border="0" align="absmiddle"></a>
        		<input type="hidden" name="addr_sido" value="">
        		<input type="hidden" name="addr_gugun" value="">
        		<input type="hidden" name="addr_dong" value="">
        		<input type="hidden" name="zip_no" value="">
        	</td>
        </tr>
      </table>
  <% }  %>
    </td>
    <td width="10" bgcolor="d3d0c7" style="padding-left:5px"></td>
  </tr>
  <tr align="center">
    <td width="10" height="25" bgcolor="d3d0c7"></td>
    <td height="25" bgcolor="d3d0c7">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="129"></td>
          <td style="padding-left:5px"></td>
          <td width="55"></td>
        </tr>
      </table>
    </td>
    <td width="10" height="25" bgcolor="d3d0c7" style="padding-left:5px"></td>
  </tr>
</table>
</form>
</body>
</html>