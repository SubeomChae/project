<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 사내근로복지기금종합관리시스템 도움말 -->
<link href="/com/css/help.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function goSearch() {
		document.main.action = "sabokHelpAll.do";
		document.main.target = "_self";
		document.main.submit();
	}
	
	function goDetail(menu_id) {
		$(".page-help-list-menu").find(".active").removeClass("active");
		$("li[menu_id='"+menu_id+"']").addClass("active");
		ajaxReplace('sabokHelp.do', {'menu_id' : menu_id}, "#divHelpDetail");
		
// 		ifrm.location.href = 'sabokHelp.do?menu_id='+menu_id;
	}
	
	$(function () {
		$(".page-logo-text").html("사내근로복지기금종합관리시스템 도움말");
		$("body").removeClass("page-child page-window-popup").addClass("page-help");
		$("div").removeClass("contentWrapper");
		$("#divHelpDetail").addClass("contentWrapper");
		
		var menu_id = '<%=box.get("menu_id")%>';
		if(menu_id != '') {
			goDetail(menu_id);
			var offset = $("li[menu_id='"+menu_id+"']").offset();
		    $('#divListData').animate({scrollTop : offset.top-350}, 400);
		}else {
			$('#ifrm').attr('src', '/com/fd/redirect.do?reqUrl=com/gongsa');
		}
	});
<%-- 	<% 	int pos = -1; --%>
// 		if(rsWp.getLength() > 0) { 
// 			if(!box.get("menu_id").equals("")) {
// 				for(int i=0; i < rsWp.getLength(); i++) {
// 					if(rsWp.get("menu_id",i).length() > 1 && rsWp.get("menu_id",i).equals(box.get("menu_id").toUpperCase())) {
// 						pos = i;
// 						break;
// 					}
// 				}
// 			}else {
// 				pos = 1;
// 			}
// 			if(pos > 0) { 
// 				out.println("setBackColor('"+pos+"'); goDetail('"+rsWp.get("menu_id",pos)+"'); $(\"divArea\").scrollTop = 25 * "+pos+";"); 
// 			}else {
// 				out.println("ifrm.location.href = 'about:blank';"); 
// 			}
// 	   	}
// 	%>
// 	});
</script>

<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<div class="page-help-list-wrapper">
			<div class="help-search-con">
				<form name="main" method="post" action="" class="fType" style="margin:0px">
				<input type="hidden" name="sort_order"  value="">
				<input type="hidden" name="selectedRow" value="">

				<div class="form-inline">
					<select name="search_key" class="form-control" style="width:60px">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>목차</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>내용</option>
					</select>							
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:105px" onkeydown="if(event.keyCode == 13) goSearch();">
					<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
				</div>
				</form>
			</div>
			
			<div class="page-help-title">도움말 목차</div>
			<div id="divListData" class="page-help-list">
			
				<ul class="page-help-list-menu">
				<% for(int i=0; i < rsWp.getLength(); i++) { %>
					<li id="tr_<%=i%>" height="20" <%if(!rsWp.get("default_page",i).equals("")){%> style="cursor:pointer" onClick="goDetail('<%=rsWp.get("menu_id",i)%>')"<%}%>> 
						<td style="border:none">
						<% if(rsWp.getInt("menu_lvl",i) == 1) { %>
							<img src='/com/img/tree/ftv2folderclosed.gif' border='0' align='absmiddle'> <b><%=rsWp.get("menu_nm",i)%></b>
						<% }else if(rsWp.getInt("menu_lvl",i) == 2) { %>
							&nbsp;&nbsp;&nbsp;&nbsp;<img src='/com/img/tree/ftv2link.gif' border='0' align='absmiddle'> <%=rsWp.get("menu_nm",i)%>
						<% }else if(rsWp.getInt("menu_lvl",i) == 3) { %>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='/com/img/tree/ftv2mlastnode.gif' border='0' align='absmiddle'> <%=rsWp.get("menu_nm",i)%>
						<% }else if(rsWp.getInt("menu_lvl",i) == 4) { %>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='/com/img/tree/ftv2lastnode.gif' border='0' align='absmiddle'> <%=rsWp.get("menu_nm",i)%>
						<% }else { %>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='/com/img/tree/ftv2lastnode.gif' border='0' align='absmiddle'> <%=rsWp.get("menu_nm",i)%>
						<% } %>
						</td>
					</li>
				<% } %>
				</ul>
			</div>
		</div>
	</div>
</div>
<div id="divHelpDetail">
	
</div>

<div class="page-footer" style="z-index:1">
	<div class="form-inline f-right">
		<div class="form-group" style="margin-top:10px">
			<button type="button" class="btn dark marL5" onclick="window.close()"><img src="/com/img/ico_btn_cancel.png">CLOSE</button>
		</div>
	</div>
</div>
