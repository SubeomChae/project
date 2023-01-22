/*******************************************************************/
/* Class Name  : Box               			           */
/* Description : HttpRequest 값을 다루기 위한 Class                  */
/*******************************************************************/
/* Modification Log	                                           */
/* No  DATE  	    Company     Author 	Description                */
/*******************************************************************/

package egovframework.cbiz;

import java.io.File;
import java.io.Reader;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.ubiz.mapper.ent.SesUserEntity;
import oracle.sql.CLOB;;
 
public class Box implements Serializable {

	HashMap<String, Object> bxmap = new HashMap<String, Object>();

	public static String strEnc = "";
	public static String strMultiEnc = "";
	/**
	 *  
	 */
	private static final long serialVersionUID = 1L;

	private String mType = ""; // NORMAL(mPas), SPRING(mReq)

	/**
	 * String format
	 */
	public static final int DEF_DATE_FMT     = 1;		// 년월일
	public static final int DEF_DATETIME_FMT = 2;		// 년월일 시분초
	public static final int THOUSAND_COMMA   = 3;		// 천단위 콤마 ( 정수형 )
	public static final int THOUSAND_COMMA_FLOAT   = 4;	// 천단위 콤마 ( 소수점 포함 )
	public static final int ZIP_CODE         = 5;		// 우편번호
	public static final int JUMIN_NO		 = 6;		// 주민등록번호
	public static final int MULTILINE_TEXT	 = 7;		// 여러줄 문자열
	public static final int DEF_DATETIME_FMT_APM = 8;   // 년월일 시분초 (오전 오후)
	public static final int HTML             = 9;		// HTML 형태
	public static final int HTML_TEXT        = 13;		// HTML TEXT 형태
	public static final int YES_NO           = 10;		// 예, 아니오
	public static final int POSSIBLE_OR_NOT  = 11;		// 가능, 불가능
	public static final int SLIP_NO		 	 = 12;		// 전표번호
	public static final int KOREAN_SPECIAL	 = 21;		// 한글 예외처리
	public static final int JAVASCRIPT	 	 = 22;		// 자바스크립트 사용
	public static final int SPECIAL_CHAR     = 23;		// 특수문자 치환

	private Hashtable colIndex = new Hashtable();

	protected String name = null;

	public Box() {
		super();
		this.name = "";
	}

