package com.core.action;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;

import com.ams.BaseConst;
import com.ams.system.entity.User;
import com.core.model.OutputMessage;
import com.core.model.UserSession;
import com.util.tools.ToolSecurityIDEA;
import com.util.tools.ToolString;
import com.util.tools.ToolWeb;

/**
 * Controller父类
 *
 * @version 1.0,2013-8-28
 * @author Wymann
 */
public class BaseAction implements Serializable {

	private static final long serialVersionUID = -8729137965180254125L;

	/**
	 * 错误页面
	 */
	protected String ERROR = "error/404";
	/**
	 * 单位管理
	 */
	protected String COMPANY = "company/";
	/**
	 * 客户管理根目录
	 */
	protected String CUSTOMER = "customer/";
	/**
	 * 系统管理根目录
	 */
	protected String SYSTEM = "system/";
	/**
	 * 数据导入导出
	 */
	protected String BASEDATA = "basedata/";
	
	/**
	 * 部门
	 */
	protected String DEPART="infomanage/depart/";
	
	/**
	 * 项目
	 */
	protected String PROJECT="infomanage/project/";
	/**
	 * 资产信息
	 * 
	 */
	protected String ASSETINF="assetmanage/assetinf/";
	/**
	 * 资产类别
	 */
	protected String ASSETCLA="assetmanage/assetcla/";
	/**
	 * 资产名称
	 */
	protected String ASSETNAM="assetmanage/assetnam/";
	/**
	 * 厂商
	 */
	protected String FACTORY="infomanage/factory/";
	/**
	 * 供应商
	 */
	protected String SUPPLIER="infomanage/supplier/";
	/**
	 * 维护公司信息
	 */
	protected String MAINTENANCEINFO="infomanage/maintenanceinfo/";
	/*
	 * 资产调拨
	 */
	protected String ASSETCHANGE="assetmanage/assetchange/";
	
	/**
	 * 资产维护记录
	 */
	protected String MAINTENANCERECORD="assetmanage/maintenancerecord/";
	/**
	 * 资产购置申请
	 * 
	 */
	protected String ASSETPURCHASEAPPLICATION="assetmanage/assetpurchaseapplication/";
	
	/**
	 * 资产报损
	 */
	protected String ASSETDAMAGE="assetmanage/assetdamage/";
	
	/********************* 获取Request *******************/
	/**
	 * 请求上下文
	 */
	private HttpServletRequest request;

	protected HttpServletRequest getRequest() {
		return this.request;
	}

	@Resource
	protected void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * 将spring mvc 默认的ISO-8859-1转为utf-8
	 * 
	 * @param str
	 * @return
	 * @throws Exception
	 * @author Whymann 2013-12-25 下午05:27:19
	 */
	protected String toUTF8(String str) throws Exception {
		if (StringUtils.isNotEmpty(str)) {
			byte bt[] = str.trim().getBytes("ISO-8859-1");
			return new String(bt, "UTF-8");
		}
		return null;
	}

	/**
	 * 获得当前访问的url
	 * 
	 * @return
	 * @author Whymann 2013-12-8 上午10:53:56
	 */
	protected String getUrl() {
		return getRequest().getRequestURI();
	}

	/**
	 * 获得前一次访问路径
	 * 
	 * @return
	 * @author Whymann 2013-12-13 下午03:51:18
	 */
	protected String getReferer() {
		// 保存之前跳转到的页面
		String refer = getRequest().getHeader("referer");
		// 项目服务器路径
		String basePath = getRequest().getScheme() + "://" + getRequest().getServerName() + ":"
				+ getRequest().getServerPort() + getRequest().getContextPath();
		if (StringUtils.isEmpty(refer)) {// 为空，保存历史记录为前台首页
			refer = "";
		} else {
			// 截取掉项目路径，保留访问参数
			refer = refer.substring(basePath.length());
		}
		return refer;
	}

	/**
	 * 获取用户回话
	 * 
	 * @return
	 */
	protected UserSession getSession() {
		return (UserSession) this.getRequest().getSession().getAttribute(BaseConst.USERSESSION);
	}

	/**
	 * 获取登录用户
	 * 
	 * @return
	 */
	protected User getUser() {
		if (null != getSession()) {
			return getSession().getUser();
		}
		return null;
	}

	/**
	 * 返回错误信息
	 * 
	 * @param msg
	 */
	protected void returnException(String msg) {
		getRequest().setAttribute("exception", msg);
	}

	/**
	 * 获取验证码
	 * 
	 * @param request
	 * @return
	 */
	public String getAuthCode() {
		String authCode = ToolWeb.getCookieValueByName(request, BaseConst.authcode);
		if (null != authCode && !authCode.equals("")) {
			// Base64解码
			try {
				authCode = ToolString.decode(authCode);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 解密
			byte[] securityByte = Base64.decodeBase64(authCode);

			String securityKey = BaseConst.securityKey;
			byte[] keyByte = Base64.decodeBase64(securityKey);

			byte[] dataByte = null;
			try {
				dataByte = ToolSecurityIDEA.decrypt(securityByte, keyByte);
			} catch (Exception e) {
				e.printStackTrace();
			}
			authCode = new String(dataByte);
		}
		return authCode;
	}

	/**
	 * 重写getPara，进行二次decode解码
	 */
	public String getPara(String name) {
		String value = getRequest().getParameter(name);
		if (null != value && !value.isEmpty()) {
			try {
				value = URLDecoder.decode(value, ToolString.encoding);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return value;
	}

	/**
	 * 设置ajax操作数据信息
	 * 
	 * @return
	 */
	public OutputMessage setOutputMessage(boolean state, String msg, String param) {
		OutputMessage output = new OutputMessage();
		output.setState(state);
		output.setMessage(msg);
		output.setParam(param);
		if (state) {
			output.setStatus("1");
		} else {
			output.setStatus("0");
		}
		return output;
	}

}
