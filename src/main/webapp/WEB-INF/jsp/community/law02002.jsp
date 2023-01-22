<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 자료실(정관, 운영규정) 상세조회 -->
<script language="javascript">
	function goEdit() {
		document.viewForm.action = 'law02003_edit.do';
		document.viewForm.target = '_self';
		document.viewForm.submit();
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("law02002_delete.do","#viewForm", function(rtn) {
				if(rtn.isOk == "Y") {
					parent.parent.goSearch();
					alert('삭제되었습니다.');
					
				}else {
					alert(rtn.errMsg);
					
				}
			});
		}
	}
</script>

<body>
<form id="viewForm" name="viewForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="law_id"      value="<%=box.get("law_id")%>">
<input type="hidden" name="chg_seq" 	value="<%=box.get("chg_seq")%>">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">

	<table class="table table-view table-bordered table-cover mar0">
		<tr>
			<td class="td-head">개정일</td>
			<td colspan="3"><%=obox.get("chg_ymd",Box.DEF_DATE_FMT)%></td>
		</tr>
		<tr>
			<td class="td-head">주요 개정내용</td>
			<td colspan="3"><%=obox.get("chg_summary",Box.MULTILINE_TEXT)%></td>
      		</tr> 
		<tr height="28">
			<td class="td-head">전문파일</td>
			<td colspan="3">
			<% if(obox.get("whole_file").equals("")) { %>미등록
			<% }else { %>
				<a href="javascript:fileDownload(document.viewForm, '<%=obox.get("whole_file")%>')">
					<img src="/com/img/ico_disk.png" border="0" align="absmiddle"><b><%=obox.get("whole_file").substring(obox.get("whole_file").indexOf("_")+1)%></b>&nbsp;&nbsp;
				</a>
			<% } %>
			</td> 
      		</tr> 
		<tr>
			<td class="td-head">신구대비파일</td>
			<td colspan="3">
			<% if(obox.get("comp3_file").equals("")) { %>미등록
			<% }else { %>
				<a href="javascript:fileDownload(document.viewForm, '<%=obox.get("comp3_file")%>')"><img src="/com/img/bn_down.gif" border="0" align="absmiddle">
					<img src="/com/img/ico_disk.png" border="0" align="absmiddle"><b><%=obox.get("comp3_file").substring(obox.get("comp3_file").indexOf("_")+1)%></b>&nbsp;&nbsp;
				</a>
			<% } %>
			</td> 
      		</tr> 
		<tr>
			<td width="20%" class="td-head">최초등록일시</td>
			<td width="30%" style="padding-left:5px"><%=obox.get("sys_reg_date",Box.DEF_DATETIME_FMT_APM)%></td>
			<td width="20%" class="td-head">최초등록자</td>
			<td width="30%" style="padding-left:5px"><%=obox.get("sys_reg_nm")%></td>
        		</tr> 
		<tr height="28">
			<td class="td-head">최종수정일시</td>
			<td><%=obox.get("sys_upd_date",Box.DEF_DATETIME_FMT_APM)%></td>
			<td class="td-head">최종수정자</td>
			<td><%=obox.get("sys_upd_nm")%></td>
      		</tr> 
	</table>
	
<% if(uSesEnt.use_auth.startsWith("S")) { %>	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark" onclick="goEdit();"><img src="/com/img/ico_btn_edit.png">수정</button>
	  			<button type="button" class="btn dark" onClick="goDelete();"><img src="/com/img/ico_btn_delete.png">삭제</button>
	  		</span>
	  	</span>
	</div>
<% } %>
</form>
