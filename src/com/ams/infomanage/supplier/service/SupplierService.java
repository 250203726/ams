package com.ams.infomanage.supplier.service;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.supplier.entity.Supplier;
import com.ams.infomanage.supplier.model.SupplierModel;
import com.util.page.Pager;

/**
 * 供应商管理
 * @author simon
 */
public interface SupplierService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	Supplier save(Supplier model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	Supplier update(Supplier model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找供应商信息
	 * @param id
	 * @return
	 */
	Supplier getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Supplier> findByCondition(Supplier model, Pager page);
	
	/**
	 * 检查供应商名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkSupplier(String name, String id);
	
	/**
	 * 根据名称获取供应商信息
	 * @param name
	 * @return
	 */
	Supplier getByName(String name);

}
