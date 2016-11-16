package com.ams.infomanage.depart.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.ams.infomanage.depart.dao.DepartDao;
import com.ams.infomanage.depart.entity.Depart;
import com.ams.infomanage.depart.model.DepartModel;
import com.ams.infomanage.depart.service.DepartService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 	部门管理
 *	@author simon
 */
@Service
public class DepartServiceImpl implements DepartService{
	
	@Resource
	private DepartDao departDao;

	/**
	 * 保存单位
	 * @param model
	 * @return
	 */
	public Depart save(Depart model) {
		if(null!=model){
			model.setDepartId(IdGenerator.getInstance().getId());
			departDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改单位
	 * @param model
	 * @return
	 */
	public Depart update(Depart model) {
		if(null!=model && StringUtils.isNotEmpty(model.getDepartId())){
			Depart depart=departDao.get(model.getDepartId());
			if(null!=depart){
				depart.setDepartName(model.getDepartName());;
				depart.setDepartAdd(model.getDepartAdd());
				depart.setDepartOwner(model.getDepartOwner());
				departDao.update(depart);
				return depart;
			}
		}
		return null;
	}

	/**
	 * 删除单位信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Depart depart=departDao.get(id);
			departDao.delete(depart);
		}
	}

	/**
	 * 根据id查找单位信息
	 * @param id
	 * @return
	 */
	public Depart getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Depart depart=departDao.get(id);
			return depart;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Depart> findByCondition(Depart model, Pager page) {
		return departDao.findByCondition(model,page);
	}

	/**
	 * 根据名称获取单位信息
	 * @param name
	 * @return
	 */
	public Depart getByName(String name) {
		return departDao.getByName(name);
	}

	/**
	 * 检查部门名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkDepart(String name, String id) {
		List<Depart> list=departDao.checkDepart(name, id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
