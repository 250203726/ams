package com.ams.system.dao;

import java.util.List;

import com.ams.system.entity.Auth;
import com.ams.system.entity.User;
import com.core.dao.BaseDao;

/**
 * 权限管理
 * @author Wymann
 * @Date 2014-5-10 下午09:46:28
 *
 */
public interface AuthDao extends BaseDao<Auth>{

	/**
	 * 查询用户权限值
	 * @param user
	 * @return
	 */
	List<String> getPtree(User user);

	/**
	 * 根据角色获取权限列表
	 * @param id
	 * @return
	 */
	List<Auth> getByRoleId(String id);

	/**
	 * 查找所有权限
	 * @return
	 */
	List<Auth> findAll();

	/**
	 * 根据父亲节点删除下面子节点
	 * @param id
	 * @return
	 */
	int deleteByParentId(String id);

}
