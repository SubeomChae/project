<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 지출결의서 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(slip_no) {
		ajaxReplaceForm("slp02001.do", "#main", "#divListData", function() {
			if(slip_no == '') { 
				goWrite();
			}else {
				goDetail(slip_no); 
			}
			fixTableHeader("MyTable");
		});
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("slp02001.do", "#main", "#divListData", function() {
			var slip_no = $("tr[id='tr_0']").attr("slip_no");
			if(slip_no != undefined) { goDetail(slip_no); }
			fixTableHeader("MyTable");
		});
		return false;
	}

	function goWrite(){
		$("tr[id^='tr_']").removeClass("bg-yellow");
		ajaxReplaceForm("slp02002_write.do?method=write", "#main", "#divFrame");
	}
	
	function goDetail(slip_no) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(slip_no != '') { $("tr[slip_no='"+slip_no+"']").addClass("bg-yellow"); }
		var pageUrl = 'slp02002_edit.do?method=edit&slip_no='+slip_no;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}

	$(function() {
		goWrite();
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="biz_type"	value="<%=box.get("biz_type")%>">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">지출결의서</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:25%;">
			<col style="width:10%;">
			<col style="width:55%;">
		</colgroup>
		<tbody>
	  		<tr>
				<td class="td-head">작성일자</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("slip_ymd_from",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="slip_ymd_from" name="slip_ymd_from" value="<%=box.get("slip_ymd_from")%>" maxlength="8" title="작성일자(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("slip_ymd_to",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="slip_ymd_to" name="slip_ymd_to" value="<%=box.get("slip_ymd_to")%>" maxlength="8" title="작성일자(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>	
				</td>
				<td class="td-head">작성자</td>
				<td>
					<div class="form-inline">
						<div class="input-group marL5 marT5">
							<%=uSesEnt.dept_nm%>&nbsp;&nbsp;<%=uSesEnt.empl_nm%>&nbsp;&nbsp;<%=uSesEnt.position_nm%>
						</div>
						<span class="f-right marR60">
							<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button>
							<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">신규</button>
						</span>
					</div>	
				</td>
	  		</tr>
	  	</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-4 col-xs-4 col-sm-4 row-set-col padL0 padR0">
			<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 145px)">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:25%">
						<col style="width:55%">
						<col style="width:20%">
					</colgroup>
					<thead>
						<tr>
							<th>전표번호</th>
							<th>사용목적</th>
							<th>결재상태</th>
		          		</tr> 
	          		</thead>
	          		<tbody>
					<% if(rsWp.getLength() == 0) { %>
						<tr><td colspan="3" class="t-center">등록된 자료가 없습니다.</td></tr>
					<% }else {
				   		for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" slip_no="<%=rsWp.get("slip_no",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("slip_no",i)%>')"> 
							<td class="t-center"><%=rsWp.get("slip_no",i,Box.SLIP_NO)%></td>
							<td><%=rsWp.get("subject",i)%></td>
							<td class="t-center"><%=rsWp.get("sign_status_nm",i)%></td>
						</tr>	
						<% } %>
				    <% } %>		
			    	</tbody>
				</table>
			</div>
			<%=PageUtil.makePaging(box, rsWp, 50, 5, "", request)%>
		</div>
		<div class="col-md-8 col-xs-8 col-sm-8 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>	
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>