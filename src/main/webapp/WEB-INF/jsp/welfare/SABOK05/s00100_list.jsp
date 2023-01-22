<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 경조금 신청 -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(apply_no) {
		document.main.page_count.value = '';
		ajaxReplaceForm("wel01001_list.do", "#main", "#divListData", function() {
			if(apply_no == '') {
				goDetail($("tr[id='tr_0']").attr("apply_no"));
			}else {
				goDetail(apply_no); 
			}
			fixTableHeader("MyTable");
		});
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("wel01001_list.do", "#main", "#divListData", function() {
			var apply_no = $("tr[id='tr_0']").attr("apply_no");
			if(apply_no != undefined) { goDetail(apply_no); }
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		ajaxReplaceForm("wel01003_edit.do", "#main", "#divFrame");
	}

	function goDetail(apply_no) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(apply_no != '') { $("tr[apply_no='"+apply_no+"']").addClass("bg-yellow"); }
		var pageUrl = 'wel01002_select.do?apply_no='+apply_no;
		ajaxReplaceForm(pageUrl, "#main", "#divFrame");
	}

	function goSort(sort_order) {
		document.main.sort_order.value = sort_order;
		goSearch('');
	}
	
	$(function() {
		<% if(box.get("apply_no").equals("")) { %>
			goWrite();
		<% }else { %>
			<% for(int i=0; i < rsWp.getLength(); i++) { %> 
				<% if(rsWp.get("apply_no",i).equals(box.get("apply_no"))) { %>
					$("tr[apply_no='"+apply_no+"']").addClass("bg-yellow");
			  		goDetail('<%=box.get("apply_no")%>');
		 		<% } %>
			<% } %>
		<% } %>
			fixTableHeader("MyTable");
		});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_cd"  	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="page_count"	value="">
<input type="hidden" name="sort_order"  value="">
<input type="hidden" name="selectedRow" value="">

	<h1 class="page-title">경조금 신청</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:22%;">
			<col style="width:10%;">
			<col style="width:18%;">
			<col style="width:10%;">
			<col style="width:30%;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">신청일자</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="신청일자(부터)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="신청일자(까지)" class="form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
					</div>		
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:95%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>성명</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>사번</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>부서명</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val",Box.SPECIAL_CHAR)%>" class="form-control" style="width:200px; ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch('');">
				</td>
				<td class="td-head">결재상태</td>
				<td>
					<div class="form-inline">
						<select name="sign_status" title="결재상태" class="bs-select form-control" style="width:140px">
							<option value=''>전체</option>
							<%=CodeUtil.optList("PR_COMTB_CODE02_LIST","LISTCODE",box.get("sign_status"),"sign_status","","","","")%>
						</select>
						<span class="f-right marR50">
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
	<div class="table-top-guide">
		<span style="color:#01a1db;">신청일자를 클릭</span>하면 해당 경조비 신청 세부내역을 조회할 수 있습니다.
	</div>
	
	<div class="row row-set">
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
			<div id="divArea" class="table-scrollable scrollOptionY" style="height:calc(100vh - 160px)">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">	
					<colgroup>
						<col style="width:18%;">
						<col style="width:30%;">
						<col style="width:15%">
						<col style="width:23%;">
						<col style="width:14%;">
					</colgroup>		  		
					<thead>	
						<tr>						
							<th><a href="javascript:goSort('t1.apply_ymd')">신청일자</a></th>
							<th><a href="javascript:goSort('t3.dept_nm')">부서명</a></th>
							<th><a href="javascript:goSort('t2.empl_nm')">성명</a></th>
							<th><a href="javascript:goSort('t1.data04')">경조구분</a></th>
							<th><a href="javascript:goSort('t4.sign_status')">상태</a></th>
						</tr>
					</thead>
					<tbody>
					<% if(rsWp.getLength() == 0) { %>
							<tr><td colspan="5" class="t-center">등록된 자료가 없습니다.</td></tr>
					<%}else { 
						  for(int i=0; i < rsWp.getLength(); i++) { %>
							<tr id="tr_<%=i%>" apply_no="<%=rsWp.get("apply_no",i)%>" style="cursor:pointer" onClick="goDetail('<%=rsWp.get("apply_no",i)%>')"> 
								<td class="t-center"><%=rsWp.get("apply_ymd",i,Box.DEF_DATE_FMT)%></td>
								<td class="t-center"><%=rsWp.get("dept_nm",i)%></td>
								<td class="t-center"><%=rsWp.get("empl_nm",i)%></td>
								<td class="t-center"><%=rsWp.get("family_rel_nm",i)%> <%=rsWp.get("cong_class_nm",i)%></td>
								<td class="t-center"><%=rsWp.get("sign_status_nm",i)%></td>
							</tr>
						<% } %>
					<% } %>
					</tbody>
				</table>
			</div>
			<% if(rsWp.getLength() > 0) { %>
				<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
			<% } %>
		</div>
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
			<div id="divFrame">
			
			</div>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
