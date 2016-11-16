package com.ams.system.service;

import java.util.List;

import com.ams.system.entity.Auth;
import com.ams.system.entity.User;

/**
 * 权限管理
 * @author Wymann
 * @Date 2014-5-10 下午09:45:50
 *
 */
public interface AuthService {

	Auth save(Auth auth);
	
	Auth update(Auth auth);

	boolean delete(String id);

	Auth getById(String id);
	
	/**
	 * 查询用户权限值
	 * @param user
	 * @return
	 */
	List<String> getPtree(User user);

	/**
	 * 根据角色查找权限列表
	 * @param id
	 * @return
	 */
	List<Auth> getByRoleId(String id);

	/**
	 * 查找所有权限
	 * @return
	 */
	List<Auth> findAll();

}
