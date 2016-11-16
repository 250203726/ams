package com.ams.infomanage.factory.service;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.factory.entity.Factory;
import com.ams.infomanage.factory.model.FactoryModel;
import com.util.page.Pager;

/**
 * 厂商管理
 * @author simon
 */
public interface FactoryService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	Factory save(Factory model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	Factory update(Factory model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找厂商信息
	 * @param id
	 * @return
	 */
	Factory getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Factory> findByCondition(Factory model, Pager page);
	
	/**
	 * 检查厂商名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkFactory(String name, String id);
	
	/**
	 * 根据名称获取厂商信息
	 * @param name
	 * @return
	 */
	Factory getByName(String name);

}
