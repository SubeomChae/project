<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="egovframework.cbiz.*, egovframework.cbiz.crypto.RsaUtil, egovframework.cbiz.util.*"%>
<jsp:useBean id="box"     class="egovframework.cbiz.Box"          scope="request" />
<jsp:useBean id="notiWp"  class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="dataWp"  class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="corpWp"  class="egovframework.cbiz.RsWrapper"     scope="request" />
<jsp:useBean id="uSesEnt" class="egovframework.ubiz.mapper.ent.SesUserEntity" scope="session" />
<%@ include file="/WEB-INF/jsp/com/include/inc.jsp" %>

<html>
<head>
<title>::: 사내근로복지기금종합관리시스템 :::</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<style type="text/css">
.rollingBanner {background: url(/com/img/bg_slide_banner.png) no-repeat 0 0; margin-left:10px; width:180px; height:450px;}
.rollingBanner .banner_list {width:180px; position:relative; margin:0 auto; height:450px; }
.rollingBanner .banner_list .banner_rolling {width:170px; height:450px; margin:0 0 0 20; position:absolute;}
.rollingBanner .banner_list .banner_rolling .banner_font {display:block; font-size:15; font-family:고딕체; color:#aaaaaa;}
</style>
<script src="/com/js/rolling.js"></script>
<script language="javascript">
	function go_login() {
		if (formValidate("#login")) {
			if(isEmpty(document.login.user_id)) {
				alert('ID를 입력하세요.');
				document.login.user_id.focus();
				return;
			}else if(isEmpty(document.login.pswd)) {
				alert('비밀번호를 입력하세요.');
				document.login.pswd.focus();
				return;
			}else {
				try {
					if(document.login.idSaveCheck.checked) {
						setCookie("sabok_user_id", document.login.dbo.value + '|' + document.login.user_id.value, 3);
					}
					ajaxSubmitForm("/com/login.do", "#login", function(data) {
						if(data.isOk == "Y") {
							document.login.action = "/com/mainFrame.do";
							document.login.target = "_top";
							document.login.submit();
						}else {	
							alert(data.errMsg);
						}
					});
				} catch(e) {
					alert('로그인정보 암호화에 실패하였습니다.\n\n시스템 관리자에게 문의하시기 바랍니다.');
				}
	 		}
		}
	}	

	function go_download(file_no, file_nm, file_path) {
		document.form1.file_no.value = file_no;
		document.form1.file_nm.value = file_nm;
		document.form1.file_path.value = file_path;
		document.form1.action = '/com/file.do?method=downFile&proc=PR_COMTB_DATA01';
		document.form1.submit();
	}
	
	function page_init() {
		var cookie = getCookie("sabok_user_id");
		if(cookie == null || cookie == 'undefined') { 
			cookie = '|'; 
		}else {
			document.login.idSaveCheck.checked = true;
		}
		var arr = cookie.split('|');
		if(arr[0] != '') { document.login.dbo.value = arr[0]; }
		if(arr[1] != undefined) { document.login.user_id.value = arr[1]; }
		document.login.user_id.focus(); 
	}
</script>
</head>
<body>
	<div class="page-wrapper">
		<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0" background="/com/img/main_bg1.png">
			<tr align="left">
				<td width="25%"></td>
				<td width="50%">
					<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0" background="/com/img/main_bg1.png">
						<tr height="5%"><td></td></tr>
						<tr height="540">
							<td align="center" valign="top">
								<table width="960" height="540" cellpadding="0" cellspacing="0" border="0" background="/com/img/main_bg.png" style="background-repeat:no-repeat">
									<tr height="110">
										<td style="padding-left:55px"><img src="/com/img/img_logo.png" border=0></td>
									</tr>
									<tr height="150">
										<td style="padding-left:55px"><span style="font-family:NanumGothic; font-size:33px; color:white;"><b>공동근로복지기금<br>종합관리시스템</b>에 오신 것을 환영합니다</span></td>
									</tr>
						            <tr>
						            	<td>
						                	<table width="100%" cellpadding="0" cellspacing="0" border="0">
						                    	<tr>
							                    	<td width="55"></td>
							                        <td width="390">
							                        	<form id="login" name="login" method="post" action="" style="margin:0px">
							                            <input type="hidden" name="frame_yn" 	value="Y">
							                            <input type="hidden" name="connect_ip" 	value="<%=request.getRemoteAddr()%>">
							                            <table width="100%" height="260"  cellpadding="0" cellspacing="0" border="0">
															<tr height="20">
																<td colspan="2"><span style="font-family:Arial; font-weight:bold; font-size:25px; color:#5d4848;">Member's Login</span></td>
															</tr>																							
															<tr height="10"><td colspan="2"></td></tr>
							                        	<% if(!uSesEnt.isLogin()) { %>   
															<tr height="35">
																<td width="250px"><input type="text" name="user_id" class="loginInput" title="ID" tabindex="1" style="width:250px; height:35px;border: 1px solid #666666; padding:5px;" placeholder="아이디" ></td>
																<td rowspan="3" style="padding-left:10px"><button type="button" style="width:85px; height:80px; background-color: #935148" onClick="go_login();"><font color="white">LOGIN</font></button></td>
															</tr>																														
															<tr height="10"><td colspan="2"></td></tr>
															<tr height="35">
																<td><input type="password" name="pswd" placeholder="비밀번호" class="loginInput" title="PASSWORD" tabindex="2" style="width:250px; height:35px;border: 1px solid #666666; padding:5px;" onkeydown="if(event.keyCode == 13) go_login();"></td>
															</tr>
															<tr height="10"><td colspan="2"</td></tr>
															<tr height="35">
																<td colspan="2">
																	<select name="dbo" class="required" title="회사" tabindex="3" style="width:250px; height:35px; border: 1px solid #666666; font-size:13px">
																		<option value="">:: 회사 선택 ::</option>
																	<% String client_ip = request.getRemoteAddr();
																	   for(int i=0; i < corpWp.getLength(); i++) { 
																	   	String permit_ip[] = StringUtil.split(corpWp.get("etc_remark",i),";",true);
																	   	boolean isOk = false;
																	   	for(int j=0; j < permit_ip.length; j++) { 
																	   		if(!permit_ip[j].equals("") && (permit_ip[j].equals("*") || client_ip.indexOf(permit_ip[j]) == 0)) { isOk = true; break; }
																	   	}
																	   	if(!isOk) { continue; } %>
																		<option value="<%=StringUtil.strEncode(corpWp.get("ref_pk",i))%>"><%=corpWp.get("subject",i)%></option> 
																	<% } %>
																	</select> 
																</td>
															</tr>
															<tr height="10"><td colspan="2"></td></tr>
															<tr height="20px">											
																<td colspan="2">
																	<label class="mt-checkbox mt-checkbox-outline" style="font-size:14px"> 
																		<input type="checkbox" name="idSaveCheck" value="Y" style="border:none;"> 아이디저장<span style="border:1px solid #666666; background-color:white"/>
																	</label>
																</td>
															</tr>
															<tr valing="top">											
																<td colspan="2" style="line-height:110%">
																	<span style="color:#666666; font-size:12px; font-weight:bold; letter-spacing:-0.5px">아이디/비밀번호를 잊어버린 경우에는 공동근로복지기금 관리자에게 연락 바랍니다.</span><br>
																	<span style="color:#935148; font-size:12px; font-weight:bold;">문의전화 : 031-915-8934 </span>
																</td>
															</tr>
														<% }else { %>
								                            <tr height="50" valign="bottom"><td colspan="2"><span class="name_bold"><%=uSesEnt.corp_nm%><br><b><%=uSesEnt.empl_nm%></b></span> 님이 로그인하셨습니다.</td></tr>
								                            <tr height="20">
								                            	<td valign="top" style="padding:15 0 0 0;">
								                            		<button type="button" style="width:100px; height:24px; background-color: #e1e1e1" onClick="location.href = '/com/logout.do'"><font color="white">LOGOUT</font></button>
								                            		<button type="button" style="width:100px; height:24px; background-color: #935148" onClick="location.href = '/com/mainFrame.do'"><font color="white">들어가기</font></button>
								                            	</td>
								                            </tr>
															<tr height="*"><td></td></tr>
								                        <% } %>	
														</table>
														</form>
													</td>
													<td width="*">&nbsp;</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr height="240">
							<td align="center" style="padding-top:20px;">
								<table width="960" cellpadding="0" cellspacing="0" border="0">
									<tr>			
										<td width="360">
											<table width="100%" height="245" border="0" cellpadding="0" cellspacing="0" background="/com/img/noti_bg.png">
												<tr>
												  	<td>					
														<table width="100%" border="0" cellpadding="0" cellspacing="0">
															<tr height="35">
																<td style="padding-left:15px"><img id="tabmenu" src="/com/img/tit_main_noti.png" border="0" align="absmiddle" alt="공지사항"></td>
															</tr>
														</table>
														<table width="100%" border="0" cellpadding="0" cellspacing="0">
															<tr height="6"><td colspan="2"></td></tr>
														<% for(int i=0; i < notiWp.getLength() && i < 9; i++) { %>
															<tr height="20">
																<td width="*" style="font-size:13px;padding-left:10px"><img src="/com/img/bullet_b.gif" border="0" align="absmiddle"> <a href="#" onClick="window.open('/popup/inf01004_select.do?inform_no=<%=notiWp.get("ref_pk",i)%>&popup_yn=Y','inf01004','width=590,height=500,left=100,top=100,scrollbars=auto')"><%=notiWp.getCutStr("subject",i,20)%></a>
																	<%if(DateUtil.dayDiff(notiWp.get("sys_reg_date",i),DateUtil.toString("yyyyMMdd")) <= 30) {%> <img src="/com/img/ico_new_s.gif" border="0"><%}%>
																</td>
																<td width="90" align="right" style="font-size:13px;padding-right:10px"><%=notiWp.get("sys_reg_date",i,Box.DEF_DATE_FMT)%></td>
															</tr>
														<% } %>
														<% for(int i=notiWp.getLength(); i < 9; i++) { %>
															<tr height="20"><td>&nbsp;</td></tr>
														<% } %>		
														</table>
													</td>
												</tr>
											</table>
										</td>											
										<td width="360">
											<table width="100%" height="245" border="0" cellpadding="0" cellspacing="0" background="/com/img/noti_bg.png">
												<tr>
												  	<td>
														<table width="100%" border="0" cellpadding="0" cellspacing="0">
															<tr height="35">
																<td style="padding-left:15px"><img id="tabmenu" src="/com/img/tit_main_data.png" border="0" align="absmiddle" alt="자료실"></td>
															</tr>
														</table>
														<table width="100%" border="0" cellpadding="0" cellspacing="0">
															<tr height="6"><td colspan="2"></td></tr>
														<% for(int i=0; i < dataWp.getLength() && i < 9; i++) { %>
															<tr height="20">
																<td width="*" style="font-size:13px;padding-left:7px"><img src="/com/img/bullet_b.gif" border="0" align="absmiddle"> 
																<a href="javascript:fileDownload(document.form1, '<%=dataWp.get("etc_remark",i)%>', '<%=dataWp.get("subject",i)%>')"><%=dataWp.getCutStr("subject",i,20)%></a>
																	<%if(DateUtil.dayDiff(dataWp.get("sys_reg_date",i),DateUtil.toString("yyyyMMdd")) <= 30) {%> <img src="/com/img/ico_new_s.gif" border="0"><%}%>
																</td>
																<td width="90" align="right" style="font-size:13px;padding-right:10px"><%=dataWp.get("sys_reg_date",i,Box.DEF_DATE_FMT)%></td>
															</tr>
														<% } %>
														<% for(int i=dataWp.getLength(); i < 9; i++) { %>
															<tr height="20"><td>&nbsp;</td></tr>
														<% } %>
														</table>
													</td>
												</tr>		
											</table>					
										</td>
										<td width="234">
											<table width="100%" height="245" border="0" cellpadding="0" cellspacing="0" background="/com/img/contact_bg.gif" style="background-repeat:no-repeat">
												<tr>
												  	<td></td>
												</tr>	
												<tr height="105">
													<td align="center">
														<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
															<tr height="50%">
																<td rowspan="2" width="50%" align="right" style="padding-right:5px;"><img src="/com/img/right_brochure.png" align="absmiddle"></td>
																<td width="50%" valign="bottom" style="padding-bottom:5px;"><font size="3" face="gothic"><b>Brochure</b></td>
															</tr>
															<tr height="50%">
																<td valign="top"><a href="javascript:fileDownload(document.form1, '20140808144120500_63.pdf', '20140808144120500_63.pdf')"><img src="/com/img/right_down.png" border="0" align="absmiddle"></a><td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr height="79">
							<td width="960" align="center">
								<table width="960" height="100%" cellpadding="0" cellspacing="0" border="0" background="/com/img/bg_login_middle_1.png">	
									<tr>
										<td align="right" style="no-repeat;">
											<select style="width:170px" onchange="if(this.value != '') window.open(this.value);">
												<option value="" selected>::: 관련사이트 바로가기 :::</option>
												<option value="http://www.hometax.go.kr/">국세청 홈텍스</option>
												<option value="http://www.moel.go.kr/">고용노동부</option>
												<option value="http://www.moel.go.kr/seoul">&nbsp;&nbsp;&nbsp;&nbsp;서울지방노동청</option>
												<option value="http://www.moel.go.kr/busan">&nbsp;&nbsp;&nbsp;&nbsp;부산지방노동청</option>
												<option value="http://www.moel.go.kr/daegu">&nbsp;&nbsp;&nbsp;&nbsp;대구지방노동청</option>
												<option value="http://www.moel.go.kr/gyeongin">&nbsp;&nbsp;&nbsp;&nbsp;경인지방노동청</option>
												<option value="http://www.moel.go.kr/gwangju">&nbsp;&nbsp;&nbsp;&nbsp;광주지방노동청</option>
												<option value="http://www.moel.go.kr/daejeon">&nbsp;&nbsp;&nbsp;&nbsp;대전지방노동청</option>
											</select>
										</td>
									</tr>				
									<tr><td></td></tr>
								</table>
							</td>
						</tr>
						<tr height="5%"><td>&nbsp;</td></tr>
					</table>
				</td>
				<td width="25%" style="padding-left:20;">
					<table width="211" height="774" cellpadding="0" cellspacing="0" border="0" background="/com/img/right_bg.png">
						<tr height="39"><td align="center" style="padding-top:15px;"><img src="/com/img/right_title.png" align="absmiddle"></td></tr>
						<tr height="9"><td align="center" style="padding:5 0 5 0"><img src="/com/img/right_middle.png" align="absmiddle"></td></tr>
						<tr height="*">
							<td>
								<div class="rollingBanner">
									<div class="banner_list">
										<div id="rolling_group" class="banner_rolling">
											<div class="banner_font">
										           <% for(int j=0; j<=3; j++) { %>
										               <% for(int i=0; i < corpWp.getLength(); i++) { 
							                                 if(corpWp.get("ref_pk",i).equals("SABOK01")) { continue; } %>
							                                 <%if(corpWp.get("site_addr",i).startsWith("http://")){%><a href="<%=corpWp.get("site_addr",i)%>" target="_blank"><%}%><b><%=StringUtil.getReplaceSpecialCharacters(StringUtil.replace(corpWp.get("subject",i)," 사내근로복지기금",""))%></b></a><br><br>
						                              <% } %>
					                              <% } %>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr height="9"><td align="center" style="padding:5 0 15 0"><img src="/com/img/right_middle.png" align="absmiddle"></td></tr>
						<tr height="100"><td align="center" style="padding-bottom:15px"><a href="http://www.sinjinitc.co.kr" target="_blank"><img src="/com/img/q_banner001.gif" border="0" align="absmiddle"></a></td></tr>	
					</table>
				</td>
			</tr>
		</table>
	</div>
<form name="menu" method="post" action="/com/mainFrame.do" style="display:none">
<input type="hidden" name="menu_id" 		value="">
<input type="hidden" name="default_page" 	value="">
</form>
<form name="form1" method="post">
<input type="hidden" name="pathKey"		value="community">
<input type="hidden" name="file_no"		value="">
<input type="hidden" name="file_nm"		value="">
<input type="hidden" name="file_path"	value="">
<input type="hidden" name="tab_index" 	value="1">
</form>
<script type="text/javascript">
	var roll = new rolling(document.getElementById('rolling_group'));
	roll.set_direction(1); roll.move_gap=2; roll.time_dealy=130;
	roll.start();
</script>
</body>
</html>