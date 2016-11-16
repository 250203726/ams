package com.ams.company.service;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.util.page.Pager;

/**
 * 单位管理
 * @author Wymann
 * @Data 2014-12-12 下午06:11:27
 *
 */
public interface CompanyService {
	
	/**
	 * 保存单位
	 * @param model
	 * @return
	 */
	Company save(Company model);

	/**
	 * 修改单位
	 * @param model
	 * @return
	 */
	Company update(Company model);

	/**
	 * 删除单位信息
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找单位信息
	 * @param id
	 * @return
	 */
	Company getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<CompanyModel> findByCondition(CompanyModel model, Pager page);
	
	/**
	 * 检查单位是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkCompany(String name, String id);

	/**
	 * 根据名称获取单位信息
	 * @param name
	 * @return
	 */
	Company getByName(String name);

}
