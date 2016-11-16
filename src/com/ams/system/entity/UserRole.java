package com.ams.system.entity;

/**
 * 用户角色
 * @author Wymann
 * @Date 2014-5-10 下午09:25:32
 *
 */
public class UserRole implements java.io.Serializable {

	private String userRoleId;		//主键
	private String userId;			//用户编码
	private String roleId;			//角色编码

	public String getUserRoleId() {
		return this.userRoleId;
	}

	public void setUserRoleId(String userRoleId) {
		this.userRoleId = userRoleId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}
