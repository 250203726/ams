package com.ams.assetmanage.maintenanceRecord.service;

import java.util.List;

import com.ams.assetmanage.maintenanceRecord.entity.MaintenanceRecord;
import com.ams.assetmanage.maintenanceRecord.model.MaintenanceRecordModel;
import com.util.page.Pager;

/**
 * 资产维护记录service层接口
 * @author JackH
 *
 */
public interface MaintenanceRecordService {

	/**
	 * 保存资产维护记录
	 * @param model
	 * @return
	 */
	MaintenanceRecord save(MaintenanceRecord model);
	
	/**
	 * 修改资产维护记录
	 * @param model
	 * @return
	 */
	MaintenanceRecord update(MaintenanceRecord model);
	
	/**
	 * 删除资产维护记录
	 * @param id
	 */
	void delete(String id);
	
	/**
	 * 根据id查找资产维护记录类
	 * @param id
	 * @return
	 */
	MaintenanceRecord getById(String id);
	
	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<MaintenanceRecordModel> findByCondition(MaintenanceRecordModel model, Pager page);
	
	
	/**
	 * 根据id查找model
	 * @param name
	 * @return
	 */
	MaintenanceRecordModel getModelById(String id);

	/**
	 * 检查资产维护信息是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	boolean checkMaintenanceRecord(String name, String id);
	
	
}
