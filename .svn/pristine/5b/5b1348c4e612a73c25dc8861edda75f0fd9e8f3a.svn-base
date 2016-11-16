package com.ams.infomanage.factory.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.ams.infomanage.factory.dao.FactoryDao;
import com.ams.infomanage.factory.entity.Factory;
import com.ams.infomanage.factory.model.FactoryModel;
import com.ams.infomanage.factory.service.FactoryService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 	厂商管理
 *	@author simon
 */
@Service
public class FactoryServiceImpl implements FactoryService{
	
	@Resource
	private FactoryDao factoryDao;

	/**
	 * 保存厂商
	 * @param model
	 * @return
	 */
	public Factory save(Factory model) {
		if(null!=model){
			model.setFactoryId(IdGenerator.getInstance().getId());
			factoryDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改厂商
	 * @param model
	 * @return
	 */
	public Factory update(Factory model) {
		if(null!=model && StringUtils.isNotEmpty(model.getFactoryId())){
			Factory factory=factoryDao.get(model.getFactoryId());
			if(null!=factory){
				factory.setFactoryName(model.getFactoryName());;
				factory.setFactoryId(model.getFactoryId());
				factory.setFactoryContacts(model.getFactoryContacts());
				factory.setFactorycontactsPhone(model.getFactorycontactsPhone());
				factoryDao.update(factory);
				return factory;
			}
		}
		return null;
	}

	/**
	 * 删除厂商信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Factory factory=factoryDao.get(id);
			factoryDao.delete(factory);
		}
	}

	/**
	 * 根据id查找厂商信息
	 * @param id
	 * @return
	 */
	public Factory getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Factory factory=factoryDao.get(id);
			return factory;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Factory> findByCondition(Factory model, Pager page) {
		return factoryDao.findByCondition(model,page);
	}

	/**
	 * 根据名称获取厂商信息
	 * @param name
	 * @return
	 */
	public Factory getByName(String name) {
		return factoryDao.getByName(name);
	}

	/**
	 * 检查厂商名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkFactory(String name, String id) {
		List<Factory> list=factoryDao.checkFactory(name, id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
