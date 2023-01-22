package egovframework.cbiz.util;

import java.io.*;
import java.text.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.StringTokenizer;

import org.apache.commons.lang.exception.ExceptionUtils;

import egovframework.cbiz.Box;

/**
 * <pre>
 * 문자열 처리 관련 Class
 * </pre>
 *
 * @author     IRAM
 * @version    1.0
 * @since      2002.01.
 */
 
public class StringUtil {
    
    
  public static String urlEncode(String str) {
    return replace(java.net.URLEncoder.encode(str),"+","%20");
  }  
    
  /**
   * <pre>
   * 입력된 문자열에서 source형태의 문자열을 target문자열로 변환하여 리턴한다.
   * 예) replace('엔터프라이즈 자바빈즈','즈','빈') -> 엔터프라이빈 자바빈빈
   * </pre>
   *
   * @param  str 원래 문자열
   * @param  pattern    바꿀 문자열
   * @param  replace    바뀔 문자열
   * @return java.lang.String
   */
  public static String replace(String str, String pattern, String replace){
    int s = 0; //시작위치
    int e = 0; //append하는 위치
    if ("".equals(pattern)) return str;
    
    StringBuffer result = new StringBuffer();
    while ((e = str.indexOf(pattern,s)) >= 0){
        result.append(str.substring(s,e));
        result.append(replace);
        s = e + pattern.length();        
    } //while 종료
    result.append(str.substring(s));
    return result.toString();
  }

  /**
   * <pre>
   * 입력된 문자열에서 source형태의 문자열을 target문자열로 변환하여 리턴한다.
   * 예) 1번째로 나오는 하나만 변환한다.
   * </pre>
   *
   * @param  str 원래 문자열
   * @param  pattern    바꿀 문자열
   * @param  replace    바뀔 문자열
   * @return java.lang.String
   */
  public static String replaceFirst1(String str, String pattern, String replace){
	int s = 0; //시작위치
	int e = 0; //append하는 위치
	if ("".equals(pattern)) return str;
    
	StringBuffer result = new StringBuffer();
	while ((e = str.indexOf(pattern,s)) >= 0){
		result.append(str.substring(s,e));
		result.append(replace);
		s = e + pattern.length();
		break; // 한번만 실행한 후 종료
	} //while 종료
	result.append(str.substring(s));
	return result.toString();
  }  

  /**
   * <pre>
   * 특정 부분의 문자열을 지정한 문장열로 바꾼다.
   * </pre>
   *
   * @param  str 원래 문자열
   * @param  sPos 원래문자열을 자를 시작위치
   * @param  ePos 원래문자열을 자를 끝 위치
   * @param  replace 자른 문자열 사이에 넣을 문자열
   * @return String 변환된 문자열
   */
  public static String replace(String str,int sPos , int ePos, String replace){
    StringBuffer result = new StringBuffer(str.substring(0,sPos));
    result.append(replace);
    result.append(str.substring(ePos));
    return result.toString();
  }


  /**
   * <pre>
   * 스트링을 토큰하여 array로 넘긴다.
   * </pre>
   *
   * @param  str     원래 문자열
   * @param  delim   자를 delim 문자
   * @return String[] delim 문자로 토큰된 array
   */
    public static String[] getArrToken(String str, String delim) {
      java.util.StringTokenizer tk = new java.util.StringTokenizer(str, delim);
      String[] arr = new String[tk.countTokens()];
      for (int i=0; i < arr.length; i++) {
        arr[i] = tk.nextToken();
      }
      return arr;
    }

  /**
   * <pre>
   * 스트링을 토큰하여 array로 넘긴다.
   * </pre>
   *
   * @param  str     원래 문자열
   * @param  delim   자를 delim 문자
   * @return String[] delim 문자로 토큰된 array
   */
    public static String[] getArrToken2(String str, String delim) {
      return split(str,delim,true);
    }

  /**
   * <pre>
   * str의 문자열을 " " 으로 구분하여 length마다의 길이에 enter문자를 삽입시켜준다.
   * </pre>
   *
   * @param  str     원래 문자열
   * @param  length  Enter문자를 넣을 위치
   * @return String  원래 문자열에 Enter를 넣은 문자열
   */
    public static String HrInsEnterX(String str , int length) {

      String[] tmp  = getArrToken(str , " ");
      String rtnStr = "";
      int line_num = 1;
      for(int i=0; i < tmp.length; i++) {
        if ((rtnStr + tmp[i]).length() > length * line_num) {
          rtnStr += "\n";
          line_num++;
        }
        rtnStr += " " + tmp[i];
      }
      return rtnStr;
    }

  /**
   * <pre>
   * str의 문자열을 " " 으로 구분하여 length마다의 길이에 enter문자를 삽입시켜준다.
   * enter(\n)다음에 pad 문자를 넣어준다.
   * </pre>
   *
   * @param  str     원래 문자열
   * @param  length  Enter문자를 넣을 위치
   * @param  pad     Enter를 넣은 후 다음 줄 시작에 넣을 문자열
   * @return String  원래 문자열에 Enter를 넣은 문자열
   */
    public static String HrInsEnterX(String str , int length, String pad) {
      return replace(HrInsEnterX(str, length), "\n", "\n"+pad);
    }


