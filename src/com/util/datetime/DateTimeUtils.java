package com.util.datetime;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 该类的静态方法提供了对日期对象的系列操作, 包括<br>
 * <ui>
 * <li>格式化日期
 * <li>解析字符串为日期对象
 * <li>计算日期
 * <li>比较日期 </ui>
 * <p>
 * 对于<i>格式化日期</i>和<i>解析字符串为日期对象</i>, 该类提供了如下7种格式: <br>
 * <ui>
 * <li>默认日期格式 <tt>PATTERN_DEFAULT = "yyyy-MM-dd"</tt>
 * <li>路径格式 <tt>PATTERN_DAYPATH = "yyyy\\MM\\dd\\"</tt>
 * <li>日期时间格式(24小时制) <tt>PATTERN_DATETIME = "yyyy-MM-dd HH:mm:ss"</tt>
 * <li>无间隔符的日期时间格式(24小时制) <tt>PATTERN_DATETIME_COMPACT = "yyyyMMddHHmmss"</tt>
 * <li>无间隔符日期格式 <tt>PATTERN_DATE_COMPACT = "yyyyMMdd"</tt>
 * <li>无间隔符日期短格式 <tt>PATTERN_DATESHORT = "yyMMdd"</tt>
 * <li>年月格式 <tt>PATTERN_YEARMONTH = "yyyyMM"</tt> </ui>
 * <b>修改历史</b>
 * </p>
 * <ol>
 * <li>新增获取指定日期下一个月的第一天的方法 getFirstDayOfNextMonth</li>
 * </ol>
 */
public class DateTimeUtils {
	private static final String[] MONTHS_STRING = { "Jan", "Feb", "Mar", "Apr",	"May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

	private static final String UTC_0800 = "UTC 0800 ";

	/**
	 * 默认日期格式, <code>yyyy-MM-dd</code>
	 */
	public static final String PATTERN_DEFAULT = "yyyy-MM-dd";

	/**
	 * 路径格式, <code>yyyy\MM\dd\</code>
	 */
	public static final String PATTERN_DAYPATH = "yyyy\\MM\\dd\\";

	/**
	 * 日期时间格式, <code>yyyy-MM-dd HH:mm:ss</code>, 24小时制
	 */
	public static final String PATTERN_DATETIME = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 无间隔符的日期时间格式, <code>yyyyMMddHHmmss</code>, 24小时制
	 */
	public static final String PATTERN_DATETIME_COMPACT = "yyyyMMddHHmmss";

	/**
	 * 无间隔符日期格式, <code>yyyyMMdd</code>
	 */
	public static final String PATTERN_DATE_COMPACT = "yyyyMMdd";

	/**
	 * 无间隔符日期格式, <code>yyMMdd</code>
	 */
	public static final String PATTERN_DATESHORT = "yyMMdd";

	/**
	 * 年月, <code>yyyyMM</code>
	 */
	public static final String PATTERN_YEARMONTH = "yyyyMM";
	
	/**
	 * 年, <code>yyyy</code>
	 */
	public static final String PATTERN_YEAR = "yyyy";
	
	/**
	 * 月，<code>MM</code>
	 */
	public static final String PATTERN_MONTH="MM";

	/**
	 * <b> 根据默认格式(<code>yyyy-MM-dd</code>),格式化日期 </b>
	 * 
	 * @param date
	 *            日期
	 * @return java.util.Date
	 */
	public static String formatDate(Date date) {
		if (date == null)
			return null;
		return new SimpleDateFormat(PATTERN_DEFAULT).format(date);
	}
	
	/**
	 * <b>根据默认格式(<code>yyyy-MM-dd HH:mm:ss</code>),格式化日期</b>
	 * @param date
	 * @return
	 * @author Whymann 2013-12-25 下午03:17:09
	 */
	public static String formateDate(String dateStr){
		SimpleDateFormat df=new SimpleDateFormat(PATTERN_DATETIME);
		Date date=parseDate(dateStr, PATTERN_DATETIME);
		return formatDate(date, PATTERN_DATETIME);
	}
	

	/**
	 * <b> 根据指定格式,格式化日期 </b>
	 * 
	 * @param date
	 *            日期
	 * @param pattern
	 *            指定格式,参照类中常量定义
	 * @return java.util.Date
	 */
	public static String formatDate(Date date, String pattern) {
		if(null==date){
			return "";
		}
		return new SimpleDateFormat(pattern).format(date);
	}

	/**
	 * <b> 根据指定格式转换字符串为日期 </b> <br>
	 * 
	 * 如果字符串格式不正确,则返回null
	 * 
	 * 
	 * @param dateString
	 *            日期字符串
	 * @param pattern
	 *            指定格式,参照类中常量定义
	 * @return java.util.Date
	 */
	public static Date parseDate(String dateString, String pattern) {
		try {
			return new SimpleDateFormat(pattern).parse(dateString);
		} catch (ParseException pe) {
			return null;
		}
	}

	/**
	 * <b> 将默认格式(<code>yyyy-MM-dd</code>)的日期字符串转换成<code>java.util.Date</code>类型
	 * </b>
	 * 
	 * @param dateString
	 *            日期字符串
	 * @return java.util.Date
	 */
	public static Date parseDate(String dateString) {
		return parseDate(dateString, PATTERN_DEFAULT);
	}

	/**
	 * 将形如
	 * <li>"Thu Dec 6 11:45:13 UTC 0800 2007", 或
	 * <li>"Thu 12 6 11:45:13 UTC 0800 2007", 或
	 * <li>"Thu Dec 6 11:45:13 2007", 或
	 * <li>"Thu 12 6 11:45:13 2007" <br>
	 * 的字符串解析为Date对象
	 * 
	 * @return Date对象，解析失败将返回 null
	 * @since 12/06/07
	 */
	public static Date parseDateUTC(String date) {
		date = date.substring(4);
		date = date.replace(UTC_0800, "");
		for (int i = 0; i < MONTHS_STRING.length; i++) {
			if (date.startsWith(MONTHS_STRING[i])) {
				date = date.replace(MONTHS_STRING[i], String.valueOf(i + 1));
				break;
			}
		}

		try {
			SimpleDateFormat df = new SimpleDateFormat("MM dd HH:mm:ss yyyy");
			return df.parse(date);
		} catch (Exception ex) {
			return null;
		}
	}

	/**
	 * 计算日期
	 * 
	 * @param date
	 *            需要计算的日期
	 * @param timeUnit
	 *            时间单位 (Calendar.HOUR, Calendar.DATE, Calendar.MONTH,
	 *            Calendar.YEAR)
	 * @param amount
	 *            增减数,可以为负数
	 * @author LiuYuan
	 * @return
	 */
	public static Date accountDate(Date date, int timeUnit, int amount) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(timeUnit, amount);
		return c.getTime();
	}
	
