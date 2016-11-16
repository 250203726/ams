package com.ams.infomanage.project.service;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.project.entity.Project;
import com.ams.infomanage.project.model.ProjectModel;
import com.util.page.Pager;

/**
 * 项目管理
 * @author simon
 */
public interface ProjectService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	Project save(Project model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	Project update(Project model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找项目信息
	 * @param id
	 * @return
	 */
	Project getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Project> findByCondition(Project model, Pager page);
	
	/**
	 * 检查项目名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkProject(String name, String id);
	
	/**
	 * 根据名称获取项目信息
	 * @param name
	 * @return
	 */
	Project getByName(String name);

}
