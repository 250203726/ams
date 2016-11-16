package com.ams.infomanage.supplier.dao;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.supplier.entity.Supplier;
import com.ams.infomanage.supplier.model.SupplierModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 厂商管理
 * @author Wymann
 * @Data 2014-12-12 下午06:11:59
 *
 */
public interface SupplierDao extends BaseDao<Supplier>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Supplier> findByCondition(Supplier model, Pager page);

	/**
	 * 检查当前供应商是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	List<Supplier> checkSupplier(String name, String id);
	
	/**
	 * 根据名称获取供应商信息
	 * @param name
	 * @return
	 */
	Supplier getByName(String name);

}
