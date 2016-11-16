package com.ams.infomanage.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.ams.infomanage.project.dao.ProjectDao;
import com.ams.infomanage.project.entity.Project;
import com.ams.infomanage.project.model.ProjectModel;
import com.ams.infomanage.project.service.ProjectService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 	项目管理
 *	@author simon
 */
@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Resource
	private ProjectDao projectDao;

	/**
	 * 保存项目
	 * @param model
	 * @return
	 */
	public Project save(Project model) {
		if(null!=model){
			model.setProjectId(IdGenerator.getInstance().getId());
			projectDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改项目
	 * @param model
	 * @return
	 */
	public Project update(Project model) {
		if(null!=model && StringUtils.isNotEmpty(model.getProjectId())){
			Project project=projectDao.get(model.getProjectId());
			if(null!=project){
				project.setProjectName(model.getProjectName());;
				project.setProjectHead(model.getProjectHead());
				projectDao.update(project);
				return project;
			}
		}
		return null;
	}

	/**
	 * 删除项目信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Project project=projectDao.get(id);
			projectDao.delete(project);
		}
	}

	/**
	 * 根据id查找项目信息
	 * @param id
	 * @return
	 */
	public Project getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Project project=projectDao.get(id);
			return project;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Project> findByCondition(Project model, Pager page) {
		return projectDao.findByCondition(model,page);
	}

	/**
	 * 根据名称获取项目信息
	 * @param name
	 * @return
	 */
	public Project getByName(String name) {
		return projectDao.getByName(name);
	}

	/**
	 * 检查项目名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkProject(String name, String id) {
		List<Project> list=projectDao.checkProject(name, id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
