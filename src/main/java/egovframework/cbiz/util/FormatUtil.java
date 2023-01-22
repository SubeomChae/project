/*******************************************************************/
/* Class Name  : FormatUtil          			           */
/* Description : 출력형태 포맷 관련 Class                             */
/*******************************************************************/
/* Modification Log	                                           */
/* No  DATE  	    Company     Author 	Description                */
/* 01  2002/06/01   IRAM              Initial Release            */
/*******************************************************************/

package egovframework.cbiz.util;

/**
 * <pre>
 * 출력형태 포맷 관련 Class
 * </pre>
 *
 * @author     IRAM
 * @version    1.0
 * @since      2002.01.
 */
 
public class FormatUtil
{
  /**
   * <pre>
   * 10글자로 넘어온 사업자 등록 번호에 "-"를 붙여준다
   * 예) "1234567890" -> "123-45-67890"
   * </pre>
   *
   * @param  bizRegiNo 사업자등록번호
   * @return java.lang.String
   */
    public static String bizRegiNoFormat(String bizRegiNo)
    {
        String b = bizRegiNo;

        if (b.length() != 10)
            return b;
        else
            return b.substring(0,3) + "-" + b.substring(3,5) + "-" + b.substring(5,10);
    }

  /**
   * <pre>
   * source의 값이 null일경우 target값을 리턴하고 아닐경우 source값을 리턴한다.
   * </pre>
   *
   * @param  source null인지 판단할 문자열
   * @param  target null일경우 반환할 문자열
   * @return java.lang.String
   */
	public static String nvl(String source, String target) {
		if (source == null || source.trim().equals("")) {
			return target;
		} else {
			return source;
		}
	}

  /**
   * <pre>
   * source의 값이 null 또는 "" 일경우 target값을 리턴하고 아닐경우 source값을 리턴한다.
   * </pre>
   *
   * @param  source null 또는 "" 인지 판단할 문자열
   * @param  target null 또는 "" 일경우 반환할 문자열
   * @return java.lang.String
   */
    public static String nvl2(String source, String target)
    {
        return ( source == null || source.equals("") )? target: source;
    }

  /**
   * <pre>
   * source의 값이 null 또는 trim하여 "" 일경우 target값을 리턴하고 아닐경우 source값을 리턴한다.
   * </pre>
   *
   * @param  source null 또는 "" 인지 판단할 문자열
   * @param  target null 또는 "" 일경우 반환할 문자열
   * @return java.lang.String
   */
    public static String nvl3(String source, String target)
    {
        return ( source == null || source.trim().equals("") )? target: source;
    }

  /**
   * <pre>
   * substring을 할 수 있을 경우 substring 한 결과
   * substring을 할 수 없을 경우 target 리턴
   * </pre>
   *
   * @param  source 원문자열
   * @param  from   substring 시작
   * @param  to     substring 끝
   * @param  target substring 할 수 없을 경우 target 리턴
   * @return java.lang.String
   */
    public static String nvlSubstr(String source, int from, int to, String target)
    {
        try {
            return source.substring(from,to);
        } catch(Exception e) {
            return target;
        }
    }


  /**
   * <pre>
   * source의 양쪽 끝에 '를 붙여준다
   * 예) abcdef  -> 'abcdef'
   * </pre>
   *
   * @param  source 양쪽에 ''를 붙일 문자열
   * @return java.lang.String
   */
    public static String makeQuot(String source)
    {
        return "'" + nvl2(source,"") + "'";
    }

   /**
   * <pre>
   * 주민등록 번호를 포맷에 맞추어 리턴한다.
   * 예) '1234561234567' -> '123456-1234567'
   * 13자리가 아닐경우 그냥 반환
   * </pre>
   *
   * @param  juminno 주민등록번호
   * @return java.lang.String
   */
    public static String juminNo(String juminno) {
        int juminno_len = juminno.length();
        String retValue = "";

        if (juminno_len == 13) {
            retValue = juminno.substring(0, 6) + "-" + juminno.substring(6, 13);
        } else {
            retValue = juminno;
        }

        return retValue;
    }

    public static String juminNo(String juminno, String x) {
        int juminno_len = juminno.length();
        String retValue = "";

        if (juminno_len == 13) {
            retValue = juminno.substring(0, 6) + "-" + juminno.substring(6, 7) + "xxxxxx";
        } else {
            retValue = juminno;
        }

        return retValue;
    }

