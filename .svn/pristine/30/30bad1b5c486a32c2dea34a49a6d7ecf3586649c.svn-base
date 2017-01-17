package com.ams.infomanage.unit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.infomanage.supplier.entity.Supplier;
import com.ams.infomanage.unit.dao.UnitDao;
import com.ams.infomanage.unit.entity.Unit;
import com.ams.infomanage.unit.service.UnitService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 单位service实现类
 * @author simon
 * @date 2017年1月17日 下午3:06:54
 */
@Service
public class UnitServiceImpl implements UnitService {

	@Resource
	private UnitDao	unitDao;

	/**
	 * 保存单位
	 * 
	 * @param 
	 * @return
	 */
	public Unit save(Unit model) {
		if (null != model) {
			model.setUnitId(IdGenerator.getInstance().getId());
			unitDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改单位
	 * 
	 * @param 
	 * @return
	 */
	public Unit update(Unit model) {
		if (null != model && StringUtils.isNotEmpty(model.getUnitId())) {
			Unit unit = unitDao.get(model.getUnitId());
			if (null != unit) {
				unit.setUnitId(model.getUnitId());
				unit.setUnitName(model.getUnitName());
				unitDao.update(unit);
				return unit;
			}
		}
		return null;
	}

	/**
	 * 删除单位
	 * 
	 * @param id
	 */
	public void delete(String id) {
		if (StringUtils.isNotEmpty(id)) {
			Unit unit = unitDao.get(id);
			unitDao.delete(unit);
		}
	}

	/**
	 * 根据id查找单位
	 * 
	 * @param id
	 * @return
	 */
	public Unit getById(String id) {
		if (StringUtils.isNotEmpty(id)) {
			Unit unit = unitDao.get(id);
			return unit;
		}
		return null;
	}

	/**
	 * 条件查询
	 * 
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Unit> findByCondition(Unit model, Pager page) {
		return unitDao.findByCondition(model, page);
	}

	/**
	 * 根据单位名称获取单位
	 * @param name
	 * @return
	 */
	public Unit getByName(String name) {
		return unitDao.getByName(name);
	}
	
	/**
	 * 检查当前单位是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkUnit(String name, String id) {
		List<Unit> list = unitDao.checkUnit(name, id);
		if (!list.isEmpty() && list.size() > 0) {
			return true;
		}
		return false;
	}
}
