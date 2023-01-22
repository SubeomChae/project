<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="msgBox"  class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="menuWp"  class="egovframework.cbiz.RsWrapper"     scope="session" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<html>
<title>::: 사내근로복지기금관리시스템 :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="JavaScript" type="text/JavaScript">
	function go_menu(menu_id, default_page) {
		document.main.menu_id.value = menu_id;
		parent.parent.leftFrame.go_menu(menu_id.substring(0,1), default_page);
    }
    
	function receive_note() {
		wdt = 780; hgt = 500;
    	xPos = Math.ceil((screen.width - wdt) / 2);
        yPos = Math.ceil((screen.height- hgt) / 2);
    	window.open('not01001_list.do', 'not01001', "width="+wdt+",height="+hgt+",menubar=no,toolbar=no,scrollbars=no,resizable=no,status=no,left="+xPos+",top="+yPos);
	}

    var loop_cnt = 0;
	function start_timer() {
		loop_cnt++;
		// 10분 간격으로 결재요청 메시지,새 쪽지 확인
		if(loop_cnt >= 10) {
			loop_cnt = 0;
<%-- 			sinjax.selectWithParm('PR_COMTB_MESG02@SELECT_RECEIVE_COUNT', ['sign_empl_no'], ['<%=uSesEnt.empl_no%>'], 'start_timer'); --%>
		}
		setTimeout("start_timer()", 1000*60);
	}

	function __start_timer_post(rsBox) {
		var talk_cnt = sinjax.GetObject(rsBox,'talk_cnt');
		var wait_cnt = sinjax.GetObject(rsBox,'wait_cnt');
		var sign_cnt = sinjax.GetObject(rsBox,'sign_cnt');
		var refer_cnt = sinjax.GetObject(rsBox,'refer_cnt');
		reload_msg_cnt(talk_cnt, wait_cnt, sign_cnt, refer_cnt);
	}
	
	function reload_msg_cnt(talk_cnt, wait_cnt, sign_cnt, refer_cnt) {
		if(talk_cnt > 0) { talk_cnt = "<font color=red><b>" + talk_cnt + "</b></font>"; } else { talk_cnt = 0; }
		if(wait_cnt > 0) { wait_cnt = "<font color=red><b>" + wait_cnt + "</b></font>"; } else { wait_cnt = 0; }
		if(sign_cnt > 0) { sign_cnt = "<font color=red><b>" + sign_cnt + "</b></font>"; } else { sign_cnt = 0; }
		if(refer_cnt > 0) { refer_cnt = "<font color=red><b>" + refer_cnt + "</b></font>"; } else { refer_cnt = 0; }
		document.getElementById('divWait').innerHTML = "<a href=\"javascript:go_menu('G02','/esign/sgn02001_list.do')\"> 접수대기 "+wait_cnt+"개</a>";	
		document.getElementById('divSign').innerHTML = "<a href=\"javascript:go_menu('G03','/esign/gn03001_list.do')\"> 결재대기 "+sign_cnt+"개</a>";
		document.getElementById('divRefer').innerHTML = "<a href=\"javascript:go_menu('G07','/esign/sgn05001_list.do')\"> 참조문서 "+refer_cnt+"개</a>";	
		document.getElementById('divNote').innerHTML = "&nbsp;<a href=\"javascript:go_menu('H05','/community/not01001_list.do')\">새 쪽지 "+talk_cnt+"개</a>";	
	}

	function set_menu(menu_id) { document.main.menu_id.value = menu_id; }

	function go_change_corp(corp_nm) {
		if(confirm('['+corp_nm+']으로 세션을 이동하시겠습니까?')) {
			try {
				ajaxSubmitForm("/com/login.do", "#login", function(data) {
					if(data.isOk == "Y") {
						document.login.action = "/com/mainFrame.do";
						document.login.target = "_top";
						document.login.submit();
					}else {	
						alert(data.errMsg);
					}
				});
			} catch(e) { }
		}else {
			document.login.corp_cd.value = '<%=uSesEnt.dbo%>';
		}
	}

	function page_init() {
	<%if(msgBox.getInt("talk_cnt")>0){%>receive_note();<%}%>
		start_timer();
	}
</script>

