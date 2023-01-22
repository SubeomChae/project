<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>시스템도입현황 - 거래내역</title>

<script language="javascript">
	function goEdit() {
		document.main.action = 'adm96003_edit.do';
		document.main.target = 'sfrm';
		document.main.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#main");
			document.main.action = 'adm96002_delete.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goDetail(prof_cd) {
		document.getElementById('divArea').style.height = 200;
		document.main.action = "adm96002_select.do?prof_cd="+prof_cd;
		document.main.target = "sfrm";
		document.main.submit();
	}
	
	function goWrite() {
		var oldRow = document.main.selectedRow.value;
		var corp_cd = document.main.corp_cd.value;
		if(oldRow != '') { document.getElementById("tr_"+oldRow).style.background = 'white'; }
		
		document.sfrm.location.href = 'adm96003_edit.do?corp_cd='+corp_cd;
	}
	
	function goTabpage(tab_index) {
		try { parent.document.main.tab_index.value = tab_index; } catch(e) {}
		for(var i=1; i <= 2; i++) {
			document.getElementById('tabImage'+i).style.backgroundImage = 'url(/com/img/bg_tab120_' + (tab_index == i ? 'on' : 'off') + '.gif)';
		}
		var theURL = '';
		if	   (tab_index == '1') { theURL = 'adm95002_select.do'; }
		else if(tab_index == '2') { theURL = 'adm96001_list.do'; }		

		document.main.action = theURL; 
		document.main.target = "_self";
		document.main.submit();
	}
	
	function page_init() {
	<% if(!box.get("prof_cd").equals("")) { 
			out.println("goDetail('"+box.get("prof_cd")+"');");
   		}else if(rsWp.getLength() > 0) {
			out.println("set_backColor(0); goDetail('"+rsWp.get("prof_cd",0)+"');");
		} %>
	}
	
	function fnOnLoad() {
		document.getElementById('divArea').onscroll = function() { 
			document.getElementById('divArea').onscroll = function() { document.getElementById('vFixTable').style.top = document.getElementById('divArea').scrollTop; }
		}
	}
	onload = fnOnLoad;
</script>
</head>
<body>
<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="corp_cd"		value="<%=obox.get("corp_cd")%>">
<input type="hidden" name="selectedRow"	value="">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
	  	<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25" align="center">
					<td id="tabImage1" width="120" nowrap background="/com/img/bg_tab120_off.gif" style="cursor:hand;" onClick="goTabpage('1')">도입개요</td>
					<td id="tabImage2" width="120" nowrap background="/com/img/bg_tab120_on.gif" style="cursor:hand;" onClick="goTabpage('2')">거래내역</td>					
					<td width="*">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" valign="top">
			<div id="divArea" style='width:100%;height:expression(document.body.clientHeight-100);overflow-y:auto'>
			<table id="vFixTable" width="100%" border="1" cellpadding="0" cellspacing="0" class="table01" style="position:relative;left:0;top:0;word-break:break-all;">
				<tr height="25">
					<td colspan="2" align="center" class="table01_title">회사명</td>
					<td colspan="3" style="letter-spacing:-1px;padding-left:5px"><b><%=obox.get("corp_nm")%></b> (<%=obox.get("corp_class")%> 유형)</td>
					<td align="right" style="padding-right:5px">
					<% if(uSesEnt.use_auth.equals("SA")) { %>
			  			<a href="javascript:goWrite();"><img src="/com/img/bn_write.gif" border=0 align="absmiddle"></a>			  	
			  		<% } %>
					</td>
				</tr> 
				<tr height="25" align="center" class="table01_title">
					<td width="5%">No</td>
					<td width="15%">구분</td>
					<td width="20%">계산서일자</td>
					<td width="20%">청구금액</td>
					<td width="20%">입금일자</td>
					<td width="20%">상태</td>
				</tr> 
			</table>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table03" style="word-break:break-all;">	
		<% if(rsWp.getLength() == 0) { %>
				<tr height="25" align="center"><td colspan="6">등록된 자료가 없습니다.</td></tr>
		<% }else {
			   for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand" onClick="set_backColor('<%=i%>');goDetail('<%=rsWp.get("prof_cd",i)%>')">
					<td align="center" width="5%"><%=String.valueOf(i+1)%></td>
					<td align="center" width="15%"><%=rsWp.get("amt_class",i)%></td>
					<td align="center" width="20%"><%=rsWp.get("apply_ymd",i,Box.DEF_DATE_FMT)%></td>					
					<td align="right"  width="20%" style="padding-right:10px"><%=rsWp.get("total_amt",i,Box.THOUSAND_COMMA)%></td>
					<td align="center" width="20%"><%=rsWp.get("acct_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td align="center" width="20%"><%=rsWp.get("sign_status",i)%></td>
				</tr>	
			<% } %>
		<% } %>
			</table>
			</div>
		</td>
	</tr>
	<tr height="">
		<td width="100%" height="300" valign="top" style="padding-top:5px">
	    	<iframe name="sfrm" marginwidth="0" src="about:blank" frameborder="0" width="100%" height="100%" scrolling="no"></iframe>	    	
	    </td>
	</tr>
</table>
</form>
