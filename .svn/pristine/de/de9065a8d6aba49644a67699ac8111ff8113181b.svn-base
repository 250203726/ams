package com.ams.customer.dao;

import java.util.List;

import com.ams.customer.entity.Customer;
import com.ams.customer.model.CustomerModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 客户管理
 * @author Wymann
 * @Data 2014-12-12 下午06:13:45
 *
 */
public interface CustomerDao extends BaseDao<Customer>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<CustomerModel> findByCondition(CustomerModel model, Pager page);

	/**
	 * 检查客户是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	List<Customer> checkCustomer(String name, String id);

	/**
	 * 根据名称获取客户信息
	 * @param name
	 * @return
	 */
	Customer getByName(String name);

}
