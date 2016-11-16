package com.ams.system.entity;

/**
 * 角色实体
 * @author Wymann
 * @Date 2014-5-10 下午09:24:58
 *
 */
public class Role implements java.io.Serializable {

	private String roleId;		//主键
	private String roleName;	//角色名称

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
