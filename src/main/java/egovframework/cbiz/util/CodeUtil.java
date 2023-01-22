package egovframework.cbiz.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.service.SpHelperService;
import egovframework.ubiz.mapper.ent.SesUserEntity;

@Component
public class CodeUtil {
	private static CommDBService commDBService;

    @Autowired
    public CodeUtil(CommDBService commDBService) {
    	CodeUtil.commDBService = commDBService;
    }

    public static String optList(String procedureName, String actionType, String defVal, String param01, String param02, String param03, String param04, String param05) throws Exception {
        Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        RsWrapper rsWp = commDBService.execList(procedureName, actionType, box);

        StringBuffer sb = new StringBuffer();
        for(int i=0; i < rsWp.getLength(); i++) {
            sb.append("<option value='" + rsWp.get("CODE",i) + "'")
              .append(rsWp.get("OPTKEY",i).equals("") ? "" : " title='" + rsWp.get("OPTKEY",i) + "'")
              .append(rsWp.get("CODE",i).equals(defVal) ? "selected" : "")
              .append(">")
              .append(rsWp.get("DATA",i))
              .append("</option>");
        }
        return sb.toString();
    }

    public static String optList(String procedureName, String actionType, String defVal, String param01, String param02, String param03, String param04, String param05, String dbo) throws Exception {
        Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        box.put("dbo", dbo);
        RsWrapper rsWp = commDBService.execList(procedureName, actionType, box);

        StringBuffer sb = new StringBuffer();
        for(int i=0; i < rsWp.getLength(); i++) {
            sb.append("<option value='" + rsWp.get("CODE",i) + "'")
              .append(rsWp.get("OPTKEY",i).equals("") ? "" : " title='" + rsWp.get("OPTKEY",i) + "'")
              .append(rsWp.get("CODE",i).equals(defVal) ? "selected" : "")
              .append(">")
              .append(rsWp.get("DATA",i))
              .append("</option>");
        }
        return sb.toString();
    }
    
    public static String optList(RsWrapper rsWp, String defVal) throws Exception {
        StringBuffer sb = new StringBuffer();
        for(int i=0; i < rsWp.getLength(); i++) {
            sb.append("<option value='" + rsWp.get("CODE",i) + "'")
              .append(rsWp.get("OPTKEY",i).equals("") ? "" : " title='" + rsWp.get("OPTKEY",i) + "'")
              .append(rsWp.get("CODE",i).equals(defVal) ? "selected" : "")
              .append(">")
              .append(rsWp.get("DATA",i))
              .append("</option>");
        }
        return sb.toString();
    }

    public static String optList(RsWrapper rsWp, String codeGroup, String defVal) {
        StringBuffer sb = new StringBuffer();
        for(int i=0; i < rsWp.getLength(); i++) {
            if(rsWp.get("CODE_GROUP",i).equals(codeGroup)) {
                sb.append("<option value='" + rsWp.get("CODE",i) + "'")
                  .append(rsWp.get("CODE",i).equals(defVal) ? "selected" : "")
                  .append(">")
                  .append(rsWp.get("DATA",i))
                  .append("</option>");
            }
        }
        return sb.toString();
    }
    
    public static String optListTxt(RsWrapper rsWp, String defVal) {
        for(int i=0; i < rsWp.getLength(); i++) {
            if(rsWp.get("CODE",i).equals(defVal)) {
            	return rsWp.get("DATA",i);
            }
        }
        return "";
    }

    public static String optListTxt(RsWrapper rsWp, String codeGroup, String defVal) {
        for(int i=0; i < rsWp.getLength(); i++) {
            if(rsWp.get("CODE_GROUP",i).equals(codeGroup) && rsWp.get("CODE",i).equals(defVal)) {
            	return rsWp.get("DATA",i);
            }
        }
        return "";
    }

    public static String optListJs(RsWrapper rsWp, String codeGroup, String defVal) {
        StringBuffer sb = new StringBuffer();
        for(int i=0; i < rsWp.getLength(); i++) {
            if(!rsWp.get("CODE_GROUP",i).equals(codeGroup)) { continue; }
            sb.append("<option value='").append(rsWp.get("CODE",i)).append("'").append(rsWp.get("CODE",i).equals(defVal) ? " selected " : "").append(">");
            sb.append(StringUtil.replace(rsWp.get("DATA",i), "^", "&nbsp;&nbsp;")).append("</option> \t");
        }
        return sb.toString();
    }
    
