<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"		class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="lineWp"	class="egovframework.cbiz.RsWrapper"    scope="request" />
<jsp:useBean id="uSesEnt" 	class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />

<title>그래프분석(대부사업 집행추이)</title>
<link rel="stylesheet" type="text/css" href="/com/css/Nwagon.css">
<script type="text/javascript" src="/com/js/Nwagon.js"></script>
<form name="main" method="post" action="" class="fType" style="margin:0px">
<table class="search-panel table table-bordered">
	<tr> 
		<td style="border:none">
			<div id="divChart4" style="overflow-x:hidden;overflow-y:hidden;"></div>
			<script language="javascript">
			<%  String fields = ""; int colLength = 0; float maxValue = 0; 
				String ArrCol[] = {"","","","","","","","","","","","","","","","","",""};
				if(box.get("param01").equals("1")) {
					for(int i=0; i <= box.getInt("param03")-box.getInt("param02"); i++) {
						ArrCol[i] = String.valueOf(i+box.getInt("param02"));
						colLength++;
					}
				}else {
					for(int i=0; i < 12; i++) {
						ArrCol[i] = String.valueOf(i+1); 
						colLength++;
					}
				}
				
				String ArrVal[] = new String[colLength];
				for(int i=0; i < colLength; i++) { 
					ArrVal[i] = "[";
				}
				
				for(int i=0; i < lineWp.getLength(); i++) { if(!lineWp.get("code1",i).equals("대부사업")) { continue; }
					fields += (!fields.equals("") ? ",":"") + "'" + lineWp.get("code2",i) + "'";
					if(maxValue < lineWp.getFloat("max_value",i)) { maxValue = lineWp.getFloat("max_value",i); } 
					for(int j=0; j < colLength; j++) {
						ArrVal[j] += (!StringUtil.replace(ArrVal[j],"[","").equals("") ? ",":"") + lineWp.get("data"+ArrCol[j],i);
					}
				}
				for(int i=0; i < colLength; i++) { 
					ArrVal[i] += "]";
				} %>
				var options = {
					'legend': {
			            names: [
			            <% if(box.get("param01").equals("1")) { %>
							<% for(int i=box.getInt("param02"); i <= box.getInt("param03"); i++) { %>	
								'<%=i%>'<%=box.get("param03").equals(String.valueOf(i))?"":","%>
							<% } %>
						<% }else { %>
							<% for(int i=1; i <= 12; i++) { %>	
								'<%=box.getInt("param02")%>.<%=StringUtil.lpad(String.valueOf(i),"0",2)%>'<%=String.valueOf(i).equals("12")?"":","%>
							<% } %>
						<% } %>
								],
			            hrefs: []
			        },
			        'dataset': {
			            values: [
						<% for(int i=0; i < ArrVal.length; i++) { %>
							<%=ArrVal[i]%><%=String.valueOf(i).equals(String.valueOf(ArrVal.length-1))?"":","%>
						<% } %>
		            			],
			            colorset: ['#DC143C', '#FF8C00', '#30a1ce', '#2eb400', '#9f9f9f', '#aa7777', '#ffcc33', '#e89800', '#ff8c00', '#cc79a7', '#696a72', '#000000'],
			            fields:[<%=fields%>]
			        },
			        'chartDiv': 'divChart4', 'chartType': 'line', 'chartSize': { width: 1150, height: 500 },
			        'minValue' : 0, 'maxValue': <%=maxValue%>, 'increment': Math.ceil(<%=maxValue%>/10), 'isGuideLineNeeded' : true
				};
				Nwagon.chart(options);
			</script>
		</td>
	</tr>
</table>
</form>