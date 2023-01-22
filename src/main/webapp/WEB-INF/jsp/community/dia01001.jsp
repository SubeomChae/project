<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 나의 업무일정 -->
<script language='javascript'>
	function goSearch() {
		document.main.action = "dia01001_list.do";
		document.main.target = "_self";
		document.main.submit();
	}

	var rownum = <%=rsWp.getLength()%>;
	function goAddTr(id) {
		var tbody = document.getElementById(id).getElementsByTagName("TBODY")[0];
		var row = document.createElement("TR"); row.align="center"; row.height="25";

		var td0 = document.createElement("TD"); td0.width="5%";
		var td1 = document.createElement("TD"); td1.colSpan="2";
		var td2 = document.createElement("TD"); td2.width="5%";

		td0.innerHTML = "입력";
		td1.innerHTML = "<input type='text' name='memo_content"+rownum+"' maxlength='100' value='' title='주요일정' style='width:98%;border:0 solid gray'>";
		td2.innerHTML = "";

		for(var i=0; i <= 2; i++) { row.appendChild(eval("td"+i)); }
		tbody.appendChild(row);
		document.all["memo_content"+rownum].focus();
		rownum++;
    }

	function goSave() {
		if(isEmpty(document.main.sys_ymd)) {
			alert('기준일은 필수입력항목입니다.');
			return;
		}
		removeMask("#main");
		document.main.input_cnt.value = rownum;
		document.main.action = 'dia01001_insert.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDelete(memo_seq) {
		removeMask("#main");
		document.main.action = 'dia01001_delete.do?memo_seq='+memo_seq;
		document.main.target = '_self';
		document.main.submit();
	}

	function Calendar_Post() {
		if(!isEmpty(document.main.sys_ymd)) {
			var sys_ymd = document.main.sys_ymd.value.replace(/-/g,"");
			goSearch(); 
		}
	}
	
	function page_init() {
		goAddTr('MyTable');
	}	
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="input_cnt" 	value="">
<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
	<tr height="25">
		<td>
			<img height="13" src="/com/img/title_bullet.gif" width="17" border="0" align="absmiddle"> 
			<span style="font-weight:bold; color:#e47d14;">나의 업무일정 등록</span>
		</td>
		<td align="right"># 기준일 : 
			<input type="text" name="sys_ymd" value="<%=box.get("sys_ymd")%>" size="11" maxlength="8" title="기준일" class="tYMD" style="height:18;border:1 solid gray" onChange="__Calendar_Setting_Post('')"><a href="javascript:Calendar_P(document.main.sys_ymd)"><img src="/com/img/calender_icon.gif" align="absmiddle" border="0"></a>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="100%">
			<table id='MyTable' width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="28" align="center" class="table01_title">
          			<td width="7%" align="center">No</td>
					<td width="93%" colspan="3">주요 일정</td>
          		</tr>
			<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr height="25"> 
					<td align="center"><%=String.valueOf(i+1)%></td>
					<td align="center" colspan="2"><input type="text" name="memo_content<%=i%>" maxlength="100" value="<%=rsWp.get("memo_content",i)%>" title="일정" style="width:99%;border:0 solid gray;ime-mode:active;"></td>
					<td width="5%" align="center"><a href="javascript:goDelete('<%=rsWp.get("memo_seq",i)%>');"><img src="/com/img/icon_remove.gif" border="0" align="absmiddle" alt="삭제"></a></td>
				</tr>	
			<% } %>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right" style="padding-top:5px"><a href="javascript:goSave();"><img src="/com/img/bn_save.gif" align="absmiddle" border="0"></a></td>
	</tr>
</table>
</form>