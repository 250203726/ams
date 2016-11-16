package com.ams.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ams.system.dao.RoleAuthDao;
import com.ams.system.entity.RoleAuth;
import com.core.dao.impl.BaseDaoImpl;

/**
 * 角色权限管理
 * @author Wymann
 * @Date 2014-5-10 下午10:06:40
 *
 */
@Repository
public class RoleAuthDaoImpl extends BaseDaoImpl<RoleAuth> implements RoleAuthDao{

	/**
	 * 根据角色编码删除角色关联权限
	 * @param roleId 
	 * @author Whymann 2014-5-12 下午05:28:24
	 */
	public int deleteByRoleId(String roleId) {
		log.info("根据角色id："+roleId+"删除角色关联权限...");
		try{
			return getJdbcTemplate().update("delete from t_role_auth where roleId='"+roleId+"'");
		}catch(RuntimeException e){
			log.error("根据角色id："+roleId+"删除角色关联权限失败，请检查！",e);
			throw e;
		}
		
	}

}
