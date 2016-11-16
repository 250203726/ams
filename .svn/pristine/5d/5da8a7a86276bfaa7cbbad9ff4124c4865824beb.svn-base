package com.ams.customer.service;

import java.util.List;

import com.ams.customer.entity.Customer;
import com.ams.customer.model.CustomerModel;
import com.util.page.Pager;

/**
 * 客户管理
 * @author Wymann
 * @Data 2014-12-12 下午06:13:19
 *
 */
public interface CustomerService {
	
	/**
	 * 保存
	 * @param model
	 */
	Customer save(Customer model);

	/**
	 * 修改
	 * @param model
	 */
	Customer update(Customer model);
	
	/**
	 * 删除客户信息
	 * @param id
	 */
	void delete(String id);
	
	/**
	 * 获取客户信息
	 * @param id
	 * @return
	 */
	Customer getById(String id);
	
	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<CustomerModel> findByCondition(CustomerModel model, Pager page);

	/**
	 * 检查当前客户是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkCustomer(String name, String id);

	/**
	 * 根据名称获取客户信息
	 * @param name
	 * @return
	 */
	Customer getByName(String name);

	/**
	 * 根据客户名称查找
	 * @param name 客户名称
	 * @return 返回客户实体，无返回null
	 */
	Customer readCustomerByName(String name);

}
