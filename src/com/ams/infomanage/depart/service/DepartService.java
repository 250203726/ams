package com.ams.infomanage.depart.service;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.depart.entity.Depart;
import com.ams.infomanage.depart.model.DepartModel;
import com.util.page.Pager;

/**
 * 部门管理
 * @author simon
 */
public interface DepartService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	Depart save(Depart model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	Depart update(Depart model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找部门信息
	 * @param id
	 * @return
	 */
	Depart getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Depart> findByCondition(Depart model, Pager page);
	
	/**
	 * 检查部门名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkDepart(String name, String id);
	
	/**
	 * 根据名称获取部门信息
	 * @param name
	 * @return
	 */
	Depart getByName(String name);

}
