package com.ams.infomanage.project.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.BaseConst;
import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.project.dao.ProjectDao;
import com.ams.infomanage.project.entity.Project;
import com.ams.infomanage.project.model.ProjectModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 项目管理
 * @author Wymann
 * @Data 2014-12-12 下午06:12:46
 *
 */
@Repository
public class ProjectDaoImpl extends BaseDaoImpl<Project> implements ProjectDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Project> findByCondition(Project model, Pager page) {
		log.info("项目管理条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.projectId, ");
			sql.append("       a.projectName, ");
			sql.append("       a.projectHead ");
			sql.append("  from t_project a ");
			sql.append(" where 1 = 1 ");
			if(StringUtils.isNotEmpty(model.getProjectName())){
				sql.append("   and a.projectName like '%"+model.getProjectName()+"%' ");
			}
			if(StringUtils.isNotEmpty(model.getProjectHead())){
				sql.append("   and a.projectHead like '%"+model.getProjectHead()+"%' ");
			}
			sql.append(" order by a.projectName, a.projectHead asc");
			log.info(sql);
			return jdbcQuery(sql.toString(), page, Project.class);
		}catch(RuntimeException e){
			log.error("项目管理条件查询失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据项目名称获取项目信息
	 * @param name
	 * @return
	 */
	public Project getByName(String name) {
		/*log.info("根据项目名称获取项目信息...");
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
	public List<Project> checkProject(String name, String id) {
		log.info("检查当前项目是否存在...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_project a ");
			sql.append(" where a.projectName = '"+name+"' ");
			if(StringUtils.isNotEmpty(id)){
				sql.append("   and a.projectId != '"+id+"' ");
			}
			sql.append(" limit 1 ");
			
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Project>(Project.class));
		}catch (RuntimeException e) {
			log.error("检查当前项目是否存在失败，请检查！", e);
			throw e;
		}
	}

}
