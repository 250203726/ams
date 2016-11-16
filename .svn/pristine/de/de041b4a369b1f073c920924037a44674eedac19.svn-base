package com.ams.system.dao;

import java.util.List;

import com.ams.system.entity.Role;
import com.ams.system.model.RoleModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 角色管理
 * @author Wymann
 * @Date 2014-5-10 下午10:04:54
 *
 */
public interface RoleDao extends BaseDao<Role>{

	/**
	 * 根据用户编码获取用户角色
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
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Role> findByCondition(RoleModel model, Pager page);

}