	/**
	 * 获取当前日期所在的年份
	 * @return
	 */
	public static int getCurrentYear(){
		String year= formatDate(new Date(), PATTERN_YEAR);
		return Integer.parseInt(year);
	}
	
	/**
	 * 获取当前日期所在的年份
	 * @param date
	 * @return
	 */
	public static int getCurrentYear(Date date){
		String year= formatDate(date, PATTERN_YEAR);
		return Integer.parseInt(year);
	}
	
	/**
	 * 获得当前日期所在的月份
	 * @param date
	 * @return
	 */
	public static int getCurrentMonth(Date date){
		String month= formatDate(date, PATTERN_MONTH);
		return Integer.parseInt(month);
	}
	
	/**
	 * 年份列表
	 * @param date:当前日期
	 * @param adv:在当前日期基础上，提前年份数
	 * @param end:往后截止的年份
	 * @return
	 */
	public static int[] getCurrentDesYear(Date date,int adv, int end) {
		int curYear=getCurrentYear(date)+adv;
		if(curYear-end<0){
			return null;
		}
		int[] yearArray=new int[curYear-end+1];
		for(int i=0;i<curYear-end+1;i++){
			yearArray[i]=curYear-i;
		}
		return yearArray;
	}
	
	/**
	 * 返回一年中的12个月份
	 * @return
	 */
	public static int[] getAllMonth(){
		int[] monthArray=new int[12];
		for(int i=0;i<12;i++){
			monthArray[i]=i+1;
		}
		return monthArray;
	}

	/**
	 * 获取日期所在年份的总天数
	 * 
	 * @param date
	 * @return
	 * @author LiuYuan
	 */
	public static int getDaysOfCurrentYear(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.isLenient() ? 366 : 365;
	}

	/**
	 * 获取日期所在月份的总天数
	 * 
	 * @param date
	 * @return
	 * @throws Exception
	 * @author LiuYuan
	 */
	public static int getDaysOfCurrentMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 计算两个日期相差的单位数,取整值
	 * 
	 * @param date1
	 *            日期1
	 * @param date2
	 *            日期2
	 * @param unit
	 *            时间单位
	 * @return
	 * @throws Exception
	 * @author LiuYuan
	 */
	public static int getDiscrepantUnits(Date date1, Date date2, int timeUnit) {
		if (isSameDate(date1, date2))
			return 0;
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(date1.before(date2) ? date1 : date2);
		c2.setTime(date1.before(date2) ? date2 : date1);
		int count = -1;
		while (c1.before(c2)) {
			c1.add(timeUnit, 1);
			count++;
		}

		return date1.before(date2) ? count : -count;
	}

	/**
	 * 返回两个日期相差的天数
	 * 
	 * @param dateStart
	 * @param dateEnd
	 * @return
	 */
	static public int getDiscrepantDays(Date dateStart, Date dateEnd) {
		return (int) ((dateEnd.getTime() - dateStart.getTime()) / 1000 / 60 / 60 / 24);
	}