  /**
   * <pre>
   * str의 문자열을 length마다의 길이에 enter문자를 삽입시켜준다.
   * " " 로 토큰한 후 토큰 한 string 이 length보다 클경우 /n 을 넣어준다.
   * HrInsEnterX와 틀린 점은 length 안에 enter가 있을 경우 그 다음부터 다시 length를 체크한다.
   * </pre>
   *
   * @param  str     원래 문자열
   * @param  length  Enter문자를 넣을 위치
   * @return String  원래 문자열에 Enter를 넣은 문자열
   */
    public static String HrInsEnterX2(String str , int length) {

      String[] tmp  = getArrToken(str , " ");
      String rtnStr = "";
      String this_line = "";
      for(int i=0; i < tmp.length; i++) {
        this_line += tmp[i];
        if (this_line.length() > length) {
          rtnStr += this_line + "\n";
          this_line = "";
        } else if(this_line.indexOf("\n") != -1) {
          // 엔터가 있을 경우
          rtnStr += this_line;
          this_line = "";
        }
      }
      rtnStr += this_line;
      return rtnStr;
    }

  /**
   * <pre>
   * string에서 integer에 해당하는 값을 찾아온다.
   * </pre>
   *
   * @param str 숫자가 들어있는 문자열
   * @return 숫자로 만들어지는 문자열일 경우 integer에 해당하는 문자열이 넘어오고 아닐경우 공백("")이 넘어온다.
   */
    public static String getIntString(String str) {
      String rtn = "";
      try {
        rtn = String.valueOf(Integer.parseInt(str));
      } catch (Exception e) {
        rtn = "";
      }
      return rtn;
    }

  /**
   * <pre>
   * str string에서 숫자인 것만 찾아온다.
   * </pre>
   *
   * @param  str 원래 문자열
   * @return String 원래 문자열에서 숫자만 리턴
   */
  public static String getNumber(String str) {
    if (str == null) {
      return str;
    }

    StringBuffer sb = new StringBuffer(str);
    StringBuffer newSb = new StringBuffer();

    int sbLen = sb.length();
    char number;
    for(int i = 0; i < sbLen; i++) {
      number = sb.charAt(i);
      if (number >= 48 && number <= 57)
        newSb.append(sb.charAt(i));
    }

    return newSb.toString();
  }


/**
 *<pre>
 * 문자열을 15자 만큼만 보여주고
 * 그 길이에 초과되는 문자열일 경우 "..."를 덧붙여 보여준다.
 *</pre>
 *
 * @param input 변환할 문자열
 * @return String 제한된 길이만큼 자르고 ... 을 붙인 문자열
 */
  public static String fixLength(String input) {
    return fixLength(input, 15, "...");
  }

/**
 *<pre>
 * 문자열을 일정길이 만큼만 보여주고
 * 그 길이에 초과되는 문자열일 경우 "..."를 덧붙여 보여준다.
 *</pre>
 *
 * @param input 변환할 문자열
 * @param limit 문자열의 제한 길이
 * @return String 제한된 길이만큼 자르고 ... 을 붙인 문자열
 */
  public static String fixLength(String input, int limit) {
    return fixLength(input, limit, "...");
  }

/**
 *<pre>
 * 문자열을 일정길이 만큼만 보여주고
 * 그 길이에 초과되는 문자열일 경우 특정문자를 덧붙여 보여준다.
 *</pre>
 *
 * @param input 변환할 문자열
 * @param limit 문자열의 제한 길이
 * @param postfix 덧붙일 문자열
 * @return String 제한된 길이만큼 자르고 postfix문자열을 붙인 문자열
 */
  public static String fixLength(String input, int limit, String postfix)
  {
    char[] charArray = input.toCharArray();
    if (limit >= charArray.length)
      return input;
    return new String( charArray, 0, limit ).concat( postfix );
  }

/**
 *<pre>
 * 문자열을 일정길이 만큼만 보여주고
 * 그 길이(Unicode)에 초과되는 문자열일 경우 "..." 문자를 덧붙여 보여준다.
 *
 * 단 fixLength와의 차이는 제한길이의 기준이 char가 아니라 byte로
 * 처리함으로해서 한글문제를 해결할수 있다.
 *</pre>
 *
 * @param input 변환할 문자열
 * @param limitByte 문자열의 제한 길이(byte)
 * @return 제한된 길이만큼 자르고 ... 을 붙인 문자열
 */
  public static String fixUnicodeLength(String input, int limitByte) {
    return fixLength(input, limitByte, "...");
  }

/**
 *<pre>
 * 문자열을 일정길이 만큼만 보여주고
 * 그 길이에 초과되는 문자열일 경우 특정문자를 덧붙여 보여준다.
 *
 * 단 fixLength와의 차이는 제한길이의 기준이 char가 아니라 byte로
 * 처리함으로해서 한글문제를 해결할수 있다.
 *</pre>
 *
 * @param input 변환할 문자열
 * @param limitByte 문자열의 제한 길이(byte)
 * @param postfix 덧붙일 문자열
 * @return String 제한된 길이만큼 자르고 postfix문자열을 붙인 문자열
 */
  public static String fixUnicodeLength( String input, int limitByte, String postfix )
  {
      /*
              중간에 -1을 해주는 것은. 21바이트짜리 한글 스트링을.
              20으로 짤라서 String을 생성하면, 끝글자만 짤리는것이 아니라.
              스트링자체가 완전 생성이 되지 않기 때문. 그러므로 길이가 0이면
              -1한만큼 스트링을 생성하는 것이다.
      */
      byte[] outputBytes = input.getBytes();

      String output = outputBytes.length <= limitByte ?
              input : (new String( outputBytes, 0, limitByte ).length()==0 ?
                      new String( outputBytes, 0, limitByte-1 ).concat( postfix ) :
                      new String( outputBytes, 0, limitByte )	).concat( postfix );

      return output;
  }

