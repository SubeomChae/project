<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 대부금상환기준 -->

<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		if(formValidate("#pForm")) {
			removeMask("#pForm");
			ajaxReplaceForm("lon13001_list.do", "#pForm", "#divListData");
		}		
	}
	
	function goSave() {
		for(var i=0; i < 12; i++) {
			if(isEmpty(document.all['start_ymd'+i]) || isEmpty(document.all['end_ymd'+i])) {
				document.all['intr_ilsu'+i].value = '';
			}else {
				if(parseInt(document.all['start_ymd'+i].value.replace(/-/g,"")) >= parseInt(document.all['end_ymd'+i].value.replace(/-/g,""))){					
					alert('이자기산시작일이 종료일보다 값이 크거나 같습니다.');
					document.all['start_ymd'+i].value = '';
					document.all['end_ymd'+i].value = '';				
					return;
				}
				document.all['intr_ilsu'+i].value = getDayInterval(document.all['start_ymd'+i].value.replace(/-/g,"")+'000', document.all['end_ymd'+i].value.replace(/-/g,"")+'000') + 1;
				if(isEmpty(document.all['gongje_cnt'+i])) { document.all['gongje_cnt'+i].value = '1'; }
			}
			formatMaskElm(document.all['intr_ilsu'+i]);
			formatMaskElm(document.all['gongje_cnt'+i]);
		}
		
		if(formValidate("#pForm")) {
			if(confirm('저장하시겠습니까?')) {
				removeMask("#pForm");
				ajaxSubmitForm("lon13001_update.do","#pForm", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}		
	}
	
	$(function() {
		$(".page-logo-text").html("대부금상환기준");	
	});
</script>

<form id="pForm" name="pForm" method="post" action="" class="fType">

	<table class="search-panel table table-bordered">
		<tbody>
			<tr>
				<td width="15%" class="td-head">기준년도</td>
				<td width="85%">
					<select name="std_yy" title="기준년도" class="bs-select form-control" style="width:120px" onChange="goSearch()">
            			<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
				</td>
			</tr>
		</tbody>
	</table>
				
<div id="divListData" class="contentsRow">
<% } %>

	<div class="table-scrollable">
		<table class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
					<th width="15%">기준년월</th>
					<th width="57%">이자기산일</th>
					<th width="13%">일수</th>
					<th width="15%">공제회수</th>
          		</tr>
          	</thead>
          	<tbody>
			<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td class="t-center"><%=box.get("std_yy") + "-" + rsWp.get("refund_mm",i)%></td>
					<td class="t-center">
						<div class="form-inline">
							<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
								<input type="text" name="start_ymd<%=i%>" value="<%=rsWp.get("start_ymd",i)%>" maxlength="8" title="기산일(부터)" class="form-control required tYMD">
								<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
							</div>
							<span> ~ </span>
							<div class="input-group input-medium date date-picker" data-date="" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
								<input type="text" name="end_ymd<%=i%>" value="<%=rsWp.get("end_ymd",i)%>" maxlength="8" title="기산일(까지)" class="form-control required tYMD">
								<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
							</div>
						</div>	
					</td>
					<td class="t-center">
						<input type="text" name="intr_ilsu<%=i%>" maxlength="3" value="<%=rsWp.get("intr_ilsu",i)%>" title="일수" class="form-control tMONEY" style="width:35px;" readOnly>
					</td>
					<td class="t-center">
						<input type="text" name="gongje_cnt<%=i%>" maxlength="3" value="<%=rsWp.get("gongje_cnt",i)%>" title="공제회수" class="form-control tMONEY" style="width:35px;">
					</td>
					<input type="hidden" name="refund_mm<%=i%>" value="<%=rsWp.get("refund_mm",i)%>">
					<input type="hidden" name="slip_no<%=i%>" value="<%=rsWp.get("slip_no",i)%>">
					<input type="hidden" name="pro_status<%=i%>" value="<%=rsWp.get("pro_status",i)%>">
				</tr>	
			<% } %>
          	</tbody> 
		</table>
	</div>
	
	<div class="table-bottom-control">
		<span class="f-right">
			<button type="button" class="btn dark" onClick="goSave()"><img src="/com/img/ico_btn_save.png">저장</button>
		</span>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
</form>
<% } %>