    public static String msgNo(String msg_no) {
        int msg_no_len = msg_no.length();
        String retValue = "";

        if (msg_no_len == 12) {
            retValue = msg_no.substring(0, 8) + "-" + msg_no.substring(8);
        } else {
            retValue = msg_no;
        }

        return retValue;
    }

    public static String[] dateArr(String datestr) {
        String[] tmp = {"","",""};
        if ( datestr != null && datestr.length() == 8) {
            tmp[0] = datestr.substring(0,4);
            tmp[1] = datestr.substring(4,6);
            tmp[2] = datestr.substring(6,8);
        }
        return tmp;
    }

    public static String[] zipArr(String zipstr) {
        String[] tmp = {"",""};
        if ( zipstr != null && zipstr.length() == 6) {
            tmp[0] = zipstr.substring(0,3);
            tmp[1] = zipstr.substring(3,6);
        }
        return tmp;
    }

  /**
   * <pre>
   * 입렫된 숫자를 휴대전화 포맷에 맞게 리턴한다.
   * </pre>
   *
   * @param  pNumber 휴대전화번호
   * @return java.lang.String
   */
    public static Object pcsFormat(String pNumber) {
        String pcsNumber = StringUtil.replace(pNumber.trim(), "-", "");
        String retValue = "";
        int len = pcsNumber.length();

        if (len >= 10) {
            retValue = pcsNumber.substring(0, 3) + "-" + pcsNumber.substring(3, len-4) + "-" + pcsNumber.substring(len-4);
        } else {
            retValue = pcsNumber;
        }

        return retValue;
    }


  /**
   * <pre>
   * 입력된 스트링에 1000 단위 컴마를 삽입하여 리턴한다.
   * 예) 10000000 -> 10,000,000
   * </pre>
   *
   * @param  inputStr 숫자 문자열
   * @return java.lang.String
   */
    public static String insertComma(String inputStr) {
        String tmpStr = inputStr;
        String underComma = "";
        
        if (inputStr.indexOf(".") >=0) {
            // 소숫점 아래는 자른다.
            tmpStr = inputStr.substring(0,tmpStr.indexOf("."));
            underComma = "."+inputStr.substring(inputStr.indexOf(".")+1);
        } 
           
        
        int len = tmpStr.length();
        String resultValue = "";
        String sign = "";
        if (inputStr.startsWith("-")) {
           sign = "-";
           len = len -1;
           tmpStr = tmpStr.substring(1);
        }

        for (int i=0 ; i<len ; i++) {
            if (i > 0  && (i % 3) == 0 )
                resultValue = "," + resultValue;

            resultValue = tmpStr.charAt(len - 1 - i) + resultValue;
        }
       return sign+resultValue+underComma;
    }

    /**
     * <pre>
     * 
     * </pre>
     *
     * @param  inputStr 숫자 문자열
     * @return java.lang.String
     */
      public static String dotPadding(String inputStr, int size) {
    	  if (inputStr.indexOf(".") >=0) {
    		  String beforeComma = inputStr.substring(0,inputStr.indexOf("."));
              String underComma = inputStr.substring(inputStr.indexOf(".")+1);
              return beforeComma + "." + StringUtil.rpad(underComma,"0",size);
    	  } else {
    		 return inputStr + ".00"; 
    	  }
      }
      
  /**
   * <pre>
   * 입력된 스트링에 1000 단위 컴마를 삽입하여 리턴한다.
   * 만약 resultValue가 0일경우 resultValue는 공백으로 처리
   * 예) 10000000 -> 10,000,000
   * </pre>
   *
   * @param  inputStr 숫자 문자열
   * @return java.lang.String
   */
    public static String insertComma2(String inputStr) {
        String resultValue = insertComma(inputStr);
        resultValue = "0".equals(resultValue) ? "":resultValue;
       return resultValue;
    }

  /**
   * <pre>
   * source의 길이가 length만큼 될 때 까지 source 앞에 0을 붙여 리턴한다.
   * 예) fillZero('123',5) ==> '00123'
   * </pre>
   *
   * @param source 앞에 0을 붙일 문자열
   * @param length 0을 붙여 만들 문자열의 전체 길이
   * @return java.lang.String
   */
    public static String fillZero(String source, int length){
      if(source == null) return "";

      if(source.length() >= length) return source;

      while(source.length() < length)
        source = "0" + source;

      return source;
    }

