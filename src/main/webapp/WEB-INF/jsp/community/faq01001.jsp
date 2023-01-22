<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% RsWrapper codeWp = CodeUtil.getRsWrapper("PR_COMTB_CODE02_LIST","MULTCODE","","group_type|faq_category|","","","",""); %>
<!-- FAQ -->
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch() {
		if(formValidate("#main")) {
			ajaxReplaceForm("faq01001_list.do", "#main", "#divListData", function() {
				$("tr#Q_0").find("a").trigger("click");
			});
		}
	}

	function goPage(page_count) {
		document.main.page_count.value = page_count;
		ajaxReplaceForm("faq01001_list.do", "#main", "#divListData");
		return false;
	}

	function goTabpage(tab_index, faq_category) {
		document.main.tab_index.value = tab_index;
		document.main.faq_category.value = faq_category;
		$("#faqTabMenu li").removeClass('active');		
		$("#faqTabMenu #tabMenu"+tab_index).addClass('active');
		if(tab_index == '2') {
			$("#faq_sub_category").show();
		}else {
			$("#faq_sub_category").hide();
		}
		goSearch();
	}
	
	
	function goView(inx) {
		if($('#A_'+inx).css("display") == 'none') {
			$('#A_'+inx).show();
			if(!isEmpty(document.main.selectedRow) && document.main.selectedRow.value != inx) {
				$('#A_'+document.main.selectedRow.value).hide();
			}
			document.main.selectedRow.value = inx;
		}else {
			$('#A_'+inx).hide();
		}
	}
	
	function goWrite() {
		document.saveForm.faq_no.value = '';
		document.saveForm.faq_head.value = '';
		document.saveForm.faq_content.value = '';
		document.saveForm.faq_category.value = '';
		document.saveForm.faq_sub_category.value = '';
		$('#divEditModal').modal('show');
	}
	
	function goEdit(faq_no, corp_cd, faq_head, faq_content, faq_category, faq_sub_category) {
		document.saveForm.faq_no.value = faq_no;
		document.saveForm.corp_cd.value = corp_cd;
		document.saveForm.faq_head.value = faq_head;
		document.saveForm.faq_content.value = replaceSpecial(faq_content);
		document.saveForm.faq_category.value = faq_category;
		document.saveForm.faq_sub_category.value = faq_sub_category;
		change_faq_category(faq_category);
		$('#divEditModal').modal('show');
	}

	function goSave() {
		if(formValidate("#saveForm")) {
			if(confirm('저장하시겠습니까?')) {
				var callurl = 'faq01001_update.do?action_type=' + (isEmpty(document.saveForm.faq_no) ? 'INSERT' : 'UPDATE');
				ajaxSubmitForm(callurl,"#saveForm", function(rtn) {
					if(rtn.isOk == "Y") {
						returnFormSubmit(document.main, 'faq01001_list.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goDelete(faq_no, faq_category) {
		if(confirm('삭제하시겠습니까?')) {
			removeMask("#saveForm");
			document.saveForm.faq_no.value = faq_no;
			document.saveForm.faq_category.value = faq_category;
			ajaxSubmitForm("faq01001_delete.do?faq_no="+faq_no,"#main", function(rtn) {
				if(rtn.isOk == "Y") {
					returnFormSubmit(document.main, 'faq01001_list.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}

	function change_faq_category(faq_category) {
		changeObjectProperty(document.saveForm.faq_sub_category, faq_category == 'B' ? 'required' : 'readonly');
		document.getElementById('spanSubCategory').style.display = faq_category == 'B' ? '' : 'none';
	}
	
	$(function() {
		$("tr#Q_0").find("a").trigger("click");
		goTabpage('1','A')
	});
</script>


<form  id="main" name="main" method="post" action="" class="fType" style="margin:0px;">
<input type="hidden" name="selectedRow" 	value="">
<input type="hidden" name="tab_index" 		value="<%=box.get("tab_index")%>">
<input type="hidden" name="faq_category" 	value="<%=box.get("faq_category")%>">
<input type="hidden" name="page_count"		value="">

	<h1 class="page-title">FAQ</h1>
	
	<table class="search-panel table table-bordered">
		<tr>
			<td width="*" class="form-inline">
				<select name="search_key" class="bs-select form-control" style="width:100px">
					<option value='1' <%=box.get("search_key").equals("1")?"selected":""%>>질문</option>
					<option value='2' <%=box.get("search_key").equals("2")?"selected":""%>>답변</option>
					<option value='3' <%=box.get("search_key").equals("3")?"selected":""%>>질문+답변</option>
				</select>
				<select id="faq_sub_category" name="faq_sub_category" class="bs-select form-control" onChange="goSearch();" style="display:none;">
					<option value=''>:: 회계실무사례 ::</option>
					<option value='01' <%=box.get("faq_sub_category").equals("01")?"selected":""%>>목적사업</option>
					<option value='02' <%=box.get("faq_sub_category").equals("02")?"selected":""%>>대부사업</option>
					<option value='03' <%=box.get("faq_sub_category").equals("03")?"selected":""%>>예적금거래</option>
					<option value='04' <%=box.get("faq_sub_category").equals("04")?"selected":""%>>고유목적사업준비금</option>
					<option value='99' <%=box.get("faq_sub_category").equals("99")?"selected":""%>>기타</option>
				</select>
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width:200px;ime-mode:active;" onkeydown="if(event.keyCode == 13) goSearch();">
	  			<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
			<% if(uSesEnt.use_auth.equals("SA")) { %>
				<span class="f-right marR60">
					<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">새로작성</button>
				</span>
			<% } %>	  			
			</td>
		</tr>
	</table>
</form>

<div id="divListData" class="contentsRow">
<% } %>
	<div class="table-top-control">
		<div class="notice-view">
			<span style="color:#01a1db;">질문을 클릭</span>하면 해당 FAQ의 세부내용을 검색할 수 있습니다.
		</div>
	</div>
					  
	<ul id="faqTabMenu" class="nav nav-tabs">
		<li id="tabMenu1" onClick="goTabpage('1','A')" <%if(box.get("faq_category").equals("A")){%>class="active"<%}%>><a data-toggle="tab">시스템사용법</a></li>
		<li id="tabMenu2" onClick="goTabpage('2','B')" <%if(box.get("faq_category").equals("B")){%>class="active"<%}%>><a data-toggle="tab">회계실무사례</a></li>
		<li id="tabMenu3" onClick="goTabpage('3','C')" <%if(box.get("faq_category").equals("C")){%>class="active"<%}%>><a data-toggle="tab">기타</a></li>
	</ul>
	
	<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 219px);">
		<table class="table table-striped table-bordered table-hover order-column">
		<% for(int i=0; i < rsWp.getLength(); i++) { %>
			<tr id="Q_<%=i%>"> 
				<td width="90%" colspan="<%=uSesEnt.use_auth.startsWith("S")?"1":"2"%>" class="t-left">
					&nbsp;<img src="/com/img/icon_question1.gif"> 
					<a href="javascript:goView('<%=i%>')"><span style="font-weight:bold; color:blue;"><%=rsWp.get("faq_sub_category_nm",i)%></span><%=rsWp.get("faq_head",i)%></a>
				</td>
			<% if(uSesEnt.use_auth.equals("SA")) { %>
				<td class="t-center">
					<button type="button" id="btnModify" class="btn btn-primary btn-table" onClick="goEdit('<%=rsWp.get("faq_no",i)%>','<%=rsWp.get("corp_cd",i)%>','<%=rsWp.get("faq_head",i)%>','<%=rsWp.get("faq_content",i,Box.JAVASCRIPT).replaceAll("\"", "@DQUOT@")%>','<%=rsWp.get("faq_category",i)%>','<%=rsWp.get("faq_sub_category",i)%>');">수정</button>
					<button type="button" id="btnDelete<%=i%>" class="btn btn-primary btn-table" onClick="goDelete('<%=rsWp.get("faq_no",i)%>');">삭제</button>
				</td>
			<% } %>
			</tr>	
			<tr id="A_<%=i%>"> 
				<td colspan="2" class="t-left pad10">
					<%=StringUtil.getReplaceSpecialCharacters(rsWp.get("faq_content",i,Box.MULTILINE_TEXT))%>
				</td>
			</tr>
		<% } %>
		</table>
	</div>
	<%=PageUtil.makePaging(box, rsWp, 30, 5, "COUNT", request)%>
	
<% if(!box.get("ajax_yn").equals("Y")) { %>									
</div>				
<!-- FAQ 등록 모달 -->	
<div class="modal fade" id="divEditModal" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog" style="width:800px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">자주 묻는 질문(FAQ)</h4>
			</div>
			<div class="modal-body">
				<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px;">
				<input type="hidden" name="faq_no" value="">					
					<table class="table table-view table-bordered">
						<tbody>
							<tr>
								<th style="width:15%;">질문</th>
								<td class="t-left">
									<select name="faq_category" title="FAQ 분류" value="" class="bs-select form-control required" style="width:18%" onChange="change_faq_category(this.value)">
										<option value=''>::: FAQ 분류 :::</option>
										<%=CodeUtil.optList(codeWp, "faq_category", "")%>
									</select>
									<span id="spanSubCategory" style="display:none">
										<select name="faq_sub_category" title="회계실무사례" value="" class="bs-select form-control required" style="width:25%">
											<option value=''>선택</option>
											<option value='01'>목적사업</option>
											<option value='02'>대부사업</option>
											<option value='03'>예적금거래</option>
											<option value='04'>고유목적사업준비금</option>
											<option value='99'>기타</option>
										</select>
									</span>
									<input type="text" name="faq_head" value="<%=box.get("faq_head")%>" maxlength="100" title="질문" class="form-control required" style="width:55%">
								</td>
							</tr> 
							<tr height="150"> 
								<th>답변</th>
								<td colspan="3"><textarea name="faq_content" class="form-control" style="height:120px;width:100%;ime-mode:active;"></textarea></td>
							</tr>
						<% if(uSesEnt.use_auth.equals("SA")) { %>	
							<tr> 
								<th>공지대상</th>
								<td colspan="3" class="t-left">
									<select name="corp_cd" title="공지대상" class="bs-select form-control" style="width:250px">
										<option value=''>전체</option>
				                		<%=CodeUtil.optList("PR_COMTB_CORP01_LIST","LISTCODE","","corp_cd","","","","")%>
				                	</select> 
								</td>
							</tr>
						<% }else { %>	
							<input type="hidden" name="corp_cd" value="<%=uSesEnt.dbo%>">
						<% } %>
						</tbody>
					</table>
				</form>
				<div class="table-bottom-control">
					<span style="width:100%;">
						<span style="float:right;">
							<button type="button" id="btnSave" class="btn dark" onClick="goSave();"><img src="/com/img/ico_btn_save.png">저장</button>
							<button type="button" id="btnCancel" class="btn dark" onClick="$('#divEditModal button.close').trigger('click');"><img src="/com/img/ico_btn_cancel.png">취소</button>
						</span>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
<% } %>