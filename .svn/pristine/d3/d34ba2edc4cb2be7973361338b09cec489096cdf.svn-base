package com.ams.system.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.system.dao.ManagerDao;
import com.ams.system.entity.Manager;
import com.ams.system.model.ManagerModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 项目经理管理
 * @author Wymann
 * @Data 2015-1-2 下午01:44:42
 *
 */
@Repository
public class ManagerDaoImpl extends BaseDaoImpl<Manager> implements ManagerDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<ManagerModel> findByCondition(ManagerModel model, Pager page) {
		log.info("条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.managerId, ");
			sql.append("	   a.code,");
			sql.append("       a.managerName, ");
			sql.append("       a.enable, ");
			sql.append("       a.tel, ");
			sql.append("	   d.userName as refUserName,");
			sql.append("       a.createUser, ");
			sql.append("       a.createTime, ");
			sql.append("       b.Name as enableName, ");
			sql.append("       c.userName as createUserName ");
			sql.append("  from t_manager a ");
			sql.append("  left join t_dictionary b ");
			sql.append("    on b.value = a. enable ");
			sql.append("   and b.Groupname = 'dic_state' ");
			sql.append("  left join t_user c ");
			sql.append("    on c.user_Id = a.createUser ");
			sql.append("  left join t_user d ");
			sql.append("    on d.user_Id = a.refuser ");
			sql.append(" where 1 = 1 ");
			if(StringUtils.isNotEmpty(model.getEnable())){
				sql.append("   and a. enable = '"+model.getEnable()+"' ");
			}
			if(StringUtils.isNotEmpty(model.getManagerName())){
				sql.append("   and a.managerName like '%"+model.getManagerName()+"%' ");
			}
			sql.append(" order by a.managerId asc ");
			
			return jdbcQuery(sql.toString(), page,ManagerModel.class);
		}catch (RuntimeException e) {
			log.error("条件查询失败，请检查！", e);
			throw e;
		}
	}
	
	/**
	 * 检查工号是否有重复
	 * @param code
	 * @param managerId
	 * @return
	 */
	public boolean checkCode(String code, String managerId){
		log.info("检查工号是否有重复...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select count(a.managerId) from t_manager a where a.code='"+code+"' ");
			if(StringUtils.isNotEmpty(managerId)){
				sql.append(" and a.managerId!='"+managerId+"'	");
			}
			int num=getJdbcTemplate().queryForInt(sql.toString());
			if(num<=0){
				return false;
			}
			return true;
		}catch (RuntimeException e) {
			log.error("检查工号是否有重复失败，请检查！", e);
			throw e;
		}
	}
	
	/**
	 * 根据当前账号获取项目经理
	 * @param userId
	 * @return
	 */
	public Manager findByRefuser(String userId){
		log.info("根据当前账号获取项目经理...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* from t_manager a where a.refuser='"+userId+"' ");
			List<Manager> list= getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Manager>(Manager.class));
			if(!list.isEmpty() && list.size()>0){
				return list.get(0);
			}
			return null;
		}catch (RuntimeException e) {
			log.error("根据当前账号获取项目经理失败，请检查！", e);
			throw e;
		}
	}

}
