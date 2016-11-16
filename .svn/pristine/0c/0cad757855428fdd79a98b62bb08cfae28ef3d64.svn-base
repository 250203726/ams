package com.ams.customer.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.ams.customer.dao.CustomerDao;
import com.ams.customer.entity.Customer;
import com.ams.customer.model.CustomerModel;
import com.core.dao.impl.BaseDaoImpl;
import com.util.page.Pager;

/**
 * 客户管理
 * @author Wymann
 * @Data 2014-12-12 下午06:14:36
 *
 */
@Repository
public class CustomerDaoImpl extends BaseDaoImpl<Customer> implements CustomerDao{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<CustomerModel> findByCondition(CustomerModel model, Pager page) {
		log.info("客户管理，条件查询...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* ");
			sql.append("  from t_customer a ");
			sql.append(" where 1 = 1 ");
			if(StringUtils.isNotEmpty(model.getCustomerName())){
				sql.append("   and a.customer_Name like '%"+model.getCustomerName()+"%' ");
			}
			if(StringUtils.isNotEmpty(model.getCustomerCode())){
				sql.append("   and a.customer_Code like '"+model.getCustomerCode()+"%' ");
			}
			sql.append(" order by a.customer_Name asc ");
			
			return jdbcQuery(sql.toString(),page,CustomerModel.class);
		}catch(RuntimeException e){
			log.error("客户管理，条件查询失败，请检查！",e);
			throw e;
		}
	}

	/**
	 * 检查客户是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	public List<Customer> checkCustomer(String name, String id) {
		log.info("检查客户是否存在...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* from t_customer a where a.customer_Name='"+name+"'");
			if(StringUtils.isNotEmpty(id)){
				sql.append(" and a.customer_Id!='"+id+"'");
			}
			sql.append(" limit 1 ");
			return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Customer>(Customer.class));
		}catch (RuntimeException e) {
			log.error("检查客户是否存在失败，请检查！", e);
			throw e;
		}
	}

	/**
	 * 根据名称获取客户信息
	 * @param name
	 * @return
	 */
	public Customer getByName(String name) {
		log.info("根据名称获取客户信息...");
		try{
			StringBuffer sql=new StringBuffer();
			sql.append("select a.* from t_customer a where a.customer_Name='"+name+"'");
			sql.append(" limit 1 ");
			List<Customer> list=getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Customer>(Customer.class));
			if(!list.isEmpty() && list.size()>0){
				return list.get(0);
			}
			return null;
		}catch (RuntimeException e) {
			log.error("根据名称获取客户信息失败，请检查！", e);
			throw e;
		}
	}

}
