package com.ams.customer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cfg.PropertyConst;

import com.ams.customer.dao.CustomerDao;
import com.ams.customer.entity.Customer;
import com.ams.customer.model.CustomerModel;
import com.ams.customer.service.CustomerService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;
import com.util.web.ResourceContext;

/**
 * 客户管理
 * @author Wymann
 * @Data 2014-12-12 下午06:13:24
 *
 */
@Service
public class CustomerServiceImpl implements CustomerService{

	@Resource
	private CustomerDao customerDao;
	
	/**
	 * 保存
	 * @param model
	 */
	public Customer save(Customer customer) {
		if(null!=customer){
			customer.setCustomerId(IdGenerator.getInstance().getId());
			customer.setCustomerType(ResourceContext.getInstance().getValue(PropertyConst.CUSTOMER_WBDW));
			customerDao.save(customer);
		}
		return customer;
	}

	/**
	 * 修改
	 * @param model
	 */
	public Customer update(Customer model) {
		if(null!=model && StringUtils.isNotEmpty(model.getCustomerId())){
			Customer customer=new Customer();
			customer=customerDao.get(model.getCustomerId());
			if(null!=customer){
				customer.setContactPerson(model.getContactPerson());
				customer.setContatctAddress(model.getContatctAddress());
				customer.setContatctPhone(model.getContatctPhone());
				customer.setCustomerCode(model.getCustomerCode());
				customer.setCustomerName(model.getCustomerName());
				customer.setCustomerNote(model.getCustomerNote());
				customer.setCustomerType(model.getCustomerType());
				customerDao.update(customer);
				return customer;
			}
		}
		return model;
	}
	
	/**
	 * 删除客户信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Customer customer=customerDao.get(id);
			if(null!=customer){
				customerDao.delete(customer);
			}
		}
	}
	
	/**
	 * 获取客户信息
	 * @param id
	 * @return
	 */
	public Customer getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			return customerDao.get(id);
		}
		return null;
	}
	
	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<CustomerModel> findByCondition(CustomerModel model, Pager page) {
		return customerDao.findByCondition(model,page);
	}

	/**
	 * 检查客户是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	public boolean checkCustomer(String name, String id) {
		List<Customer> list=customerDao.checkCustomer(name,id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

	/**
	 * 根据名称获取客户信息
	 * @param name
	 * @return
	 */
	public Customer getByName(String name) {
		return customerDao.getByName(name);
	}

	/**
	 * 根据客户名称查找
	 * @param name 客户名称
	 * @return 返回客户实体，无返回null
	 */
	public Customer readCustomerByName(String name) {
		Customer customer=customerDao.getByName(name);
		return customer;
	}
}
