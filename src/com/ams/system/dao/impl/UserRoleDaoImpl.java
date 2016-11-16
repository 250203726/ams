package com.ams.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ams.system.dao.UserRoleDao;
import com.ams.system.entity.UserRole;
import com.core.dao.impl.BaseDaoImpl;

/**
 * 用户角色管理
 * @author Wymann
 * @Date 2014-5-10 下午10:09:07
 *
 */
@Repository
public class UserRoleDaoImpl extends BaseDaoImpl<UserRole> implements UserRoleDao{

	/**
	 * 删除用户关联角色
	 * @param userId
	 * @return 
	 * @author Whymann 2014-5-12 下午03:25:23
	 */
	public int deleteByUserId(String userId) {
		log.info("删除用户关联角色...");
		try{
			String sql="delete from t_user_role where userId='"+userId+"'";
			return getJdbcTemplate().update(sql);
		}catch(RuntimeException e){
			log.error("删除用户关联角色失败，请检查！", e);
			throw e;
		}
	}

}
