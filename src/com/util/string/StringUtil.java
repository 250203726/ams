package com.util.string;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符验证工具包
 * @author Wymann
 * @Date 2013-12-23 下午12:41:09
 *
 */
public class StringUtil {
	
	/**
	 * 
	 * @param list
	 * @param mark
	 * @return
	 * @author Whymann 2014-1-16 下午04:03:42
	 */
	public static String addSplit(List<String> list,String mark){
		String str="";
		if(list.size()>0){
			if(""==mark && mark.length()<=0){
				mark=",";
			}
			for(int i=0;i<list.size();i++){
				str+=list.get(i).toString();
				if(i!=list.size()-1){
					str+=mark;
				}
			}
		}
		return str;
	}
	
	/**
	 * 填充字符
	 * @param oriC  原始字符
	 * @param size  总长度
	 * @return
	 */
	public static String fillCharacter(String oriC,int size){
		String res = "";
		String fillC="0";
		if(oriC != null){
			int oriCLen = oriC.length();
			for(int i = size - oriCLen;i>0;i--){
				res += fillC;
			}
		}
		res += oriC;
		return res;
	}
	
	
	/**
	 * 过滤特殊字符 
	 * @param str
	 * @return
	 * @author Whymann 2013-12-23 下午12:54:34
	 */
    public static String filter(String   str){
        String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";  
        Pattern   p   =   Pattern.compile(regEx);     
        Matcher   m   =   p.matcher(str);     
        // 清除掉所有特殊字符  
        return   m.replaceAll("").trim(); 
    }    

	/**
     * 判断输入字符是否为有效汉字
     * @param str 字符
     * @return 是否合法汉字
     */
    public static boolean isValidHan(String str) {
        String regex = "[\u4e00-\u9fa5]*";

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(str); 
        
        return matcher.matches();
    }
    
    /**
     * @param 日期验证，验证的格式有："yyyyMM","yyyyMMdd","yyyyMMdd HH:mm:ss",
     *                               "yyyy-MM","yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"
     *                               "yyyy.MM","yyyy.MM.dd","yyyy.MM.dd HH:mm:ss"
     *                            "yyyy/MM","yyyy/MM/dd","yyyy/MM/dd HH:mm:ss"
     *                            "yyyy_MM","yyyy_MM_dd","yyyy_MM_dd HH:mm:ss"
     * @param str
     * @return false/true
     */
    public static boolean isValidDate(String str) {
        if(null == str || "".equals(str)){
            return false;
        }

        Pattern pattern = null;
        Matcher matcher = null;

        String regex = "(" +
                      //第一种情况为月份是大月的有31天。
                      "(^\\d{3}[1-9]|\\d{2}[1-9]\\d{1}|\\d{1}[1-9]\\d{2}|[1-9]\\d{3}" +//年
                      "([-/\\._]?)" +//时间间隔符(-,/,.,_)
                      "(10|12|0?[13578])" +//大月
                      "([-/\\._]?)" +//时间间隔符(-,/,.,_)
                      "((3[01]|[12][0-9]|0?[1-9])?)" +//日(31)要验证年月因此出现0/1次
                      "([\\s]?)" +//空格
                      "((([0-1]?[0-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9]))?))$" +//时分秒
                      "|" +//或
                      //第二种情况为月份是小月的有30天，不包含2月。
                      "(^\\d{3}[1-9]|\\d{2}[1-9]\\d{1}|\\d{1}[1-9]\\d{2}|[1-9]\\d{3}" +//年
                      "([-/\\._]?)" +//时间间隔符(-,/,.,_)
                      "(11|0?[469])" +//小月不含2月
                      "([-/\\._]?)" +//时间间隔符(-,/,.,_)
                      "(30|[12][0-9]|0?[1-9])" +//日(30)
                      "([\\s]?)" +//空格
                      "((([0-1]?[0-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9]))?))$" +//时分秒
                      "|" +//或
                      //第三种情况为平年月份是2月28天的。
                      "(^\\d{3}[1-9]|\\d{2}[1-9]\\d{1}|\\d{1}[1-9]\\d{2}|[1-9]\\d{3}" +//年
                      "([-/\\._]?)" +//时间间隔符(-,/,.,_)
                      "(0?2)" +//平年2月
                      "([-/\\._]?)" +//时间间隔符(-,/,.,_)
                      "(2[0-8]|1[0-9]|0?[1-9])" +//日(28)
                      "([\\s]?)" +//空格
                      "((([0-1]?[0-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9]))?))$" +//时分秒
                      "|" +//或
                      //第四种情况为闰年月份是2月29天的。
                      //可以被4整除但不能被100整除的年份。
                      //可以被400整除的数亦是能被100整除，因此后两位是00，所以只要保证前两位能被4整除即可。
                      "(^((\\d{2})(0[48]|[2468][048]|[13579][26]))|((0[48]|[2468][048]|[13579][26])00)" +
                      "([-/\\._]?)" +
                      "(0?2)" +
                      "([-/\\._]?)" +
                      "(29)" +
                      "([\\s]?)" +
                      "((([0-1]?\\d|2[0-3]):([0-5]?\\d):([0-5]?\\d))?))$" +//时分秒
                      ")";; 

        pattern = Pattern.compile(regex);
        matcher = pattern.matcher(str);
        
        return matcher.matches();
    }
    
    /**
     * 判断是否合法EMAIL
     * @param email 输入地址
     * @return 是否合法EMAIL
     */
    public static boolean isValidEmail(String email) {
        //p{Alpha}:内容是必选的，和字母字符[\p{Lower}\p{Upper}]等价。如：200896@163.com不是合法的。
        //w{2,15}: 2~15个[a-zA-Z_0-9]字符；w{}内容是必选的。 如：dyh@152.com是合法的。
        //[a-z0-9]{3,}：至少三个[a-z0-9]字符,[]内的是必选的。如：dyh200896@16.com是不合法的。
        //[.]:'.'号时必选的。如：dyh200896@163com是不合法的。
        //p{Lower}{2,}小写字母，两个以上。如：dyh200896@163.c是不合法的。
        String regex = "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
        
        Pattern mailPattern = Pattern.compile(regex);
        Matcher matcher = mailPattern.matcher(email); 
        
        return matcher.matches();
    }
    
    /**
     * 是否有效手机号码，可以更改参数以只检查特定运营商的号段
     * @param mobile 号码
     * @return 是否合法手机号码
     */
    @SuppressWarnings("unused")
    public static boolean isValidMobile(String mobile){
        /**
         * 手机号码
         * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
         * 联通：130,131,132,152,155,156,185,186
         * 电信：133,1349,153,180,189
         */
        String MOBILE = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
        /**
         * 中国移动：China Mobile
         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
         */
        String CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
        /**
         * 中国联通：China Unicom
         * 130,131,132,152,155,156,185,186
         */
        String CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$";
        /**
         * 中国电信：China Telecom
         * 133,1349,153,180,189
         */
        String CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$";
        /**
         * 大陆地区固话及小灵通
         * 区号：010,020,021,022,023,024,025,027,028,029
         * 号码：七位或八位
         */
        String PHS = "^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
        
        Pattern pattern = Pattern.compile(MOBILE);
        Matcher matcher = pattern.matcher(mobile); 
        
        return matcher.matches();
    }
}
