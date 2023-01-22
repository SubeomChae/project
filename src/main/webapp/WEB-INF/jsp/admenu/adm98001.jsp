<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="obox"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="copWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="etcWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>거래내역 정산</title>

<script language='javascript'>
	function goSearch() {
		document.main.action = 'adm10.do?method=adm98001_list';
		document.main.target = '_self';
		document.main.submit();
	}
	
	function goCreate() {
		if(confirm('자료생성하시겠습니까?')) {
			document.main.action = 'adm10.do?method=adm98001_create';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function goDeleteAll() {
		if(confirm('분기자료 전체를 삭제하시겠습니까?')) {
			document.main.action = 'adm10.do?method=adm98001_delete_all';
			document.main.target = '_self';
			document.main.submit();
		}
	}
	
	function go_save_etc() {
		if(formValidate(document.saveForm)) {
			if(parseInt(document.saveForm.rel_amt.value) == 0) {
				alert('금액은 0원을 입력할 수 없습니다.');
				document.saveForm.rel_amt.focus();
				return;
			} 
			removeMask(document.saveForm);
			document.saveForm.action_type.value = isEmpty(document.saveForm.jungsan_seq) ? 'INSERT' : 'UPDATE';
			document.saveForm.std_yy.value = document.main.std_yy.value;
			document.saveForm.std_mm.value = document.main.std_mm.value;
			
			document.saveForm.action = 'adm10.do?method=adm98001_update';
			document.saveForm.target = '_self';
			document.saveForm.submit();
		}
	}
	
	function go_delete_etc() {
		if(confirm('삭제하시겠습니까?')) {
			document.saveForm.std_yy.value = document.main.std_yy.value;
			document.saveForm.std_mm.value = document.main.std_mm.value;
			
			document.saveForm.action = 'adm10.do?method=adm98001_delete';
			document.saveForm.target = '_self';
			document.saveForm.submit();
		}
	}
	
	function go_write_file() {
		document.getElementById('divFileTable').style.display = '';
	}
	
	function go_edit_file(jungsan_seq, rel_person, rel_amt, etc_remark) {
		document.saveForm.jungsan_seq.value = jungsan_seq;
		document.saveForm.rel_person.value = rel_person;
		document.saveForm.rel_amt.value = rel_amt;
		document.saveForm.etc_remark.value = etc_remark;
		
		document.getElementById('btnDeleteFile').style.display = '';
		document.getElementById('divFileTable').style.display = '';
	}
</script>
</head>
<body>
<form name="main" method="post" action="" class="fType" style="margin:0px">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr> 
		<td style="padding:10 0 0 10">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr height="35">
					<td width="*" class="cont_title">거래내역 정산</td>
				</tr>
			</table>
		</td>
		<td width="5" rowspan="2" valign="top"></td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table01">
		  		<tr height="28">
					<td width="12%" class="table01_title" align="center">정산년월</td>
					<td width="75%" style="padding-left:5px">
						<select name="std_yy" title="정산년도" style="width:90px" onChange="document.main.ib_changed.value='Y';">
	            			<%=DateUtil.getYearOptionTag(box.get("std_yy"),"2010",DateUtil.getYear(),"desc","년")%>
						</select>&nbsp;
						<select name="std_mm" title="정산분기" onChange="goSearch('N')">
							<option value="03" <%=box.get("std_mm").equals("03")?"selected":""%>>1/4분기</option>
							<option value="06" <%=box.get("std_mm").equals("06")?"selected":""%>>2/4분기</option>
							<option value="09" <%=box.get("std_mm").equals("09")?"selected":""%>>3/4분기</option>
							<option value="12" <%=box.get("std_mm").equals("12")?"selected":""%>>4/4분기</option>
						</select>
					<% if(true) { %>	
					  	&nbsp;<a href="javascript:goCreate();"><img src="/com/img/btn_data_create.gif" border="0" align="absmiddle" alt="자료생성"></a>
					  	&nbsp;<a href="javascript:goDeleteAll();"><img src="/com/img/btn_delete_all.gif" border="0" align="absmiddle" alt="전체삭제"></a>
					<% } %>	
					</td>
				    <td align="center">
			  			<a href="javascript:goSearch();"><img src="/com/img/btn_search.gif" border="0" align="absmiddle"></a>
				    </td>
		  		</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="padding-top:5px">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="25" align="center" class="table01_title">
					<td rowspan="2" width="12%">구분</td>
					<td colspan="6">(주)신진아이티컨설팅</td>
					<td>컨소시엄</td>
					<td rowspan="2" width="12%">부가가치세<br>(VAT)</td>
					<td rowspan="2" width="12%">합계</td>
				</tr>
				<tr height="25" align="center" class="table01_title">
					<td width="8%">적립금</td>
					<td width="8%">임치형</td>
					<td width="8%">채수범</td>
					<td width="8%">이우진</td>
					<td width="8%">변상민</td>
					<td width="12%">소계</td>
					<td width="12%">연구소</td>
				</tr>
				<tr height="25">
					<td class="table01_title">수입</td>
					<td align="right" style="padding-right:10px"><%=obox.get("jungsan_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("lch_in_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("csb_in_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("lwj_in_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("bsm_in_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("in_sub_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("consor_in_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("vat_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("in_tot",Box.THOUSAND_COMMA)%></td>
				</tr>
				<tr height="25">
					<td class="table01_title">지출</td>
					<td align="right" style="padding-right:10px">-</td>
					<td align="right" style="padding-right:10px"><%=obox.get("lch_out_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("csb_out_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("lwj_out_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("bsm_out_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("out_sub_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("consor_out_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px">-</td>
					<td align="right" style="padding-right:10px"><%=obox.get("out_tot",Box.THOUSAND_COMMA)%></td>
				</tr>
				<tr height="25">
					<td class="table01_title">합계</td>
					<td align="right" style="padding-right:10px"><%=obox.get("jungsan_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("lch_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("csb_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("lwj_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("bsm_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("sinjin_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("consor_tot",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("vat_amt",Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:10px"><%=obox.get("total_amt",Box.THOUSAND_COMMA)%></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="sub_cont_title" vAlign="middle" height="30" style="padding-top:10px">
			<img height="13" src="/com/img/title_bullet.gif" width="17" border="0" align="absmiddle"> 세부 거래내역
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="25" align="center" class="table01_title">
					<td width="3%">No</td>
					<td width="10%">회사명</td>
					<td width="10%">구분</td>
					<td width="10%">입금일자</td>
					<td width="10%">입금금액</td>
					<td width="10%">부가세</td>
					<td width="10%">신진ITC</td>
					<td width="10%">컨소시엄</td>
          		</tr> 
		<% if(copWp.getLength() == 0) { %>
				<tr height="25"><td colspan="20" align="center">등록된 자료가 없습니다.</td></tr>
		<% }else {
		   	   for(int i=0; i < copWp.getLength(); i++) { %>
				<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
					<td align="center"><%=copWp.get("row_num",i)%></td>
					<td align="center"><%=copWp.get("corp_nm",i)%></td>
					<td align="center"><%=copWp.get("amt_class",i)%></td>
					<td align="center"><%=copWp.get("acct_ymd",i,Box.DEF_DATE_FMT)%></td>
					<td align="right" style="padding-right:5px"><%=copWp.get("tot_amt",i,Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:5px"><%=copWp.get("vat_amt",i,Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:5px"><%=copWp.get("sinjin_amt",i,Box.THOUSAND_COMMA)%></td>
					<td align="right" style="padding-right:5px"><%=copWp.get("consortium_amt",i,Box.THOUSAND_COMMA)%></td>
				</tr>	
		<% 	   }
		   } %>
			</table>
		<% if(copWp.getLength() > 0) { %>	
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		        <tr>
					<td align="center" style="padding-top:5px"><%=copWp.getPageLine(request, 10, 10)%></td>
				</tr>
		    </table>
		<% } %>	
		</td>
  	</tr>
	<tr>
		<td class="sub_cont_title" vAlign="middle" height="30" style="padding-top:10px">
			<img height="13" src="/com/img/title_bullet.gif" width="17" border="0" align="absmiddle"> 기타 거래내역
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" cellpadding="0" cellspacing="0" class="table01">
				<tr height="30" align="center" class="table01_title">
					<td width="3%">No</td>
					<td width="20%">담당자</td>
					<td width="13%">금액</td>
					<td width="62%">적요</td>
					<td width="2%"><a href="#" onClick="go_write_file()"><img src="/com/img/icon_add3.gif" border=0 align="absmiddle" alt="추가"></a></td>
          		</tr> 
		<% if(copWp.getLength() == 0) { %>
				<tr height="25"><td colspan="20" align="center">등록된 자료가 없습니다.</td></tr>
		<% }else {
		   	   for(int i=0; i < etcWp.getLength(); i++) { %>
				<tr height="25" onMouseOver="this.className='btnover'" onMouseOut="this.className='btnbase'" class="buttonbase"> 
					<td align="center"><%=i+1%></td>
					<td align="center"><%=etcWp.get("rel_person",i)%></td>
					<td align="right" style="padding-right:10px"><%=etcWp.get("rel_amt",i,Box.THOUSAND_COMMA)%></td>
					<td style="padding-left:5px"><%=etcWp.get("etc_remark",i)%></td>
					<td align="center"><a href="#" onClick="go_edit_file('<%=etcWp.get("jungsan_seq",i)%>','<%=etcWp.get("rel_person",i)%>','<%=etcWp.get("rel_amt",i)%>','<%=etcWp.get("etc_remark",i)%>')"><img src="/com/img/icon_doc.gif" border=0 align="absmiddle" alt="수정"></a></td>
				</tr>	
		<% 	   }
		   } %>
			</table>
		</td>
  	</tr>
</table>
</form>
<form id="saveForm" name="saveForm" method="post" action="" class="fType" style="margin:0px">
<input type="hidden" name="action_type"	value="">
<input type="hidden" name="std_yy"	value="">
<input type="hidden" name="std_mm"	value="">
<input type="hidden" name="jungsan_seq"	value="">
<table id="divFileTable" cellpadding="0" cellspacing="1" border="0" bgcolor="#000000" style="position:absolute;left:30%;top:55%;width:400px;background:#000000;z-index:1;display:none;">
	<tr>
	  	<td bgcolor="white">
			<table width="420" border="1" cellpadding="0" cellspacing="0" class="table03">
				<tr height="25">
					<td colspan="4" align="center" bgcolor="#000000"><font color=white><b>기타 거래내역</b></font></td>
				</tr>
				<tr height="28">
					<td width="70" align="center" class="table01_title">담당자</td>
					<td width="140" style="padding-left:5px">
						<select name="rel_person" class="required" style="width:130px">
							<option value=''>선택</option>
							<option value='임치형'>임치형</option>
							<option value='채수범'>채수범</option>
							<option value='이우진'>이우진</option>
							<option value='변상민'>변상민</option>
							<option value='사내근로복지기금연구소'>연구소</option>
						</select>
					</td>
					<td width="70" align="center" class="table01_title">금액</td>
					<td width="140" style="padding-left:5px">
						<input type="text" name="rel_amt" value="" class="required tFMONEY" style="width:130px">
					</td>
				</tr>
				<tr height="28">
					<td align="center" class="table01_title">적요</td>
					<td colspan="3" style="padding-left:5px"><input type="text" name="etc_remark" maxlength="50" class="required" title="적요" style="width:350px;height:20px;font-size:11px;border:1 solid gray;ime-mode:active;"></td>
				</tr>
				<tr>
					<td colspan="4" align="right" style="padding:5 5 5 0">
						<img id="btnSaveFile" src="/com/img/bn_save.gif" border="0" align="absmiddle" alt="저장" style="cursor:hand" onClick="go_save_etc()">
						<img id="btnDeleteFile" src="/com/img/bn_delete.gif" border="0" align="absmiddle" alt="삭제" style="cursor:hand;display:none" onClick="go_delete_etc()">
						<img id="btnCancelFile" src="/com/img/bn_cancel.gif" border="0" align="absmiddle" alt="취소" style="cursor:hand;" onClick="document.getElementById('divFileTable').style.display='none';">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>