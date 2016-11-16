package com.ams.infomanage.project.dao;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.project.entity.Project;
import com.ams.infomanage.project.model.ProjectModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 单位管理
 * @author Wymann
 * @Data 2014-12-12 下午06:11:59
 *
 */
public interface ProjectDao extends BaseDao<Project>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Project> findByCondition(Project model, Pager page);

	/**
	 * 检查当前单位是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	List<Project> checkProject(String name, String id);
	
	/**
	 * 根据名称获取单位信息
	 * @param name
	 * @return
	 */
	Project getByName(String name);

}
