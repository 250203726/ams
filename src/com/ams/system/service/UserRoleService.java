package com.ams.system.service;

import com.ams.system.entity.User;

/**
 * 用户角色管理
 * @author Wymann
 * @Date 2014-5-10 下午10:00:13
 *
 */
public interface UserRoleService {

	/**
	 * 保存用户信息和角色
	 * @param user
	 * @param role
	 */
	void save(User user, String role);

	/**
	 * 修改用户和角色
	 * @param user
	 * @param role
	 */
	void update(User user, String role);

}
