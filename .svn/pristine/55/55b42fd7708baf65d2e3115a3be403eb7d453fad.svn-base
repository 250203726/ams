package com.ams.infomanage.maintenanceinfo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.ams.infomanage.maintenanceinfo.dao.MaintenanceinfoDao;
import com.ams.infomanage.maintenanceinfo.entity.Maintenanceinfo;
import com.ams.infomanage.maintenanceinfo.model.MaintenanceinfoModel;
import com.ams.infomanage.maintenanceinfo.service.MaintenanceinfoService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 	维护公司管理
 *	@author simon
 */
@Service
public class MaintenanceinfoServiceImpl implements MaintenanceinfoService{
	
	@Resource
	private MaintenanceinfoDao maintenanceinfoDao;

	/**
	 * 保存维护公司
	 * @param model
	 * @return
	 */
	public Maintenanceinfo save(Maintenanceinfo model) {
		if(null!=model){
			model.setMaintenanceId(IdGenerator.getInstance().getId());
			maintenanceinfoDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改维护公司
	 * @param model
	 * @return
	 */
	public Maintenanceinfo update(Maintenanceinfo model) {
		if(null!=model && StringUtils.isNotEmpty(model.getMaintenanceId())){
			Maintenanceinfo maintenanceinfo=maintenanceinfoDao.get(model.getMaintenanceId());
			if(null!=maintenanceinfo){
				maintenanceinfo.setMaintenanceName(model.getMaintenanceName());;
				maintenanceinfo.setMaintenanceContacts(model.getMaintenanceContacts());
				maintenanceinfo.setMaintenanceContactsPhone(model.getMaintenanceContactsPhone());
				maintenanceinfoDao.update(maintenanceinfo);
				return maintenanceinfo;
			}
		}
		return null;
	}

	/**
	 * 删除维护公司信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Maintenanceinfo maintenanceinfo=maintenanceinfoDao.get(id);
			maintenanceinfoDao.delete(maintenanceinfo);
		}
	}

	/**
	 * 根据id查找维护公司信息
	 * @param id
	 * @return
	 */
	public Maintenanceinfo getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Maintenanceinfo maintenanceinfo=maintenanceinfoDao.get(id);
			return maintenanceinfo;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Maintenanceinfo> findByCondition(Maintenanceinfo model, Pager page) {
		return maintenanceinfoDao.findByCondition(model,page);
	}

	/**
	 * 根据名称获取维护公司信息
	 * @param name
	 * @return
	 */
	public Maintenanceinfo getByName(String name) {
		return maintenanceinfoDao.getByName(name);
	}

	/**
	 * 检查维护公司名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkMaintenanceinfo(String name, String id) {
		List<Maintenanceinfo> list=maintenanceinfoDao.checkMaintenanceinfo(name, id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
