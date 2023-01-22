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
		var theURL = 'adm97001_list.do?tab_index=2';
		if(gbn == 'E') { theURL = theURL + '&excel_yn=Y&excel_file_nm=거래내역총괄_책임자별'; }
		
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
		document.main.target = "_self";
		document.main.submit();
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
	</tr>
	<tr valign="top">
		<td align="center" style="padding-bottom:10px">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="10%" class="table01_title" align="center">기준년도</td>
					<td style="padding-left:5px">
						<select name="apply_yy" title="기준년도" style="width:100px" onChange="goSearch()">
	            			<%=DateUtil.getYearOptionTag(box.get("apply_yy"),"2010",DateUtil.nextYear(),"desc","년")%>
						</select>
					</td>
					<td nowrap align="right" style="padding-right:15px">
			  			<a href="javascript:goSearch();"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>&nbsp;
			  			<a href="javascript:goSearch('E');"><img src="/com/img/btn_excel.gif" border="0" align="absmiddle"></a>
				    </td>		
		  		</tr>
			</table>				
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px">
				<tr height="25" align="center">
					<td id="tabImage1" width="120" nowrap background="/com/img/bg_tab120_off.gif" style="cursor:hand;" onClick="goTabpage('1')">회사별</td>
					<td id="tabImage2" width="120" nowrap background="/com/img/bg_tab120_on.gif" style="cursor:hand;" onClick="goTabpage('2')">책임자별</td>					
					<td width="*" align="right">(단위 : 원)</td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100%" valign="top">
						<div id="divArea" style='width:100%;height:expression(document.body.clientHeight-150);overflow-y:auto'>
<% } %>
						<table width="100%" border="1" cellpadding="5" cellspacing="0" class="table01">				 
							<tr height="25" class="table01_title">					
								<td width="11%">구분</td>
								<td width="*">책임자명</td>
								<td width="6%">1월</td>
								<td width="6%">2월</td>
								<td width="6%">3월</td>
								<td width="6%">4월</td>
								<td width="6%">5월</td>
								<td width="6%">6월</td>
								<td width="6%">7월</td>
								<td width="6%">8월</td>
								<td width="6%">9월</td>
								<td width="6%">10월</td>
								<td width="6%">11월</td>
								<td width="6%">12월</td>
								<td width="6%">계</td>
							</tr> 
						<% if(rsWp.getLength() == 0) { %>
							<tr height="25" align="center"><td colspan="15">등록된 자료가 없습니다.</td></tr>
						<% }else {
							   int pass_cnt = 0;
			   				   for(int i=0; i < rsWp.getLength(); i++) {%> 			    				   
								<tr id="tr_<%=i%>" height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase" style="cursor:hand;" bgcolor="<%=rsWp.get("charge_person", i).equals("합계")||rsWp.get("charge_person", i).equals("소계")?"f6f6f6":"" %>">
					       	<% if(pass_cnt==0) {
									int span_cnt = 1;
									for(int j=i+1; j < rsWp.getLength(); j++) { 
										if(!rsWp.get("corp_nm", i).equals(rsWp.get("corp_nm", j))) { break; }
										span_cnt ++;
									} 
							%>
									<td rowspan="<%=span_cnt%>" class="table01_title"><%=rsWp.get("corp_nm", i)%></td>
							<% pass_cnt = span_cnt - 1;
							   }else {
								   pass_cnt --;
							   } %>			
									<td style="padding-left:5px;"><%=rsWp.get("charge_person",i)%></td>
									<td align="right"><%=rsWp.get("m01_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m02_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m03_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m04_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m05_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m06_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m07_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m08_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m09_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m10_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m11_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("m12_amt",i, Box.THOUSAND_COMMA)%></td>
									<td align="right"><%=rsWp.get("total_amt",i, Box.THOUSAND_COMMA)%></td>
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
