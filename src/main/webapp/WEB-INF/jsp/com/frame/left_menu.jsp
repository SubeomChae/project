<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="menuWp"  class="egovframework.cbiz.RsWrapper"    scope="session" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<title>::: 사내근로복지기금관리시스템 :::</title>
<script src="/com/js/treemenu.js"></script>
<script for=window event="onresize" language="JScript">resizing_menu();</script>
<script language="JavaScript" type="text/JavaScript">
	function resize_frame(open_yn) {
		var leftWidth = parent.document.getElementsByTagName("frameset").item(1);
		if(open_yn == 'Y') {
			leftWidth.cols = '234,*';
			document.getElementById('open').style.visibility = 'hidden';
		}else {
			leftWidth.cols = '12,*';
			document.getElementById('open').style.visibility = 'visible';
		}
	}
	
	function go_menu(menu_id, default_page) {
		if(menu_id.length == 1) { // Top Menu에서 호출한 경우
		for(var i=0; i < document.tree.elements.length; i++) {
			var tree_menu_id = document.tree.elements[i].name.substring(5);
			var node_id = document.tree.elements[i].value;
			if(tree_menu_id.length == 1 && indexOfEntries[node_id].isOpen) {
				indexOfEntries[node_id].setState(0);
			}
			if(tree_menu_id.substring(0,1) == menu_id) { clickOnNode(node_id); }
		}
		resize_frame('Y');
	}
	try{parent.parent.topFrame.set_menu(menu_id);}catch(e){}

		document.main.menu_id.value = menu_id;
		document.main.action = default_page == '' ? '/com/redirect.do?reqUrl=com/selectMenu' : default_page;
		document.main.target = "rightFrame";           
		document.main.submit();
	}
	
	function resizing_menu() { document.getElementById("divTree").style.height = document.body.clientHeight - 160; }
	function page_init() {
		resizing_menu();
	}
</script>
<div id="x" style="left:197px; visibility:visible; position:absolute; top:76px">
<a href="javascript:javascript:resize_frame('N')"><img src="/com/img/icon_x.gif" height="12" width="12" border="0" alt="Close"></a>
</div>
<div class="article" id="open" style="border-right:#000000 1px; border-top:#000000 1px; z-index:12; left:0px; visibility:hidden; border-left:#000000 1px; width:12px; border-bottom:#000000 1px; position:absolute; top:1px; height:100%; background-color:#ffffff; layer-background-color:#ffffff">
   <a href="javascript:resize_frame('Y')"><img id="Image1" onmouseover="MM_swapImage('Image1','','/com/img/icon_open_on.gif',1)" onmouseout="MM_swapImgRestore()" alt="Menu Open" src="/com/img/icon_open_off.gif" border="0" name="Image1"></a>
</div>
	<table width="240" height="100%" background="/com/img/cub_sidenav_bg.png">
	   <tr height="70">
	      <td style="padding-left:25px"><a href="/com/mainForm.do" target="_top"><img src="/com/img/img_logo.png" border="0" align="absmiddle" alt="사내근로복지기금관리시스템" /></a></td>
	   </tr>
	   <tr height="40">
	      <td style="padding-left:8px;">
	         <table width="215" cellpadding="0" cellspacing="0" border="0" background="/com/img/sub_img001001.gif" style="background-repeat:no-repeat;">
	            <tr height="70" >
	               <td width="100%" class="t-left" style="padding-left:75px;font-family:Dotum;font-size:9pt;letter-spacing:-1px"><%=uSesEnt.dept_nm%><br><b><%=uSesEnt.empl_nm%></b> 님 환영합니다.</td>
	            </tr>
	         </table>
	      </td>
	      <td width="5" bgcolor="ffffff"></td>
	   </tr>
	   <tr>
	      <td style="padding-left:8px;padding-bottom:5px">
	         <table width="210" height="100%" bgcolor="ffffff" cellpadding="0" cellspacing="0" style="border:solid 3px #d2dddf">
	            <tr>
	               <td valign="top" style="padding-left:3px;font-family:Dotum;font-size:9pt;letter-spacing:-1px">
	                  <div id="divTree" style="height:calc(100vh - 150px);width:207px;overflow:auto;">
	                  <script>
	                     aux0 = foldersTree = gFld('사내근로복지기금관리시스템');
	                  <%   String tree_node[] = new String[menuWp.getLength()];
	                     for(int i=0; i < menuWp.getLength(); i++) {
	                        String menu_lvl = menuWp.get("menu_lvl", i);
	                        String default_page = menuWp.get("default_page", i);
	                        if(menu_lvl.equals("1")) {tree_node[i] = menuWp.get("menu_id", i); 
	                           out.println("aux"+menuWp.get("menu_id",i)+" = insFld(aux0, gFld('"+menuWp.get("menu_nm", i)+"', ''));");                        
	                        }else if(menu_lvl.equals("2") && !default_page.equals("")) {
	                           out.println("insDoc(aux"+menuWp.get("upper_menu_id",i)+", gLnk(0, '"+menuWp.get("menu_nm", i)+"', 'javascript:go_menu(\""+menuWp.get("menu_id", i)+"\",\""+menuWp.get("default_page", i)+"\");'));");
	                        }else if(menu_lvl.equals("2") && default_page.equals("")) { tree_node[i] = menuWp.get("menu_id", i); 
	                           out.println("aux"+menuWp.get("menu_id",i)+" = insFld(aux"+menuWp.get("upper_menu_id",i)+", gFld('"+menuWp.get("menu_nm", i)+"', ''));");                        
	                        }else if(menu_lvl.equals("3") && !default_page.equals("")) {
	                           out.println("insDoc(aux"+menuWp.get("upper_menu_id",i)+", gLnk(0, '"+menuWp.get("menu_nm", i)+"', 'javascript:go_menu(\""+menuWp.get("menu_id", i)+"\",\""+menuWp.get("default_page", i)+"\");'));");
	                        }else if(menu_lvl.equals("3") && default_page.equals("")) {   tree_node[i] = menuWp.get("menu_id", i); 
	                           out.println("aux"+menuWp.get("menu_id",i)+" = insFld(aux"+menuWp.get("upper_menu_id",i)+", gFld('"+menuWp.get("menu_nm", i)+"', ''));");                        
	                        }else if(menu_lvl.equals("4")) {   
	                           out.println("insDoc(aux"+menuWp.get("upper_menu_id",i)+", gLnk(0, '"+menuWp.get("menu_nm", i)+"', 'javascript:go_menu(\""+menuWp.get("menu_id", i)+"\",\""+menuWp.get("default_page", i)+"\");'));");
	                        }
	                     }
	                     if (menuWp.getLength() > 0) { out.println("initializeDocument();"); }
	                  %>
	                  </script>
	                  </div>
	               </td>
	            </tr>
	         </table>
	      </td>   
	      <td width="5" bgcolor="ffffff"></td>
	   </tr>
	</table>
<form name="main" method="post" style="display:none"><input type="hidden" name="menu_id" value=""></form>
<form name="tree" method="post" style="display:none">
<%for(int i=0; i < tree_node.length; i++) { if(tree_node[i] == null) continue; %><input type="hidden" name="menu_<%=tree_node[i]%>" value="<%=i+1%>"><%}%>
</form>