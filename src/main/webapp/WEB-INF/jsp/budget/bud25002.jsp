<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="pieWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%  RsWrapper welfWp = new RsWrapper();
	RsWrapper loanWp = new RsWrapper();
	for(int i=0; i < pieWp.getLength(); i++) {
		if(pieWp.get("code1",i).equals("목적사업")) { 
			welfWp.appendRs(pieWp.getRsBoxAt(i)); 
		}else if(pieWp.get("code1",i).equals("대부사업")) { 
			loanWp.appendRs(pieWp.getRsBoxAt(i)); 
		}
	}
 %>
 
<!-- 기금운용실적분석(그래프분석) -->
<link rel="stylesheet" type="text/css" href="/com/css/Nwagon.css">
<script type="text/javascript" src="/com/js/Nwagon.js"></script>
<script language='javascript'>
	function goSearch() {
		if(formValidate("#main")) {
			if(document.main.column_key.value == '1') {
				if(parseInt2(document.main.end_yy) - parseInt2(document.main.start_yy) <= 0) {
					alert("년도별로 조회 시, 기간을 1년이상으로 지정해야 합니다.");
					return;
				}
			}
			removeMask("#main");
			document.main.action = 'bud25002_list.do';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function changeColumnKey(column_key) {
		document.getElementById('spanStartYY').style.display = column_key == '2' ? 'none'  : '';
	}
	
	function checkWelfCd() {
		var param04 = '';
		for(var i=0; i < <%=pieWp.getLength()%>; i++) {
			if(document.all['checkbox'+i].checked) { 
				param04 += document.all['checkbox'+i].value.replace('|','acute;');
			}
		}
		var param = 'param01=<%=box.get("column_key")%>&param02=<%=box.get("column_key").equals("2")?box.get("end_yy"):box.get("start_yy")%>&param03=<%=box.get("end_yy")%>&param04='+param04;
		document.ifrm1.location.href = 'bud25002_listS.do?'+param;
	}
	
	function checkLoanCd() {
		var param04 = '';
		for(var i=0; i < <%=pieWp.getLength()%>; i++) {
			if(document.all['checkbox'+i].checked) { 
				param04 += document.all['checkbox'+i].value.replace('|','acute;');
			}
		}
		var param = 'param01=<%=box.get("column_key")%>&param02=<%=box.get("column_key").equals("2")?box.get("end_yy"):box.get("start_yy")%>&param03=<%=box.get("end_yy")%>&param04='+param04;
		document.ifrm2.location.href = 'bud25002_listL.do?'+param;
	}
	
	$(function() {
		changeColumnKey('<%=box.get("column_key")%>');
		<%if(welfWp.getLength() > 0){%>checkWelfCd();<%}%>
		<%if(loanWp.getLength() > 0){%>checkLoanCd();<%}%>
	});
</script>
<h1 class="page-title">기금운용실적분석(그래프분석)</h1>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
	<table class="search-panel table table-bordered">
		<colgroup>
			<col style="width:12%;">
			<col style="width:12%;">
			<col style="width:12%;">
			<col style="width:*;">
		</colgroup>
		<tbody>	
	  		<tr>
				<td class="td-head">조회기준</td>
				<td width="12%">
					<select name="column_key" class='bs-select form-control' title="조회기준" style="width:80px" onChange="changeColumnKey(this.value)">
						<option value='1' <%=box.get("column_key").equals("1")?"selected":""%>>년도별</option>
						<option value='2' <%=box.get("column_key").equals("2")?"selected":""%>>월별</option>
					</select>
				</td>
				<td class="td-head">기준년도</td>
				<td width="*">
					<span id="spanStartYY">
					<select name="start_yy" class='bs-select form-control' style="width:80px;" onChange="goSearch('N')">
						<%=DateUtil.getYearOptionTag(box.get("start_yy"),"2011",DateUtil.nextYear(),"desc","년")%>
					</select> ~ 
					</span>
					<select name="end_yy" class='bs-select form-control' style="width:80px;" onChange="goSearch('N')">
						<%=DateUtil.getYearOptionTag(box.get("end_yy"),"2011",DateUtil.nextYear(),"desc","년")%>
					</select>
					<span class="t-right">
						<button type="button" class="btn btn-primary" onClick="goSearch();"><img src="/com/img/ico_btn_search.png">검색</button>
					</span>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div id="divListData" class="contentsRow">
		<div id="divList" class="table-scrollable scrollOptionY" style='width:100%;height:calc(100vh - 125px);'>
			<table class="table table-striped table-bordered table-hover order-column">
				<tr>
				<% if(welfWp.getLength() > 0) { %>
					<td width="50%">
						<span style="font-size:20px;font-family:나눔고딕;font-weight:bold">목적사업 집행실적</span>
						<div id="divChart1" style="overflow-x:hidden;overflow-y:hidden;"></div>
						<script language="javascript">
						<% 	String fields = ""; String values = "";
							for(int i=0; i < welfWp.getLength(); i++) { 
								fields += (!fields.equals("") ? ",":"") + "'" + welfWp.get("code2",i) + "'";
								values += (!values.equals("") ? ",":"") + welfWp.get("data1",i);
							} %>
							var options = {
								'dataset': {
									values: [<%=values%>],
									colorset: ['#DC143C', '#FF8C00', '#30a1ce', '#2eb400', '#9f9f9f', '#aa7777', '#ffcc33', '#e89800', '#ff8c00', '#cc79a7', '#696a72', '#000000'],
									fields: [<%=fields%>]
								},
								'donut_width': 90, 'core_circle_radius': 0, 'chartDiv': 'divChart1', 'chartType': 'pie', 'chartSize': { width: 500, height: 300 }
							};
							Nwagon.chart(options);
						</script>
					</td>
				<% } %>
				<% if(loanWp.getLength() > 0) { %>
					<td width="50%">
						<span style="font-size:20px;font-family:나눔고딕;font-weight:bold">대부사업 집행실적</span>
						<div id="divChart2" style="overflow-x:hidden;overflow-y:hidden;"></div>
						<script language="javascript">
						<% 	String fields = ""; String values = "";
							for(int i=0; i < loanWp.getLength(); i++) { 
								fields += (!fields.equals("") ? ",":"") + "'" + loanWp.get("code2",i) + "'";
								values += (!values.equals("") ? ",":"") + loanWp.get("data1",i);
							} %>
							var options = {
								'dataset': {
									values: [<%=values%>],
									colorset: ['#DC143C', '#FF8C00', '#30a1ce', '#2eb400', '#9f9f9f', '#aa7777', '#ffcc33', '#e89800', '#ff8c00', '#cc79a7', '#696a72', '#000000'],
									fields: [<%=fields%>]
								},
								'donut_width': 90, 'core_circle_radius': 0, 'chartDiv': 'divChart2', 'chartType': 'pie', 'chartSize': { width: 500, height: 300 }
							};
							Nwagon.chart(options);
						</script>
					</td>
				<% } %>
				</tr>
			<% int bugtLength = 0;
			   if(welfWp.getLength() > 0) {  %>	
				<tr>
					<td colspan="2">
						<table>
							<tr>
								<td width="280px"><h1 class="page-title-2depth">목적사업 집행추이<span style="font-size:11px">(단위:백만원)</span></h1></td>
								<td width="*">
									<span style="background-color:yellow;">
									<% for(int i=0; i < welfWp.getLength(); i++) { bugtLength++; %>
										<label class="mt-checkbox mt-checkbox-outline marL10">
											<input type="checkbox" name="checkbox<%=bugtLength-1%>" value="<%=welfWp.get("sort_key",i)%>|" <%=box.get("param04").equals("") || box.get("param04").indexOf(welfWp.get("sort_key",i)) >= 0 ? "checked":""%> onClick="checkWelfCd()"><%=welfWp.get("code2",i)%><span/>
										</label>
									<% } %>
									</span>
								</td>
							</tr>
						</table>
					<% if(welfWp.getLength() > 0) { %>
						<iframe name="ifrm1" id="ifrm1" marginwidth="0" src="" frameborder="0" width="100%" height="500" scrolling="no"></iframe>
					<% } %>
					</td>
				</tr>
			<% } %>	
			<% if(loanWp.getLength() > 0) { %>	
				<tr>
					<td colspan="2">
						<table>
							<tr>
								<td width="280px"><h1 class="page-title-2depth">대부사업 집행추이<span style="font-size:11px">(단위:백만원)</span></h1></td>
								<td width="*">
									<span style="background-color:yellow;">
									<% for(int i=0; i < loanWp.getLength(); i++) { bugtLength++; %>
										<label class="mt-checkbox mt-checkbox-outline marL10">
											<input type="checkbox" name="checkbox<%=bugtLength-1%>" value="<%=loanWp.get("sort_key",i)%>|" <%=box.get("param04").equals("") || box.get("param04").indexOf(loanWp.get("sort_key",i)) >= 0 ? "checked":""%> onClick="checkLoanCd()"><%=loanWp.get("code2",i)%><span/>
										</label>
									<% } %>
									</span>
								</td>
							</tr>
						</table>
					<% if(loanWp.getLength() > 0) { %>
						<iframe name="ifrm2" id="ifrm2" marginwidth="0" src="" frameborder="0" width="100%" height="500" scrolling="no"></iframe>
					<% } %>
					</td>
				</tr>
			<% } %>	
			</table>
		</div>
	</div>
</form>