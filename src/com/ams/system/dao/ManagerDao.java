package com.ams.system.dao;

import java.util.List;

import com.ams.system.entity.Manager;
import com.ams.system.model.ManagerModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 项目经理管理
 * @author Wymann
 * @Data 2015-1-2 下午01:44:14
 *
 */
public interface ManagerDao extends BaseDao<Manager>{

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
