package com.ams.system.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.system.dao.AuthDao;
import com.ams.system.entity.Auth;
import com.ams.system.entity.User;
import com.core.dao.impl.BaseDaoImpl;
import com.util.enums.dic.StateEnum;

/**
 * 权限管理
 * @author Wymann
 * @Date 2014-5-10 下午09:46:36
 *
 */
@Repository
public class AuthDaoImpl extends BaseDaoImpl<Auth> implements AuthDao{

	/**
	 * 查询用户权限值
	 * @param user
	 * @return 
	 * @author Whymann 2014-5-11 下午05:33:00
	 */
	public List<String> getPtree(User user) {
		log.info("查询用户权限值...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("SELECT ");
			sql.append("	e.authority ");
			sql.append("FROM ");
			sql.append("	t_user a ");
			sql.append("LEFT JOIN t_user_role b ON b.userId = a.user_id ");
			sql.append("LEFT JOIN t_role c ON c.role_Id = b.roleId ");
			sql.append("LEFT JOIN t_role_auth d ON d.roleId = c.role_Id ");
			sql.append("LEFT JOIN t_auth e ON e.auth_Id = d.authId ");
			sql.append("WHERE ");
			sql.append("	a.userName = '"+user.getUserName()+"' ");
			sql.append("	and e.authority is not null ");
			sql.append("AND a. ENABLE = '1' ");
			sql.append("GROUP BY ");
			sql.append("	e.authority ");
			return getJdbcTemplate().queryForList(sql.toString(), String.class);
		}catch(RuntimeException e){
			log.error("查询用户权限值失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据角色获取权限列表
	 * @param id
	 * @return 
	 * @author Whymann 2014-5-12 下午04:00:19
	 */
	public List<Auth> getByRoleId(String id) {
		log.info("根据角色id:"+id+"获取权限列表...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.*					");
			sql.append("  from t_auth a				");
			sql.append("  left join t_role_auth b	");
			sql.append("    on b.authId = a.auth_Id	");
			sql.append("  left join t_role c		");
			sql.append("    on c.role_Id = b.roleId	");
			sql.append(" where c.role_Id = '"+id+"'	");
			sql.append("   and a.enable = '"+StateEnum.VALID+"'");
			sql.append(" order by a.authority asc 	");
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Auth>(Auth.class));
		}catch(RuntimeException e){
			log.error("根据角色id:"+id+"获取权限列表失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 查找所有权限
	 * @return 
	 * @author Whymann 2014-5-12 下午04:50:40
	 */
	@SuppressWarnings("unchecked")
	public List<Auth> findAll() {
		log.info("查找所有权限...");
		try{
			Query query=getSession().createQuery("from Auth a where a.enable='"+StateEnum.VALID+"'");
			return query.list();
		}catch(RuntimeException e){
			log.error("查找所有权限失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据父亲节点删除下面子节点
	 * @param id
	 * @return
	 */
	public int deleteByParentId(String id) {
		log.info("根据父亲节点id:"+id+"删除下面子节点");
		try{
			String sql="delete from t_auth where parentId='"+id+"'";
			return getJdbcTemplate().update(sql);
		}catch(RuntimeException e){
			log.error("根据父亲节点id:"+id+"删除下面子节点", e);
			throw e;
		}
	}

}
