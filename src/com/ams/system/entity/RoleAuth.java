package com.ams.system.entity;

/**
 * 角色权限实体
 * @author Wymann
 * @Date 2014-5-10 下午09:25:18
 *
 */
public class RoleAuth implements java.io.Serializable {

	private String roleAuthId;		//主键
	private String roleId;			//角色编码
	private String authId;			//权限编码

	public String getRoleAuthId() {
		return this.roleAuthId;
	}

	public void setRoleAuthId(String roleAuthId) {
		this.roleAuthId = roleAuthId;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getAuthId() {
		return this.authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}

}
