package com.ams.infomanage.maintenanceinfo.service;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.maintenanceinfo.entity.Maintenanceinfo;
import com.ams.infomanage.maintenanceinfo.model.MaintenanceinfoModel;
import com.util.page.Pager;

/**
 * 维护公司信息管理
 * @author simon
 */
public interface MaintenanceinfoService {
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	Maintenanceinfo save(Maintenanceinfo model);

	/**
	 * 更新
	 * @param model
	 * @return
	 */
	Maintenanceinfo update(Maintenanceinfo model);

	/**
	 * 删除 
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据id查找维护公司信息
	 * @param id
	 * @return
	 */
	Maintenanceinfo getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Maintenanceinfo> findByCondition(Maintenanceinfo model, Pager page);
	
	/**
	 * 检查维护公司名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkMaintenanceinfo(String name, String id);
	
	/**
	 * 根据名称获取维护公司信息信息
	 * @param name
	 * @return
	 */
	Maintenanceinfo getByName(String name);

}
