<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>사업코드</title>
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(bugt_cd) {
		ajaxReplaceForm("bud01001_list.do", "#main", "#divListData", function() {
			if(bugt_cd == '') {
				if ($("tr[id='tr_0']").attr("bugt_cd") != undefined) {
					goDetail($("tr[id='tr_0']").attr("bugt_cd"));
				}
			}else {
				goDetail(bugt_cd); 
			}
		});
	}
		
	function goDetail(bugt_cd) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(bugt_cd != '') { $("tr[bugt_cd='"+bugt_cd+"']").addClass("bg-yellow"); }
	    var theUrl= '/budget/fd/bud01002_select.do';
		document.main.bugt_cd.value = bugt_cd;
	    document.ifrm.location.href = theUrl+"?bugt_cd="+ bugt_cd;	
	
	}

	function goWrite() {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		document.ifrm.location.href = '/budget/fd/bud01003_edit.do';
	}
	
	$(function() {
	<%  if(!box.get("bugt_cd").equals("")) { 
			out.println("goDetail('"+box.get("bugt_cd")+"');");
		}else if(rsWp.getLength() > 0) { 
			out.println("goDetail('"+rsWp.get("bugt_cd",0)+"');");
		}else if(uSesEnt.use_auth.equals("SA")) {
			out.println("goWrite();");
		}
	%>
	});
</script>
<h1 class="page-title">사업코드</h1>
<form id="main" name="main" method="post" action="" class="fType" style="margin: 0px">
	<input type="hidden" name="selectedRow" value="">
	<input type="hidden" name="bugt_cd" 	value="">
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:10%;">
			<col style="width:20%;">
			<col style="width:10%;">
			<col style="width:60%;">
		</colgroup>
		<tr height="28">
			<td  class="td-head" >사업구분</td>
			<td style="padding-left: 5px">
				<select name="bugt_class" style="width: 120px" onChange="goSearch('')" class="bs-select form-control">
					<option value='S' <%=box.get("bugt_class").equals("S") ? "selected" : ""%>>목적사업</option>
					<option value='L' <%=box.get("bugt_class").equals("L") ? "selected" : ""%>>대부사업</option>
				</select>
			</td>
			<td class="td-head">
				<select name="search_key" style="width: 90%" class="bs-select form-control" >
					<option value='1' <%=box.get("search_key").equals("1") ? "selected" : ""%>>사업명</option>
					<option value='2' <%=box.get("search_key").equals("2") ? "selected" : ""%>>사업목적</option>
					<option value='3' <%=box.get("search_key").equals("3") ? "selected" : ""%>>지급기준</option>
				</select>
			</td>
			<td>
				<input type="text" name="search_val" value="<%=box.get("search_val")%>" class="form-control" style="width: 140px;  ime-mode: active;" onkeydown="if(event.keyCode == 13) goSearch('');">
				&nbsp;
				<label class="mt-checkbox mt-checkbox-outline" style="width:140px">
					<input type="checkbox" name="use_flag" value="Y" <%=box.get("use_flag").equals("Y") ? "checked" : ""%>> 폐지코드 포함<span/>
				</label>
				
				<span class="f-right marR60">
					<button type="button" class="btn btn-primary" onClick="goSearch('');"><img src="/com/img/ico_btn_search.png">검색</button>
					<%if (uSesEnt.use_auth.startsWith("SA")) {%>
					<button type="button" class="btn dark" onClick="goWrite();"><img src="/com/img/ico_btn_refresh_edit.png">신규</button>
					<%}%>
				</span>
			</td>
		</tr>
	</table>
</form>
<div id="divListData" class="contentsRow"> 
<% } %> 
	<div class="row row-set">
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
			<div class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 120px);">
				<table class="table table-striped table-bordered table-hover order-column">
					<tr>
						<th width="25%">사업코드</th>
						<th width="75%">사업명</th>
					</tr>
					<% if(rsWp.getLength() == 0) { %>
					<tr height="25"><td colspan="2">등록된 자료가 없습니다.</td></tr>
					<%}else { 
						for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" bugt_cd="<%=rsWp.get("bugt_cd",i)%>" class="odd gradeX" style="cursor:pointer" onClick="setBackColor('<%=i%>');goDetail('<%=rsWp.get("bugt_cd",i)%>');"> 
							<td><%=rsWp.get("bugt_cd",i)%></td>
							<td><font color="<%=rsWp.get("use_yn",i).equals("N")?"red":""%>"><%=rsWp.get("bugt_nm",i)%></font></td>
						</tr>
						<% } %>
					<% } %>
				</table>
			</div>
		</div>		
	
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
			<iframe id ='ifrm' name="ifrm" marginwidth="0"  style="width:100%; height:calc(100vh - 120px); overflow-y:auto;" frameborder="0" scrolling="auto"></iframe>
		</div>
	</div>
<% if(!box.get("ajax_yn").equals("Y")) { %>
</div>
<% } %>
        