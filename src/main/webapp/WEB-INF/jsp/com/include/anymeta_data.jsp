<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*, egovframework.ubiz.util.anyMetaData "%>
<jsp:useBean id="box"	   	class="egovframework.cbiz.Box"		  	scope="request" />
<jsp:useBean id="uSesEnt"   class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%
	anyMetaData anyData  = (anyMetaData)request.getAttribute("anyMetaData");
	int table_width = 0;
%>
<% if(anyData == null || anyData.getMetaRsWp() == null) { %>
	<table id='AnyMeta' width='100%' class='table table-bordered table-hover'>
		<tr height="25"><th></th></tr>
		<tr height="25"><td class="t-center">검색조건을 설정하신 후, 검색버튼을 클릭하세요.</td></tr>
	</table>
<% }else { 
	boolean isOK = false;
	RsWrapper MetaWp = anyData.getMetaRsWp();
	RsWrapper HeaderWp = anyData.getHeaderRsWp();
	RsWrapper ColWp = anyData.getColRsWp();
	RsWrapper DataWp = anyData.getDataRsWp();

	// 테이블 정보 추출
	// 그룹핑할 컬럼 수, 1이면 첫번째 컬럼에 대해서만 값이 같을 때 열병합
	int vert_hdr_stag_cnt = MetaWp.getRsBoxAt(0).getInt("vert_hdr_stag_cnt");

	// 그룹 헤더정보 추출
	String[] mark_hdr_nm	= new String[HeaderWp.getLength() == 0 ? 1 : HeaderWp.getLength()];
	String[] loca_top		= new String[HeaderWp.getLength() == 0 ? 1 : HeaderWp.getLength()];
	String[] loca_bottom	= new String[HeaderWp.getLength() == 0 ? 1 : HeaderWp.getLength()];
	String[] loca_left		= new String[HeaderWp.getLength() == 0 ? 1 : HeaderWp.getLength()];
	String[] loca_right		= new String[HeaderWp.getLength() == 0 ? 1 : HeaderWp.getLength()];

	for(int i=0; i < HeaderWp.getLength(); i++) {
		// 헤더의 파라미터값 치환
		mark_hdr_nm[i]	= HeaderWp.get("mark_hdr_nm",i);
		loca_top[i]		= HeaderWp.get("loca_top",i);
		loca_bottom[i]	= HeaderWp.get("loca_bottom",i);
		loca_left[i]	= HeaderWp.get("loca_left",i);
		loca_right[i]	= HeaderWp.get("loca_right",i);
	}	

	// 컬럼정보 추출
	Hashtable htLink = new Hashtable();
	String[] col_no			= new String[ColWp.getLength()];
	String[] sql_order		= new String[ColWp.getLength()];
	String[] col_width		= new String[ColWp.getLength()];
	String[] data_type		= new String[ColWp.getLength()];
	String[] align_type		= new String[ColWp.getLength()];
	String[] href_script	= new String[ColWp.getLength()];
	
	for(int i=0; i < ColWp.getLength(); i++) {
		col_no[i]		= ColWp.get("col_no",i);
		sql_order[i]	= ColWp.get("sql_order",i);
		col_width[i]	= ColWp.get("col_width",i);
		data_type[i]	= ColWp.get("data_type",i);
		align_type[i]	= ColWp.get("align_type",i);
		href_script[i]	= box.get("excel_yn").equals("Y") ? "" : ColWp.get("href_script",i);
		table_width += ColWp.getInt("col_width",i);
		// 하이퍼링크정보
		if(href_script[i] != "") {
			if(htLink.get(col_no[i]) == null) { htLink.put(col_no[i], new ArrayList()); }

			int spos = 0; int epos = 0;
			while((spos = href_script[i].indexOf("@", epos+1)) >= 0) {
				epos = href_script[i].indexOf("@", spos+1);
				((ArrayList)htLink.get(col_no[i])).add(href_script[i].substring(spos+1, epos));
			}
		}
	}

	// 헤더영역
	//System.out.println("####################table_width="+table_width);
	out.println("<table id='AnyMeta' class='table table-bordered table-hover' style='width:"+table_width+"px'>");
	out.print(StringUtil.colWidth(col_width));
	out.println("\n<thead>");
	out.println("\n\t<tr>");
	String prev_loca_top = "0";
	for(int i=0; i < mark_hdr_nm.length; i++) {
		if(!loca_top[i].equals(prev_loca_top)) {
			out.println("\n\t</tr>");
			out.println("\n\t<tr>");
			prev_loca_top = loca_top[i];
		}
		int rowspan = Integer.parseInt(loca_bottom[i]) - Integer.parseInt(loca_top[i]) + 1;
		int colspan = Integer.parseInt(loca_right[i]) - Integer.parseInt(loca_left[i]) + 1; %>
		<th<%if(rowspan>1){%> rowspan='<%=rowspan%>'<%}%><%if(colspan>1){%> colspan='<%=colspan%>'<%}%>><%=mark_hdr_nm[i]%></th><%
	}
	out.println("\n\t</tr>");
	out.println("\n</thead>");

	// 데이터 영역
	int[] pass_cnt = {0, 0, 0, 0, 0, 0, 0};	// Grouping 컬럼수를 최대 7로 제한
	for(int row_index=0; row_index < DataWp.getLength(); row_index++) {
		out.println("\n\t<tr>");
		Box rb = DataWp.getRsBoxAt(row_index);
		String bgColor = "";
		for(int col_index=0; col_index < col_no.length; col_index++) {
			String value_txt = rb.get(col_index);
			if(!value_txt.equals("")) {
				if(data_type[col_index].equals("N")) { // 숫자
					value_txt = FormatUtil.insertComma(value_txt);
				}else if(data_type[col_index].equals("P")) {  // 소숫점 고정 숫자
					value_txt = FormatUtil.dotPadding(value_txt,2); 
				}else if(data_type[col_index].equals("M")) {  // 금액
					value_txt = FormatUtil.insertComma(value_txt);
				}else if(data_type[col_index].equals("D")) {  // 날짜
					value_txt = DateUtil.defFmtDate(value_txt);
				}else if(data_type[col_index].equals("L")) {  // 긴문자
					value_txt = value_txt.replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;").replaceAll("&amp;#8228;", "·");
				}
	
				if(col_index < 2 && "총계,합계,소계,전체".indexOf(value_txt) >= 0) {
					bgColor = " bgcolor='#f6f6f6'";
				}
			}

			// 하이퍼링크 만들기
			if(href_script[col_index] != "") {
				String tmp_script = href_script[col_index];
				ArrayList al = ((ArrayList)htLink.get(col_no[col_index]));
				for(int k=0; k < al.size(); k++) {
					String dbkey = (String)al.get(k);
					tmp_script = tmp_script.replaceAll("@" + dbkey + "@", rb.get(dbkey));
				}
				value_txt = "<a href=\""+tmp_script+"\">"+value_txt+"</a>";
			}

			String align_txt = "t-center";
			String style_txt = "";
			if(align_type[col_index].equals("L")) {
				align_txt = "t-left";
			}else if(align_type[col_index].equals("R")) {
				align_txt = "t-right";
				style_txt = " style='padding-right:2px'";
			}

			// Grouping 컬럼수에 따라 열병합
			if(vert_hdr_stag_cnt > col_index) {
				if(pass_cnt[col_index] == 0) {
					int span_cnt = 1;
					for(int tmp_index=row_index+1; tmp_index < DataWp.getLength(); tmp_index++) {
						Box tmp_rb = DataWp.getRsBoxAt(tmp_index);
						isOK = true;
						for(int j=0; j < col_index + 1; j++) {
							if(!tmp_rb.get(j).equals(rb.get(j))) {
								isOK = false;
								break; 
							}
						}
						if(isOK) { span_cnt ++; }
					}
					if(span_cnt > 1) {
						out.println("\t\t<td rowspan='"+span_cnt+"' class='"+align_txt+"'" + bgColor + style_txt+">"+value_txt+"</td>");
					}else {
						out.println("\t\t<td class='"+align_txt+"'" + bgColor + style_txt+">"+value_txt+"</td>");
					}
					pass_cnt[col_index] = span_cnt - 1;
				}else {
					pass_cnt[col_index] --;
				}
			}else {
				out.println("\t\t<td class='"+align_txt+"'" + bgColor + style_txt+">"+value_txt+"</td>");
			}
		}
		out.println("\t</tr>");
	}	
	out.println("</table>");
   }
%>

<script language="javascript">
	function goResizing() {
		var table_width = $("#divList").width() > <%=table_width%> ? ($("#divList").width() - 18) : <%=table_width%>;
		$("#AnyMeta").attr('style', 'width: '+table_width+'px !important');
		if($("#AnyMeta").width() <= $("#divList").width()) { fixTableHeader("AnyMeta"); }
	}

	$(function() {
		$(window).resize(function() { goResizing(); });
		goResizing();
	});
</script>