    /**
     * <pre>
     * String EUC_KR로 encoding한다.
     * </pre>
     *
     * @param text 한글로 encoding할 문자열
     * @return String 한글로 encoding된 문자열
     */
    public static String getEUC_KR(String text)
    {
        String rtn;

        rtn = "";

        if (text == null)
            return rtn;
        else {
            try {
                return new String(text.getBytes("8859_1"),"EUC-KR");
            }
            catch (UnsupportedEncodingException UEE)
            {
                return rtn;
            }
        }
//    return text;
    }

    /**
     * <pre>
     * String EUC_KR로 encoding한다.
     * </pre>
     *
     * @param text 한글로 encoding할 문자열
     * @return String 한글로 encoding된 문자열
     */
    public static String getUTF8(String text)
    {
        String rtn;

        rtn = "";

        if (text == null)
            return rtn;
        else {
            try {
                return new String(text.getBytes("8859_1"),"UTF-8");
            }
            catch (UnsupportedEncodingException UEE)
            {
                return rtn;
            }
        }
//    return text;
    }

    /**
     * <pre>
     * String EUC_KR로 encoding한다.
     * </pre>
     *
     * @param text 한글로 encoding할 문자열
     * @return String 한글로 encoding된 문자열
     */
    public static String[] getUTF8(String[] arrText) {
        String[] arrRtn = new String[arrText.length];

        for(int i=0; i < arrText.length; i++) {
            arrRtn[i] = getUTF8(arrText[i]);
        }
        return arrRtn;
    }

    /**
     * <pre>
     * String EUC_KR로 encoding한다.
     * </pre>
     *
     * @param text 한글로 encoding할 문자열
     * @return String 한글로 encoding된 문자열
     */
    public static String[] getEUC_KR(String[] arrText) {
        String[] arrRtn = new String[arrText.length];

        for(int i=0; i < arrText.length; i++) {
            arrRtn[i] = getEUC_KR(arrText[i]);
        }
        return arrRtn;
    }

    /**
     * <pre>
     * String 8859_1(Unicode)로 encoding한다.
     * </pre>
     *
     * @param text 8859_1로 encoding할 문자열
     * @return String 8859_1로 encoding한 문자열
     */
    public static String get8859_1(String text) {
        String rtn = "";
        if(text == null) { return rtn; }

        try {
            return new String(text.getBytes("euc-kr"),"8859_1");
        }catch (UnsupportedEncodingException UEE) {
            return rtn;
        }
    }

    // 한글파일명 다운로드 시.. 파일명
    public static String korDownFileName(String text) {
        String rtn = "";
        if(text == null) { return rtn; }
            
        try {
            return new String(text.getBytes("UTF-8"),"8859_1");
        }catch (UnsupportedEncodingException UEE) {
            return rtn;
        }
    }

    /**
     * <pre>
     * String 을 from enc 에서 to enc 형태로 변환한다.
     * </pre>
     * @param text
     * @param fromenc
     * @param toenc
     * @return
     */
    public static String[] getEncodeStr(String[] arrText, String fromenc, String toenc) {
        String[] arrRtn = new String[arrText.length];

        for(int i=0; i < arrText.length; i++) {
            arrRtn[i] = getEncodeStr(arrText[i], fromenc, toenc);
        }
        return arrRtn;
    }

    /**
     * <pre>
     * String 을 from enc 에서 to enc 형태로 변환한다.
     * </pre>
     * @param text
     * @param fromenc
     * @param toenc
     * @return
     */
    public static String getEncodeStr(String text, String fromenc, String toenc) {
        String rtn;

        rtn = "";

        if (text == null)
            return rtn;
        else {
            try {
                return new String(text.getBytes(fromenc),toenc);
            }
            catch (UnsupportedEncodingException UEE)
            {
                return rtn;
            }
        }
    }

    /**
     * <pre>
     * String을 encoding한다.
     * </pre>
     *
     * @param text encoding할 문자열
     * @param fromEncode text의 원래 encoding
     * @param toEncode 변환할 encoding
     * @return String 변환된 문자열
     */
    public static String getConvertCharset(String text, String fromEncode, String toEncode)
    {
        String rtn;

        rtn = "";

        if (text == null)
            return rtn;
        else {
            try {
                return new String(text.getBytes(fromEncode),toEncode);
            }
            catch (UnsupportedEncodingException UEE)
            {
                return rtn;
            }
        }
    }

    /**
     * <pre>
     * HTML과 관련하여 일부 특수문자를 반환한다.
     * </pre>
     *
     * @param str 읿부 html 특수문자가 포함된 문자열
     * @return String 일부 html 특수문자를 변환한 문자열
     */
    public static String getSpecialCharacters(String str)
    {
        str = replace(str, "&", "&amp;");
        str = replace(str, "<", "&lt;");
        str = replace(str, ">", "&gt;");
        str = replace(str, "≥", "&ge;");
        str = replace(str, "≤", "&le;");
        str = replace(str, "·", "&middot;");
        str = replace(str, "'", "&acute;");
        str = replace(str, "\"","&quot;");

        return str;
    }

