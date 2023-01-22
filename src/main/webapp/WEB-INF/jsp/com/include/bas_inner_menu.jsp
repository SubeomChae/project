<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%> 
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%	Box box = Box.makeBox(request); %>
<script language='javascript'>
	function goInnerMenu(pageUrl) {
		if(pageUrl.indexOf('basMain') < 0) {
			if(isEmpty(document.main.detail_key)) {
				alert('시설물이 선택되지 않았습니다.');
				return;
			}else {
				arr = document.main.detail_key.value.split('|');
				if(document.main.popup_yn.value != 'Y' && "1,2,4,T".indexOf(arr[3]) >= 0) {
					alert('승인되지 않은 시설물입니다.');
					return;
				}
			}
		}
	<% if(!uSesEnt.group_type.equals("Y")) { %>
		if(document.main.popup_yn.value != 'Y') {
			document.main.leftParams.value = '';
			for(var i=1; i <= 9; i++) { document.main.leftParams.value += eval('document.basForm.param0'+i).value + 'Ð'; }
			document.main.leftParams.value += document.basForm.page_count.value + 'Ð' + document.basForm.currentKey.value + 'Ð';
		}
	<% } %>
		document.main.tab_index.value = '1';
		<%if(box.get("id").startsWith("man")){%>document.main.biz_id.value = '';<%}%>
		
		var deco = '';
		if(location.href.indexOf("/fd/") >= 0) { deco = 'fd'; }
		if(location.href.indexOf("/pd/") >= 0) { deco = 'pd'; }
		if(deco != '') {
			if(pageUrl.indexOf("/facility/") == 0) { pageUrl = pageUrl.replace('/facility/','/facility/'+deco+'/'); }
			else if(pageUrl.indexOf("/maint/") == 0) { pageUrl = pageUrl.replace('/maint/','/maint/'+deco+'/'); }
			else if(pageUrl.indexOf("/lcc/") == 0) { pageUrl = pageUrl.replace('/lcc/','/lcc/'+deco+'/'); }
			else if(pageUrl.indexOf("/price/") == 0) { pageUrl = pageUrl.replace('/price/','/price/'+deco+'/'); }
		}
		document.main.action = pageUrl;
		document.main.target = '_self';
		document.main.submit();
	}
</script>

<% if("A,B,C,D,K,Y,U,S".indexOf(uSesEnt.group_type) >= 0) { %>
<div class="contentsRow">
	<div class="table-top-control top-tab-btn">
		<div class="btn-group" data-toggle="buttons">
			<label class="btn blue <%if(box.get("id").equals("bas")){%>active<%}%>" onClick="goInnerMenu('/facility/basMain.do')"><input type="radio" class="toggle"> 시설물관리대장 </label>
			<label class="btn blue <%if(box.get("id").equals("man_p")){%>active<%}%>" style="margin-left:1px" onClick="goInnerMenu('/maint/manMain.do?biz_id=1')"><input type="radio" class="toggle"> 유지관리계획 </label>
			<label class="btn blue <%if(box.get("id").equals("man_r")){%>active<%}%>" style="margin-left:1px" onClick="goInnerMenu('/maint/manMain.do?biz_id=2')"><input type="radio" class="toggle"> 유지관리실적 </label>
			<label class="btn blue <%if(box.get("id").equals("lcc")){%>active<%}%>" style="margin-left:1px" onClick="goInnerMenu('/lcc/lccMain.do')"><input type="radio" class="toggle"> 시설물비용정보 </label>
			<label class="btn blue <%if(box.get("id").equals("prc")){%>active<%}%>" style="margin-left:1px" onClick="goInnerMenu('/price/prcMain.do')"><input type="radio" class="toggle">점검진단대가산정 </label>
		</div>
	</div>
</div>	
<% } %>