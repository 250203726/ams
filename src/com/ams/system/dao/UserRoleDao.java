package com.ams.system.dao;

import com.ams.system.entity.UserRole;
import com.core.dao.BaseDao;

/**
 * 用户角色管理
 * @author Wymann
 * @Date 2014-5-10 下午10:05:32
 *
 */
public interface UserRoleDao extends BaseDao<UserRole>{

	/**
	 * 根据用户编码，删除关联角色
	 * @param userId
	 * @return
	 */
	int deleteByUserId(String userId);

}
