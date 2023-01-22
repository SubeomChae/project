<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="obox"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% String xmlBuf = ""; %>

<!-- [별지 제3호의3 서식(4)] 이익잉여금처분(결손금처리)계산서 -->
<script language='javascript'>
	$(function() {
		ajaxSubmitForm("xmlUpdate.do","#taxForm", function(rtn) {
			if(rtn.isOk == "Y") {
				hideServerWorking();
			}else {
				alert(rtn.errMsg);
			}
		});
	});
</script>

<form id="taxForm" name="taxForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="report_id" 		value="<%=box.get("report_id")%>">
<input type="hidden" name="std_yy" 			value="<%=box.get("std_yy")%>">
	
	<h2 class="page-title-2depths">이익잉여금처분(결손금처리)계산서</h2>
	
	<div class="table-top-control">
		<span style="float:right;">[별지 제3호의3 서식(4)]</span>
	</div>

	<div id="divListData" class="contentsRow">
		
		<table class="table table-bordered order-column table-cover marB0">
			<%	xmlBuf += "<acc_start_ymd>"+obox.get("acc_start_ymd",Box.DEF_DATE_FMT)+"</acc_start_ymd>\n"
					   +  "<acc_end_ymd>"+obox.get("acc_end_ymd",Box.DEF_DATE_FMT)+"</acc_end_ymd>\n"
					   +  "<corp_nm>"+obox.get("corp_nm")+"</corp_nm>\n"
					   +  "<saupja_no>"+FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))+"</saupja_no>\n"; %>
			<tr>
				<td width="15%" bgcolor="f6f6f6">법인명</td>
				<td colspan="3"><%=obox.get("corp_nm")%></td>
				<td width="15%" bgcolor="f6f6f6">사업자등록번호</td>
				<td colspan="3"><%=FormatUtil.bizRegiNoFormat(obox.get("saupja_no"))%></td>
			</tr> 
			<tr>
				<td bgcolor="f6f6f6">사업연도</td>
				<td colspan="3"><%=obox.get("acc_start_ymd",Box.DEF_DATE_FMT)%> ~ <%=obox.get("acc_end_ymd",Box.DEF_DATE_FMT)%></td>
				<td bgcolor="f6f6f6">처분(처리)확정일</td>
				<td colspan="3"></td>
			</tr> 
			<tr>
				<td colspan="8"></td>
				</tr> 
			<tr>
				<td colspan="4" class="td-head" width="50%">1. 이익잉여금처분계산서</td>
				<td colspan="4" class="td-head" width="50%">2. 결손금처리계산서</td>
				</tr> 
			<tr>
				<td colspan="2" class="td-head" width="30%">과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="15%">금액</td>
				<td colspan="2" class="td-head" width="30%">과목</td>
				<td class="td-head" width="5%">코드</td>
				<td class="td-head" width="15%">금액</td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left">I. 미처분이익잉여금<br>(02+03+04-05+06)</td>
				<td class="t-cetner">01</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left">I. 미처리결손금<br>(31+32+33+34+35)</td>
				<td class="t-cetner">30</td>
				<td class="t-right"></td>
				</tr> 
			<tr>
				<td colspan="2" class="t-left"> 1. 전기이월미처분이익잉여금<br>(또는 전기월 미처리결손금)</td>
				<td class="t-cetner">02</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 1. 전기이월미처리결손금<br>(또는 전기이월미처분이익잉여금)</td>
				<td class="t-cetner">31</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 2. 회계정책변경의 누적효과</td>
				<td class="t-cetner">03</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 2. 회계정책변경의 누적효과</td>
				<td class="t-cetner">32</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 3. 전기오류수정이익<br>(또는 전기오류수정손실)</td>
				<td class="t-cetner">04</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 3. 전기오류수정손실<br>(또는 전기오류수정이익)</td>
				<td class="t-cetner">33</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 4. 중간배당액 </td>
				<td class="t-cetner">05</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 4. 중간배당액 </td>
				<td class="t-cetner">34</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 5. 당기순이익<br>(또는 당기순손실)</td>
				<td class="t-cetner">06</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 5. 당기순손실<br>(또는 당기순이익)</td>
				<td class="t-cetner">35</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left">II. 임의적립금 등의 이입액</td>
				<td class="t-cetner">08</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left">II. 결손금 처리액 </td>
				<td class="t-cetner">40</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-cetner">합계</td>
				<td class="t-cetner">10</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 1. 임의적립금이입액 </td>
				<td class="t-cetner">41</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left">III. 이익잉여금 처분액</td>
				<td class="t-cetner">11</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 2. 그 밖의 법정적립금이입액 </td>
				<td class="t-cetner">42</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 1. 이익준비금 </td>
				<td class="t-cetner">12</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 3. 이익준비금이입액 </td>
				<td class="t-cetner">43</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 2. 기타법정적립금 </td>
				<td class="t-cetner">13</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left"> 4. 자본잉여금이입액 </td>
				<td class="t-cetner">44</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 3. 주식할인발행차금상각액 </td>
				<td class="t-cetner">14</td>
				<td class="t-right"></td>
				<td colspan="2" class="t-left">III. 차기이월미처리결손금 </td>
				<td class="t-cetner">50</td>
				<td class="t-right"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 4. 배당금 </td>
				<td class="t-cetner">15</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left">&nbsp;&nbsp;가. 현금배당 </td>
				<td class="t-cetner">16</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left">&nbsp;&nbsp;나. 주식배당 </td>
				<td class="t-cetner">17</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 5. 이익처분에 의한 상여금 </td>
				<td class="t-cetner">26</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 6. 사업확장적립금 </td>
				<td class="t-cetner">18</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 7. 감채적립금 </td>
				<td class="t-cetner">19</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 8. 그 밖의 적립금 </td>
				<td class="t-cetner">20</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 9. 「조세특례제한법」상 준비금 등 적립액 </td>
				<td class="t-cetner">27</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left"> 10. 그 밖의 잉여금처분액 </td>
				<td class="t-cetner">28</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
			<tr>
				<td colspan="2" class="t-left">IV. 차기이월미처분이익잉여금</td>
				<td class="t-cetner">25</td>
				<td class="t-right"></td>
				<td colspan="3" style="border:none"></td>
			</tr> 
		</table>
	</div>
<textarea name="xmlBuf" style="display:none"><%=xmlBuf%></textarea>
</form>