    /**
     * <pre>
     * HTML과 관련하여 일부 특수문자를 변환한다.
     * </pre>
     *
     * @param str html로 변환될 문자를 포함하는 문자열
     * @return String 일부가 html문자로 변환된 문자열
     */
    public static String getReplaceSpecialCharacters(String str)
    {
        str = replace(str, "&lt;br&gt;", "\n");
        str = replace(str, "&amp;", "&");
        str = replace(str, "&lt;", "<");
        str = replace(str, "&gt;", ">");
        str = replace(str, "&ge;", "≥");
        str = replace(str, "&le;", "≤");
        str = replace(str, "&middot;", "·");
        str = replace(str, "&acute;", "'");
        str = replace(str, "&apos;", "'");
        str = replace(str, "&quot;", "\"");
        str = replace(str, "m&sup2;", "m²");
        str = replace(str, "m&sup3;", "m³");

        return str;
    }
    
    public static Box getReplaceSpecialCharacters(Box box) {
    	Box obox = new Box("");
    	for(Enumeration e = box.keys() ; e.hasMoreElements() ;) {
			String key = (String)e.nextElement();
			if(box.get(key).indexOf("&") >= 0) {
				obox.put(key, getReplaceSpecialCharacters(box.get(key)));
			}
		}
    	return obox;
    }
    
	public static String getHtml(String src) {
		String tmp = src.replaceAll("&amp;", "&");
		tmp = tmp.replaceAll("&lt;", "<");
		tmp = tmp.replaceAll("&gt;", ">");
		tmp = tmp.replaceAll("&quot;", "\"");

		return tmp;
	}

	public static String getXss(String src) {
		String tmp = src.replaceAll("&", "&amp;");
		tmp = tmp.replaceAll("\"", "&#34;");
		tmp = tmp.replaceAll("\'", "&#039;");
		tmp = tmp.replaceAll("\\<", "&lt;");
		tmp = tmp.replaceAll("\\>", "&gt;");
		return tmp;

	}

	public static String getTag(String str) {
		StringTokenizer st = new StringTokenizer(str, " |,|#");
		StringBuffer bu = new StringBuffer();
		int i = 0, j = 0;
		String[] arr = new String[10];
		String[] arrcom = new String[10];
		while (st.hasMoreTokens()) {
			arr[i] = st.nextToken();
			if (arrcom[i].startsWith("#")) {
				bu.append("<a>").append(arrcom[i]).append("</a> ");
			} else {
				bu.append("<a>").append("#").append(arrcom[i]).append("</a> ");
			}
			i++;
		}
		return bu.toString();
	}

	public static ArrayList<String> ArraylistTag(String str) {
		ArrayList<String> myList = new ArrayList<String>();
		String[] sArr = str.split(" ");
		for (String v : sArr) {
			myList.add(v);
		}
		return myList;
	}
	
	public static String replceHtmlToText(String src) {
		String tmp = getHtml(src);
		tmp = tmp.replaceAll("\\<.*?\\>", "");
		return tmp;
	}

	public static String replceHtmlToTextCut(String src, int len) {
		String tmp = replceHtmlToText(src);
		if (tmp.length() > len) {
			tmp = tmp.substring(0, len) + "...";
		}
		return tmp;
	}
	
	public static String getSortClass(String sortKey, String sortOrder) {
		if (sortOrder.split(" ")[0].equals(sortKey)) {
			if (sortOrder.toLowerCase().endsWith("desc")) {
				return "sorting_desc";
			} else {
				return "sorting_asc";
			}
		} else {
			return "sorting";
		}
	}

    /**
     * <pre>
     * String에 comma를 삽입한다.
     * </pre>
     *
     * @param str 숫자로 이루어진 문자열
     * @return String 천단위 comma를 삽입한 문자열
     */
    public static String getComma(String str)
    {
        return getComma(str,true);
    }

    /**
     * <pre>
     * String에 comma를 삽입한다.
     * isTruncated가 false이면 소수점 이하를 자르지 않는다.
     * </pre>
     *
     * @param str 숫자로 이루어진 문자열
     * @param isTruncated true이면 소숫점이하를 자른다.
     * @return String 천단위 comma를 삽입한 문자열
     */
  public static String getComma(String str, boolean isTruncated)
  {
    DecimalFormat commaFormat; // comma 삽입을 위한 변수

    if(str == null)
      return "";
    else if(str.trim().equals(""))
      return "";
    else if(str.trim().equals("&nbsp;"))
      return "&nbsp;";
    else {
      //str에 .이 있으면 Float으로 처리한다.
      int pos = str.indexOf(".");
      if(pos >= 0) {
        if(!isTruncated) {
          String fmt = "#,##0.";
          for(int i=0; i < (str.trim().length() - pos - 1); i++) { fmt += "0"; }
          commaFormat = new DecimalFormat(fmt);
          return commaFormat.format(Float.parseFloat(str.trim()));
        }
        else {
          commaFormat = new DecimalFormat("#,##0");
          return commaFormat.format(Long.parseLong(str.trim().substring(0,pos)));
        }
      }
      else {
        commaFormat = new DecimalFormat("#,##0");
        return commaFormat.format(Long.parseLong(str.trim()));
      }
    }
  }
  