	public static Box makeBox(Map<String, Object> map) {
		Box bx = new Box("");
		for (String key : map.keySet()) {
			try {
				if(map.get(key) != null && map.get(key).getClass().equals(oracle.sql.CLOB.class)) {
					CLOB clob = (CLOB) map.get(key);
					if(clob != null && clob.isEmptyLob() == false) {
						Reader reader = clob.getCharacterStream();

						StringBuffer out = new StringBuffer();
						char[] buff = new char[1024];
						int nchars = 0;

						while ((nchars = reader.read(buff)) > 0) {
							out.append(buff, 0, nchars);
						}
						String cval = out.toString();
						if(cval != null && cval.indexOf("&") >= 0) { cval = StringUtil.getReplaceSpecialCharacters(cval); }
						bx.put(key, cval);
					}else {
						bx.put(key, "");
					}
				}else {
					String cval = FormatUtil.nvl2(map.get(key).toString(),"");
					if(cval.indexOf("&") >= 0) { cval = StringUtil.getReplaceSpecialCharacters(cval); }
					bx.put(key.toLowerCase(), cval);
				}
			} catch (Exception ex) {
				CD.logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(ex));
			}
		}
		return bx;
	}
	
	public void putAllBox(Box box) {
	    for (String key : box.keySet()) {
            try {
            	String cval = FormatUtil.nvl2(box.get(key),"");
				if(cval.indexOf("&") >= 0) { cval = StringUtil.getReplaceSpecialCharacters(cval); }
                this.put(key.toLowerCase(), cval);
            } catch (Exception ex) {
                CD.logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(ex));
            }
        }
	}

	/**
	 * box에 request값을 저장 처리
	 * @param req
	 * @return
	 */
	public static Box makeBox(HttpServletRequest req) {
		Box box = new Box("");
		try {
			box = new Box("RequestBox");
			Enumeration e = req.getParameterNames();
			while (e.hasMoreElements()) {
				String key = (String) e.nextElement();
				String skey = key;
				if(req.getParameterValues(key) != null) {
					if(req.getParameterValues(key).length == 1) {
						String cval = req.getParameter(key);
						if(cval != null && cval.indexOf("&") >= 0) { cval = StringUtil.getReplaceSpecialCharacters(cval); }
						box.put(skey, cval);
					}else {
					    box.put("orig_"+skey, req.getParameterValues(key));
		                box.put(skey, getArrayToStr(req.getParameterValues(key),"", true));
					}
				}
			}
			if(req.getSession().getAttribute(CD.USER_SES_KEY) != null) {
				if(!((SesUserEntity)req.getSession().getAttribute(CD.USER_SES_KEY)).dbo.equals("")){
					box.put("dbo", ((SesUserEntity)req.getSession().getAttribute(CD.USER_SES_KEY)).dbo);
				}
				box.put("sys_reg_id", ((SesUserEntity)req.getSession().getAttribute(CD.USER_SES_KEY)).empl_no);
				box.put("connect_ip", req.getRemoteAddr());
			}
			req.setAttribute("box", box);
		} catch (Exception ex) {
			CD.logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(ex));
		}
		return box;
	}

	public static Box makeBox(HttpServletRequest req, Model model) {
		Box box = makeBox(req);
		req.setAttribute("box", box);
		model.addAttribute("box", box);
		return box;
	}

	/**
	 * 파일 업로드와 함께 box에 request 값을 저장 처리
	 * @param req
	 * @param uploadRootPath
	 * @param subDirNm
	 * @param model
	 * @return
	 */
	public static Box makeBox(MultipartHttpServletRequest req, String uploadRootPath) {
		Box box = new Box("");
		uploadRootPath = uploadRootPath.replaceAll("\\\\","/");
		try {
			box = new Box("RequestBox");
			Enumeration e = req.getParameterNames();
			while (e.hasMoreElements()) {
				String key = (String) e.nextElement();
				String skey = key;
				if(req.getParameterValues(key) != null) {
					if(req.getParameterValues(key).length == 1) {
						String cval = req.getParameter(key);
						if(cval != null && cval.indexOf("&") >= 0) { cval = StringUtil.getReplaceSpecialCharacters(cval); }
						box.put(skey, cval);
					}else {
					    box.put("orig_"+skey, req.getParameterValues(key));
		                box.put(skey, getArrayToStr(req.getParameterValues(key),"", true));
					}
				}
			}

			final Map<String, MultipartFile> files = req.getFileMap();

			MultipartFile file;
			String tmpPath = uploadRootPath + (uploadRootPath.endsWith("/") ? "" : "/") + "temp";
			File f = new File(tmpPath);
			if(!f.exists()) { f.mkdirs(); }
 
			ArrayList<Box> fileList = new ArrayList<Box>();
			for (Map.Entry<String, MultipartFile> elem : files.entrySet()) {
				file = elem.getValue();
				if (!"".equals(file.getOriginalFilename())) {
					Box fbox = new Box();
					String fnm = file.getOriginalFilename();
					String ext = FileUtil.getFileExt(fnm);
					String sFileNm = CD.getNewID() + "." + ext.toLowerCase(); 

					fbox.put("input_nm", file.getName());
					fbox.put("isupload", "Y");
					fbox.put("sfile_nm", sFileNm);
					fbox.put("file_nm", fnm);
					fbox.put("file_ext", ext);
					fbox.put("file_size", file.getSize() + "");
					fbox.put("full_path", tmpPath);

					String filePath = tmpPath + "/" + sFileNm;
					file.transferTo(new File(filePath)); 
					fileList.add(fbox);

					box.put(file.getName() + "_isupload", "Y");
					box.put(file.getName() + "_filebox", fbox);
				}
			}
			if(req.getSession().getAttribute(CD.USER_SES_KEY) != null) {
				if(!((SesUserEntity)req.getSession().getAttribute(CD.USER_SES_KEY)).dbo.equals("")){
					box.put("dbo", ((SesUserEntity)req.getSession().getAttribute(CD.USER_SES_KEY)).dbo);
				}
				box.put("sys_reg_id", ((SesUserEntity)req.getSession().getAttribute(CD.USER_SES_KEY)).user_id);
				box.put("connect_ip", req.getRemoteAddr());
			}
			box.put("attachFileList", fileList);
			req.setAttribute("box", box);
		} catch (Exception ex) {
			CD.logger.error(org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(ex));
		}
		return box;
	}
	
	/**
	 * 첨부된 모든 파일의 확장자, 사이즈 체크
	 * @param fileExt
	 * @param maxFileSize
	 * @return
	 */
	public boolean attachAllFileChk(String allowFileExt, String maxFileSize) {
	    ArrayList<Box> fileList = this.getAttachedFileList();
	    for(int i=0; i < fileList.size(); i++) {
	        Box fbox = fileList.get(i);
	        if (attachFileChk(fbox, allowFileExt, maxFileSize) == false) {
	            break;
	        } 
	    }
	    if (getAttachFileErrMsg().isEmpty()) {
	        return true;
	    } else {
	        this.put("attachFileErrMsg", getAttachFileErrMsg());
	        return false;
	    }
	}
	
	public void deleteAttachFile() {
	    try {
    	    ArrayList<Box> fileList = this.getAttachedFileList();
            for(int i=0; i < fileList.size(); i++) {
                Box fbox = fileList.get(i);
                FileUtil.doDeleteFile(fbox.get("full_path") + "/" + fbox.get("sfile_nm"));
            }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	}
	
	/**
	 * 파일 하나의 확장자, 사이즈 체크
	 * @param fbox
	 * @param allowFileExt
	 * @param maxFileSize
	 * @return
	 */
	public boolean attachFileChk(Box fbox, String allowFileExt, String maxFileSize) {
        String errMsg = "";
	    String inpKey = fbox.get("input_nm");
        String fileNm = fbox.get("file_nm"); // 원래파일명
        String fileExt = FileUtil.getFileExt(fileNm).toLowerCase();
        long fileSize = fbox.getLong("file_size");
        if (allowFileExt.indexOf(fileExt) < 0) {
            errMsg = "허용되는 첨부파일의 확장자가 아닙니다.[" + fileExt + "]";
        }
        if (fileSize > Integer.parseInt(maxFileSize) * 1024 * 1024) {
            errMsg = "첨부 파일의 크기는 최대.[" + maxFileSize + "]M 입니다.";
        }
        if (errMsg.isEmpty()) {
            return true;
        } else {
            this.put("attachFileErrMsg", errMsg);
            return false;
        }
	}
	
	public String getAttachFileErrMsg() {
	    return this.get("attachFileErrMsg");
	}
	
	/**
	 * 파일업로드 확장자 체크
	 * @param multiRequest
	 * @param allowFileExt
	 * @return
	 */
	public static boolean chkUploadFileExt(final MultipartHttpServletRequest multiRequest, String allowFileExt) {
		boolean rtn = true;
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
        for( Map.Entry<String, MultipartFile> elem : files.entrySet() ){
        	MultipartFile fileItem = elem.getValue();
        	String fnm = fileItem.getOriginalFilename();
        	String ext = FileUtil.getFileExt(fnm);
        	if (allowFileExt.indexOf(ext.toLowerCase()) < 0) {
        		rtn = false;
        		break;
    		}
        }
        return rtn;
	}
	
	/**
	 * 첨부 파일 리스트 목록
	 * @return
	 */
	public ArrayList<Box> getAttachedFileList() {
		if (this.getObject("attachFileList") == null) {
			return new ArrayList<Box>();
		} else {
			return (ArrayList<Box>)this.getObject("attachFileList");
		}
	}
	
	/**
	 * 업로드 파일 정보 box 조회
	 * @param inputNm
	 * @return
	 */
	public Box getFileBox(String inputNm) {
		if (this.getObject(inputNm + "_filebox") == null) {
			Box fbox = new Box("");
			fbox.put("input_nm", inputNm);
			fbox.put("isupload", "N");
			return fbox;
		} else {
			return (Box) this.getObject(inputNm + "_filebox");
		}
	}
	
	// upload file의 클라이언트가 보낸 파일 이름
	public String getSourceFileNm(String key) {
		return this.getFileBox(key).get("file_nm");
	}
	// upload되어 서버에 저장된 파일의 이름
	public String getStoredFileNm(String key) {
		return this.getFileBox(key).get("sfile_nm");
	}
	// 저장된 파일의 사이즈
	public String getStoredFileSize(String key) throws Exception {
	    return this.getFileBox(key).get("file_size");
	}
	
	/**
	 * spring 에서의 파일이동 처리
	 * @param key
	 * @param pathKey
	 * @param fileNm
	 * @throws Exception
	 */
	public void springMoveFileToService(String key, String uploadRootPath, String subPath, String fileNm) throws Exception {
		String srcFile = uploadRootPath + "/temp/" + getStoredFileNm(key);
		String destFile = uploadRootPath + "/" + subPath + "/" + fileNm;
		
		File f = new File(destFile);
		if(!f.getParentFile().exists()) {
			f.getParentFile().mkdirs();
		} 
		FileUtil.fileMove(srcFile, destFile);
	}
	
	/**
	 * <pre>
	 * Constructor
	 * </pre>
	 *
	 * @param name
	 *            Box의 이름
	 */
	public Box(String name) {
		super();
		this.name = name;
	}

	/**
	 * <pre>
	 * Box를 복사해 새로운 Box instance를 반환한다.
	 * </pre>
	 *
	 * @return Object 복사된 Box Object
	 */
	public Object clone() {

		Box newbox = new Box(name);

		Box src = (Box) this;
		Box target = (Box) newbox;

		Enumeration e = src.keys();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			if(key.equals("attachFileList")) { continue; }
			Object value = src.get(key);
			target.put(key, value);
		}
		return newbox;
	}

	public Enumeration keys() {
		return new SetEnumeration(this.keySet());
	}

	public Enumeration elements() {
		return new SetEnumeration(this.entrySet());
	}

	/**
	 * <pre>
	 * Box에 있는 값 중 entity class의 field 에 해당하는 값이 있으면 entity object의 filed 값을 셋팅.
	 * Usage :
	 * Box box = HttpUtility.getBox(req);
	 * box.copyToEntity(c);  // c class field 에 해당하는 값을 넣어준다.
	 * </pre>
	 * 
	 * @param entity
	 *            java.lang.Object
	 */
	public Object copyToEntity(Object entity) {
		if (entity == null)
			throw new NullPointerException("trying to copy from box to null entity class");

		Class c = entity.getClass();
		java.lang.reflect.Field[] field = c.getFields();
		for (int i = 0; i < field.length; i++) {
			try {
				String fieldtype = field[i].getType().getName();
				String fieldname = field[i].getName();

				if (containsKey(fieldname)) {
					if (fieldtype.equals("java.lang.String")) {
						field[i].set(entity, getString(fieldname));
					} else if (fieldtype.equals("int")) {
						field[i].setInt(entity, getInt(fieldname));
					} else if (fieldtype.equals("double")) {
						field[i].setDouble(entity, getDouble(fieldname));
					} else if (fieldtype.equals("long")) {
						field[i].setLong(entity, getLong(fieldname));
					} else if (fieldtype.equals("float")) {
						field[i].set(entity, new Float(getDouble(fieldname)));
					}
				}
			} catch (Exception e) {
				// Debug.warn.println(this, e.getMessage());
			}
		}
		return entity;
	}

	public Properties getProperty() {
		Properties pt = new Properties();

		Enumeration e = this.keys();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			pt.setProperty(key, this.get(key));
		}
		return pt;
	}

	// index에 의해 데이터를 가져올때 사용
	public String get(int idx) {
		String key = (String) colIndex.get((new Integer(idx).toString()));
		return get(key);
	}

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 String 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return String 찾은 값
	 */
	public String get(String key) {
		if(bxmap.get(key) == null && bxmap.get(key.toLowerCase()) == null) {
			return "";
		}else {
			return bxmap.get(key) != null ? (String) bxmap.get(key) : (String) bxmap.get(key.toLowerCase());
		}
	}

	/**
	 * key에 해당하는 값이 없을 경우 target의 값을 리턴한다.
	 * 
	 * @param key
	 * @param target
	 * @return
	 */
	public String getNvl(String key, String target) {
		String str = getString(key);
		if (str == null || str.equals(""))
			str = target;
		return str;
	}

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 금액 표시에 맞게 천단위 , 를 붙여 가져온다. 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return String 찾은 값
	 */
	public String getThdComma(String key) {
		return FormatUtil.insertComma(get(key));
	}

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 double 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key Box에서 찾을 key
	 * @return double 찾은 값
	 */
	public double getDouble(String key) {
		String value = removeComma(getString(key));
		if (value.equals(""))
			return 0;
		double num = 0;
		try {
			num = Double.valueOf(value).doubleValue();
		} catch (Exception e) {
			num = 0;
		}
		return num;
	}
	
	/**
     * <pre>
     * Box에서 key에 해당하는 값이 double형이 맞는지 체크
     * 공백일 경우 double로 판단
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @return true : double이 맞을 경우, false : double이 아닐경우
     */
	public boolean isDouble(String key) {
	    return isDouble(key, false);
	}

    
    /**
     * <pre>
     * Box에서 key에 해당하는 값이 double형이 맞는지 체크
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @param emptyErr 공백을 double이 아니라고 판단할 경우 true로 지정
     * @return true : double이 맞을 경우, false : double이 아닐경우
     */
	public boolean isDouble(String key, boolean emptyErr) {
	    String value = removeComma(getString(key)).trim();
	    if (value.isEmpty() && emptyErr) {
	        return false;
	    } else if (value.isEmpty() && emptyErr == false) {
	        return true;
	    } else {
	        try {
	            Double.parseDouble(value);
	            return true;
	        } catch (Exception e) {
	            return false;
	        }
	    }	    
	}

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 double 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return double 찾은 값
	 */
	public float getFloat(String key) {
		return (float) getDouble(key);
	}
    
    /**
     * <pre>
     * Box에서 key에 해당하는 값이 float형이 맞는지 체크
     * 공백일 경우 float로 판단
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @return true : float이 맞을 경우, false : float이 아닐경우
     */
    public boolean isFloat(String key) {
        return isFloat(key, false);
    }

    
    /**
     * <pre>
     * Box에서 key에 해당하는 값이 float형이 맞는지 체크
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @param emptyErr 공백을 float이 아니라고 판단할 경우 true로 지정
     * @return true : float이 맞을 경우, false : float이 아닐경우
     */
    public boolean isFloat(String key, boolean emptyErr) {
        String value = removeComma(getString(key)).trim();
        if (value.isEmpty() && emptyErr) {
            return false;
        } else if (value.isEmpty() && emptyErr == false) {
            return true;
        } else {
            try {
                Float.parseFloat(value);
                return true;
            } catch (Exception e) {
                return false;
            }
        }       
    }

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 int 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return int 찾은 값
	 */
	public int getInt(String key) {
		double value = getDouble(key);
		return (int) value;
	}
    
    /**
     * <pre>
     * Box에서 key에 해당하는 값이 int형이 맞는지 체크
     * 공백일 경우 int로 판단
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @return true : int이 맞을 경우, false : int이 아닐경우
     */
    public boolean isInt(String key) {
        return isInt(key, false);
    }

    
    /**
     * <pre>
     * Box에서 key에 해당하는 값이 int형이 맞는지 체크
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @param emptyErr 공백을 int이 아니라고 판단할 경우 true로 지정
     * @return true : int이 맞을 경우, false : int이 아닐경우
     */
    public boolean isInt(String key, boolean emptyErr) {
        String value = removeComma(getString(key)).trim();
        if (value.isEmpty() && emptyErr) {
            return false;
        } else if (value.isEmpty() && emptyErr == false) {
            return true;
        } else {
            try {
                Integer.parseInt(value);
                return true;
            } catch (Exception e) {
                return false;
            }
        }       
    }

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 long 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return long 찾은 값
	 */
	public long getLong(String key) {
		String value = removeComma(getString(key));
		if (value.equals(""))
			return 0L;

		long lvalue = 0L;
		try {
			lvalue = Long.valueOf(value).longValue();
		} catch (Exception e) {
			lvalue = 0L;
		}
		return lvalue;
	}
    
    /**
     * <pre>
     * Box에서 key에 해당하는 값이 long형이 맞는지 체크
     * 공백일 경우 long로 판단
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @return true : long이 맞을 경우, false : long이 아닐경우
     */
    public boolean isLong(String key) {
        return isLong(key, false);
    }

    
    /**
     * <pre>
     * Box에서 key에 해당하는 값이 long형이 맞는지 체크
     * </pre>
     *
     * @param key Box에서 찾을 key
     * @param emptyErr 공백을 long이 아니라고 판단할 경우 true로 지정
     * @return true : long이 맞을 경우, false : long이 아닐경우
     */
    public boolean isLong(String key, boolean emptyErr) {
        String value = removeComma(getString(key)).trim();
        if (value.isEmpty() && emptyErr) {
            return false;
        } else if (value.isEmpty() && emptyErr == false) {
            return true;
        } else {
            try {
                Long.parseLong(value);
                return true;
            } catch (Exception e) {
                return false;
            }
        }       
    }

	/**
	 * <pre>
	 * Box에서 날짜에 해당하는 값을 가져온다.
	 * usage)
	 *   box.getDateParams("due_date");
	 *  는 다음과 같다.
	 *  box.get("due_date1") + box.get("due_date2") + box.get("due_date3");
	 *  request.getParameter("due_date1") + request.getParameter("due_date2") + request.getParameter("due_date3");
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return String 찾은 값
	 */
	public String getDateParams(String key) {

		return getString(key + "1") + getString(key + "2") + getString(key + "3");
	}

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 String 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return String 찾은 값
	 */
	public String getString(String key) {
		String value = "";
		try {
			Object o = (Object) get(key);
			Class c = o.getClass();
			if (o == null)
				value = "";
			else if (c.isArray()) {
				int length = Array.getLength(o);
				if (length == 0)
					value = "";
				else {
					for (int i = 0; i < Array.getLength(o); i++) {
						Object item = Array.get(o, i);
						if (item != null) {
							value += item.toString();
						}
					}
				}
			} else
				value = o.toString();
		} catch (Exception e) {
			value = "";
		}
		return value;
	}

	/**
	 * <pre>
	 * check box 와 같이 같은 name에 대해 여러 value들이 String의 Vector로 넘겨준다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return Vector
	 */
	public Vector getVector(String key) {
		Vector vector = new Vector();
		try {
			Object o = (Object) getObject(key);
			if (o == null || (o.toString().isEmpty())) {
				o = (Object) getObject(key.toLowerCase());
			}
			Class c = o.getClass();
			if (o != null) {
				if (c.isArray()) {
					int length = Array.getLength(o);
					if (length != 0) {
						for (int i = 0; i < length; i++) {
							Object tiem = Array.get(o, i);
							if (tiem == null)
								vector.addElement("");
							else
								vector.addElement(tiem.toString());
						}
					}
				} else
					vector.addElement(o.toString());
			}
		} catch (Exception e) {
		}
		return vector;
	}

	public String getVectorValueAt(String key, int i) {
		key = key.replaceAll("_", "");
		Object o = (Object) get(key);
		Class c = o.getClass();
		if (c.isArray()) {
			Object tiem = Array.get(o, i);
			return tiem.toString();
		} else {
			return get(key);
		}
	}

	public int getVectorSize(String key) {
		return getVector(key).size();
	}

	/**
	 * <pre>
	 * check box 와 같이 같은 name에 대해 여러 value들이 String의 Vector에서 값을 빼내 스트링으로
	 * 붙여서 넘겨준다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @param concat_str
	 *            string과 string을 붙일때 사용될 문자열
	 * @param trim_tail
	 *            스트링의 맨뒤의 concat_str을 없앨것인지 여부
	 * @return Vector
	 */
	public String getVectorToStr(String key, String concat_str, boolean trim_tail) {
		Vector vt = getVector(key);
		String rtn = "";
		for (int i = 0; i < vt.size(); i++) {
			rtn += (String) vt.get(i) + concat_str;
		}
		if (rtn.length() > 0 && trim_tail) {
			return rtn.substring(0, rtn.length() - concat_str.length());
		} else {
			return rtn;
		}
	}
	

	/**
	 * Stirng Array를 ,로 구분된 문자열로 반환
	 * @param arr1
	 * @param concat_str
	 * @param trim_tail
	 * @return
	 */
       public static String getArrayToStr(String[] arr1, String concat_str, boolean trim_tail) {
          String rtn = "";
          for (int i = 0; i < arr1.length; i++) {
             rtn += arr1[i] + concat_str;
          }
          if (rtn.length() > 0 && trim_tail) {
             return rtn.substring(0, rtn.length() - concat_str.length());
          } else {
             return rtn;
          }
       }

       /**
        * box의 특정key의 Stirng Array를 ,로 구분된 문자열로 반환
        * @param arr1
        * @param concat_str
        * @param trim_tail
        * @return
        */
       public String getArrayToStr(String key, String concat_str, boolean trim_tail) {
          String[] arr1 = (String[]) getObject(key);
          String rtn = "";
          for (int i = 0; i < arr1.length; i++) {
             rtn += arr1[i] + concat_str;
          }
          if (rtn.length() > 0 && trim_tail) {
             return rtn.substring(0, rtn.length() - concat_str.length());
          } else {
             return rtn;
          }
       }


	/**
	 * <pre>
	 * Box에 새로운 값을 저장한다.
	 * </pre>
	 *
	 * @param key
	 *            찾을때 쓸 key
	 * @param value
	 *            저장할 값
	 */
	public void put(String key, String value) {
		// key = key;
		bxmap.put(key, value);
	}

	public void put(String key, int value) {
		bxmap.put(key, value);
	}

	public int putMeta() {
		int param_cnt = 0;
		String elm_id = ""; String elm_val = ""; String elm_key = "";
		for(Enumeration e = keys() ; e.hasMoreElements() ;) {
			String key = (String)e.nextElement();
			if(key.startsWith("_")) {
				elm_id  += key.substring(1) + "Ð";
				elm_val += get(key) + "Ð";
				elm_key += get(key.substring(1)+"_key") + "Ð";
				param_cnt++;
			}
		}
		put("elm_id", 	elm_id);
		put("elm_val", 	elm_val);
		put("elm_key", 	elm_key);
		return param_cnt;
	}

	/**
	 * <pre>
	 * 문자열에서 ","를 제거한다.
	 * </pre>
	 *
	 * @param s
	 *            source문자열
	 * @return ","를 제거한 문자열
	 */
	private static String removeComma(String s) {
		if (s == null)
			return null;
		if (s.indexOf(",") != -1) {
			StringBuffer buf = new StringBuffer();
			for (int i = 0; i < s.length(); i++) {
				char c = s.charAt(i);
				if (c != ',')
					buf.append(c);
			}
			return buf.toString();
		}
		return s;
	}

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 Object 형식으로 가져온다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @return Object 찾은 값
	 */
	public Object getObject(String key) {
		try {
			return bxmap.get(key);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * <pre>
	 * Box의 모든 값을 스트링으로 반환
	 * </pre>
	 *
	 * @return java.lang.String
	 */
	public synchronized String toString() {
		int max = size() - 1;
		StringBuffer buf = new StringBuffer();
		Enumeration keys = keys();
		Enumeration objects = elements();
		buf.append("{");

		for (int i = 0; i <= max; i++) {
			String key = keys.nextElement().toString();
			String value = null;
			Object o = objects.nextElement();
			if (o == null)
				value = "";
			else {
				Class c = o.getClass();
				if (c.isArray()) {
					int length = Array.getLength(o);
					if (length == 0)
						value = "";
					else if (length == 1) {
						Object item = Array.get(o, 0);
						if (item == null)
							value = "";
						else
							value = item.toString();
					} else {
						StringBuffer valueBuf = new StringBuffer();
						valueBuf.append("[");
						for (int j = 0; j < length; j++) {
							Object item = Array.get(o, j);
							if (item != null)
								valueBuf.append(item.toString());
							if (j < length - 1)
								valueBuf.append(",");
						}
						valueBuf.append("]");
						value = valueBuf.toString();
					}
				} else
					value = o.toString();
			}
			buf.append(key + "=" + value);
			if (i < max)
				buf.append(", ");
			buf.append("\n");
		}
		buf.append("}");

		return "Box[" + name + "]=" + buf.toString();

	}

	public String get(String key, String fmt) {
		return get(key, Integer.parseInt(fmt));
	}

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 가져와 fmt에 맞게 포맷하여 반환한다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @param fmt
	 *            포맷형태 상수
	 * @return String 찾은 값
	 */
	public String get(String key, int fmt) {
	      String tmp="";
	      switch (fmt) {
	          case DEF_DATE_FMT :
	              tmp = DateUtil.defFmtDate(get(key));
	              break;
	          case DEF_DATETIME_FMT :
	              tmp = DateUtil.defFmtDateTime(get(key));
	              break;
	          case THOUSAND_COMMA :
	              tmp = StringUtil.getComma(get(key));
	              break;
	          case THOUSAND_COMMA_FLOAT :
	        	  tmp = StringUtil.getComma(get(key), false);
	        	  break;
	          case ZIP_CODE :
	        	  tmp = StringUtil.getZip(get(key));
	        	  break;
	          case JUMIN_NO :
	        	  tmp = StringUtil.getJumin(get(key));
	        	  break;
	          case MULTILINE_TEXT :
	        	  tmp = StringUtil.getReplaceSpecialCharacters(get(key));
	        	  tmp = tmp.replaceAll("\n", "<br>");
	        	  break; 
	          case KOREAN_SPECIAL :
	        	  tmp = get(key).replaceAll("&amp;#","&#");
	        	  break; 
	          case DEF_DATETIME_FMT_APM :
	              tmp = DateUtil.defFmtDateTimeAPM(get(key));
	              break;
	          case HTML :
	              tmp = get(key).replaceAll("&lt;br&gt;","<br>");
	              break;
	  		  case HTML_TEXT:
	  			  tmp = StringUtil.replceHtmlToText(get(key));
	  			  break;
	          case YES_NO :
	              tmp = (get(key).equals("Y") ? "예" : "아니오");
	              break;
	          case POSSIBLE_OR_NOT :
	              tmp = (get(key).equals("Y") ? "가능" : "불가능");
	              break;
	          case JAVASCRIPT :
	              tmp = get(key).replaceAll("\n", "@NEWLINE@").replaceAll("\r", "").replaceAll("'", "@SQUOT@").replaceAll("&quot;", "@DQUOT@");
	              tmp = StringUtil.replace(tmp, "(", "@LBRACE@");
	              tmp = StringUtil.replace(tmp, ")", "@RBRACE@");
	              break;
	          case SPECIAL_CHAR :
	        	  tmp = get(key).replaceAll("\"","&quot;").replaceAll("'","&apos;").replaceAll("<","&lt;").replaceAll(">","&gt;");
	        	  break; 
	          case SLIP_NO :
	        	  tmp = StringUtil.getSlip(get(key));
	        	  break;
	      }
	      return tmp;
	  }

	/**
	 * <pre>
	 * Box에서 key에 해당하는 값을 가져와 fmt에 맞게 포맷하여 반환한다.
	 * 만약 값이 공백일 경우 target을 넘겨준다.
	 * </pre>
	 *
	 * @param key
	 *            Box에서 찾을 key
	 * @param fmt
	 *            포맷형태 상수
	 * @return String 찾은 값
	 */
	public String get(String key, int fmt, String target) {
		String tmp = get(key, fmt);
		return tmp.equals("") ? target : tmp;
	}
	
    public void putColIndex(String col_nm, int idx) {
        colIndex.put((new Integer(idx)).toString(), col_nm);
    }
    
	//@Override
	public int size() {
		return bxmap.size();
	}

	//@Override
	public boolean isEmpty() {
		return bxmap.size() == 0 ? true : false;
	}

	//@Override
	public boolean containsKey(Object key) {
		return bxmap.containsKey(key);
	}

	//@Override
	public boolean containsValue(Object value) {
		return bxmap.containsValue(value);
	}

	//@Override
	public Object get(Object key) {
		if (bxmap.get(key) == null && key instanceof String) {
			return bxmap.get(((String) key).toLowerCase());
		} else {
			return bxmap.get(key);
		}
	}

	//@Override
	public Object put(String key, Object value) {
		bxmap.put(key, value);
		return bxmap;
	}

	//@Override
	public Object remove(Object key) {
		bxmap.remove(key);
		return null;
	}

	//@Override
	public void putAll(Map<? extends String, ? extends Object> m) {
		// TODO Auto-generated method stub

	}

	//@Override
	public void clear() {
		// TODO Auto-generated method stub

	}

	//@Override
	public Set<String> keySet() {
		return bxmap.keySet();
	}

	//@Override
	public Collection<Object> values() {
		return bxmap.values();
	}

	//@Override
	public Set<java.util.Map.Entry<String, Object>> entrySet() {
		// TODO Auto-generated method stub
		return bxmap.entrySet();
	}

}