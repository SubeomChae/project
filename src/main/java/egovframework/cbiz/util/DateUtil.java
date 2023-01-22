/*******************************************************************/
/* Class Name  : DateUtil          			           */
/* Description : 날짜 시간 관련 utility class                        */
/*******************************************************************/
/* Modification Log	                                           */
/* No  DATE  	    Company     Author 	Description                */
/* 01  2002/06/01   IRAM              Initial Release            */
/*******************************************************************/

package egovframework.cbiz.util;

import java.util.*;

import org.apache.commons.lang3.math.NumberUtils;

import java.text.*;

/**
 * <pre>
 * 날짜 시간 관련 utility class
 * </pre>
 *
 * @author     IRAM
 * @version    1.0
 * @since      2002.01.
 *
 */

public class DateUtil
{
  /**
   * 양력 쉬는 날
   */
  private static final String sunOffDays = "0101,0301,0405,0505,0606,0717,0815,1003,1225";

  /**
   * <pre>
   * Constructor
   * </pre>
   */
  public DateUtil()  {}

  /**
   * <pre>
   * 현재 시스템의 날짜/시간을 xFormat에 맞도록 리턴한다.
   * </pre>
   *
   * @param  xFormat 날짜 format
   * @return format된 날짜
   */
    private static String fmDate(String xFormat) {
        Date currentTime = new Date();
        SimpleDateFormat fmt = new SimpleDateFormat(xFormat);
        return  fmt.format(currentTime);
    }

  /**
   * <pre>
   * 현재 시스템의 날짜/시간을 "yyyy/MM/dd HH:mm:ss S" 형태로 리턴한다
   * </pre>
   *
   * @return format된 Date 문자열
   */
    public String toString()
    {
        return fmDate("yyyy/MM/dd HH:mm:ss S");
    }

  /**
   * <pre>
   * 현재 시스템의 날짜/시간을 xFormat에 맞도록 리턴한다.
   * ex)
   * String dt = DateUtil.toString("yyyy/MM/dd");
   * </pre>
   *
   * @param  xFormat 포맷 문자열
   * @return format된 Date 문자열
   */
    public static String toString(String xFormat)
    {
        return fmDate(xFormat);
    }


  /**
   * <pre>
   * 현재 시스템의 년도(year)를 yyyy형태로 리턴
   * </pre>
   *
   * @return String 년도
   */
    public static String getYear() {
      return fmDate("yyyy");
    }

    public static String nextYear() {
        return nextYear(1);
    }

    public static String nextYear(int year) {
        return String.valueOf(Integer.parseInt(getYear()) + year);
    }

/**
   * <pre>
   * 현재 시스템의 월(month)을 MM형태로 리턴
   * </pre>
   *
   * @return String 월
   */
    public static String getMonth() {
      return fmDate("MM");
    }

  /**
   * <pre>
   * 현재 시스템의 일(day)을 dd형태로 리턴
   * </pre>
   *
   * @return String 날짜
   */
    public static String getDay() {
      return fmDate("dd");
    }

  /**
   * <pre>
   * 현재 시스템의 시간(hour)를 hh형태로 리턴
   * </pre>
   *
   * @return String 현재시간
   */
    public static String getHour() {
      return fmDate("hh");
    }

  /**
   * <pre>
   * 현재 시스템의 분(minute)을 mm형태로 리턴
   * </pre>
   *
   * @return String 현재 분
   */
    public static String getMinute() {
      return fmDate("mm");
    }

  /**
   * <pre>
   * 현재 시스템의 초(second)를 ss형태로 리턴
   * </pre>
   *
   * @return String 현재 초
   */
    public static String getSecond() {
      return fmDate("ss");
    }

