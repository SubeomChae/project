<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>목적사업/대부사업예산</title>

<script language="javascript">
	function goDetail(bugt_yy, bugt_cd, start_ymd, end_ymd, member_cnt, unit_amt, bugt_amt, exec_amt, remain_amt, intr_rate, defer_year, refund_year, refund_cnt, etc_remark) {
		$("tr[id^='tr_']").removeClass("bg-yellow");
		if(bugt_cd != '') { $("tr[bugt_cd='"+bugt_cd+"']").addClass("bg-yellow"); }
		document.main.bugt_cd.value = bugt_cd;
		document.main.start_ymd.value = start_ymd == '' ? '<%=box.get("bugt_yy")+"0101"%>' : start_ymd;
		document.main.end_ymd.value = end_ymd == '' ? '<%=box.get("bugt_yy")+"1231"%>' : end_ymd;
		document.main.member_cnt.value = member_cnt;
		document.main.unit_amt.value = unit_amt;
		document.main.etc_remark.value = etc_remark;
		document.main.bugt_amt.value = bugt_amt;
		document.main.exec_amt.value = exec_amt;
		document.main.remain_amt.value = remain_amt;
		document.getElementById('divExecAmt').innerHTML = insertComma(exec_amt)+' 원';
		document.getElementById('divRemainAmt').innerHTML = insertComma(remain_amt)+' 원';
		formatMaskElm(document.main.start_ymd);
		formatMaskElm(document.main.end_ymd);
		formatMaskElm(document.main.member_cnt);
		formatMaskElm(document.main.unit_amt);
		formatMaskElm(document.main.bugt_amt);

		<% if(box.get("bugt_cd").startsWith("L")) {	%>
			document.main.intr_rate.value = intr_rate;
			document.main.defer_year.value = defer_year;
			document.main.refund_year.value = refund_year;
			document.main.refund_cnt.value = refund_cnt;
			formatMaskElm(document.main.intr_rate);
			formatMaskElm(document.main.defer_year);
			formatMaskElm(document.main.refund_year);
			formatMaskElm(document.main.refund_cnt);
		<% } %>

		document.getElementById('divEditTable').style.display = '';
		document.getElementById('btnSave').style.display = '';
		document.getElementById('btnDelete').style.display = bugt_yy == '' || parseInt2(document.main.exec_amt) > 0 ? 'none' : '';
		document.main.action_type.value = bugt_yy == '' ? 'INSERT' : 'UPDATE';
	}
	
	function goSave() {
		if (formValidate("#main")) {
			if(confirm('저장하시겠습니까?')) {
				ajaxSubmitForm("bud13001_update.do","#main", function(rtn) {
					if(rtn.isOk == "Y") {
						toastPop1('저장되었습니다.');
						document.main.bugt_cd.value = '<%=StringUtil.substr(box.get("bugt_cd"),0,6)%>';
						returnFormSubmit(document.main, 'bud13001_list.do');
					}else {
						alert(rtn.errMsg);
					}
				});
			}
		}
	}
	
	function goDelete() {
		if(confirm('삭제하시겠습니까?')) {
			ajaxSubmitForm("bud13001_delete.do","#main", function(rtn) {
				if(rtn.isOk == "Y") {
					toastPop1('삭제되었습니다.');
					document.main.bugt_cd.value = '<%=StringUtil.substr(box.get("bugt_cd"),0,6)%>';
					returnFormSubmit(document.main, 'bud13001_list.do');
				}else {
					alert(rtn.errMsg);
				}
			});
		}
	}
	
	function autoCalc(amt_flag) {
		if(amt_flag == '1') {
			document.main.bugt_amt.value = parseInt2(document.main.member_cnt) * parseInt2(document.main.unit_amt);
			formatMaskElm(document.main.bugt_amt);
		}
		document.main.remain_amt.value = parseInt2(document.main.bugt_amt) - parseInt2(document.main.exec_amt);
		document.getElementById('divRemainAmt').innerHTML = insertComma(document.main.remain_amt.value)+' 원';
	}
	$(function() {
	<% if(rsWp.getLength() == 1) {
		out.println("goDetail('"+rsWp.get("bugt_yy",0)+"','"+rsWp.get("bugt_cd",0)+"','"+rsWp.get("start_ymd",0)+"','"+rsWp.get("end_ymd",0)+"','"+rsWp.get("member_cnt",0)+"','"+rsWp.get("unit_amt",0)+"','"+rsWp.getLong("bugt_amt",0)+"','"+(rsWp.getLong("exec_amt",0)+rsWp.getLong("cause_amt",0))+"','"+rsWp.getLong("remain_amt",0)+"','"+rsWp.get("intr_rate",0)+"','"+rsWp.get("defer_year",0)+"','"+rsWp.get("refund_year",0)+"','"+rsWp.get("refund_cnt",0)+"','"+rsWp.get("etc_remark",0)+"');");
	   } 
	%>
	});
