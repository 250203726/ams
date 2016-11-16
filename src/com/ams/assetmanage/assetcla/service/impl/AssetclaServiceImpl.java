package com.ams.assetmanage.assetcla.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.assetmanage.assetcla.dao.AssetclaDao;
import com.ams.assetmanage.assetcla.entity.Assetcla;
import com.ams.assetmanage.assetcla.service.AssetclaService;
import com.ams.infomanage.supplier.entity.Supplier;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 资产类别管理
 * 
 * @author 
 * @Data 
 * 
 */
@Service
public class AssetclaServiceImpl implements AssetclaService {

	@Resource
	private AssetclaDao assetclaDao;

	/**
	 * 保存资产类别
	 * 
	 * @param 
	 * @return
	 */
	public Assetcla save(Assetcla model) {
		if (null != model) {
			model.setassettypeid(IdGenerator.getInstance().getId());
			assetclaDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改资产类别
	 * 
	 * @param 
	 * @return
	 */
	public Assetcla update(Assetcla model) {
		if (null != model && StringUtils.isNotEmpty(model.getassettypeid())) {
			Assetcla assetcla = assetclaDao.get(model.getassettypeid());
			if (null != assetcla) {
				assetcla.setassettypeid(model.getassettypeid());
				assetcla.setassettypename(model.getassettypename());
				assetclaDao.update(assetcla);
				return assetcla;
			}
		}
		return null;
	}

	/**
	 * 删除资产类别信息
	 * 
	 * @param id
	 */
	public void delete(String id) {
		if (StringUtils.isNotEmpty(id)) {
			Assetcla assetcla = assetclaDao.get(id);
			assetclaDao.delete(assetcla);
		}
	}

	/**
	 * 根据id查找资产类别信息
	 * 
	 * @param id
	 * @return
	 */
	public Assetcla getById(String id) {
		if (StringUtils.isNotEmpty(id)) {
			Assetcla assetcla = assetclaDao.get(id);
			return assetcla;
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
	public List<Assetcla> findByCondition(Assetcla model, Pager page) {
		return assetclaDao.findByCondition(model, page);
	}

	/**
	 * 根据名称获取资产类别信息
	 * @param name
	 * @return
	 */
	public Assetcla getByName(String name) {
		return assetclaDao.getByName(name);
	}
	
	/**
	 * 检查当前资产类别是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkAssetcla(String name, String id) {
		List<Assetcla> list = assetclaDao.checkAssetcla(name, id);
		if (!list.isEmpty() && list.size() > 0) {
			return true;
		}
		return false;
	}
}