  /**
   * val 문자열을 우편번호 형식으로 변환하여 반환한다. ex)000-000
   * @param val
   * @return
   */
  public static String getZip(String val) {
	  String tmp = val.replaceAll("-","");
	  if (tmp.length() == 6) {
		  tmp = tmp.substring(0,3) + "-" + tmp.substring(3);
	  }
	  return tmp;
  }

  /**
   * val 문자열을 주민등록번호 형식으로 변환하여 반환한다. ex)000000-0000000
   * @param val
   * @return
   */
  public static String getJumin(String val) {
	  String tmp = val.replaceAll("-","");
	  if (tmp.length() > 6) {
		  tmp = tmp.substring(0,6) + "-" + tmp.substring(6);
	  }
	  return tmp;
  }

  /**
   * val 문자열을 전표번호 형식으로 변환하여 반환한다.
   * @param val
   * @return
   */
  public static String getSlip(String val) {
	  String tmp = val.replaceAll("-","");
	  if (tmp.length() > 8) {
		  tmp = tmp.substring(0,8) + "-" + tmp.substring(8);
	  }
	  return tmp;
  }

    /**
     * <pre>
     * Long값에 comma를 삽입한 String을 리턴한다.
     * </pre>
     *
     * @param lstr long형 데이터
     * @return String long값에 천단위 comma를 삽입한 문자열
     */
    public static String getComma(Long lstr)
    {
        DecimalFormat commaFormat; // comma 삽입을 위한 변수
        commaFormat = new DecimalFormat("#,##0");

        if (lstr == null) return "";
        else return commaFormat.format(lstr);
    }

    /**
     * <pre>
     * text를 format에 맞추어 출력한다.
     * getFormatedText("0193372412","???-???-????") --->> 019-337-2412로 출력
     * </pre>
     *
     * @param text    원래 문자열
     * @param format  포맷 문자열
     * @return String 포맷에 맞게 변환된 문자열
     */
    public static String getFormatedText(String text,String format)
    {
      String rtn;
      int start,i,j,len;
      int tCount,fCount;

      tCount = text.length();
      fCount = format.length();

      rtn = "";

      if ("".equals(text)) return rtn;
      if ("&nbsp;".equals(text)) return "&nbsp;";
      // text가 01252412 이고 format 이 ????-???? 이면 0125-2412로 출력
      //text에서 -를 제거한다.
      for (i=0; i<tCount; ++i) {
        if (!text.substring(i,i+1).equals("-"))
          rtn = rtn + text.substring(i,i+1);
      }

      text = rtn;
      tCount = text.length();

      //포멧에서 ?의  count
      len = 0;
      for (j=0; j<fCount; ++j) {
        if (format.substring(j,j+1).equals("?")) ++len;
      }
      //text의 길이가 len보다 작으면 앞에 0를 붙인다.
      if (tCount<len) {
        for (i=0; i<(len-tCount); ++i) {
          text = '0' + text;
        }
        tCount = len;
      }

      rtn = "";
      start = 0;
      for (i=0; i<tCount; ++i) {
        for (j=start; j<fCount; ++j) {
          if (format.substring(j,j+1).equals("?")) {
            rtn = rtn + text.substring(i,i+1);
            start = start + 1;
            break;
          }
          else {
            rtn = rtn + format.substring(j,j+1);
            start = start + 1;
          }
        }
      }
      return rtn+format.substring(start);
    }

    /**
     * <pre>
     * format형태의 String에서 문자만을 추출하여 리턴한다.
     * getFormatedText("019-337-2412","???-???-????") --->> 0193372412로 출력
     * </pre>
     *
     * @param text  원래 문자열
     * @param format 포맷 문자열
     * @return String 원래 문자열에서 포맷에 해당하는 문자만을 추출한 문자열
     */
    public static String getRawText(String text,String format)
    {
      int start,i,j,tCount,fCount;
      String rtn;

      tCount = text.length();
      fCount = format.length();

      rtn = "";
      if ("".equals(text)) return rtn;
      if ("&nbsp;".equals(text)) return "&nbsp;";
      // test가 0125-2412 이고 format 이 ????-???? 이면 01252412로 출력

      start = 0;
      for (i=0; i<tCount; ++i) {
        for (j=start; j<fCount; ++j) {
          if (format.substring(j,j+1).equals("?")) {
            rtn = rtn + text.substring(i,i+1);
            start = start + 1;
            break;
          }
          else {
            start = start + 1;
            break;
          }
        }
      }
      return rtn;
    }


    /**
     * <pre>
     * 주어진 size내에서 0으로 채워진 String을 리턴한다.
     * </pre>
     *
     * @param num 원래 숫자
     * @param size 0을 넣어 만들 문자열의 길이
     * @return String 주어진 size 앞부분에 0을 채운 문자열
     */
    public static String getZeroBaseString(int num,int size)
    {
        return getZeroBaseString(String.valueOf(num),size);
    }

    /**
     * <pre>
     * 주어진 size내에서 0으로 채워진 String을 리턴한다.
     * </pre>
     *
     * @param num 원래 숫자 문자열
     * @param size 0을 넣어 만들 문자열의 길이
     * @return String 주어진 size 앞부분에 0을 채운 문자열
     */
    public static String getZeroBaseString(String num,int size)
    {
      String zeroBase = "";

      if (num.length() >= size)
          return num;

      for(int index=0; index<(size-num.length()); ++index) {
          zeroBase += "0";
      }

      return zeroBase+num;
    }

