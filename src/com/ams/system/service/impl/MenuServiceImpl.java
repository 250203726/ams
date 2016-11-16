package com.ams.system.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.system.dao.MenuDao;
import com.ams.system.entity.Menu;
import com.ams.system.service.MenuService;
import com.util.generator.IdGenerator;

/**
 * 菜单管理
 * @author Wymann
 * @Data 2015-1-8 上午10:51:43
 *
 */
@Service
public class MenuServiceImpl implements MenuService{
	
	@Resource
	private MenuDao menuDao;

	/**
	 * 新增
	 * @param menu
	 * @return
	 */
	public Menu save(Menu menu) {
		if(null!=menu){
			menu.setMenuId(IdGenerator.getInstance().getId());
			menuDao.save(menu);
		}
		return menu;
	}

	/**
	 * 修改
	 * @param menu
	 * @return
	 */
	public Menu update(Menu model) {
		if(null!=model && StringUtils.isNotEmpty(model.getMenuId())){
			Menu menu=menuDao.get(model.getMenuId());
			if(null!=menu){
				menu.setEnable(model.getEnable());
				menu.setIcon(model.getIcon());
				menu.setLevels(model.getLevels());
				menu.setModuleId(model.getModuleId());
				menu.setName(model.getName());
				menu.setCode(model.getCode());
				menu.setSortCode(model.getSortCode());
				menu.setParams(model.getParams());
				menu.setParentId(model.getParentId());
				menu.setUrl(model.getUrl());
				menuDao.update(menu);
			}
		}
		return model;
	}

	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public boolean delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Menu menu=menuDao.get(id);
			if(null!=menu){
				if("0".equals(menu.getParentId())){//如果是父亲节点，就删除下面一级子节点
					menuDao.deleteByParentId(id);
				}
				menuDao.delete(menu);
				return true;
			}
		}
		return false;
	}

	/**
	 * 根据编号获取菜单
	 * @param id
	 * @return
	 */
	public Menu getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			return menuDao.get(id);
		}
		return null;
	}

}