    /**
     * <pre>
     * 시스템 날짜를 리턴한다.
     * 20000621182030형태로 리턴 (2000년6월21일 오후 6시 20분 30초)
     * </pre>
     *
     * @return String
     */
    public static String getSysDate()
    {
        String second, minute, hour;
        Calendar cal = Calendar.getInstance();

        String year  = String.valueOf(cal.get(Calendar.YEAR));
        String month = String.valueOf(cal.get(Calendar.MONTH)+1);
        String day   = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));

        if((cal.get(Calendar.MONTH)+1) < 10) month = "0" + String.valueOf((cal.get(Calendar.MONTH)+1));
        else month = String.valueOf((cal.get(Calendar.MONTH)+1));

        if(cal.get(Calendar.DAY_OF_MONTH) < 10) day = "0" + String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
        else day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));

        if(cal.get(Calendar.HOUR_OF_DAY) < 10) hour = "0" + String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
        else hour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));

        if(cal.get(Calendar.MINUTE) < 10) minute = "0" + String.valueOf(cal.get(Calendar.MINUTE));
        else minute = String.valueOf(cal.get(Calendar.MINUTE));

        if(cal.get(Calendar.SECOND) < 10) second = "0" + String.valueOf(cal.get(Calendar.SECOND));
        else second = String.valueOf(cal.get(Calendar.SECOND));

        return year + month + day + hour+ minute + second;
    }

    /**
     * <pre>
     * from , to 날짜 사이의 날짜
     * </pre>
     *
     * @param from 기간 부터
     * @param to   기간 까지
     * @param format 날짜 포맷
     * @return int 날짜 형식이 맞고, 존재하는 날짜일 때 2개 일자 사이의 일자 리턴
     *         -999: 형식이 잘못 되었거나 존재하지 않는 날짜 또는 기간의 역전
     */
    public static int getDaysBetween(String from, String to, String format)
    {
        java.text.SimpleDateFormat formatter =
        new java.text.SimpleDateFormat (format, java.util.Locale.KOREA);
        java.util.Date d1 = null;
        java.util.Date d2 = null;
        try {
            d1 = formatter.parse(from);
            d2 = formatter.parse(to);
        } catch(java.text.ParseException e) {
            return -999;
        }
        if ( !formatter.format(d1).equals(from) ) return -999;
        if ( !formatter.format(d2).equals(to) ) return -999;

        long duration = d2.getTime() - d1.getTime();

        if ( duration < 0 ) return -999;
        return (int)( duration/(1000 * 60 * 60 * 24) );
        // seconds in 1 day
    }

    /**
     * <pre>
     * 해당월의 일자수를 리턴한다.
     * </pre>
     *
     * @param year  년
     * @param month 월
     * @return int  일자수
     */
    public static int getDayCount(int year, int month)
    {
        int day[] = {31,28,31,30,31,30,31,31,30,31,30,31};

        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
            day[1] = 29;
        }
        return day[month-1];
    }

    /**
     * <pre>
     * 윤년인지 판단한다.
     * </pre>
     *
     * @param year 년도
     * @return 윤년 true 아니면 false
     */
    public static boolean isLeafYear(int year)
    {
        if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
          return true;
        } else {
          return false;
        }
    }

    /**
     * <pre>
     * 해당월의 일자수를 리턴한다.
     * </pre>
     *
     * @param year  년
     * @param month 월
     * @return int  일자수
     */
    public static String lastDay(String year, String month)
    {
    	int day = getDayCount(Integer.parseInt(year), Integer.parseInt(month));
        return year + month + String.valueOf(day);
    }

    /**
     * <pre>
     * 날짜가 유효한 날짜인지를 검사한다.
     * "02/30/2000" 형태로 검사
     * </pre>
     *
     * @param date 검사할 날짜
     * @return boolean 유효하면 true 아니면 false
     */
    public static boolean isDate(String date)
    {
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

        format.setLenient(false);
        return format.parse(date,new ParsePosition(0)) == null ? false : true;
    }

    /**
     * <pre>
     * 날짜문자열이 주어진 포맷으로 변환될 수 있는지 검사한다.
     * </pre>
     *
     * @param date 검사할 문자열
     * @param xfmt 날짜 포맷
     * @return 변환가능 true 불가능 false
     */
    public static boolean isDate(String date,String xfmt)
    {
        SimpleDateFormat format = new SimpleDateFormat(xfmt);

        format.setLenient(false);
        return format.parse(date,new ParsePosition(0)) == null ? false : true;
    }

    /**
     * <pre>
     * 요일에 대한 int를 리턴한다.
     * 0=일요일,1=월요일,2=화요일,3=수요일,4=목요일,5=금요일,6=토요일
     * </pre>
     *
     * @param year  년
     * @param month 월
     * @param day   일
     *
     * @return String 요일에 대한 int
     */
    public static int getWeekDay(int year,int month,int day)
    {
        Calendar cal = Calendar.getInstance();
        cal.set(year,month-1,day);

        return cal.get(Calendar.DAY_OF_WEEK) - 1;
    }

    /**
     * <pre>
     * 요일에 대한 이름을 리턴한다.
     * 일,월,화,수,목,금,토
     * </pre>
     *
     * @param year  년
     * @param month 월
     * @param day   일
     *
     * @return String 요일
     */
    public static String getWeekDayNm(int year,int month,int day)
    {
        String weekNm="";
        switch (getWeekDay(year, month, day)) {
          case 0: weekNm = "일";break;
          case 1: weekNm = "월";break;
          case 2: weekNm = "화";break;
          case 3: weekNm = "수";break;
          case 4: weekNm = "목";break;
          case 5: weekNm = "금";break;
          case 6: weekNm = "토";break;
        }
        return weekNm;
    }

    public static String getWeekDayNm(String ymd)
    {
    	return getWeekDayNm(Integer.parseInt(ymd.substring(0,4)), Integer.parseInt(ymd.substring(4,6)), Integer.parseInt(ymd.substring(6,8)));
    }

    /**
     * <pre>
     * 년도,월,날짜에 주어진 날짜를 더한 날짜를 만들어준다.
     * </pre>
     *
     * @param year   년
     * @param month  월
     * @param day    일
     * @param add    더할 날짜(년도,월,일)
     * @param fmt    리턴 포맷
     * @param ymd    더할 필드('Y' : 년도, 'M' : 월, 'D' : 일 )
     * @return String 날짜
     */
    public static String addDate(int year, int month, int day, int add, String fmt, String ymd) {

      Calendar calendar = Calendar.getInstance();
      Date     _date    = null;
      calendar.set(year,month-1,day);

      if (ymd.equals("Y")) {
        // 년도 더하기
        calendar.add(Calendar.YEAR, add);
      } else if (ymd.equals("M")) {
        // 월 더하기
        calendar.add(Calendar.MONTH, add);
      } else {
        // 일 더하기
        calendar.add(Calendar.DATE, add);
      }

      _date = calendar.getTime();
      SimpleDateFormat sfmt = new SimpleDateFormat(fmt);
      return  sfmt.format(_date);
    }

    /**
     * <pre>
     * 년도,월,날짜에 주어진 날짜를 더한 날짜를 만들어준다.
     * </pre>
     *
     * @param date   년월일
     * @param add    더할 날짜(년도,월,일)
     * @param fmt    리턴 포맷
     * @param ymd    더할 필드('Y' : 년도, 'M' : 월, 'D' : 일 )
     * @return String 날짜
     */
    public static String addDate(String date, int add, String fmt, String ymd) {
      int year  = Integer.parseInt(date.substring(0,4));
      int month = Integer.parseInt(date.substring(4,6));
      int day   = Integer.parseInt(date.substring(6,8));

      return addDate(year, month, day, add, fmt, ymd);
    }

    /**
     * <pre>
     * yyyyMMdd 형태의 스트링을 주어진 포맷 형태로 만든다.
     * </pre>
     *
     * @param date 날짜문자열
     * @param fmt  리턴 포맷
     * @return String
     */
    public static String strToDateStr(String date, String fmt) {

      int year  = Integer.parseInt(date.substring(0,4));
      int month = Integer.parseInt(date.substring(4,6));
      int day   = Integer.parseInt(date.substring(6,8));

      Calendar calendar = Calendar.getInstance();
      Date     _date    = null;
      calendar.set(year,month-1,day);

      _date = calendar.getTime();
      SimpleDateFormat sfmt = new SimpleDateFormat(fmt);
      return  sfmt.format(_date);
    }

    /**
     * <pre>
     * yyyyMMdd 또는 yyyyMMddHHmmss 형태로 주어진 스트링을 주어진 Date 형식으로 만든다.
     * </pre>
     *
     * @param date 날짜문자열
     * @return Date
     */
    public static Date strToDate(String date) {
      int year=0, month=0, day=0, hour=0, min=0, sec=0;
      if ( date.length() > 14) {
        year  = Integer.parseInt(date.substring(0,4));
        month = Integer.parseInt(date.substring(4,6));
        day   = Integer.parseInt(date.substring(6,8));
        hour  = Integer.parseInt(date.substring(8,10));
        min  = Integer.parseInt(date.substring(10,12));
        sec  = Integer.parseInt(date.substring(12,14));
      } else if (date.length() == 8) {
        year  = Integer.parseInt(date.substring(0,4));
        month = Integer.parseInt(date.substring(4,6));
        day   = Integer.parseInt(date.substring(6,8));
      }
      Calendar calendar = Calendar.getInstance();
      Date     _date    = null;
      calendar.set(year,month-1,day,hour,min,sec);

      _date = calendar.getTime();
      return _date;
    }

    /**
     * <pre>
     * sqlDate 를 문자열로 변환한다.
     * </pre>
     *
     * @param _date java.sql.Date형태의 날짜
     * @return String 변환된 문자열
     */
    public static String sqlDateToStr(java.sql.Date _date) {
     // _date.toString();
      return _date.toString();
    }

    /**
     * <pre>
     * 인자로 넘어온 년월이 양력에서 쉬틑 날인지 확인한다.
     * </pre>
     *
     * @param month 월
     * @param day   일
     * @return boolean  true : 쉬는날 , false : 쉬지 않는 날
     */
    public static boolean isSunOffDay(String month, String day) {
      String month_day = month + day;
      if (sunOffDays.indexOf(month_day) >= 0) {
        return true;
      } else {
        return false;
      }
    }

    /**
     * <pre>
     * 인자로 넘어온 년월이 양력에서 쉬틑 날인지 확인한다.
     * </pre>
     *
     * @param month 월
     * @param day   일
     * @return boolean  true : 쉬는날 , false : 쉬지 않는 날
     */
    public static boolean isSunOffDay(int month, int day) {
      String sMonth = StringUtil.getZeroBaseString(month,2);
      String sDay   = StringUtil.getZeroBaseString(day,2);
      return isSunOffDay(sMonth, sDay);
    }

    /**
     * <pre>
     * 인자로 넘어온 년월이 쉬는 날인지 확인한다.
     * 음력 쉬는 날 확인 구현 안되어 있음
     * </pre>
     *
     * @param month 월
     * @param day   일
     *
     * @return boolean  true : 쉬는날 , false : 쉬지 않는 날
     */
    public static boolean isOffDay(int month, int day) {
      String sMonth = StringUtil.getZeroBaseString(month,2);
      String sDay   = StringUtil.getZeroBaseString(day,2);
      return isSunOffDay(sMonth, sDay);
    }

    /**
     * <pre>
     * 인자로 넘어온 년월이 쉬는 날인지 확인한다.
     * 음력 쉬는 날 확인 구현 안되어 있음
     * </pre>
     *
     * @param month 월
     * @param day   일
     * @return boolean  true : 쉬는날 , false : 쉬지 않는 날
     */
    public static boolean isOffDay(String month, String day) {
      if (month.length() == 1) month = "0" + month;
      if (day.length()   == 1) day = "0" + day;
      return isSunOffDay(month, day);
    }

  /**
   * <pre>
   * 날짜 차이를 int로 반환(검증 필요)
   * </pre>
   *
   * @param from 날짜 부터
   * @param to   날짜 까지
   * @return int 차이
   */
    public static int dayDiff(String from, String to) throws Exception {
  	  try {
  	    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
  	    Date beginDate = formatter.parse(from.substring(0,8));
  	    Date endDate = formatter.parse(to.substring(0,8));
  	    long diff = endDate.getTime() - beginDate.getTime();
  	    long diffDays = diff / (24 * 60 * 60 * 1000);
  	    return new Long(diffDays).intValue();
  	  } catch (Exception e) {
  		return -9999;
  	  }

    } // dayDiff

  /**
   * <pre>
   * 날짜 차이를 int로 반환(년도만 구현)
   * </pre>
   *
   * @param from 날짜 부터
   * @param to   날짜 까지
   * @param ymd  차이를 리턴할 구분자 "Y" 년 "M"월 "D" 일
   * @return int 차이
   */
  public static int dateDiff(String from, String to, String ymd) {
    if (ymd.equals("Y") && from.length() == 8 && to.length() == 8) {
        int f_year = Integer.parseInt(from.substring(0,4));
        int t_year = Integer.parseInt(to.substring(0,4));     
        int f_md   = Integer.parseInt(from.substring(4));           
        int t_md   = Integer.parseInt(to.substring(4));
        int diff = t_year - f_year;
        
        if ( f_md > t_md) {
            --diff;
        } 
        return diff;
    } else {
        return -1;   
    }
  }

  /**
   * <pre>
   * sql날짜로 바꾸어서 리턴
   * </pre>
   *
   * @param inDate 변환할 date
   * @return java.sql.Date
   */
  public static final java.sql.Date toSQLDate(java.util.Date inDate) {
    // This method returns a sql.Date version of the util.Date arg.
    // new java.sql.Date(java.util.Calendar.getInstance().getTime().getTime())
    return new java.sql.Date(inDate.getTime());
  }

  /**
   * <pre>
   * 날짜 문자열을 받아들여 기본 날짜 형태(yyyy-MM-dd)로 만든다.
   * </pre>
   *
   * @param  xFormat 날짜 format
   * @return format된 날짜
   */
  public static String defFmtDate(String inDate) {
	  return defFmtDate(inDate,"-");
  }

  public static String defFmtDate(String inDate, String dmt) {
      inDate = inDate.replaceAll("-", "");
	  inDate = convertDate(inDate);
	  
      if (inDate.length() >= 8) {
          return inDate.substring(0,4) + dmt
               + inDate.substring(4,6) + dmt
               + inDate.substring(6,8);
      } else if (inDate.length() >= 6) {
          return inDate.substring(0,4) + dmt
               + inDate.substring(4,6);
      } else if (inDate.length() >= 4) {
          return inDate.substring(0,4);
      } else {
          return inDate;
      }
  }
  
  /**
   * 문자 날짜타입 변환처리
   * @param inDate
   * @return
   */
  public static String convertDate(String inDate) {
	  if (inDate.length() > 0 && NumberUtils.isNumber(inDate.substring(0,1)) == false) {
  		  // 영문 날짜의 변환
  		  try {
  			  DateFormat format = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
  			  Date date = format.parse(inDate);
  			  format = new SimpleDateFormat("yyyyMMddHHmmss");
  			  inDate = format.format(date);
  		  } catch (Exception ex) {
  			  ex.printStackTrace();
  		  }
  	  }
	  return inDate;
  }

  /**
   * <pre>
   * 날짜 문자열을 받아들여 기본 날짜 형태(yyyy-MM-dd HH:mm:ss)로 만든다.
   * </pre>
   *
   * @param  xFormat 날짜 format
   * @return format된 날짜
   */
    public static String defFmtDateTime(String inDate) {
    	
    	inDate = convertDate(inDate);
    	
        if (inDate.length() >= 14) {
            return inDate.substring(0,4) + "-"
                 + inDate.substring(4,6) + "-"
                 + inDate.substring(6,8) + " "
                 + inDate.substring(8,10) + ":"
                 + inDate.substring(10,12) + ":"
                 + inDate.substring(12,14);
        } else if (inDate.length() >= 12) {
                return inDate.substring(0,4) + "-"
                     + inDate.substring(4,6) + "-"
                     + inDate.substring(6,8) + " "
                     + inDate.substring(8,10) + ":"
                     + inDate.substring(10,12);
        } else if (inDate.length() >= 8) {
            return inDate.substring(0,4) + "-"
                 + inDate.substring(4,6) + "-"
                 + inDate.substring(6,8);
        } else {
            return inDate;
        }
    }

  /**
   * <pre>
   * 날짜 문자열을 받아들여 시설안전기술 공단의 기본 날짜 형태로 만든다.
   * </pre>
   *
   * @param  xFormat 날짜 format
   * @return format된 날짜
   */
    public static String defFmtDate2(String inDate) {
    	inDate = convertDate(inDate);
    	
        if (inDate.length() >= 8) {
            return inDate.substring(0,4) + "년 "
                 + inDate.substring(4,6) + "월 "
                 + inDate.substring(6,8) + "일";
        } else if (inDate.length() == 6) {
            return inDate.substring(0,4) + "년 "
                 + inDate.substring(4,6) + "월";
        } else if (inDate.length() == 4) {
            return inDate.substring(0,4) + "년";
        } else {
            return inDate;
        }
    }

  /**
   * <pre>
   * 날짜 문자열을 받아들여 시설안전기술 공단의 기본 날짜 형태로 만든다.
   * </pre>
   *
   * @param  xFormat 날짜 format
   * @return format된 날짜
   */
    public static String defFmtDateTime2(String inDate) {
    	inDate = convertDate(inDate);
    	
        if (inDate.length() >= 14) {
            return inDate.substring(0,4) + "년 "
                 + inDate.substring(4,6) + "월 "
                 + inDate.substring(6,8) + "일 "
                 + inDate.substring(8,10) + "시 "
                 + inDate.substring(10,12) + "분 "
                 + inDate.substring(12,14) + "초";
        } else if (inDate.length() >= 12) {
                return inDate.substring(0,4) + "년 "
                     + inDate.substring(4,6) + "월 "
                     + inDate.substring(6,8) + "일 "
                     + inDate.substring(8,10) + "시 "
                     + inDate.substring(10,12) + "분 ";
        } else {
            return inDate;
        }
    }

	/**
	 * <pre>
	 * 날짜 문자열을 받아들여 기본 날짜 형태(yyyy-MM-dd 오전오후 HH:mm)로 만든다.
	 * </pre>
	 *
	 * @param  inDate 포맷할 날짜
	 * @return String format된 날짜
	 */
	  public static String defFmtDateTimeAPM(String inDate) {
		  inDate = convertDate(inDate);
		  
	      if (inDate.length() >= 14) {
	          return inDate.substring(0,4) + "-"
	               + inDate.substring(4,6) + "-"
	               + inDate.substring(6,8) + " "
	               + getAmPm(inDate.substring(8,10)) + ":"
	               + inDate.substring(10,12);
	      } else if (inDate.length() >= 12) {
	              return inDate.substring(0,4) + "-"
	                   + inDate.substring(4,6) + "-"
	                   + inDate.substring(6,8) + " "
	                   + getAmPm(inDate.substring(8,10)) + ":"
	                   + inDate.substring(10,12);
	      } else if (inDate.length() >= 8) {
	          return inDate.substring(0,4) + "-"
	               + inDate.substring(4,6) + "-"
	               + inDate.substring(6,8);
	      } else {
	          return inDate;
	      }
	  }    
	
	  /**
	   * 날짜 문자열을 받아들여 기본 날짜 형태(yyyyMMdd)로 만든다.
	   * @param  inDate 포맷할 날짜
	   * @return String format된 날짜
	   */
	  public static String fmsYmd(String inDate) {
		  if (inDate.length() == 4) {
			  return inDate + "0101";
		  } else if (inDate.length() == 6) {
			  return inDate + "01";
		  } else {
			  return inDate;
		  }
	  }    
			
	  /**
	   * 해당 시간이 오전인지 오후인지 조회
	   * @param hour 시간
	   * @return String 오전, 오후
	   */
	  public static String getAmPm(String hour) {
	  	if (hour == null ) {
	  		return "";
	  	} else if (hour == "") {
	  		return "";
	  	} else {
	  		if (Integer.parseInt(hour) <= 12 ) {
	  			return "오전 " + hour;
	  		} else { return "오후 " + StringUtil.lpad(String.valueOf((Integer.parseInt(hour) - 12)),"0",2) ;}
	  	}
	  }
	  
	public static String getYearOptionTag(String defYear, String from, String to, String order, String postFix) {
		String optionStr = "";
		String selected = "";
		int ifrom = Integer.parseInt(from);
		int ito   = Integer.parseInt(to);
		int idefYear = Integer.parseInt(FormatUtil.nvl2(defYear,"0"));
		if (order.equals("asc")) {
			for (int i= ifrom; i <= ito; i++) {
				selected = i == idefYear ? "selected" : "";
				optionStr += "\n <option value='"+i+"' "+selected+">"+i+postFix+"</option>";
			}
		} else {
			for (int i= ito; i >= ifrom; i--) {
				selected = i == idefYear ? "selected" : "";
				optionStr += "\n <option value='"+i+"' "+selected+">"+i+postFix+"</option>";
			}
		}
		return optionStr;
		
	}  
	  
	public static String getYearOptionTag(String defYear, String from, String to, String order) {
		return getYearOptionTag(defYear, from, to, order, "");
	}  
	  
    public static String getYearOptionTag(String defYear, String from, String to) {
		return getYearOptionTag(defYear, from, to, "desc");
    }
    
    public static String getMonthOptionTag(String defMon, String postFix) {
    	String optionStr = "";
		String selected = "";
    	for (int i= 1; i < 13; i++) {
			String mon = StringUtil.lpad(String.valueOf(i), "0", 2);
			selected = mon.equals(defMon) ? "selected" : "";
			optionStr += "\n <option value='"+mon+"' "+selected+">"+mon+postFix+"</option>";
    	}
    	return optionStr;
    }
    
    public static String getMonthOptionTag(String defMon) {
    	return getMonthOptionTag(defMon, "");
    }
    
	public static String getDayOptionTag(String defDay, String postFix) {
		String optionStr = "";
		String selected = "";
		int idefDay = Integer.parseInt(FormatUtil.nvl2(defDay,"0"));
		for (int i= 1; i < 32; i++) {
			selected = i == idefDay ? "selected" : "";
			String day = StringUtil.lpad(String.valueOf(i), "0", 2);
			optionStr += "\n <option value='"+day+"' "+selected+">"+day+postFix+"</option>";
		}
		return optionStr;
	}

	public static String getDayOptionTag(String defDay) {
    	return getDayOptionTag(defDay, "");
	}
	    
	public static String getHourOptionTag(String defHour, int fromHour, int toHour, String postFix) {
		String optionStr = "";
		String selected = "";
		int idefHour = Integer.parseInt(FormatUtil.nvl2(defHour,"0"));
		for (int i=fromHour; i <= toHour; i++) {
			selected = i == idefHour ? "selected" : "";
			String hour = StringUtil.lpad(String.valueOf(i), "0", 2);
			optionStr += "\n <option value='"+hour+"' "+selected+">"+hour+postFix+"</option>";
		}
		return optionStr;
	}

	public static String getHourOptionTag(String defHour) {
		return getHourOptionTag(defHour, 0, 23, "");
	}

	public static String getMinOptionTag(String defMin, int fromMin, int toMin, String postFix) {
		String optionStr = "";
		String selected = "";
		int idefMin = Integer.parseInt(FormatUtil.nvl2(defMin,"0"));
		for (int i=fromMin; i <= toMin; i++) {
			selected = i == idefMin ? "selected" : "";
			String min = StringUtil.lpad(String.valueOf(i), "0", 2);
			optionStr += "\n <option value='"+min+"' "+selected+">"+min+postFix+"</option>";
		}
		return optionStr;
	}

	public static String getMinOptionTag(String defMin) {
		return getMinOptionTag(defMin, 0, 59, "");
	}

}

