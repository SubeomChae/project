package egovframework.ubiz.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.http.protocol.HTTP;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.CustomEx;
import egovframework.cbiz.CustomProperty;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.service.SpHelperService;
import egovframework.cbiz.service.impl.CommDBDAO;
import egovframework.cbiz.service.impl.CommExcelHandler;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.ubiz.ErrMsg;
import egovframework.ubiz.mapper.ent.SesUserEntity;

public class abstractController {
	public static Logger logger = LogManager.getLogger("biz");

	@Resource(name = "commDBService")
	protected CommDBService commDBService;
	 
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@Autowired
	protected DataSourceTransactionManager transactionManager;

	public static String USER_EX_DB_CODE = "45000";

	public SesUserEntity getSesUserEnt(HttpServletRequest request) {
		return (SesUserEntity)request.getSession().getAttribute(CD.USER_SES_KEY);
	}
    
	public void sesToBox(HttpServletRequest request, Box box) {
		SesUserEntity sesEnt = (SesUserEntity)request.getSession().getAttribute(CD.USER_SES_KEY);
		if (sesEnt != null) {
    		box.put("ss_user_id", sesEnt.user_id);
    		box.put("ss_user_nm", sesEnt.user_nm);
		}
	}
	
	protected TransactionStatus getTransactionStatus() {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("trans");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		return transactionManager.getTransaction(def);
	}
	
	public void setPagingInfo(HttpServletRequest request, Box box) {
		box.put("pageUnit", Integer.parseInt(box.getNvl("unit_count", "10")));
		box.put("pageSize", box.get("pageUnit"));
		box.put("pageIndex", Integer.parseInt(box.getNvl("pageIndex", box.getNvl("page_count", "1"))));
	}

	/**
	 * list map 자료를 json으로 변환
	 * 
	 * @param mapList
	 * @return
	 */
	public JsonArray getJson(List mapList) {
		JsonArray list = new JsonArray();
		if (mapList != null && mapList.size() > 0) {
			Map map = (Map) mapList.get(0);

			ArrayList<String> alKey = new ArrayList<String>();
			for (Object key : map.keySet()) {
				alKey.add((String) key);
			}

			for (Object item : mapList) {
				JsonObject jobj = new JsonObject();
				for (String key : alKey) {
					jobj.addProperty(key, CD.mget(key, (Map) item));
				}
				list.add(jobj);
			}
		}
		return list;
	}

	public JsonArray getJson(RsWrapper rsWp) {
		return getJson(rsWp, null);
	}

	/**
	 * RsWrapper box 자료를 json으로 전환
	 * 
	 * @param rsWp
	 * @return
	 */
	public JsonArray getJson(RsWrapper rsWp, String fldList) {
		JsonArray list = new JsonArray();

		if (rsWp != null && rsWp.getLength() > 0) {
			Box box = rsWp.getRsBoxAt(0);

			for (Box bx : rsWp) {
				JsonObject jobj = new JsonObject();
				if (fldList == null) {
					for (Object key : bx.keySet()) {
						if (bx.getObject((String) key) instanceof RsWrapper) {
							jobj.add((String) key, getJson((RsWrapper) bx.getObject((String) key)));
						} else {
							jobj.addProperty((String) key, bx.get((String) key));
						}
					}
				} else {
					for (String key : fldList.split(",")) {
						key = key.trim();
						if (bx.getObject(key) instanceof RsWrapper) {
							jobj.add(key, getJson((RsWrapper) bx.getObject(key)));
						} else {
							jobj.addProperty((String) key, bx.get(key));
						}
					}
				}
				list.add(jobj);
			}
		}
		return list;
	}

	/**
	 * box 자료를 json으로 변환
	 * 
	 * @param box
	 * @return
	 */
	public JsonObject getJsonObj(Box box) {
		return getJsonObj(box, null);
	}
	
	public void sendErrJson(String msg, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    JsonObject jsonObj = new JsonObject();
	    jsonObj.addProperty("isOk", "N");
        jsonObj.addProperty("errMsg", msg);
        returnJsonResult(jsonObj, request, response);
	}
    
    public void sendErrJson(String msg, HttpServletRequest request, HttpServletResponse response, TransactionStatus tranStat) throws Exception {
        if (tranStat != null) {
            transactionManager.rollback(tranStat);
        }
        sendErrJson(msg, request, response);
    }

