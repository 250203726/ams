package com.ams.infomanage.maintenanceinfo.dao;

import java.util.List;

import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.infomanage.maintenanceinfo.entity.Maintenanceinfo;
import com.ams.infomanage.maintenanceinfo.model.MaintenanceinfoModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 维护公司信息管理
 * @author Wymann
 * @Data 2014-12-12 下午06:11:59
 *
 */
public interface MaintenanceinfoDao extends BaseDao<Maintenanceinfo>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<Maintenanceinfo> findByCondition(Maintenanceinfo model, Pager page);

	/**
	 * 检查当前维护公司信息是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	List<Maintenanceinfo> checkMaintenanceinfo(String name, String id);
	
	/**
	 * 根据名称获取维护公司信息
	 * @param name
	 * @return
	 */
	Maintenanceinfo getByName(String name);

}