<table width="100%" height="70" border="0" background="/com/img/bg_sabok01_new.png" style="table-layout:fixed">
	<tr>
		<td width="100%">
			<table width="100%" cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed">
				<tr height="25">
					<td  nowrap style="padding-left:7px;font-size:12px; color:#666666; letter-spacing:-1px;">
						<img src="/com/img/bu_icon02.gif" align="absmiddle"><span id="divWait"><a href="javascript:go_menu('G02','/esign/sgn02001_list.do')"> 접수대기 <%if(msgBox.getInt("wait_cnt")>0){%><font color=red><b><%}%><%=msgBox.getInt("wait_cnt")%><%if(msgBox.getInt("wait_cnt")>0){%></b></font><%}%>개 </a></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="/com/img/bu_icon02.gif" align="absmiddle"><span id="divSign"><a href="javascript:go_menu('G03','/esign/sgn03001_list.do')"> 결재대기 <%if(msgBox.getInt("sign_cnt")>0){%><font color=red><b><%}%><%=msgBox.getInt("sign_cnt")%><%if(msgBox.getInt("sign_cnt")>0){%></b></font><%}%>개 </a></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="/com/img/icon_refer.gif" align="absmiddle"><span id="divRefer"><a href="javascript:go_menu('G07','/esign/sgn05001_list.do')"> 참조문서 <%if(msgBox.getInt("refer_cnt")>0){%><font color=red><b><%}%><%=msgBox.getInt("refer_cnt")%><%if(msgBox.getInt("refer_cnt")>0){%></b></font><%}%>개 </a></span>&nbsp;&nbsp;&nbsp;&nbsp;
				    	<img src="/com/img/icon_note.gif" align="absmiddle"><span id="divNote"><a href="javascript:go_menu('H05','/community/not01001_list.do')"> 새 쪽지 <%if(msgBox.getInt("talk_cnt")>0){%><font color=red><b><%}%><%=msgBox.getInt("talk_cnt")%><%if(msgBox.getInt("talk_cnt")>0){%></b></font><%}%>개</a></span>
						<a href="javascript:sendNote('')">[쪽지 보내기]</a>&nbsp;&nbsp;
					</td>
					<td align="right" nowrap style="padding-right:3px;font-size:12px; color:#666666; letter-spacing:-1px;">
						<form id="login" name="login" method="post" action="" style="margin:0px">
						<a href="javascript:go_menu('A00','/com/rightFrame.do')">홈으로</a>&nbsp;&nbsp;|&nbsp;&nbsp; 
						<a href="javascript:go_menu('A00','/com/siteMap.do')">사이트맵</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="javascript:sabokHelp('001');">도움말</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="/com/logout.do" target="_top">로그아웃</a>&nbsp;&nbsp;
					<%  boolean isAdmin = false;
						if(uSesEnt.use_auth.equals("SA")) {
							String admin_desk = CustomProperty.admin_desk;
							String admin_ip[] = StringUtil.split(admin_desk,";",true);
							String remote_ip = request.getRemoteAddr();
							for(int i=0; i < admin_ip.length; i++) {
								if(remote_ip.startsWith(admin_ip[i]) && uSesEnt.user_id.equals("admin")) { 
									isAdmin = true; 
									break;
								}
							}
						}
						if(isAdmin) { %>
						<input type="hidden" name="corp_change" value="Y">
						<select name="corp_cd" style="width:100px" onChange="go_change_corp(getSelectedText(this));">
							<%=CodeUtil.optList("PR_COMTB_CORP01_LIST", "LISTCODE", uSesEnt.dbo, "", "", "", "", "")%>
						</select>
					<%	} %>
						</form>
					</td>
				</tr>
				<tr height="45">
					<td width="100%" colspan="2" style="padding:5px 0 0 5px">
					<%	boolean isUsingC = false; 
						boolean isUsingD = false;
						boolean isUseAuth = false;
						for(int i=0; i < menuWp.getLength(); i++) {
							if(menuWp.get("menu_id",i).startsWith("C")) { isUsingC = true; }
							else if(menuWp.get("menu_id",i).startsWith("D")) { isUsingD = true; }
							if(isUsingC && isUsingD) { break; }
						}
						if(!uSesEnt.use_auth.equals("G")) { isUseAuth = true; }
					%>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="95"><a href="javascript:go_menu('A','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image01','','/com/img/menu01_on.gif',0)"><img src="/com/img/menu01_off.gif" alt="인사관리" name="Image01" width="92" height="30" border="0"></a></td>
								<td width="95"<%if(!isUseAuth){%> style="display:none"<%}%>><a href="javascript:go_menu('B','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image02','','/com/img/menu02_on.gif',0)"><img src="/com/img/menu02_off.gif" alt="사업계획" name="Image02" width="92" height="30" border="0"></a></td>
								<td width="95"<%if(!isUsingC){%> style="display:none"<%}%>><a href="javascript:go_menu('C','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image03','','/com/img/menu03_on.gif',0)"><img src="/com/img/menu03_off.gif" alt="목적사업" name="Image03" width="92" height="30" border="0"></a></td>
								<td width="95"<%if(!isUsingD){%> style="display:none"<%}%>><a href="javascript:go_menu('D','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image04','','/com/img/menu04_on.gif',0)"><img src="/com/img/menu04_off.gif" alt="대부사업" name="Image04" width="92" height="30" border="0"></a></td>
								<td width="95"<%if(!isUseAuth){%> style="display:none"<%}%>><a href="javascript:go_menu('E','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image05','','/com/img/menu05_on.gif',0)"><img src="/com/img/menu05_off.gif" alt="회계관리" name="Image05" width="92" height="30" border="0"></a></td>
								<td width="95"<%if(!isUseAuth){%> style="display:none"<%}%>><a href="javascript:go_menu('F','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image06','','/com/img/menu06_on.gif',0)"><img src="/com/img/menu06_off.gif" alt="세무관리" name="Image06" width="92" height="30" border="0"></a></td>
								<td width="95"><a href="javascript:go_menu('G','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image07','','/com/img/menu07_on.gif',0)"><img src="/com/img/menu07_off.gif" alt="전자결재" name="Image07" width="92" height="30" border="0"></a></td>
								<td width="95"><a href="javascript:go_menu('H01','/community/inf01001_list.do');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image08','','/com/img/menu08_on.gif',0)"><img src="/com/img/menu08_off.gif" alt="커뮤니티" name="Image08" width="92" height="30" border="0"></a></td>
								<td width="95"<%if(!isUseAuth){%> style="display:none"<%}%>><a href="javascript:go_menu('Z','');" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image09','','/com/img/menu09_on.gif',0)"><img src="/com/img/menu09_off.gif" alt="기준정보" name="Image09" width="92" height="30" border="0"></a></td>
								<td width="*" align="right"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		<td>
	</tr>
</table>
<form name="main" method="post" action="" style="display:none">
<input type="hidden" name="menu_id" value="">
</form>
</html>