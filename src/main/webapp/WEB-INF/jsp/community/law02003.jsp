<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<!-- 자료실(정관, 운영규정) 등록 -->
<script language="javascript">
function goSave() {
	if(formValidate("#main")) {
		if(confirm('저장하시겠습니까?')) {
			removeMask("#main");
			document.main.action = '<%=box.get("chg_seq").equals("")?"law02003_insert":"law02003_update"%>.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
}

$(function() {
	$(".page-logo-text").html("자료실");	
});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px" enctype="multipart/form-data">
<input type="hidden" name="law_id" 		value="<%=box.get("law_id")%>">
<input type="hidden" name="chg_seq" 	value="<%=box.get("chg_seq")%>">
<input type="hidden" name="pathKey"		value="community">

	<table class="table table-view table-bordered table-cover mar0">
		<tr>
			<th style="width:19%">개정일</th>
			<td>
				<div class="form-inline">
					<div class="input-group input-medium date date-picker" data-date="<%=obox.get("chg_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
						<input type="text" id="chg_ymd" name="chg_ymd" value="<%=obox.get("chg_ymd")%>" maxlength="8" title="개정일" class="form-control required tYMD">
						<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
					</div>
				</div>
			</td>
      		</tr> 
		<tr height="150">
			<th>주요 개정내용</th>
			<td>
				<textarea name="chg_summary" title="주요 개정내용" class="form-control" style="width:100%;height:140px;ime-mode:active;"><%=obox.get("chg_summary")%></textarea>
			</td>
      		</tr> 
		<tr>
			<th>전문파일</th>
			<td>
				<% if(!obox.get("whole_file").equals("")) { %>
					<img src="/com/img/ico_disk.png" border="0" align="absmiddle">
					<%=obox.get("whole_file").substring(obox.get("whole_file").indexOf("_")+1)%>
				<% } %>
				<div class="form-inline">
					<div class="form-group">
						<div class="fileinput fileinput-new input-group" data-provides="fileinput">
							<div class="form-control input-fixed" data-trigger="fileinput" style="width:346px;">
								<i class="fa fa-file fileinput-exists"></i>&nbsp;<span id="whole_file" class="fileinput-filename"></span>
							</div>
							<span class="input-group-addon btn dark btn-file">
								<span class="fileinput-new">파일찾기</span>
								<span class="fileinput-exists">파일교체</span>
								<input type="file" id="whole_file" name="whole_file" title="전문파일">
							</span>
						</div>
					</div>
				</div>
			</td> 
      		</tr> 
		<tr>
			<th>신구대비파일</th>
			<td>
				<% if(!obox.get("comp3_file").equals("")) { %>
					<img src="/com/img/ico_disk.png" border="0" align="absmiddle">
					<%=obox.get("comp3_file").substring(obox.get("comp3_file").indexOf("_")+1)%><br>
				<% } %>
				<div class="form-inline">
					<div class="form-group">
						<div class="fileinput fileinput-new input-group" data-provides="fileinput">
							<div class="form-control input-fixed" data-trigger="fileinput" style="width:346px;">
								<i class="fa fa-file fileinput-exists"></i>&nbsp;<span id="comp3_file" class="fileinput-filename"></span>
							</div>
							<span class="input-group-addon btn dark btn-file">
								<span class="fileinput-new">파일찾기</span>
								<span class="fileinput-exists">파일교체</span>
								<input type="file" id="comp3_file" name="comp3_file" title="신구대비파일">
							</span>
						</div>
					</div>
				</div>
			</td> 
      		</tr> 
	</table>
	
	<div class="table-bottom-control">
		<span style="width:100%;">
			<span style="float:right;">
				<button type="button" class="btn dark marR5" onclick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
	  		</span>
	  	</span>
 	</div>
 </form>