	public static String rButtonList(String procedureName, String actionType, String obj, String dmt, String defVal, String param01, String param02, String param03, String param04, String param05) throws Exception {
		Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        RsWrapper rsWp = commDBService.execList(procedureName, actionType, box);
		StringBuffer sb = new StringBuffer();
		if(rsWp.getLength() > 0) { 
			sb.append("<div class=\"mt-radio-inline\">"); 
			String funcNm = "";
			String word[] = StringUtil.split(obj, "_", true);
			for(int i=0; i < word.length; i++) {
				if(word[i].equals("")) { break; }
				funcNm += word[i].substring(0,1).toUpperCase() + (word[i].length() > 1 ? word[i].substring(1) : ""); 
			}
			for(int i=0; i < rsWp.getLength(); i++) {
				sb.append("\t<label class=\"mt-radio mt-radio-outline\">"); 
				sb.append("\t\t<input type=\"radio\" name=\""+obj+"\" value=\""+rsWp.get("CODE",i)+"\"" + (rsWp.get("CODE",i).equals(defVal)?" checked":"") + " onClick=\"change"+funcNm+"(this.value)\">"+rsWp.get("DATA",i)+"<span/>"); 
				sb.append("\t</label>"+dmt); 
			}
			sb.append("</div>");
		}
		return sb.toString();	
	}
	
	public static String checkBoxList(String procedureName, String actionType, String obj, String dmt, String defVal, String param01, String param02, String param03, String param04, String param05) throws Exception {
		Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        RsWrapper rsWp = commDBService.execList(procedureName, actionType, box);
		StringBuffer sb = new StringBuffer();
		for(int i=0; i < rsWp.getLength(); i++) {
			sb.append("<label class=\"mt-checkbox mt-checkbox-outline\">"); 
			sb.append("\t<input type=\"checkbox\" name=\""+obj+"\" value=\""+rsWp.get("CODE",i)+"\"" + (rsWp.get("CODE",i).equals(defVal)?" checked":"") + ">"+rsWp.get("DATA",i)+"<span/>"); 
			sb.append("</label>");
		}
		return sb.toString();	
	}

    public static RsWrapper getRsWrapper(String procedureName, String actionType, String defVal, String param01, String param02, String param03, String param04, String param05) throws Exception {
        Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        return commDBService.execList(procedureName, actionType, box);
    }

    public static RsWrapper getRsWrapper(String procedureName, String actionType, String defVal, String param01, String param02, String param03, String param04, String param05, String dbo) throws Exception {
        Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        box.put("dbo", dbo);
        return commDBService.execList(procedureName, actionType, box);
    }
    
    public static RsWrapper getRsWrapper(String procedureName, String actionType, String defVal, String param01, String param02, String param03, String param04, String param05, String param06, String param07, String param08, String param09, String param10, String page_count, String unit_count) throws Exception {
        Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        box.put("param06", param06);
        box.put("param07", param07);
        box.put("param08", param08);
        box.put("param09", param09);
        box.put("param10", param10);
    	box.put("page_count", page_count);
    	box.put("unit_count", unit_count);
        return commDBService.execList(procedureName, actionType, box);
    }
    
    public static Box getRsBox(String procedureName, String actionType, String param01, String param02, String param03, String param04, String param05, String dbo) throws Exception {
        Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        box.put("dbo", dbo);
        RsWrapper rsWp = commDBService.execList(procedureName, actionType, box);
        return rsWp.getLength() > 0 ? rsWp.getRsBoxAt(0) : new Box("");
    }
    
    public static Box getRsBox(String procedureName, String actionType, String param01, String param02, String param03, String param04, String param05) throws Exception {
        Box box = new Box("");
        box.put("param01", param01);
        box.put("param02", param02);
        box.put("param03", param03);
        box.put("param04", param04);
        box.put("param05", param05);
        RsWrapper rsWp = commDBService.execList(procedureName, actionType, box);
        return rsWp.getLength() > 0 ? rsWp.getRsBoxAt(0) : new Box("");
    }
	
    public static Box getRsBox(String procedureName, String actionType, String params) throws Exception {
    	String param[] = StringUtil.split(params, "@", true);
        Box box = new Box("");
        for(int i=0; i < param.length; i++) {
            box.put(StringUtil.arrayCol(param[i],1,"="), StringUtil.arrayCol(param[i],2,"="));
        }
        RsWrapper rsWp = commDBService.execList(procedureName, actionType, box);
        return rsWp.getLength() > 0 ? rsWp.getRsBoxAt(0) : new Box("");
    }
	
    public static Box queryBox(String refTable, String selectCol, String whereCond) throws Exception {
        Box box = new Box("");
        box.put("param01", refTable);
        box.put("param02", selectCol);
        box.put("param03", whereCond);
        RsWrapper rsWp = commDBService.execList("PR_DUAL", "EXEC_QUERY", box);
        return rsWp.getLength() > 0 ? rsWp.getRsBoxAt(0) : new Box("");
    }
	
	public static void main(String[] args) {
		
	}

}