  /**
   * <pre>
   * 문자열을 getMethod에 맞는 형태로 변환한다.
   * 엔터를 공백으로 하고 공백은 "%20"으로 변환한다.
   * </pre>
   *
   * @param str 원래 문자열
   * @return String 변환된 문자열
   */
  public static String getGetMethodFormat(String str)
  {
    String rtn = "";
    rtn = replace(str, "\n"," ");
    rtn = replace(rtn, " ","%20");
    return rtn;
  }


  /**
   * <pre>
   * str을 size길이에 맞도록 왼쪽에 f_char로 채운다.
   * </pre>
   *
   * @param str 원래 문자열
   * @param f_char 원래 문자열 뒤에 붙일 문자열
   * @param size f_char를 붙여 만들 문자열의 길이
   * @return String 원래 문자열에 f_char를 붙여 만든 문자열
   */
  public static String lpad(String str, String f_char, int size) {
    if(str.length() >= size)
        return str;
    else
        return getFillChar("",f_char,size - str.length()) + str;
  }

  public static String lpadKOR(String str, String f_char, int size) {
	  int strLength = lengthKOR(str);
	  if(strLength >= size)
	      return str;
	  else
	      return getFillChar("",f_char,size - strLength) + str;
  }

  /**
   * <pre>
   * str을 size길이에 맞도록 오른쪽에 f_char로 채운다.
   * </pre>
   *
   * @param str 원래 문자열
   * @param f_char 원래 문자열 뒤에 붙일 문자열
   * @param size f_char를 붙여 만들 문자열의 길이
   * @return String 원래 문자열에 f_char를 붙여 만든 문자열
   */
  public static String rpad(String str, String f_char, int size) {
    if(str.length() >= size)
        return str;
    else
        return str + getFillChar("",f_char,size - str.length());
  }

  public static String rpadKOR(String str, String f_char, int size) {
	  int strLength = lengthKOR(str);
	  if(strLength >= size)
		  return str;
	  else
	      return str + getFillChar("",f_char,size - strLength);
  }

  /**
   * <pre>
   * str을 size길이에 맞도록 뒤에 f_char로 채운다.
   * </pre>
   *
   * @param str 원래 문자열
   * @param f_char 원래 문자열 뒤에 붙일 문자열
   * @param size f_char를 붙여 만들 문자열의 길이
   * @return String 원래 문자열에 f_char를 붙여 만든 문자열
   */
  public static String getFillChar(String str, String f_char, int size) {
   String fillChar = "";

    if (str.length() >= size)
        return str;

    for(int index=0; index<(size-str.length()); ++index) {
        fillChar += f_char;
    }

    return str+fillChar;
  }

    /**
     * <pre>
     * str을 size(Byte)길이에 맞도록 뒤에 f_char로 채운다.
     * str의 길이를 byte로 계산한다.
     * </pre>
     *
     * @param str 원래 문자열
     * @param f_char 원래 문자열 뒤에 붙일 문자열
     * @param size f_char를 붙여 만들 문자열의 길이
     * @return String 원래 문자열에 f_char를 붙여 만든 문자열
     */
  public static String getFillCharByte(String str, String f_char, int size) {
   String fillChar = "";

   if (str.getBytes().length >= size)
     return str;

   for(int index=0; index<(size-str.getBytes().length); ++index) {
     fillChar += f_char;
   }

   return str+fillChar;
 }

  /**
   * <pre>
   * 대상문자열(strTarget)에서 구분문자열(strDelim)을 기준으로 문자열을 분리하여
   * 각 분리된 문자열을 배열에 할당하여 반환한다.
   * </pre>
   *
   * @param strTarget 분리 대상 문자열
   * @param strDelim 구분시킬 문자열로서 결과 문자열에는 포함되지 않는다.
   * @param bContainNull 구분되어진 문자열중 공백문자열의 포함여부.
   *                     true : 포함, false : 포함하지 않음.
   * @return 분리된 문자열을 순서대로 배열에 격납하여 반환한다.
   */
  public static String[] split(String strTarget, String strDelim, boolean bContainNull){
    // StringTokenizer는 구분자가 연속으로 중첩되어 있을 경우 공백 문자열을 반환하지 않음.
    // 따라서 아래와 같이 작성함.
    int index = 0;
    String[] resultStrArray = new String[getStrCnt(strTarget,strDelim)+1];
    String strCheck = new String(strTarget);
    while(strCheck.length() != 0) {
      int begin = strCheck.indexOf(strDelim);
      if(begin == -1) {
        resultStrArray[index] = strCheck;
        break;
      } else {
        int end = begin + strDelim.length();
        if(bContainNull){
          resultStrArray[index++] = strCheck.substring(0, begin);
        }
        strCheck = strCheck.substring(end);
        if(strCheck.length()==0 && bContainNull){
            resultStrArray[index] = strCheck;
            break;
        }
      }
    }
    return resultStrArray;
  }

