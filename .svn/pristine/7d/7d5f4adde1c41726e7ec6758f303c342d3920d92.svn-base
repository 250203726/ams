package com.ams.infomanage.depart.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.depart.dao.DepartDao;
import com.ams.infomanage.depart.entity.Depart;
import com.ams.infomanage.depart.model.DepartModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 单位管理
 * @author Wymann
 * @Data 2014-12-12 下午06:12:46
 *
 */
@Repository
public class DepartDaoImpl extends BaseDaoImpl<Depart> implements DepartDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Depart> findByCondition(Depart model, Pager page) {
		log.info("部门管理条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.departId, ");
			sql.append("       a.departName, ");
			sql.append("       a.departAdd, ");
			sql.append("       a.departOwner ");
			sql.append("  from t_depart a ");
			sql.append(" where 1 = 1 ");
			if(StringUtils.isNotEmpty(model.getDepartName())){
				sql.append("   and a.departName like '%"+model.getDepartName()+"%' ");
			}
			if(StringUtils.isNotEmpty(model.getDepartAdd())){
				sql.append("   and a.departAdd = '"+model.getDepartAdd()+"' ");
			}
			if(StringUtils.isNotEmpty(model.getDepartOwner())){
				sql.append("   and a.departOwner = '"+model.getDepartOwner()+"' ");
			}
			sql.append(" order by a.departName asc, a.departAdd asc");
			log.info(sql);
			return jdbcQuery(sql.toString(), page, Depart.class);
		}catch(RuntimeException e){
			log.error("部门管理条件查询失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据单位名称获取单位信息
	 * @param name
	 * @return
	 */
	public Depart getByName(String name) {
		/*log.info("根据单位名称获取单位信息...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_company a ");
			sql.append(" where a.company_Name = '"+name+"' ");
			sql.append(" limit 1 ");
			List<Company> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Company>(Company.class));
			if(!list.isEmpty() && list.size()>0){
				return list.get(0);
			}
			return null;
		}catch (RuntimeException e) {
			log.error("根据单位名称获取单位信息失败，请检查！", e);
			throw e;
		}*/
		log.info("未定义函数功能");
		return null;
	}

	@Override
	public List<Depart> checkDepart(String name, String id) {
		log.info("检查当前部门是否存在...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_depart a ");
			sql.append(" where a.departName = '"+name+"' ");
			if(StringUtils.isNotEmpty(id)){
				sql.append("   and a.departId != '"+id+"' ");
			}
			sql.append(" limit 1 ");
			
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Depart>(Depart.class));
		}catch (RuntimeException e) {
			log.error("检查当前部门是否存在失败，请检查！", e);
			throw e;
		}
	}

}
