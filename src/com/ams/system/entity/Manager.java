package com.ams.system.entity;

import java.util.Date;

/**
 * 项目经理
 * @author Wymann
 * @Data 2015-1-2 下午01:39:39
 *
 */
public class Manager {

	private String managerId;		//
	private String managerName;		//姓名
	private String code;
	private String enable;			//是否启用
	private String tel;				//联系方式
	private String refuser;
	private String createUser;		//
	private Date createTime;		//
	
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRefuser() {
		return refuser;
	}
	public void setRefuser(String refuser) {
		this.refuser = refuser;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
