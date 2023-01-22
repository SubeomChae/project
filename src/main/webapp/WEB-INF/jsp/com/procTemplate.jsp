<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"			scope="request" />
<jsp:useBean id="pkWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="colWp"		class="egovframework.cbiz.RsWrapper"	scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<%	String arr[] = StringUtil.split(box.get("table_nm"),"|",true); %>
<html>
<head>
<title>전자정부프레임워크 템플릿(http://localhost:8080/com/procTemplate.do)</title>
</head>
<script language="javascript">
<!--
function goSearch() {
    document.main.submit();    
}
//-->
</script>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<table border=1>
<form name="main" method="post" action="/com/procTemplate.do">
<input type="hidden" name="db_owner" value="FMSYS">
  <tr>
	<td>
		<select name="table_nm" onchange="goSearch();">
			<%=CodeUtil.optList("TB_DATA_MODEL_DOC","TABLELIST",box.get("table_nm"),"FMSYS","","","","")%>
		</select>
	</td>
	<td>
		<a href="javascript:goSearch();">[검색]</a>
	</td>
  </tr>
</form>
</table>
<br>

<% if (!box.get("table_nm").equals("")) { %>

<%		
		int cwid = 0; // 가장 긴 컬럼
		for (int i=0; i < colWp.getLength(); i++) {
			Box rb = colWp.getRsBoxAt(i); 
			if (cwid < rb.get("column_name").length()) 
				cwid = rb.get("column_name").length();
		}		
		String param_list = "", col_list="", col_list2="", p_col_list="", upd_col_list = "";
		String utable_nm = arr[0].toUpperCase();		
		
		for (int i=0; i < colWp.getLength(); i++) {
			Box rb = colWp.getRsBoxAt(i); 
			if (i>0) { col_list += ", "; col_list2 += ", "; p_col_list += ", "; }
			if (i>0 && i%5 == 0) { col_list += "\n          "; col_list2 += "\n          "; p_col_list += "\n          ";}
			
			param_list += "p_" + StringUtil.rpad(rb.get("column_name").toLowerCase(), " ", 38)
						+ " IN " + StringUtil.rpad(rb.get("data_type").toLowerCase(), " ", 10) + ",    "
						+ (i != colWp.getLength()-1 ? " \n    " : "");			
			col_list += StringUtil.rpad(rb.get("column_name").toLowerCase(), " ", cwid+1);
			col_list2 += "t1." + StringUtil.rpad(rb.get("column_name").toLowerCase(), " ", cwid+1);
			p_col_list += StringUtil.rpad("p_" + rb.get("column_name").toLowerCase(), " ", cwid+1);
			upd_col_list += StringUtil.rpad(rb.get("column_name").toLowerCase(), " ", cwid+2) + " = " 
					+ StringUtil.rpad("p_" + rb.get("column_name").toLowerCase(), " ", cwid+2) 
					+ (i != colWp.getLength()-1 ? ", \n               " : "");		
		}	  
		
		String pk_list = "", pk_where_list = "";
		for (int i=0; i < pkWp.getLength(); i++) {
			Box rb = pkWp.getRsBoxAt(i); 
			if (i>0) { pk_list += ", "; pk_where_list += " and "; }
			
			pk_list += rb.get("column_name").toLowerCase();
			pk_where_list += StringUtil.rpad(rb.get("column_name").toLowerCase(), " ", cwid+2) + " = " 
			            + StringUtil.rpad("p_" + rb.get("column_name").toLowerCase(), " ", cwid+2) 
						+ (i != pkWp.getLength()-1 ? "\n          " : "");		
		}		
%>

<textarea rows='20' cols='150'>
CREATE OR REPLACE PROCEDURE FMSYS.PR_<%=utable_nm%>
(
    p_action_type                            IN varchar2  ,        
    <%=param_list%>	 
    c1 out types.cursorType                                   
)	   
is

/************************************************************************************************************/
/* SPL Id		: PR_<%=utable_nm%>																			*/
/* SPL Name		: <%=arr[1]%> 입력/수정/삭제																			*/
/* Description  :                                                 											*/
/************************************************************************************************************/
/*                                                                                                          */
/*                                      Modification Log                                                    */
/*                                                                                                          */
/* No  Date        Company           Author     Description                                                 */
/* --  ----------  ----------------  --------   ------------------------------------------------------------*/
/* 01  2019/05/03    신진IT컨설팅    정 진 수   Initial Release                                             */
/*                                                                                                          */
/************************************************************************************************************/

BEGIN

	/********************************************************************************************************/
	/* Action Id	: INSERT																				*/
	/* Description	: <%=arr[1]%> 입력																				*/
	/* Called By	:                                                 										*/
	/********************************************************************************************************/
    if p_action_type = 'INSERT' then
        insert into <%=utable_nm%> (
          <%=col_list%>)
        values (
          <%=p_col_list%> );

        open c1 for select <%=pk_list%> from dual;
  
	/********************************************************************************************************/
	/* Action Id	: UPDATE																				*/
	/* Description	: <%=arr[1]%> 수정																				*/
	/* Called By	:                                                 										*/
	/********************************************************************************************************/
    elsif p_action_type = 'UPDATE' then
        update <%=utable_nm%>
           set <%=upd_col_list%>
         where <%=pk_where_list%>; 

	/********************************************************************************************************/
	/* Action Id	: DELETE																				*/
	/* Description	: <%=arr[1]%> 삭제																				*/
	/* Called By	:                                                 										*/
	/********************************************************************************************************/
    elsif p_action_type = 'DELETE' then
        delete from <%=utable_nm%> 
         where <%=pk_where_list%>;
	  
	/********************************************************************************************************/
	/* Action Id	: SELECT																				*/
	/* Description	: <%=arr[1]%> 1건 조회																			*/
	/* Called By	:                                                 										*/
	/********************************************************************************************************/
    elsif p_action_type = 'SELECT' then
        open c1 for
        select <%=col_list2.replaceAll("\n", "\n     ")%>
          from <%=utable_nm%> t1
         where <%=pk_where_list%>;
	   
    end if;
end;
/


CREATE OR REPLACE PROCEDURE FMSYS.PR_<%=utable_nm%>_LIST
(
    p_action_type            IN    VARCHAR2,
    p_param01                IN    VARCHAR2,
    p_param02                IN    VARCHAR2,
    p_param03                IN    VARCHAR2,
    p_param04                IN    VARCHAR2,
    p_param05                IN    VARCHAR2,
    p_param06                IN    VARCHAR2,
    p_param07                IN    VARCHAR2,
    p_param08                IN    VARCHAR2,
    p_param09                IN    VARCHAR2,
    p_param10                IN    VARCHAR2,
    p_page_count             IN    NUMBER,
    p_unit_count             IN    NUMBER,
    c1 OUT types.cursorType
)
IS
    vsql_where         VARCHAR2(2000);
    vsql_main          VARCHAR2(4000);
    vpage_end          NUMBER;
    vpage_start        NUMBER;

/************************************************************************************************************/
/* SPL Id		: PR_<%=utable_nm%>_LIST																	*/
/* SPL Name		: <%=arr[1]%> 목록 조회     	                              								*/
/* Description  :                                                 											*/
/************************************************************************************************************/
/*                                                                                                          */
/*                                      Modification Log                                                    */
/*                                                                                                          */
/* No  Date        Company           Author     Description                                                 */
/* --  ----------  ----------------  --------   ------------------------------------------------------------*/
/* 01  2018/05/03    신진IT컨설팅    정 진 수   Initial Release                                             */
/*                                                                                                          */
/************************************************************************************************************/

BEGIN

	/********************************************************************************************************/
	/* Action Id	: LIST001																				*/
	/* Description	: <%=arr[1]%> 목록                      											*/
	/* Called By	:                                                 										*/
	/********************************************************************************************************/
    if p_action_type = 'LIST001' then
        open c1 for 
        select <%=col_list2.replaceAll("\n", "\n     ")%>
          from <%=utable_nm%> t1
         where <%=pk_where_list%>
        order by <%=pk_list%>;
		  
    end if;

end;
/
</textarea>
<% } %>
</body>
</html>