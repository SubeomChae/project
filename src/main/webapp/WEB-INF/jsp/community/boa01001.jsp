<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<!-- 시스템문의사항  -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		if(formValidate("#main")) {
			document.main.page_count.value = '';
			ajaxReplaceForm("boa01001_list.do", "#main", "#divListData", function() {
				fixTableHeader("MyTable");
			});
		}
	}
	
	function goDetail(search_flag, board_no) {
		document.main.action = 'boa01002_select.do?board_no='+board_no+'&search_flag='+search_flag;
		document.main.target = '_self';
		document.main.submit();
	}

	function goWrite() {
		document.main.action = 'boa01003_edit.do';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("boa01001_list.do", "#main", "#divListData", function() {
			fixTableHeader("MyTable");
		});
		return false;
	}
	
	$(function(){
		fixTableHeader("MyTable");
	});
</script>

<form id="main" name="main" method="post" action="" class="fType">
<input type="hidden" name="page_count"	value="">

	<h1 class="page-title">시스템문의사항</h1>
	
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:auto;">
			<col style="width:auto;">
			<col style="width:auto;">
			<col style="width:auto;">
			<col style="width:auto;">
			<col style="width:auto;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head" style="width:11%">작성일</td>
				<td>
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="작성일(부터)" class="bs-select form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="작성일(까지)" class="bs-select form-control tYMD">
							<span class="input-group-btn"><button class="btn dark" type="button"><i class="fa fa-calendar"></i></button></span>
						</div>	
					</div>
				</td>
				<td class="td-head">
					<select name="search_key" class="bs-select form-control" style="width:95%">
						<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>질문제목</option>
						<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>질문내용</option>
						<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>작성자</option>
					</select>
				</td>
				<td>
					<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:170px;" onkeydown="if(event.keyCode == 13){goSearch(); return false;}">
		  			<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
		  			<label class="mt-checkbox mt-checkbox-outline">
						<input type="checkbox" name="answer_yn" value="N" <%=box.get("answer_yn").equals("N")?"checked":""%> style="border:none">미회신 Only<span/>
					</label>
					<span class="f-right marR60">
						<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
					</span>
				</td>
				
	  		</tr>
		</tbody>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-control">
		<div class="notice-view">
			<span style="color:#01a1db;">제목을 클릭</span>하면 시스템문의사항 세부내용을 검색할 수 있습니다.
		</div>
	</div>
	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 175px);">
		<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
	   			</tr>
	   			<tr>
					<td>공지</td>
					<td class="t-left">여기는 <font color=red><b>사내근로복지기금종합관리시스템의 개선</b></font>을 위한 의견을 제시하는 공간입니다. </td>
					<td>관리자</td>
					<td>2014-08-01</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
	      	<% for(int i=0; i < rsWp.getLength(); i++) { %>
				<tr> 
					<td <%if(!rsWp.get("ans_ymd",i).equals("")){%>rowspan="2"<%}%> align="center"><%=rsWp.get("row_num",i)%></td>
					<td class="t-left"><a href="javascript:goDetail('req','<%=rsWp.get("board_no",i)%>');"><%=StringUtil.getReplaceSpecialCharacters(rsWp.get("req_head",i))%></a></td>
					<td class="t-center"><%=rsWp.get("req_empl_nm",i)%></td>
					<td class="t-center"><%=rsWp.get("req_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td class="t-center"><%=rsWp.get("req_inquiry_cnt",i,Box.THOUSAND_COMMA)%></td>
				</tr>	
				<% if(!rsWp.get("ans_ymd",i).equals("")) { %>	
				<tr> 
					<td class="t-left"><a href="javascript:goDetail('ans','<%=rsWp.get("board_no",i)%>');"><img src="/com/img/re.gif" border="0"> <%=StringUtil.getReplaceSpecialCharacters(rsWp.get("ans_head",i))%></a></td>
					<td><%=rsWp.get("ans_empl_nm",i)%></td>
					<td><%=rsWp.get("ans_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td><%=rsWp.get("ans_inquiry_cnt",i,Box.THOUSAND_COMMA)%></td>
				</tr>	
				<% } %>
			<% } %>
			</tbody>
       	</table>
    </div>
     
   	<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
   	
<% if(!box.get("ajax_yn").equals("Y")) { %>   	
</div>
<% } %>