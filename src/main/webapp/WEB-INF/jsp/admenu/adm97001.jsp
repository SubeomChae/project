<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="rsWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<% if(box.get("excel_yn").equals("Y")) { %>
<%@ include file="/com/include/excel_header.jsp" %>
<% } %>

<title>거래내역 총괄</title>

<script language="javascript">
	function goSearch(gbn) {
		var theURL = 'adm97001_list.do?tab_index=1';
		if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=거래내역총괄_회사별'; }
		document.main.action = theURL;
		document.main.target = '_self';
		document.main.submit();
	}			
		
	function goTabpage(tab_index) {
		try { parent.document.main.tab_index.value = tab_index; } catch(e) {}
		for(var i=1; i <= 2; i++) {
			document.getElementById('tabImage'+i).style.backgroundImage = 'url(/com/img/bg_tab120_' + (tab_index == i ? 'on' : 'off') + '.gif)';
		}
		var theURL = '';
		if	   (tab_index == '1') { theURL = 'adm97001_list.do?tab_index='+tab_index; }
		else if(tab_index == '2') { theURL = 'adm97001_list.do?tab_index='+tab_index; }		

		document.main.action = theURL; 
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goDetail(corp_cd){
	if(corp_cd == ''){return;}
		wdt = 1000; hgt = 600;
	xPos = Math.ceil((screen.width - wdt) / 2);
	yPos = Math.ceil((screen.height - hgt) / 2);
	window.open('adm96001_list.do?corp_cd='+corp_cd, 'adm96001',"width="+wdt+",height="+hgt+",menubar=no,toolbar=no,scrollbars=yes,resizable=yes,left="+xPos+",top="+yPos);	
	}
</script>

<% if(!box.get("excel_yn").equals("Y")) { %>
<form name="main" method="post" action="" class="fType" style="margin:0px">
<input type="hidden"  name="selectedRow"	value="">
<input type="hidden" name="corp_cd" value="<%=obox.get("corp_cd")%>">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr> 
		<td style="padding:10 10 0 10">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
	        	<tr><td height="35" class="cont_title">거래내역 총괄</td></tr>
			</table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr valign="top">
		<td align="center" style="padding-bottom:10px">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="10%" class="table01_title">기준년도</td>
					<td style="padding-left:5px">
						<select name="apply_yy" title="기준년도" style="width:100px" onChange="goSearch()">
	            			<%=DateUtil.getYearOptionTag(box.get("apply_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
						</select>
					</td>	
					<td width="10%" class="table01_title">조회구분</td>
					<td style="padding-left:5px">
						<select name="amt_type" title="조회구분" style="width:100px" onChange="goSearch()">
							<option value='계산서일자' <%=box.get("amt_type").equals("계산서일자")?"selected":""%>>계산서일자</option>
							<option value='입금일자' <%=box.get("amt_type").equals("입금일자")?"selected":""%>>입금일자</option>
						</select>
					</td>	
					<td width="10%" class="table01_title">책임자</td>
					<td style="padding-left:5px">
						<select name="charge_person" style="width:100px">
							<option value=''>선택</option>							
							<option value='임치형' <%=box.get("charge_person").equals("임치형")?"selected":"" %>>임치형</option>
							<option value='채수범' <%=box.get("charge_person").equals("채수범")?"selected":"" %>>채수범</option>
							<option value='이우진' <%=box.get("charge_person").equals("이우진")?"selected":"" %>>이우진</option>
							<option value='문경남' <%=box.get("charge_person").equals("문경남")?"selected":"" %>>문경남</option>
							<option value='변상민' <%=box.get("charge_person").equals("변상민")?"selected":"" %>>변상민</option>
						</select>	
						<% if(box.get("amt_type").equals("계산서일자")) { %>
						<input type="checkbox" name="next_turm_amt" value="F" <%=box.get("next_turm_amt").equals("F")?"checked":""%> style="border:none" onClick="goSearch()">청구예정
						<% } %>
					</td>
					<td nowrap align="right" style="padding-right:15px">
			  			<a href="javascript:goSearch();"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goSearch('E');"><img src="/com/img/btn_excel.gif" border="0" align="absmiddle"></a>
				    </td>			
		  		</tr>
			</table>			
			<table width="100%" border="0" cellpadding="0" cellspacing="0">				
				<tr>
					<td class="table_description"><span style="font-weight:bold; color:#01a1db;">회사명을 클릭</span>하면 해당 세부내용을 조회할 수 있습니다.</td>					
				</tr>		
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="25" align="center">
					<td id="tabImage1" width="120" nowrap background="/com/img/bg_tab120_on.gif" style="cursor:hand;" onClick="goTabpage('1')">회사별</td>
					<td id="tabImage2" width="120" nowrap background="/com/img/bg_tab120_off.gif" style="cursor:hand;" onClick="goTabpage('2')">책임자별</td>					
					<td width="*" align="right" style="padding-right:5px">(단위 : 원)</td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%" valign="top">
						<div id="divArea" style='width:100%;height:expression(document.body.clientHeight-150);overflow-y:auto'>
<% } %>
						<table width="100%" border="1" cellpadding="5" cellspacing="0" class="table01">				 
							<tr height="25" class="table01_title">					
								<td width="10%">회사명</td>
								<td width="8%">가동일자</td>
								<td width="5%">1월</td>
								<td width="5%">2월</td>
								<td width="5%">3월</td>
								<td width="5%">4월</td>
								<td width="5%">5월</td>
								<td width="5%">6월</td>
								<td width="5%">7월</td>
								<td width="5%">8월</td>
								<td width="5%">9월</td>
								<td width="5%">10월</td>
								<td width="5%">11월</td>
								<td width="5%">12월</td>
								<td width="6%">계</td>
								<td width="6%">책임자</td>
								<td width="5%">비고</td>
							</tr> 
						<% if(rsWp.getLength() == 0) { %>
								<tr height="25" align="center"><td colspan="17">등록된 자료가 없습니다.</td></tr>
						<% }else {
			   				   for(int i=0; i < rsWp.getLength(); i++) { %>
								<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand;" bgcolor="<%=rsWp.get("corp_nm", i).equals("합계")?"f6f6f6":"" %>">
									<td style="padding-left:5px"><a href="javascript:goDetail('<%=rsWp.get("corp_cd", i)%>')"><%=rsWp.get("corp_nm",i)%></a></td>
									<td align="center"><%=rsWp.get("open_ymd",i, Box.DEF_DATE_FMT)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m01_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m01_sign_status", i).equals("")&&!rsWp.get("m01_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m01_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m02_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m02_sign_status", i).equals("")&&!rsWp.get("m02_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m02_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m03_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m03_sign_status", i).equals("")&&!rsWp.get("m03_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m03_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m04_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m04_sign_status", i).equals("")&&!rsWp.get("m04_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m04_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m05_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m05_sign_status", i).equals("")&&!rsWp.get("m05_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m05_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m06_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m06_sign_status", i).equals("")&&!rsWp.get("m06_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m06_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m07_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m07_sign_status", i).equals("")&&!rsWp.get("m07_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m07_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m08_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m08_sign_status", i).equals("")&&!rsWp.get("m08_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m08_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m09_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m09_sign_status", i).equals("")&&!rsWp.get("m09_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m09_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m10_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m10_sign_status", i).equals("")&&!rsWp.get("m10_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m10_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m11_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m11_sign_status", i).equals("")&&!rsWp.get("m11_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m11_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right" style="color: <%if(box.get("amt_type").equals("계산서일자") && !rsWp.get("corp_nm", i).equals("합계")){ if(rsWp.get("m12_sign_status", i).equals("세금계산서발행")){%>da3f3a<%} else if(rsWp.get("m12_sign_status", i).equals("")&&!rsWp.get("m12_amt", i).equals("0")){%>009900<%}}%>"><%=rsWp.get("m12_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("total_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="center"><%=rsWp.get("charge_person", i)%></td>
									<td align="center"><%=rsWp.get("regular_pay_cycle", i)%></td>
								</tr>	
						<% 	   } 
						   } %>
						</table>
<% if(!box.get("excel_yn").equals("Y")) { %>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<% } %>