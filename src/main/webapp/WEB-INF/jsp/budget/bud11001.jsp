<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>사업계획 수립</title>
<% if(!box.get("ajax_yn").equals("Y")) { %>
<script language="javascript">
	function goSearch(acct_cd2, bugt_cd, acct_full_nm) {
		ajaxReplaceForm("bud11001_list.do", "#main", "#divListData", function() {
			if(bugt_cd == '') {
				if ($("tr[id='tr_0']").attr("acct_cd2") != undefined) {
					goDetail($("tr[id='tr_0']").attr("acct_cd2"), $("tr[id='tr_0']").attr("bugt_cd"), $("tr[id='tr_0']").attr("acct_full_nm"));
				}
			}else {
				goDetail(acct_cd2, bugt_cd, acct_full_nm); 
			}
		});
	}
	
	function goDetail(acct_cd, bugt_cd, acct_nm) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(acct_cd != '') { $("tr[acct_cd2='"+acct_cd+"']").addClass("bg-yellow"); }
		var pageUrl = '';
		if(acct_cd.substring(0,3) == '711' || acct_cd.substring(0,5) == '12103') { // 목적사업, 대부사업예산
			pageUrl = '/budget/fd/bud13001_list.do';
		}else { // 수입예산/비용예산/자본예산
			pageUrl = '/budget/fd/bud12001_list.do';
		}
		document.main.acct_nm.value = acct_nm;
		
		document.main.action = pageUrl+'?acct_cd='+acct_cd+'&bugt_cd='+ bugt_cd+ '&bugt_yy='+ document.main.bugt_yy.value;
		document.main.target= 'ifrm';
		document.main.submit();
	}
	
	function goCreate() {
		if(formValidate("#main")) {
			if(confirm(document.main.bugt_yy.value +'년도 사업계획 기초데이터를 생성하시겠습니까?')) {
				removeMask("#main");				
				document.main.action = 'bud11001_create.do';
				document.main.target = '_self';
				document.main.submit();
			}
		}
	}
	
	function go_plan_code() {
		wdt = 550; hgt = 530;
	   	xPos = Math.ceil((screen.width - wdt) / 2);
	    yPos = Math.ceil((screen.height- hgt) / 2);
	   	window.open('/budget/pd/bud11002_list.do', 'bud11002', "width="+wdt+",height="+hgt+",menubar=no,toolbar=no,scrollbars=no,resizable=no,left="+xPos+",top="+yPos);
	}
	
	$(function() {
	<% if(rsWp.getLength() > 0) { 
		out.println("goDetail('"+rsWp.get("acct_cd2",0)+"','"+rsWp.get("bugt_cd",0)+"','"+rsWp.get("acct_full_nm",0)+"');");
	   }	
	%>
		fixTableHeader("MyTable");
	});
</script>
<table class="table-top-control">
	<tr height="35">
		<td>
		<h1 class="page-title">사업계획 수립</h1>
		</td>
		<% if(uSesEnt.use_auth.startsWith("SA")) { %>
		<td>
			<div class="form-inline f-right">
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="go_plan_code()"><i class="fa fa-list fa-lg"></i> 사업계획 계정과목코드관리</button>
				</div>
			</div>
		</td>	
		<% } %>
	</tr>