  /**
   * <pre>
   * 0을 빈공간으로
   * 예) zeroToEmpty("0") = ""
   * </pre>
   *
   * @param  value 문자열
   * @return java.lang.String
   */
  public static String zeroToEmpty(String value) {
    return "0".equals(value) ? "":value;
  }

  /**
   * <pre>
   * 빈공간을 0으로
   * 예) emptyToZero("") = 0
   * </pre>
   *
   * @param  value 문자열
   * @return java.lang.String
   */
  public static String emptyToZero(String value) {
    return "".equals(value) ? "0":value;
  }

  /**
   * <pre>
   * src1과 src2가 같으면target1을 반환하고 틀리면 target2를 반환
   * </pre>
   *
   * @param  src1    비교문자열1
   * @param  src2    비교문자열2
   * @param  target1 반환값1
   * @param  target2 반환값2
   * @return java.lang.String
   */
  public static String iifEQ(String src1, String src2, String target1, String target2) {
    try {
        return src1.equals(src2) ? target1 : target2;
    } catch (Exception e) {
        return target2;
    }
  }
  
  public static String makeFileSizeStr(String size, String color_yn) {
	  	String tmp = "";
	  	long lsize = Long.parseLong(size);
	  	if ("N".equals(color_yn)) {
		  	if (lsize > 1024*1024*1024) { tmp = insertComma(String.valueOf((lsize/1024/1024/10) / 100.0)) + "GB"; }
		  	else if (lsize > 1024*1024) { tmp = insertComma(String.valueOf((lsize/1024/10)  / 100.0)) + "MB"; }
		  	else if (lsize > 1024)      { tmp = insertComma(String.valueOf((lsize/10)  / 100.0)) + "KB"; }
		  	else { tmp = size + "B";}
	  	} else {
		  	if (lsize > 1024*1024*1024) { tmp = insertComma(String.valueOf((lsize/1024/1024/10) / 100.0)) + "<font color='red'>GB</font>"; }
		  	else if (lsize > 1024*1024) { tmp = insertComma(String.valueOf((lsize/1024/10)  / 100.0)) + "<font color='orange'>MB</font>"; }
		  	else if (lsize > 1024)      { tmp = insertComma(String.valueOf((lsize/10)  / 100.0)) + "<font color='blue'>KB</font>"; }
		  	else { tmp = size + "B";}
	  	}
	  	return tmp;
  }  

  public static String getPercent(int value1, int value2, int cutPoint) {
		String rtn = "";
		if(value1 == 0 && value2 == 0) {
			rtn = "";
		}else if(value1 == 0) {
			rtn = cutPoint > 0 ? "0." : "0";
			for(int i=0; i < cutPoint; i++) { rtn += "0"; }
		}else if(value1 == value2) {
			rtn = cutPoint > 0 ? "100." : "100";
			for(int i=0; i < cutPoint; i++) { rtn += "0"; }
		}else {
			rtn = String.valueOf(value1 * 100.0 / value2);
			if(rtn.indexOf(".") > 0) { rtn += "00000"; }
			else { rtn += ".00000"; }
			rtn = rtn.substring(0,rtn.indexOf(".") + cutPoint + 1);
		}
		return rtn;
  }
  
  public static String getPercent(long value1, long value2, int cutPoint) {
		String rtn = "";
		if(value1 == 0 && value2 == 0) {
			rtn = "";
		}else if(value2 == 0) {
			rtn = "N/A";
		}else if(value1 == 0) {
			rtn = cutPoint > 0 ? "0." : "0";
			for(int i=0; i < cutPoint; i++) { rtn += "0"; }
		}else if(value1 == value2) {
			rtn = cutPoint > 0 ? "100." : "100";
			for(int i=0; i < cutPoint; i++) { rtn += "0"; }
		}else {
			rtn = String.valueOf(value1 * 100.0 / value2);
			if(rtn.indexOf(".") > 0) { rtn += "00000"; }
			else { rtn += ".00000"; }
			rtn = rtn.substring(0,rtn.indexOf(".") + cutPoint + 1);
		}
		return rtn;
  }
  
  public static String brEvalSpan(String span_no) {
	  if(span_no.length() < 4) { return ""; }
	  String object_no = span_no.substring(0,4);
	  if(object_no.equals("A001")) { object_no = "S001"; }
	  else if(object_no.startsWith("P")) { object_no = "S" + StringUtil.lpad(String.valueOf(Integer.parseInt(object_no.substring(2))+1),"0",3); }
	  
	  return object_no;
  }

}