	/**
	 * 计算两个日期之间相差多少月 精确到月
	 * 
	 * @param dateStart
	 * @param dateEnd
	 * @return
	 * @throws Exception
	 * @author LiuYuan
	 */
	public static int getDiscrepantMonthI(Date dateStart, Date dateEnd) {
		Calendar calendarEnd = Calendar.getInstance();
		Calendar calendarStart = Calendar.getInstance();
		calendarEnd.setTime(dateEnd);
		calendarStart.setTime(dateStart);
		return ((calendarEnd.get(Calendar.YEAR) - calendarStart
				.get(Calendar.YEAR)) * 12)
				+ (calendarEnd.get(Calendar.MONTH) - calendarStart
						.get(Calendar.MONTH));
	}

	/**
	 * 判断两个日期的大小关系
	 * 
	 * @param d1
	 * @param d2
	 * @return -1 d1在d2之前, 0 d1与d2相等, 1 d1在d2之后
	 * @throws Exception
	 */
	public static int compareDay(Date d1, Date d2) {
		return isSameDay(d1, d2) ? 0 : (d1.before(d2) ? -1 : 1);
	}

	/**
	 * 比较两个日期是否相同
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 * @throws Exception
	 */
	public static boolean isSameDate(Date date1, Date date2) {
		return !(date1.before(date2) || date2.before(date1));
	}

	/**
	 * 比较两个日期是否相同, 只是比较年月日
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 * @throws Exception
	 */
	public static boolean isSameDay(Date date1, Date date2) {
		return formatDate(date1).equals(formatDate(date2));
	}
	
	/**
	 * 比较两个时间段是否有交集
	 * @param start1
	 * @param end1
	 * @param start2
	 * @param end2
	 * @return
	 * @author Whymann 2014-1-4 下午07:07:07
	 */
	public static boolean isDateCoss(Date start1,Date end1,Date start2,Date end2){
		if(start1.getTime()< start2.getTime() && start2.getTime()< end1.getTime()){
			return true;
		}
		if(start1.getTime()< end2.getTime() && start2.getTime()< end1.getTime()){
			return true;
		}
		return false;
	}

	/**
	 * 根据日时间得到当今天开始时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStartOfDay(Date date) {
		return parseDate(formatDate(date, PATTERN_DEFAULT) + " 00:00:00",
				PATTERN_DATETIME);
	}

	/**
	 * 根据日时间得到当今天结束时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date getEndOfDay(Date date) {
		return parseDate(formatDate(date, PATTERN_DEFAULT) + " 23:59:59",
				PATTERN_DATETIME);
	}

	/**
	 * 获取年底的日期
	 * 
	 * @return
	 */
	public static Date getEndOfYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return parseDate(calendar.get(Calendar.YEAR) + "-12-31");// 停止计费时间为年底
	}

	/**
	 * 获取下月底日期
	 * 
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public static Date getEndOfNextMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		calendar.set(Calendar.DAY_OF_MONTH,
				getDaysOfCurrentMonth(parseDate(calendar.get(Calendar.YEAR)
						+ "-" + (calendar.get(Calendar.MONTH) + 1) + "-1")));
		return calendar.getTime();
	}
    
    /**
     * <p>
     * 获取指定日期下一个月的第一天。
     * </p>
     * <p>
     * <b>修改历史(public方法要求填写，填写格式请参照类的修改历史)</b>
     * </p>
     * @param date
     * @return
     */
    public static Date getFirstDayOfNextMonth(Date date) throws Exception{
        Date localDate=date;
        if (localDate == null)
            localDate = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(localDate);
        //当前月的最后一天   
        calendar.set(Calendar.DATE, 1);
        calendar.roll(Calendar.DATE, -1);
        calendar.add(Calendar.DATE, 1);
        Date endTime = calendar.getTime();
        return endTime;
    }
    
    //得到時間差，精確以秒
    public static int   getDayCompareTime(String beDate,String enDate) throws Exception{
    	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	
        Date begin =  df.parse(beDate);
    	Date end = df.parse(enDate);
    	long   between=(end.getTime()-begin.getTime())/1000;//除以1000是为了转换成秒  
    	int   day= (int) (between/(24*3600));  
    	int   hour=(int) (between%(24*3600)/3600);  
    	int   minute=(int) (between%3600/60);  
    	int   second=(int) (between%60/60); 

    	return hour;
    	
    }
    
	/**
	 * <b> 根据默认格式(<code>yyyy-MM-dd</code>),获取当前日期 </b>
	 * 
	 * @param date
	 *            日期
	 * @return java.util.Date
	 */
	public static String getDefaultCurDate() {
		return new SimpleDateFormat(PATTERN_DEFAULT).format(new Date());
	}
	
	/**
	 * <b> 根据默认格式(<code>yyyy-MM-dd HH:mm:ss</code>),获取当前日期 </b>
	 * 
	 * @param date
	 *            日期
	 * @return java.util.Date
	 */
	public static String getDateTime(Date date) {
		return new SimpleDateFormat(PATTERN_DATETIME).format(date);
	}
	
	public static String getSimpleDefaultCurDate() {
		return new SimpleDateFormat(PATTERN_DATE_COMPACT).format(new Date());
	}
	
	
	public static Timestamp getCurTimestamp()
	{
		return new Timestamp(System.currentTimeMillis());
	}
     
}
