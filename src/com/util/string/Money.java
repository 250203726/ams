package com.util.string;

import java.text.DecimalFormat;

/**
 * 金额大小写转换
 * @author feiti_000
 *
 */
public class Money {
	
	public static DecimalFormat df = new DecimalFormat("#.00");
	/**
     * 将金额数字转化成大写字符串
     * @param d:string 类型的数字，可以是Integer/Double/Long转换而来
     * @return
     */
      public static String toMoney(double d) {
    	String fs="";
    	if(d<0){
    		fs="负";
    	}
        String returnString ="";
        //保存数字大写数组
        String[] num = {"零","壹","贰","叁","肆","伍","陆","柒","捌","玖"};
        //十进制单位
        String[] unit = {"","拾","佰","仟","万","拾","佰","仟","亿","拾","佰","仟"};
        //拆分int,double,long，等类型的传值
        String[] moneys = String.valueOf(d).replace("-", "").split("\\.");
        //将整数部分转化成字节
        char[] moneys1 = moneys[0].toCharArray();
        //new一个新数组用来保存金额每个数字对应的大写
        String[] str = new String[moneys1.length];
        //遍历字节数组找到每个数字的大写并保存
        for(int i=0;i<moneys1.length;i++){
            //保存数字大写
           str[i] = num[Integer.parseInt(String.valueOf(moneys1[i]))];
            if(!str[i].equals("零")){
                if(i!=0&&!str[i-1].equals("零")){
                    //前一位数字非零又非第一位数字，则在对应的大写数组和单位数字直接去值组合
                   returnString = returnString+ str[i]+unit[moneys1.length-i-1];
                }else if(i!=0&&str[i-1].equals("零")&&(moneys1.length-i!=4&&moneys1.length-i!=8)){
                    //非第一位数字，但是前一位为零，并且满足不是在千*字倍上的则需要在前加上 "零“
                   returnString = returnString+"零"+ str[i]+unit[moneys1.length-i-1];
                }else if(i!=0&&str[i-1].equals("零")&&(moneys1.length-i==4||moneys1.length-i==8)){
                    //非第一位数字，但是前一位为零，并且满足是在千*字倍上的则在对应的大写数组和单位数字直接去值组合
                    if(moneys1.length-i==4&&returnString.endsWith("亿")){
                        //万位至亿位上全位零的时候，千位前加上"零"
                        returnString = returnString+"零"+str[i]+unit[moneys1.length-i-1];
                    }else{
                       returnString = returnString+str[i]+unit[moneys1.length-i-1];
                    }
                }else if(i==0){
                    //第一位数字不会出现为0，直接在对应的大写数组和单位数字直接去值组合
                   returnString = returnString + str[i]+unit[moneys1.length-i-1];
                }
            }
            //在万位或者亿位上加上相应的万或亿单位
            if(moneys1.length>4){
                    if(moneys1.length-i==5){
                        //万位加单位，如果万至亿之间没有数字则不需要加
                        if(!returnString.endsWith("亿")){
                            if(!returnString.endsWith("万")){
                                //万位上有数字不为零也不需要加
                                 returnString = returnString+"万";
                            }
                        }
                    }else if(moneys1.length-i==9){
                        //亿位加单位，如果亿位上数字不为零则不需要加
                        if(!returnString.endsWith("亿")){
                            returnString = returnString+"亿";
                        }
                    }
                }
        }
        //小数点后处理
        Long dou = 0l;
        if(moneys.length>1&&moneys[1]!=null&&!"".equals(moneys[1])){
             dou = Long.valueOf(moneys[1]);
        }
        if(dou==0){
            //小数点后没有数或者为零
            returnString = returnString+"元整";
        }else{
            //小数点后保留的两位数值
            returnString = returnString+"元";
            Long j = dou/10;
            Long f = dou%10;
            returnString = returnString + num[j.intValue()]+"角";
            returnString = returnString + num[f.intValue()]+"分";
        }
        return fs+returnString;  
    }
     
	  /**
	   * 保留两位小数
	   * @return
	   */
    public static double m2(double d){
    	 String dStr=String.valueOf(d);
    	 String[] a=dStr.split("\\.");
    	 if(a.length==2 && a[1].length()>2){//保留两位小数
    		 dStr=df.format(d);
    		 return Double.valueOf(dStr);
    	 }else{
    		 return d;
    	 }
    }
    
    public static double m6(double d){
   	 String dStr=String.valueOf(d);
   	 String[] a=dStr.split("\\.");
   	 if(a.length==2 && a[1].length()>6){//保留两位小数
   		 dStr=df.format(d);
   		 return Double.valueOf(dStr);
   	 }else{
   		 return d;
   	 }
   }
      
    public static void main(String[] args){
    	System.out.println(toMoney(6789.00));
    	System.out.println(m2(249.39994));
    }
}