  /**
   * <pre>
   * strTarget 문자열에서 strSearch문자열이 몇개가 나오는지 찾아 리턴
   * </pre>
   *
   * @param strTarget 찾을 소스 문자열
   * @param strSearch 찾을 문자열
   * @return int 발생한 갯수
   */
  public static int getStrCnt(String strTarget, String strSearch){
    int result=0;
    String strCheck = new String(strTarget);
    for(int i = 0; i < strTarget.length(); ){
      int loc = strCheck.indexOf(strSearch);
      if(loc == -1) {
        break;
      } else {
        result++;
        i = loc + strSearch.length();
        strCheck = strCheck.substring(i);
      }
    }
    return result;
  }

  /**
   * <pre>
   * src문자열에서 맨 첫 글자를 대문자로 만들어 반환한다.
   * </pre>
   *
   * @param src 바꿀문자열
   * @return Strin 바뀐 문자열
   */
  public static String makeFirstUpper(String src){
    if (src != null && src.length() > 0) {
        return src.substring(0,1).toUpperCase() + src.substring(1).toLowerCase();
    } else {
        return "";
    }
  }

    /**
     * <pre>
     * 1차원배열에서 특정 String객체의 존재여부를 확인한다.
     * </pre>
     *
     * @param array 1차원배열
     * @param str   찾을 문자열
     * @param ignorecase true 일경우 대소문자 구별
     * @return boolean 존재하면 true 없으면 false
     */
    public static boolean isExistInArray(String[] array, String str, boolean ignorecase)
    {
        if (array == null) return false;

        for (int i=0; i<array.length; ++i) {
            if (ignorecase) {
                if (array[i].toUpperCase().equals(str.toUpperCase()))
                    return true;
                }
            else {
                if (array[i].equals(str))
                    return true;
            }
        }
        return false;
    }

    /**
     * <pre>
     * 문자열이 숫자인지 검사
     * </pre>
     *
     * @param str  입력한 문자열
     * @return boolean
     */
    public static boolean isNumber(String str) {
    	try {
        	if(str.indexOf(".") > 0) {
        		Double.parseDouble(str);
        	}else {
        		Long.parseLong(str);
        	}
    	}catch(NumberFormatException e) {
    		return false;
    	}
    	return true;
    }
    
    /**
     * <pre>
     * 구분자로 분리된 스트링에서 특정 인덱스의 값을 리턴.
     * </pre>
     *
     * @param arrayStr  구분자로 분리된 스트링
     * @param pos   	특정 인덱스
     * @param dmt 		구분자
     * @return String
     */
    public static String arrayCol(String arrayStr, int pos) {
    	return arrayCol(arrayStr, pos, "|");
    }
    
    public static String arrayCol(String arrayStr, int pos, String dmt) {
    	if("".equals(arrayStr)) { return ""; }
    	String array[] = split(arrayStr+dmt, dmt, true);
    	if(array.length >= pos) { return array[pos-1]; }
    	return "";
    }
    
    /**
     * <pre>
     * String 객체의 substring 메쏘드의 에러방지
     * </pre>
     *
     * @return String
     */
    public static String substr(String str, int sPos, int ePos) {
    	if(sPos > ePos) return "";
    	return str.length() < ePos ? "" : str.substring(sPos, ePos);
    }
    public static String substr(String str, int sPos) {
    	return substr(str, sPos, str.length());
    }
    

    /**
     * <pre>
     * 스트링의 왼쪽공백을 없애준다.
     * </pre>
     *
     * @return String
     */
    public static String ltrim(String str) {
    	int len = str.length();
    	int st = 0;
    	int off = 0;      
    	char[] val = str.toCharArray();    
    
    	while ((st < len) && (val[off + st] <= ' ')) {
    	    st++;
    	}

    	return st > 0 ? str.substring(st) : str;
    }

    /**
     * <pre>
     * 스트링의 오른쪽공백을 없애준다.
     * </pre>
     *
     * @return String
     */
    public static String rtrim(String str) {
    	int len = str.length();
    	int st = 0;
    	int off = 0;      
    	char[] val = str.toCharArray();    
    
    	while ((st < len) && (val[off + len - 1] <= ' ')) {
    	    len--;
    	}
    	return len < str.length() ? str.substring(0,len) : str;
    }
    
    // 주소 파싱
 	public static String addrParsing(String p_addr, int p_index) throws Exception {
 		String v_rtn = "";
 		String v_addr = StringUtil.rtrim(StringUtil.ltrim(p_addr));
 		int v_length = v_addr.length();
 		v_addr = StringUtil.replace(v_addr, "  ", " ");
 		while(true) {
 			if(v_length == v_addr.length()) { break; }
 			v_length = v_addr.length();
 			v_addr = StringUtil.replace(v_addr, "  ", " ");
 		}
 		v_addr = StringUtil.replace(v_addr, "세종특별자치시 ", "세종특별자치시  ");
 		String addr[] = StringUtil.split(v_addr+"   ", " ", true);
 		if(p_index == 1) {
 			v_rtn = addr[0];
 		}else if(p_index == 2) {
 			if(addr[2].endsWith("구") || addr[2].endsWith("군") || addr[2].endsWith("리")) {
 				v_rtn = StringUtil.rtrim(addr[1] + " " + addr[2]);
 			}else {
 				v_rtn = addr[1];
 			}
 		}else if(p_index == 3) {
 			if(addr[2].endsWith("구") || addr[2].endsWith("군") || addr[2].endsWith("리")) {
 				v_rtn = addr[3];
 			}else {
 				v_rtn = addr[2];
 			}
 		}else if(p_index == 4) {
 			if(addr[2].endsWith("구") || addr[2].endsWith("군") || addr[2].endsWith("리")) {
 				for(int i=4; i < addr.length; i++) { 
 					if(!addr[i].equals("")) { v_rtn += addr[i] + " "; }
 				}
 			}else {
 				for(int i=3; i < addr.length; i++) { 
 					if(!addr[i].equals("")) { v_rtn += addr[i] + " "; }
 				}
 			}
 		}
         return StringUtil.rtrim(v_rtn);
 	}

