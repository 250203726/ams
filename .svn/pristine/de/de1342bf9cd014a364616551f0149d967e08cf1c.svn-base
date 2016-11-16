package com.core.model;

import java.util.ArrayList;
import java.util.List;

import com.ams.system.entity.Role;
import com.ams.system.entity.User;

/**
 * 
 * @author Wymann
 * @Date 2014-5-11 上午12:07:59
 *
 */
public class UserSession {

	/**
	 * 系统登录用户
	 */
	private User user=new User();
	
	/**
	 * 角色列表
	 */
	private List<Role> userRole=new ArrayList<Role>();
	
	/**
	 * 用户权限树
	 */
	private List<String> ptree;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Role> getUserRole() {
		return userRole;
	}
	public void setUserRole(List<Role> userRole) {
		this.userRole = userRole;
	}
	public List<String> getPtree() {
		return ptree;
	}
	public void setPtree(List<String> ptree) {
		this.ptree = ptree;
	}
}
