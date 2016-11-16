package com.ams.system.entity;

/**
 * 权限实体
 * @author Wymann
 * @Date 2014-5-10 下午09:23:14
 *
 */
public class Auth {

	private String authId;		//主键
	private String parentId;	//父亲节点，根节点为0
	private String authName;	//权限名称
	private int authority;		//权限值
	private int sortCode;			//显示顺序
	private String enable;		//是否启用
	private String base;		//是否是基础权限

	public String getAuthId() {
		return this.authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getAuthName() {
		return this.authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public int getAuthority() {
		return this.authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public int getSortCode() {
		return sortCode;
	}

	public void setSortCode(int sortCode) {
		this.sortCode = sortCode;
	}

	public String getEnable() {
		return this.enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}

}
