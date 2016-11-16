package com.ams.system.model;

/**
 * 查询实体
 * @author Wymann
 * @Data 2015-1-5 下午02:04:02
 *
 */
public class UrlFilterModel {
	private String urlId;				//主键
	private String description;		//描述
	private String name;			//名称
	private String url;				//请求url
	private String returnUrl;		//返回url
	private String authoritys;		//权限值
	private String rowFilter;		//是否登录验证
	private String params;			//请求参数
	private String privilegess;		//是否权限验证
	private String formtoken;		//是否表单重复提交
	private String pvtype;			//是否加入流量统计

	public String getUrlId() {
		return urlId;
	}
	public void setUrlId(String urlId) {
		this.urlId = urlId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getReturnUrl() {
		return returnUrl;
	}
	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}
	public String getAuthoritys() {
		return authoritys;
	}
	public void setAuthoritys(String authoritys) {
		this.authoritys = authoritys;
	}
	public String getRowFilter() {
		return rowFilter;
	}
	public void setRowFilter(String rowFilter) {
		this.rowFilter = rowFilter;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public String getPrivilegess() {
		return privilegess;
	}
	public void setPrivilegess(String privilegess) {
		this.privilegess = privilegess;
	}
	public String getFormtoken() {
		return formtoken;
	}
	public void setFormtoken(String formtoken) {
		this.formtoken = formtoken;
	}
	public String getPvtype() {
		return pvtype;
	}
	public void setPvtype(String pvtype) {
		this.pvtype = pvtype;
	}
}
