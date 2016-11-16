package com.ams.infomanage.factory.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.factory.dao.FactoryDao;
import com.ams.infomanage.factory.entity.Factory;
import com.ams.infomanage.factory.model.FactoryModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 厂商管理
 * @author Wymann
 * @Data 2014-12-12 下午06:12:46
 *
 */
@Repository
public class FactoryDaoImpl extends BaseDaoImpl<Factory> implements FactoryDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Factory> findByCondition(Factory model, Pager page) {
		log.info("厂商管理条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.factoryId, ");
			sql.append("       a.factoryName, ");
			sql.append("       a.factoryContacts, ");
			sql.append("       a.factorycontactsPhone ");
			sql.append("  from t_factory a ");
			sql.append(" where 1 = 1 ");
			if(StringUtils.isNotEmpty(model.getFactoryName())){
				sql.append("   and a.factoryName like '%"+model.getFactoryName()+"%' ");
			}
			if(StringUtils.isNotEmpty(model.getFactoryContacts())){
				sql.append("   and a.factoryContacts = '"+model.getFactoryContacts()+"' ");
			}
//			if(StringUtils.isNotEmpty(model.getFactorycontactsPhone())){
//		sql.append("   and a.departOwner = '"+model.getFactorycontactsPhone()+"' ");
//			}
			sql.append(" order by a.factoryName asc, a.factoryId asc");
			log.info(sql);
			return jdbcQuery(sql.toString(), page, Factory.class);
		}catch(RuntimeException e){
			log.error("厂商管理条件查询失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据厂商名称获取厂商信息
	 * @param name
	 * @return
	 */
	public Factory getByName(String name) {
		/*log.info("根据厂商名称获取厂商信息...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_factory a ");
			sql.append(" where a.factory_Name = '"+name+"' ");
			sql.append(" limit 1 ");
			List<Factory> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Factory>(Factory.class));
			if(!list.isEmpty() && list.size()>0){
				return list.get(0);
			}
			return null;
		}catch (RuntimeException e) {
			log.error("根据厂商名称获取信息失败，请检查！", e);
			throw e;
		}*/
		log.info("未定义函数功能");
		return null;
	}

	@Override
	public List<Factory> checkFactory(String name, String id) {
		log.info("检查当前厂商是否存在...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_factory a ");
			sql.append(" where a.factoryName = '"+name+"' ");
			if(StringUtils.isNotEmpty(id)){
				sql.append("   and a.factoryId != '"+id+"' ");
			}
			sql.append(" limit 1 ");
			
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Factory>(Factory.class));
		}catch (RuntimeException e) {
			log.error("检查当前厂商是否存在失败，请检查！", e);
			throw e;
		}
	}

}
