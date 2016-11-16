package com.ams;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.util.datetime.DateTimeUtils;

public class BaseConst {
	public static final String USERSESSION="USERSESSION";
	
	public static final String HISTORYURL="historyUrl";		//历史路由
	
			
	/**
	 * 验证码到cookie
	 */
	public static final String authcode="authCode";
	
	/**
	 * 生成登陆认证cookie
	 */
	public static final String authmark="authmark";
	
	/**
	 * 用户名到cookie
	 */
	public static final String userName="userName";
	
	/**
	 * #IDEA加密秘钥
	 */
	public static final String securityKey = "ttJw6Oc4NEtwPf8CbmwLNQ==";//#IDEA加密秘钥
	
	/**
	 * #cookie最大时间 3600 * 24 * 15 = 12960000 秒 = 15 天
	 */
	public static final int maxAge=12960000;
	
	/**
	 * 分页常量
	 */
	public static final String DIC_PAGE_SIZE="dic_page_size";
	
	//-----------------AJAX请求返回参数---------------------------------------
	/**
	 * respone报错信息
	 */
	public static final int AJAX_999=999;
	
	/**
	 * 没有权限
	 */
	public static final int AJAX_998=998;
	
	
	//----------------------------------------查询条件其实年份--------------------------------------------------
	
	public static final int STARTYEAR=2008;
	
	//--------------------------------------------字典常量常量-----------------------------------
	
	/**
	 * 是否启用
	 */
	public static final String DIC_STATE="dic_state";
	
	/**
	 * 单位类型
	 */
	public static final String DIC_COMPANY_TYPE="dic_company_type";
	
	/**
	 * 资金类型
	 */
	public static final String DIC_FUND_TYPE="dic_fund_type";
	
	/**
	 * 资金计划执行状态
	 */
	public static final String DIC_FUND_STATE="dic_fund_state";
	
	/**
	 * 模块分类
	 */
	public static final String DIC_MODULE_TYPE="dic_module_type";
	
	/**
	 * 合同分类
	 */
	public static final String DIC_CONTRACT_TYPE="dic_contract_type";
	
	/**
	 * 工程类型
	 */
	public static final String DIC_PROJECT_TYPE="dic_project_type";
	
	/**
	 * 合同状态
	 */
	public static final String DIC_CONTRACT_STATE="dic_contract_state";
	
	//等待会签
	public static final String CONTRACT_STATE_DDHQ="1";
	//会签
	public static final String CONTRACT_STATE_HQ="1";
	//执行
	public static final String CONTRACT_STATE_ZX="1";
	
	/**
	 * 合同性质
	 */
	public static final String DIC_CONTRACT_NATURE="dic_contract_nature";
	
	/**
	 * 总包合同正则表达式
	 */
	public static final String ZBREGX="^[a-zA-Z]*-[a-zA-Z]*\\d{9}$";
	
	/**
	 * 分包正则表达式
	 */
	public static final String FBREGX="^[a-zA-Z]*-[a-zA-Z]*\\d{9}-\\d{2}$";
	
	/**
	 * 工单正则表达式
	 */
	public static final String GDREGX="^[a-zA-Z]*-[a-zA-Z]*\\d{9}-\\d{5}-\\d{2}$";
	
	/**
	 * 数字正则表达式
	 */
	public static final String NUMBERREGX="^[\\-\\+]?(([0-9]+)([\\.,]([0-9]+))?|([\\.,]([0-9]+))?)$";
	
	/**
	 * 根据编码分解出序号
	 * @param contractCode
	 * @return
	 */
	public static int getSortCode(String contractCode){
		String[] str=contractCode.split("-");
		if(str.length==3){
			return Integer.valueOf(str[2].toString());
		}else{
			String regEx="\\d{9}";
			Pattern pat=Pattern.compile(regEx); 
			Matcher m=pat.matcher(contractCode);
			String s="";
			while(m.find()){
				s=m.group();
			}
			if(s.length()==9){
				return Integer.valueOf(s.substring(6, s.length()));
			}
		}
		return -1;
	}
	
	/**
	 * 根据编码分解出日期
	 * @param contractCode
	 * @return
	 */
	public static Date getDate(String contractCode){
		String regEx="\\d{9}";
		Pattern pat=Pattern.compile(regEx); 
		Matcher m=pat.matcher(contractCode);
		String s="";
		while(m.find()){
			s=m.group();
		}
		Date date=DateTimeUtils.parseDate(s.substring(0, s.length()-3), "yyyyMM");
		return date;
	}
	
	public static boolean matchCode(String code,String regEx){
		Pattern pat=Pattern.compile(regEx); 
		Matcher m=pat.matcher(code);
		return m.matches();
	}
	
	public static void main(String[] args){
		System.out.println(getSortCode("ss-gj201411001-01"));
		System.out.println(DateTimeUtils.formatDate(getDate("gj201411001-01"), "yyyy"));
		double d=0.0;
		System.out.println(d==0.0);
		
		System.out.println(matchCode("ss-gj201411001-01", "^[a-zA-Z]*-[a-zA-Z]*\\d{9}-\\d{2}$"));
		System.out.println(matchCode("ss-gj201411001", "^[a-zA-Z]*-[a-zA-Z]*\\d{9}$"));
	}
	
}
