package com.ams.infomanage.supplier.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.ams.infomanage.supplier.dao.SupplierDao;
import com.ams.infomanage.supplier.entity.Supplier;
import com.ams.infomanage.supplier.model.SupplierModel;
import com.ams.infomanage.supplier.service.SupplierService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 	供应商管理
 *	@author simon
 */
@Service
public class SupplierServiceImpl implements SupplierService{
	
	@Resource
	private SupplierDao supplierDao;

	/**
	 * 保存厂商
	 * @param model
	 * @return
	 */
	public Supplier save(Supplier model) {
		if(null!=model){
			model.setSupplierId(IdGenerator.getInstance().getId());
			supplierDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改厂商
	 * @param model
	 * @return
	 */
	public Supplier update(Supplier model) {
		if(null!=model && StringUtils.isNotEmpty(model.getSupplierId())){
			Supplier supplier=supplierDao.get(model.getSupplierId());
			if(null!=supplier){
				supplier.setSupplierName(model.getSupplierName());;
				supplier.setSupplierId(model.getSupplierId());
				supplier.setSupplierContacts(model.getSupplierContacts());
				supplier.setSuppliercontactsPhone(model.getSuppliercontactsPhone());
				supplierDao.update(supplier);
				return supplier;
			}
		}
		return null;
	}

	/**
	 * 删除供应商信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Supplier supplier=supplierDao.get(id);
			supplierDao.delete(supplier);
		}
	}

	/**
	 * 根据id查找供应商信息
	 * @param id
	 * @return
	 */
	public Supplier getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Supplier supplier=supplierDao.get(id);
			return supplier;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Supplier> findByCondition(Supplier model, Pager page) {
		return supplierDao.findByCondition(model,page);
	}

	/**
	 * 根据名称获取供应商信息
	 * @param name
	 * @return
	 */
	public Supplier getByName(String name) {
		return supplierDao.getByName(name);
	}

	/**
	 * 检查供应商名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkSupplier(String name, String id) {
		List<Supplier> list=supplierDao.checkSupplier(name, id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
