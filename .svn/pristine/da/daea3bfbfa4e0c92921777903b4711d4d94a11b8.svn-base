package com.ams.system.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.system.dao.RoleDao;
import com.ams.system.entity.Role;
import com.ams.system.model.RoleModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 角色管理
 * @author Wymann
 * @Date 2014-5-10 下午10:08:14
 *
 */
@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao{

	/**
	 * 根据用户编码获取用户角色
	 * @param userId
	 * @return 
	 * @author Whymann 2014-5-12 上午12:08:24
	 */
	public List<Role> getByUserId(String userId) {
		log.info("根据用户编码获取用户角色...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*						");
			sql.append("  from t_role a					");
			sql.append("  left join t_user_role b		");
			sql.append("    on b.roleId = a.role_Id		");
			sql.append("  left join t_user c			");
			sql.append("    on c.user_id = b.userId		");
			sql.append(" where c.user_id = '"+userId+"' ");
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Role>(Role.class));
		}catch(RuntimeException e){
			log.error("根据用户编码获取用户角色失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 查找所有角色
	 * @return 
	 * @author Whymann 2014-5-12 下午02:51:49
	 */
	@SuppressWarnings("unchecked")
	public List<Role> findAll() {
		log.info("查找所有角色...");
		try{
			Query query=getSession().createQuery("from Role");
			return query.list();
		}catch(RuntimeException e){
			log.error("查找所有角色失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return 
	 * @author Whymann 2014-5-12 下午05:49:19
	 */
	public List<Role> findByCondition(RoleModel model, Pager page) {
		log.info("条件查询");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*");
			sql.append("  from t_role a");
			sql.append(" where 1 = 1");
			if(StringUtils.isNotEmpty(model.getRoleName())){
				sql.append("   and a.roleName like '%"+model.getRoleName()+"%' ");
			}
			
			sql.append(" order by a.role_Id asc ");
			
			return jdbcQuery(sql.toString(), page, Role.class);
		}catch(RuntimeException e){
			log.error("条件查询失败，请检查！", e);
			throw e;
		}
	}

}
