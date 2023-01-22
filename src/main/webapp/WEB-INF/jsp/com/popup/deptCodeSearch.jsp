<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="wsfw.lib.util.*,
				 wsfw.lib.CD,
                 wsfw.comsvc.CodeHelper,
                 wsfw.lib.dao.RsWrapper,
				 java.util.*" %>
<%@ page errorPage="/com/error.jsp" %>
<jsp:useBean id="box"		class="wsfw.lib.util.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="wsfw.lib.dao.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" 	class="wsfw.biz.com.SesUserEntity" scope="session" />
<html>
<head>
<title>부서 찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/com/include/css/style.css" id="style_css">
<script language="javascript">	
	function go_search() {
		if(isEmpty(document.main.dept_nm)) {
			alert('부서 명칭에 포함되는 일부 문자열을 입력하신 후, 검색하십시오.');
			document.main.dept_nm.focus();
			return;
		}
		document.main.action ="/com/other.do?method=deptCodeSearch";
		document.main.submit();
	}	

	function go_select(dept_cd, dept_nm){			    	  
		openURL = opener.location.href;
		start_pos = openURL.lastIndexOf("?method=");
		openURL = openURL.substring(start_pos + 8, start_pos + 16);
			
		if(openURL == 'rpt01001') { // 보조부
			opener.document.main.search_cd.value = dept_cd;
			opener.document.main.search_nm.value = dept_nm;
		}else {
			opener.document.main.dept_cd.value = dept_cd;
			opener.document.main.dept_nm.value = dept_nm;
		}
		parent.window.close();
	}
</script>
<style type="text/css">html{overflow:hidden;}</style>
</head>
<body>
<form name="main" method="post" class="fType" action="">
<input type="hidden" name="object_id" value="<%=box.get("object_id")%>">
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
								<IMG height="13" src="/com/img/title_bullet.gif" width="17" border="0" align="absmiddle"> 부서 찾기
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
			<td style="padding-left:5px"> 검색하고자 하는 부서 명칭을 기재하세요.
				<p><span class="gray11" style="padding-left:5px"></span> 명칭에 포함되는 일부 문자열을 입력해서 검색할 수 있습니다.(예: '<b>인사</b>', '<b>지원</b>' 등)</p>
			</td>
		  </tr>
		  <tr height="30"> 
			<td style="padding-left:5px">&nbsp;<select name="search_key" style="width:70px">
					<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>부서명</option>
				</select>
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" size="20" class="setfocus" style="border:1 solid gray;ime-mode:active;" onkeydown="if(event.keyCode == 13) go_search();">
				<a href="javascript:go_search();"><img src="/com/img/icon_search.gif" border="0" align="absmiddle"></a>
			</td>
		  </tr>
      </table>
	  <table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
  		<tr><td height="6"></td></tr>
  		<tr>
		  <td width="100%">
		    <div style='width:100%;height:350px;overflow-x:auto;overflow-y:auto'>
	          <table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28" align="center" class="table01_title">
				  <td width="25%">부서코드</td>
				  <td width="75%">부서명</td>
				</tr>
   			<% for(int i=0; i < rsWp.getLength(); i++) {  %>
                <tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase">
				  <td align="center"><a href="javascript:go_select('<%=rsWp.get("dept_cd",i)%>','<%=rsWp.get("dept_nm",i)%>');"><%=rsWp.get("dept_cd",i)%></a></td>
				  <td><a href="javascript:go_select('<%=rsWp.get("dept_cd",i)%>','<%=rsWp.get("dept_nm",i)%>');"><%=rsWp.get("dept_nm",i)%></a></td>
				</tr>
   			<% } %>               
			  </table>
			</div>
		  </td>
	    </tr>
	  </table>
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