</table>
<form id="main" name="main" method="post" action="" class="fType" enctype="multipart/form-data" style="margin:0px">
<input type="hidden" name="acct_nm" 	value="">
<input type="hidden" name="selectedRow" value="">

	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:12%;">
			<col style="width:*;">
		</colgroup>
		<tbody>
			<tr>
				<td class="td-head">사업년도</td>
				<td style="padding-left:5px">
					<select name="bugt_yy" title="기준년도" class="bs-select form-control" style="width:100px">
					<option value=''>선택</option>
					<%=DateUtil.getYearOptionTag(box.get("bugt_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
					</select>
					<button type="button" class="btn btn-primary" onClick="goSearch('', '', '');"><img src="/com/img/ico_btn_search.png">검색</button>
					<button type="button" class="btn dark" onClick="goCreate();"><img src="/com/img/ico_btn_refresh_edit.png">자료생성</button>
				</td>
			</tr>
		</tbody>
	</table>		    
<div id="divListData" class="contentsRow">
<% } %>
	<div class="row row-set">
		<div class="col-md-5 col-xs-5 col-sm-5 row-set-col padL0 padR0">
			<div id="divArea" class="table-scrollable scrollOptionY" style="width:100%; height:calc(100vh - 120px);">
				<table id="MyTable" class="table table-striped table-bordered table-hover order-column">
					<colgroup>
						<col style="width:30px;">
						<col style="width:70px;">
						<col style="width:*;">
						<col style="width:90px;">
						<col style="width:90px;">
					</colgroup>
					<thead>
						<tr align="center" class="table01_title">
							<th colspan="3" rowspan="2">사업계획 계정과목</th>
							<th colspan="2">금액(천원)</th>
						</tr> 
						<tr align="center" class="table01_title">
							<th>목적사업회계</th>
							<th>기금관리회계</th>
						</tr>
					</thead>
					<tbody>
					<% if(rsWp.getLength() == 0) { %>
							<tr><td colspan="2" align="center">등록된 자료가 없습니다.</td></tr>
					<%}else { 
						  int pass_cnt1 = 0; int pass_cnt2 = 0;
						  for(int row_index=0; row_index < rsWp.getLength(); row_index++) { %>
							<tr id="tr_<%=row_index%>" acct_cd2="<%=rsWp.get("acct_cd2",row_index)%>" bugt_cd="<%=rsWp.get("bugt_cd",row_index)%>" acct_full_nm="<%=rsWp.get("acct_full_nm",row_index)%>" height="25" style="cursor:pointer" 
								onClick="goDetail('<%=rsWp.get("acct_cd2",row_index)%>','<%=rsWp.get("bugt_cd",row_index)%>','<%=rsWp.get("acct_full_nm",row_index)%>');"> 
							<% if(pass_cnt1 == 0) {
									int span_cnt = 1;
									for(int tmp_index=row_index+1; tmp_index < rsWp.getLength(); tmp_index++) {
										if(!rsWp.get("acct_nm0",row_index).equals(rsWp.get("acct_nm0",tmp_index))) { break; }
										span_cnt ++;
									} %>
									<td rowspan="<%=span_cnt%>" bgcolor='ffffff' style="letter-spacing:-1px"><%=rsWp.get("acct_nm0",row_index)%></td>
								<%	pass_cnt1 = span_cnt - 1;
							   }else {
									pass_cnt1 --;
							   }
							%>
							<% if(pass_cnt2 == 0) {
									int span_cnt = 1;
									for(int tmp_index=row_index+1; tmp_index < rsWp.getLength(); tmp_index++) {
										if(!rsWp.get("acct_nm1",row_index).equals(rsWp.get("acct_nm1",tmp_index))) { break; }
										span_cnt ++;
									} %>
									<td rowspan="<%=span_cnt%>" bgcolor='ffffff' style="letter-spacing:-1px"><%=rsWp.get("acct_nm1",row_index)%></td>
								<%	pass_cnt2 = span_cnt - 1;
							   }else {
									pass_cnt2 --;
							   }
							%>
								<td><%=rsWp.get("acct_nm2",row_index)%></td>
								<td><%=rsWp.get("bugt_amt00",row_index,Box.THOUSAND_COMMA)%></td>
								<td><%=rsWp.get("bugt_amt20",row_index,Box.THOUSAND_COMMA)%></td>
							</tr>
						<% } %>
					<% } %>	
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="col-md-7 col-xs-7 col-sm-7 row-set-col">
			<iframe id ='ifrm' name="ifrm" marginwidth="0"  style="width:100%; height:calc(100vh - 120px); overflow-y:auto;" frameborder="0" scrolling="yes"></iframe>
		</div>
	</div>
</div>

</form>