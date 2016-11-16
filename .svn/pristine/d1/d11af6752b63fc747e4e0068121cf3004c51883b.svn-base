package com.ams.system.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.system.dao.ManagerDao;
import com.ams.system.entity.Manager;
import com.ams.system.model.ManagerModel;
import com.ams.system.service.ManagerService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 项目经理管理
 * @author Wymann
 * @Data 2015-1-2 下午01:44:06
 *
 */
@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Resource
	private ManagerDao managerDao;

	/**
	 * 保存
	 * @param manager
	 * @return
	 */
	public Manager save(Manager manager) {
		if(null!=manager){
			manager.setManagerId(IdGenerator.getInstance().getId());
			manager.setCreateTime(new Date());
			managerDao.save(manager);
		}
		return manager;
	}

	/**
	 * 修改
	 * @param manager
	 * @return
	 */
	public Manager update(Manager model) {
		if(null!=model && StringUtils.isNotEmpty(model.getManagerId())){
			Manager manager=managerDao.get(model.getManagerId());
			if(null!=manager){
				manager.setCode(model.getCode());
				manager.setRefuser(model.getRefuser());
				manager.setEnable(model.getEnable());
				manager.setManagerName(model.getManagerName());
				manager.setTel(model.getTel());
				managerDao.update(manager);
			}
		}
		return model;
	}

	/**
	 * 删除
	 * @param id
	 */
	public boolean delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Manager manager=managerDao.get(id);
			if(null!=manager){
				managerDao.delete(manager);
				return true;
			}
		}
		return false;
	}

	/**
	 * 修改状态
	 * @param id
	 * @param state
	 */
	public void updateState(String id, String state) {
		if(StringUtils.isNotEmpty(id) && StringUtils.isNotEmpty(state)){
			Manager manager=managerDao.get(id);
			if(null!=manager){
				manager.setEnable(state);
			}
		}
	}

	/**
	 * 根据id,获取信息
	 * @param id
	 * @return
	 */
	public Manager getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			return managerDao.get(id);
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<ManagerModel> findByCondition(ManagerModel model, Pager page) {
		return managerDao.findByCondition(model,page);
	}

	/**
	 * 检查工号是否有重复
	 */
	public boolean checkCode(String code, String managerId) {
		return managerDao.checkCode(code,managerId);
	}

	@Override
	public Manager findByRefuser(String userId) {
		return managerDao.findByRefuser(userId);
	}

}
