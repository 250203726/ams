package com.ams.system.service;

import java.util.List;

import com.ams.system.entity.Role;
import com.ams.system.model.RoleModel;
import com.util.page.Pager;

/**
 * 角色管理
 * @author Wymann
 * @Date 2014-5-10 下午10:00:04
 *
 */
public interface RoleService {

	/**
	 * 保存角色和角色关联权限
	 * @param role
	 * @param auth
	 */
	void save(Role role, String auth);
	
	/**
	 * 根据用户id获取用户主键
	 * @param userId
	 * @return
	 */
	List<Role> getByUserId(String userId);

	/**
	 * 查找所有角色
	 * @return
	 */
	List<Role> findAll();

	/**
	 * 获得角色
	 * @param id
	 * @return
	 */
	Role getByRoleId(String id);

	/**
	 * 修改角色和角色关联权限
	 * @param role
	 * @param auth
	 */
	void update(Role role, String auth);

	/**
	 * 删除角色
	 * @param id
	 */
	void delete(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Role> findByCondition(RoleModel model, Pager page);


}
