package com.ams.system.service;

import java.util.List;

import com.ams.system.entity.Manager;
import com.ams.system.model.ManagerModel;
import com.util.page.Pager;

/**
 * 项目经理管理
 * @author Wymann
 * @Data 2015-1-2 下午01:45:26
 *
 */
public interface ManagerService {

	/**
	 * 保存
	 * @param manager
	 * @return
	 */
	Manager save(Manager manager);
	
	/**
	 * 修改
	 * @param manager
	 * @return
	 */
	Manager update(Manager manager);

	/**
	 * 删除
	 * @param id
	 */
	boolean delete(String id);

	/**
	 * 修改状态
	 * @param id
	 * @param string
	 */
	void updateState(String id, String state);

	/**
	 * 根据id,获取项目经理信息
	 * @param id
	 * @return
	 */
	Manager getById(String id);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<ManagerModel> findByCondition(ManagerModel model, Pager page);

	/**
	 * 检查工号是否有重复
	 * @param code
	 * @param managerId
	 * @return
	 */
	boolean checkCode(String code, String managerId);

	/**
	 * 根据当前账号获取项目经理
	 * @param userId
	 * @return
	 */
	Manager findByRefuser(String userId);


}
