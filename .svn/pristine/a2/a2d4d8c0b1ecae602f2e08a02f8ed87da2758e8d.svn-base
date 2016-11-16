package com.ams.company.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 单位管理
 * @author Wymann
 * @Data 2014-12-12 下午06:12:46
 *
 */
@Repository
public class CompanyDaoImpl extends BaseDaoImpl<Company> implements CompanyDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<CompanyModel> findByCondition(CompanyModel model, Pager page) {
		log.info("单位管理条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.company_Id, ");
			sql.append("       a.company_Name, ");
			sql.append("       a.person, ");
			sql.append("       a.phone, ");
			sql.append("       a.address, ");
			sql.append("       a.remark, ");
			sql.append("       b.Name as company_Type ");
			sql.append("  from t_company a ");
			sql.append("  left join t_dictionary b ");
			sql.append("    on b.value = a.company_Type ");
			sql.append("   and b.Groupname = '"+BaseConst.DIC_COMPANY_TYPE+"' ");
			sql.append(" where 1 = 1 ");
			if(StringUtils.isNotEmpty(model.getCompanyName())){
				sql.append("   and a.company_Name like '%"+model.getCompanyName()+"%' ");
			}
			if(StringUtils.isNotEmpty(model.getCompanyType())){
				sql.append("   and a.company_Type = '"+model.getCompanyType()+"' ");
			}
			sql.append(" order by a.company_Type asc, a.company_Name asc ");
			
			return jdbcQuery(sql.toString(), page, CompanyModel.class);
		}catch(RuntimeException e){
			log.error("单位管理条件查询失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 检查当前单位是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	public List<Company> checkCompany(String name, String id) {
		log.info("检查当前单位是否存在...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_company a ");
			sql.append(" where a.company_Name = '"+name+"' ");
			if(StringUtils.isNotEmpty(id)){
				sql.append("   and a.company_Id != '"+id+"' ");
			}
			sql.append(" limit 1 ");
			
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Company>(Company.class));
		}catch (RuntimeException e) {
			log.error("检查当前单位是否存在失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据单位名称获取单位信息
	 * @param name
	 * @return
	 */
	public Company getByName(String name) {
		log.info("根据单位名称获取单位信息...");
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
		}
	}

}