</script>

<form id="main" name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="bugt_yy" 	value="<%=box.get("bugt_yy")%>">
<input type="hidden" name="bugt_cd" 	value="<%=box.get("bugt_cd")%>">
<input type="hidden" name="action_type" value="">
<input type="hidden" name="selectedRow" value="">
<input type="hidden" name="popup_yn" 	value="<%=box.get("popup_yn")%>">
<div id="divListData" class="contentsRow">
	<div id="ListTable" class="row row-set table-scrollable">
		<table id="MyTable"  class="table table-striped table-bordered table-hover order-column">
			<colgroup>
				<col style="width: 15%;">
				<col style="width: 35%;">
				<col style="width: 15%;">
				<col style="width: 35%;">
			</colgroup>
			<tr height="28">
				<th>사업명</th>
				<td><%=obox.get("bugt_nm")%></td>
				<th>사업구분</td>
				<td><%=obox.get("bugt_class_nm")%></td>
			</tr>
			<tr height="28">
				<th>사업목적</th>
				<td colspan="3"><%=obox.get("bugt_purpose")%></td>
			</tr>
			<tr height="28">
				<th>지급기준</th>
				<td colspan="3"><%=obox.get("pay_guide")%></td>
			</tr>
		</table>
	
		<h1 class="page-title-2depth"><%=box.get("bugt_yy")%>년 사업계획 </h1>
	
		<table class="table table-striped table-bordered table-hover order-column">
			<thead>
				<tr>
					<th width="20%">구분</th>
					<th width="10%">인원수</th>
					<th width="15%">금액</th>
					<th width="15%">소요예산</th>
					<th width="30%">대상기간</th>
				</tr>
			</thead>
			<tbody>
				<% if(rsWp.getLength() == 0) { %>
					<tr height="25"><td colspan="5">등록된 자료가 없습니다.</td></tr>
				<% }else {
					for(int i=0; i < rsWp.getLength(); i++) { %>
						<tr id="tr_<%=i%>" bugt_cd="<%=rsWp.get("bugt_cd",i)%>" onClick="goDetail('<%=rsWp.get("bugt_yy",i)%>','<%=rsWp.get("bugt_cd",i)%>','<%=rsWp.get("start_ymd",i)%>','<%=rsWp.get("end_ymd",i)%>','<%=rsWp.get("member_cnt",i)%>','<%=rsWp.get("unit_amt",i)%>',
																								  '<%=rsWp.getLong("bugt_amt",i)%>','<%=rsWp.getLong("exec_amt",i)+rsWp.getLong("cause_amt",i)%>','<%=rsWp.getLong("remain_amt",i)%>','<%=rsWp.get("intr_rate",i)%>',
																								  '<%=rsWp.get("defer_year",i)%>','<%=rsWp.get("refund_year",i)%>','<%=rsWp.get("refund_cnt",i)%>','<%=rsWp.get("etc_remark",i)%>')">
							<td><%=rsWp.get("bugt_nm",i)%></td>
							<td class="t-right" style="padding-right:2px"><%=rsWp.get("member_cnt",i)%>&nbsp;</td>
							<td class="t-right" style="padding-right:2px"><%=rsWp.get("unit_amt",i,Box.THOUSAND_COMMA)%>&nbsp;</td>
							<td class="t-right" style="padding-right:2px"><%=rsWp.get("bugt_amt",i,Box.THOUSAND_COMMA)%>&nbsp;</td>
							<td><%=rsWp.get("start_ymd",i,Box.DEF_DATE_FMT)%> ~ <%=rsWp.get("end_ymd",i,Box.DEF_DATE_FMT)%></td>
						</tr>	
					<% } %>
				<% } %>
			</tbody>
		</table>
		<table id="divEditTable" class="table table-view table-bordered" style="display:none">
			<colgroup>
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
			</colgroup>
			<tr height="28">
				<th class="td_head">지급대상기간</th>
				<td nowrap style="padding-left: 5px" colspan="3" >
					<div class="form-inline">
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("start_ymd",Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="start_ymd" name="start_ymd" value="<%=box.get("start_ymd")%>" maxlength="8" title="지급대상기간(부터)" class="form-control required tYMD">
							<span class="input-group-btn">
								<button class="btn dark" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
						<span> ~ </span>
						<div class="input-group input-medium date date-picker" data-date="<%=box.get("end_ymd", Box.DEF_DATE_FMT)%>" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
							<input type="text" id="end_ymd" name="end_ymd" value="<%=box.get("end_ymd")%>" maxlength="8" title="지급대상기간(까지)" class="form-control tYMD">
							<span class="input-group-btn">
								<button class="btn dark" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
					</div>
				</td>
			</tr>
			<tr height="28">
				<th class="td_head">소요예산</th>
				<td colspan="3" nowrap>
					<input type="text" name="member_cnt" value="" maxlength="4" title="인원수" class="form-control required tMONEY"  onChange="autoCalc('1');" style="width:40px"> 명 x 
					<input type="text" name="unit_amt" value="" maxlength="13" title="지원금액" class="form-control required tMONEY" onChange="autoCalc('1');" style="width:100px"> 원 =  
					<input type="text" name="bugt_amt" value="" maxlength="13" title="소요예산" class="form-control required tMONEY" onChange="autoCalc('2');" style="width:100px"> 원
					<input type="hidden" name="exec_amt" value="">
					<input type="hidden" name="remain_amt" value="">
				</td>
			</tr>
		<% if(box.get("bugt_cd").startsWith("L")) {	%> 
			<tr height="28">
				<th class="td_head">상환방법</th>
				<td colspan="3" nowrap>
					<input type="text" name="defer_year" value=""  maxlength="2" title="거치년수" class="form-control required tMONEY" style="width:20px"> 년 거치
					<input type="text" name="refund_year" value="" " maxlength="2" title="상환년수" class="form-control required tMONEY" style="width:30px"> 년 상환
					(상환횟수 : <input type="text" name="refund_cnt" value=""  maxlength="3" title="상환회수" class="form-control required tMONEY" style="width:30px"> 회)
					&nbsp;이자율 <input type="text" name="intr_rate" value=""  maxlength="4" title="이자율" class="form-control required tFLOAT" style="width:30px"> %
				</td>
			</tr>
		<% } %> 
			<tr height="28">
				<th class="td_head">비고</th>
				<td colspan="3"><input type="text" name="etc_remark" value="" maxlength="100" title="비고"  class="form-control" style="width:95%;"></td>
			</tr>
			<tr>
				<th class="td_head">집행금액</th>
				<td><div id="divExecAmt"></div></td>
				<th class="td_head">잔액</th>
				<td><div id="divRemainAmt"></td>
			</tr>
		</table>
	</div>
	<div class="table-bottom-control">
		<span style="width: 100%;">
			<span style="float: right;">
				<button id="btnSave" type="button" class="btn dark" onClick="goSave()" style="display:none"><img src="/com/img/ico_btn_edit.png">저장</button>
				<button id="btnDelete" type="button" class="btn dark" onClick="goDelete()" style="display:none"><img src="/com/img/ico_btn_delete.png">삭제</button>
			</span>
		</span>
	</div>
</form>