	public JsonObject getJsonObj(Box box, String fldList) {
		ArrayList<String> alKey = new ArrayList<String>();
		if (fldList == null || fldList.equals("")) {
			for (Object key : box.keySet()) {
				alKey.add((String) key);
			}
		} else {
			String[] flds = fldList.split(",");
			for (int j = 0; j < flds.length; j++) {
				alKey.add(flds[j].trim());
			}
		}

		JsonObject jobj = new JsonObject();
		for (String key : alKey) {
			jobj.addProperty(key, box.get(key));
		}
		return jobj;
	}

	/**
	 * request json 자료를 가져온다
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public JsonObject getJsonObject(HttpServletRequest request) throws Exception {
		StringBuffer jb = new StringBuffer();
		String line = null;
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
		} catch (Exception e) {
			/* report an error */ }

		JsonObject jo = null;
		if (jb.length() > 0) {
			try {
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				JsonParser jsonParser = new JsonParser();
				jo = (JsonObject) jsonParser.parse(jb.toString());
				return jo;
			} catch (Exception e) {
				// crash and burn
				CD.logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(e));
				throw new Exception("Error parsing JSON request string");
			}
		} else {
			return jo;
		}
	}

	public static String getJsonToString(JsonObject jsonObj) {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		return gson.toJson(jsonObj);
	}

	/**
	 * json 자료 반환
	 * 
	 * @param json
	 * @param request
	 * @param response
	 */
	protected void returnJsonResult(JsonObject jsonObj, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		jsonDataSend(gson.toJson(jsonObj), request, response);
	}

    protected void returnOkJsonResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	returnOkJsonResult(null, request, response);
    }

    protected void returnOkJsonResult(Box box, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JsonObject jsonObj = new JsonObject();
        jsonObj.addProperty("isOk", "Y");
        if(box != null) {
            for(java.util.Enumeration e=box.keys(); e.hasMoreElements();) {
    			String key = (String)e.nextElement();
    			jsonObj.addProperty(key, box.get(key));
    		}
        }
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        jsonDataSend(gson.toJson(jsonObj), request, response);
    }

    protected void returnFailJsonResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	returnFailJsonResult("처리 중, 에러가 발생하였습니다.", request, response);
    }

    protected void returnFailJsonResult(String errMsg, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JsonObject jsonObj = new JsonObject();
        jsonObj.addProperty("isOk", "N");
        String userMsg = FormatUtil.nvl2(errMsg, "처리 중, 에러가 발생하였습니다.");
        if(userMsg.indexOf("ORA-00001") >= 0) { userMsg = "중복된 자료가 존재합니다."; }
        if(userMsg.indexOf("ORA-20001") >= 0) { userMsg = StringUtil.replace(userMsg, "ORA-20001: ", ""); }
        
        jsonObj.addProperty("errMsg", userMsg);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        jsonDataSend(gson.toJson(jsonObj), request, response);
    }

	public static void jsonDataSend(String str, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setStatus(200);
		response.setContentType("text/html;charset=utf-8");
		response.setContentType("application/json");
		response.setHeader("Access-Control-Allow-Origin", "http://www.fms.or.kr");
		response.setHeader("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT");
		PrintWriter pr = response.getWriter();

		pr.write(str);
		pr.close();
	}
	
	/**
	 * model 넘기는것에 추가적인 셋팅을 처리함
	 * 
	 * @param model
	 * @param nm
	 * @param rsWp
	 * @param addFld
	 */
	protected void setModel(Model model, String nm, RsWrapper rsWp, String addFld) {

		if (!addFld.equals("")) {
			setAddFields(rsWp, addFld);
		}

		model.addAttribute(nm, rsWp);
	}

	protected void setModel(Model model, String nm, Box obox, String addFld) {

		if (!addFld.equals("")) {
			setAddFields(obox, addFld);
		}

		model.addAttribute(nm, obox);
	}

	protected void setAddFields(RsWrapper rsWp, String addFld) {
		for (Box rb : rsWp) {
			setAddFields(rb, addFld);
		}
	}

	protected void setAddFields(Box rb, String addFld) {
		String[] addFields = addFld.split(",");
		for (int i = 0; i < addFields.length; i++) {
			String fld = addFields[i].trim();

		}
	}

	protected void commonErrJsonRtn(Exception ex, JsonObject jsonObj) {
		if (ex instanceof java.sql.SQLException && ((java.sql.SQLException) ex).getSQLState().equals(USER_EX_DB_CODE)) {
			String msg = ((java.sql.SQLException) ex).getMessage();
			jsonObj.addProperty("errMsg", msg.replaceAll("USER_EX", ""));
			jsonObj.addProperty("isOk", "N");
		} else if (ex.getCause() != null && ex.getCause() instanceof java.sql.SQLException
				&& ((java.sql.SQLException) ex.getCause()).getSQLState().equals(USER_EX_DB_CODE)) {
			String msg = ((java.sql.SQLException) ex.getCause()).getMessage();
			jsonObj.addProperty("errMsg", ErrMsg.getInstance().getMsg(msg));
			jsonObj.addProperty("isOk", "N");
		} else {
			String msg = ex.getMessage();
			if (msg != null && msg.indexOf("USER_EX") >= 0) {
				jsonObj.addProperty("errMsg", msg.replaceAll("USER_EX", ""));
			} else {
				jsonObj.addProperty("errMsg", "시스템에서 문제가 발생하였습니다.");
			}
			jsonObj.addProperty("isOk", "N");
		}
		logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(ex));
	}

	protected void emptyChkThrowEx(Box box, String chkFlds) throws Exception {
		String[] flds = chkFlds.split(",");
		for (String fld : flds) {
			if (box.get(fld.trim()).equals("")) {
				throw new Exception(fld + " 값이 누락되었습니다.");
			}
		}
	}

	protected void logValidatorErr(BindingResult bindingResult) {
		StringBuffer sb = new StringBuffer();
		for (ObjectError oerr : bindingResult.getAllErrors()) {
			sb.append(oerr.toString());
		}
		logger.error("validator err info:" + sb.toString());
	}

	public void moveTempToService(Box box, String fileKey, String subDir) throws Exception {
		String srcDir = CustomProperty.upload_dir + "/temp/";
		String destDir = CustomProperty.upload_dir + "/" + subDir + "/";

		String sfileNm = box.get(fileKey + "_sfile_nm");
		destDir += "/" + sfileNm.substring(0, 6);

		File f = new File(destDir);
		if (f.exists() == false) {
			f.mkdirs();
		}

		FileUtil.fileMove(srcDir + "/" + sfileNm, destDir + "/" + sfileNm);
	}

    public void throwUserException(String msg) throws Exception {
    	throw new Exception(msg);
    }
     
    public void throwUserException(String msg, HttpServletRequest request) throws Exception {
        throwUserException(msg, "", "", request);
    }
     
    public void throwUserException(String msg, String moveUrl, HttpServletRequest request) throws Exception {
        throwUserException(msg, moveUrl, "", request);
    }   
    
    public void throwUserException(String msg, String moveUrl, String addScript, HttpServletRequest request) throws Exception {
       Box box = null;
       if (request.getAttribute("box") != null) {
           box = (Box)request.getAttribute("box");
       } else {
           box = new Box("");
       }
       box.put("__is_user_exception", "Y");
       box.put("__user_exception_errMsg", msg);
       box.put("__user_exception_moveUrl", moveUrl);
       box.put("__user_exception_addScript", addScript);
       throw new Exception();
   }   
	
	@ExceptionHandler(Exception.class) 
	public ModelAndView handleRuntimeException(Exception e, HttpServletResponse response, HttpServletRequest request) {
		JsonObject jsonObj = new JsonObject();
	    
	    if (request.getAttribute("box") != null) {
	        Box box = (Box)request.getAttribute("box");
    	    if (box.get("rtn_json").equals("Y")) {
    	        jsonObj.addProperty("isOk", "N");
    	        if(box.get("__is_user_exception").equals("Y")) {
    	            jsonObj.addProperty("errMsg", box.get("__user_exception_errMsg"));
    	            jsonObj.addProperty("moveUrl", box.get("__user_exception_moveUrl"));
                    jsonObj.addProperty("addScript", box.get("__user_exception_addScript"));
    	        }else {
    	            jsonObj.addProperty("errMsg", "처리 중, 문제가 발생하였습니다.");
    	        }
    	        try {
    	            returnJsonResult(jsonObj, request, response);
    	            return null;
    	        } catch (Exception ex) {
    	            ex.printStackTrace();
    	        }
    	    } else if(box.get("__is_user_exception").equals("Y")) {
    	        if (box.get("__user_exception_moveUrl").isEmpty()) {
        	        ModelAndView mnv = new ModelAndView("com/alertNBack"); 
        	        mnv.addObject("alertMsg", box.get("__user_exception_errMsg")); 
        	        return mnv; 
    	        } else {
                    ModelAndView mnv = new ModelAndView("com/alertNRedirect"); 
                    mnv.addObject("alertMsg", box.get("__user_exception_errMsg")); 
                    mnv.addObject("redirectUrl", box.get("__user_exception_moveUrl")); 
                    mnv.addObject("addScript", box.get("__user_exception_addScript")); 
                    return mnv; 
    	        }
    	    }
	    }
        
		CD.logger.debug(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(e));
		ModelAndView mnv = new ModelAndView("com/bizError"); 
		mnv.addObject("errMsg", e.getMessage()); 
		return mnv; 
	}
	
	/**
	 * 프로시저에서 발생한 예외가 사용자 예외인지 체크한다.
	 * @param ex
	 * @return
	 */
	public boolean isProcUserEx(Exception ex) throws Exception {
		boolean rtn = false;
		if(ex instanceof UncategorizedSQLException) {
			if(((UncategorizedSQLException)ex).getSQLException().getErrorCode() == 20001) {
				rtn = true;
			}
		}
		
		Box ibox = new Box("");      
		ibox.put("work_id",     CD.getNewID());
		ibox.put("log_gbn",		rtn ? "ERROR_PROC_TRACE" : "ERROR_USER_TRACE");
		ibox.put("detail_log",	CustomEx.getPrintStackTrace(ex));
		commDBService.exec("PR_TB_LOG_DETAIL", "INSERT", ibox);

		return rtn;
	}
	
	/**
	 * 프로시저에서 사용자 예외처리 내용을 가져온다.
	 * @param ex
	 * @return
	 */
	public String getProcUserExMsg(Exception ex) {
		String rtn = "";
		if(ex instanceof UncategorizedSQLException) {
			if(((UncategorizedSQLException)ex).getSQLException().getErrorCode() == 20001) {
				rtn = ((UncategorizedSQLException)ex).getSQLException().getMessage();
			}
		}
		return getUserExMsg(rtn);
	}
	
	public String getUserExMsg(String error_msg) {
		String rtn = "";
		if(!error_msg.equals("")) {
			String[] msgs = error_msg.split("\n");
			if(msgs.length > 0) {
				rtn = msgs[0];
				if(rtn.indexOf(" ") >= 0) {
					rtn = rtn.substring(rtn.indexOf(" "), rtn.length());
				}
			}
		}
		return rtn;
	}

	public String alertNBack(String msg, HttpServletRequest request) {
		Box box = new Box("");
		box.put("__alert_msg", msg.replaceAll("\"", "'").replaceAll("\n","\\\\\\n"));
		box.put("__alert_type", "alertNBack");
		request.setAttribute("box", box);
		return "/com/commonMsg";
	}

	public String alertNClose(String msg, HttpServletRequest request) {
		Box box = new Box("");
		box.put("__alert_msg", msg.replaceAll("\"", "'").replaceAll("\n","\\\\\\n"));
		box.put("__alert_type", "alertNClose");
		request.setAttribute("box", box);
		return "/com/commonMsg";
	}

	public String alertNRedirect(String msg, String url, String send_key, HttpServletRequest request) {
		Box box = getBox(send_key, request);
		box.put("__alert_msg", msg.replaceAll("\"", "'").replaceAll("\n","\\\\\\n"));
		box.put("__alert_type", "alertNRedirect");
		box.put("__move_url", url);
		request.setAttribute("box", box);
		return "/com/commonMsg";
	}

	public String Redirect(String url, String send_key, HttpServletRequest request) {
		Box box = getBox(send_key, request);
		box.put("__alert_type", "Redirect");
		box.put("__move_url", url);
		request.setAttribute("box", box);
		return "/com/commonMsg";
	}
	
	public String scriptOnly(String js_scripts, HttpServletRequest request) {
		Box box = new Box("");
		box.put("__alert_type", "scriptOnly");
		box.put("__js_scripts", js_scripts);
		request.setAttribute("box", box);
		return "/com/commonMsg";
	}
	
	private Box getBox(String send_key, HttpServletRequest request) {
		if (send_key.equals("BOX_ALL_PARAM")) {
			return (Box)request.getAttribute("box");
		} else {
			if (send_key.trim().equals("")) { return new Box("");}
			Box box  = (Box)request.getAttribute("box");
			Box box2 = new Box("");
			String[] keys = StringUtil.split(send_key, ",", true);
			for (int i=0; i< keys.length; i++) {
				String key = keys[i].trim();
				box2.put(key, box.get(key));
			}
			return box2;
		}
	}

}
