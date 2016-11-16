package com.ams.infomanage.factory.dao;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.factory.entity.Factory;
import com.ams.infomanage.factory.model.FactoryModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 厂商管理
 * @author Wymann
 * @Data 2014-12-12 下午06:11:59
 *
 */
public interface FactoryDao extends BaseDao<Factory>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Factory> findByCondition(Factory model, Pager page);

	/**
	 * 检查当前厂商是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	List<Factory> checkFactory(String name, String id);
	
	/**
	 * 根据名称获取厂商信息
	 * @param name
	 * @return
	 */
	Factory getByName(String name);

}