    /**
     * <pre>
     * 테이블 TD WIDTH 출력.
     * </pre>
     *
     * @return String
     */
    public static String colWidth(String[] col) {
    	String cHtml = "<colgroup>";
    	for(int i=0; i < col.length; i++) {
    		if(col[i].equals("")) { break; }
    		cHtml += "\n\t<col style=\"width:"+col[i]+"px;\"/>";
    	}
    	cHtml += "\n</colgroup>";
    	return cHtml;
    }
    public static String colWidth(String params) {
    	String col[] = StringUtil.split(params, ",", true);
    	return colWidth(col);
    }

    /**
     * <pre>
     * 스트링 암호화.
     * </pre>
     * @return String
     * @changed 2002.09.23  정진수
     */
    public static String strEncode(String inputStr) {
		String result = "";
		inputStr = inputStr.trim();

		for(int i=0;i<inputStr.length();i++) {
			int val = (int)inputStr.charAt(i) + i * 29;
			result = result + lpad(String.valueOf(val), "0", 3);
        }
		return result;
    }

    /**
     * <pre>
     * 암호화된 스트링 복호화.
     * </pre>
     * @return String
     * @changed 2002.09.23  정진수
     */
    public static String strDecode(String inputStr) {
		String result = "";
		inputStr = inputStr.trim();

		for(int i=0;i<inputStr.length() / 3;i++) {
			int num = Integer.parseInt(inputStr.substring(i * 3, i * 3 + 3)) - (i * 29);
			result = result + (char)num;
        }
		return result;
    }
	
    // URL 변환
    public static String encodeURL(String theURL) {
  		return replace(replace(theURL,"?","@QUES@"),"&","@AMP@");
    }
    public static String decodeURL(String theURL) {
  		return replace(replace(theURL,"@QUES@","?"),"@AMP@","&");
    }
    
    /**
     * <pre>
     * 주어진 갯수만큼 문자열 반복출력
     * </pre>
     * @return String
     * @changed 2002.09.23  정진수
     */
    public static String strLooping(String input, int count) {
		String result = "";
		for(int i=0;i<count;i++) {
			result = result + input;
        }
		return result;
    }
    
    public static boolean containsCharOnly(String input, String chars) {
		for(int i=0;i<input.length();i++) {
			boolean isOk = false;
			for(int j=0;j<chars.length();j++) {
				if(input.charAt(i) == chars.charAt(j)) {
					isOk = true;
					break;
				}
			}
			if(!isOk) { return false; }
        }
		return true;
    }
    
    public static boolean containsBadChar(String input, String chars) {
		for(int i=0;i<input.length();i++) {
			boolean isOk = false;
			for(int j=0;j<chars.length();j++) {
				if(input.charAt(i) == chars.charAt(j)) {
					isOk = true;
					break;
				}
			}
			if(isOk) { return true; }
        }
		return false;
    }
    
    public static String streamToStr(InputStream in) throws Exception {
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		int bcount = 0;
		byte[] buf = new byte[2048];
		int read_retry_count = 0;
		try {
			while( true ) {
				int n = in.read(buf);
				if ( n > 0 ) { bcount += n; bout.write(buf,0,n); }
				else if (n == -1) break;
			}
			bout.flush();
			return new String(bout.toByteArray());
		} catch (Exception e) {
			return "";
		}
    }
    
    /**
     * <pre>
     * 스트링의 길이 : 한글 2바이트, 영문 1바이트 계산
     * </pre>
     * @return String
     * @changed 2002.09.23  정진수
     */
    public static int lengthKOR(String str) {
    	int lth = 0;
    	char[] string = str.toCharArray();
    	for(int i=0; i<string.length; i++) {
    		if(string[i]>='\uAC00' && string[i]<='\uD7A3') {
    			lth += 2;
    		}else {
    			lth++;
    		}
    	}
    	return lth;
    }
    
    /**
     * <pre>
     * GET 방식의 파라메터를 제한
     * </pre>
     * @return boolean
     * @changed 2015.10.13  정진수
     */
    public static boolean blockParam(String queryStr, String okParam) {
    	if(queryStr!= null && !queryStr.equals("")) {
    		String[] params = split(queryStr, "&", true);
    		for(int i=0; i < params.length; i++) {
    			String[] arr = split(params[i], "=", true);
    			if(arr[0].equals("method")) { continue; }
    			if(okParam.indexOf(arr[0]+",") < 0) {
    				return false;
    			}
    		}
    	}
    	return true;
    }

	public static void main(String[] args) {
		try {
			String telNo = "010-2234-8934";
			System.out.println(StringUtil.arrayCol(telNo, 2, "-"));
		} catch(Exception e) {
			
		}
	}
	
	
}
