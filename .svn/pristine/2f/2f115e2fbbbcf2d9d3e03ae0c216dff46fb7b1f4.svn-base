package com.ams.assetmanage.assetdamage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.assetmanage.assetdamage.dao.AssetdamageDao;
import com.ams.assetmanage.assetdamage.entity.Assetdamage;
import com.ams.assetmanage.assetdamage.model.AssetdamageModel;
import com.ams.assetmanage.assetdamage.service.AssetdamageService;
import com.ams.assetmanage.maintenanceRecord.model.MaintenanceRecordModel;
import com.ams.infomanage.supplier.entity.Supplier;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 资产报损
 * 
 * @author 
 * @Data 
 * 
 */
@Service
public class AssetdamageServiceImpl implements AssetdamageService {

	@Resource
	private AssetdamageDao assetdamageDao;

	/**
	 * 保存资产报损
	 * 
	 */
	public Assetdamage save(Assetdamage model) {
		if (null != model) {
			model.setAssetDamageID(IdGenerator.getInstance().getId());
			assetdamageDao.save(model);
			return model;
		}
		return null;
	}

	
	/**
	 * 更新
	 * 
	 * @param 
	 * @return
	 */
	public Assetdamage update(Assetdamage model) {
		if (null != model && StringUtils.isNotEmpty(model.getAssetDamageID())) {
			Assetdamage assetdamage = assetdamageDao.get(model.getAssetDamageID());
			if (null != assetdamage) {
				assetdamage.setAssetDamageID(model.getAssetDamageID());
				assetdamage.setAssetId(model.getAssetId());
				assetdamage.setAssetDamageRemark(model.getAssetDamageRemark());
				assetdamage.setAssetDamageReason(model.getAssetDamageReason());
				assetdamage.setAssetDamageOpinion(model.getAssetDamageOpinion());
				assetdamage.setUserId(model.getUserId());
				assetdamage.setAppDate(model.getAppDate());
				assetdamage.setLastOpinion(model.getLastOpinion());
				assetdamageDao.update(assetdamage);
				return assetdamage;
			}
		}
		return null;
	}

	
	/**
	 * 删除资产报损
	 * 
	 * @param id
	 */
	public void delete(String id) {
		if (StringUtils.isNotEmpty(id)) {
			Assetdamage assetdamage = assetdamageDao.get(id);
			assetdamageDao.delete(assetdamage);
		}
	}

	
	/**
	 * 根据id查找资产报损实体
	 * 
	 * @param id
	 * @return
	 */
	public Assetdamage getById(String id) {
		if (StringUtils.isNotEmpty(id)) {
			Assetdamage assetdamage = assetdamageDao.get(id);
			return assetdamage;
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
	public List<AssetdamageModel> findByCondition(AssetdamageModel model, Pager page) {
		return assetdamageDao.findByCondition(model, page);
	}

	
	/**
	 * 检查当前资产报损是否存在
	 * 
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkAssetdamage(String name, String id) {
		List<Assetdamage> list = assetdamageDao.checkAssetdamage(name, id);
		if (!list.isEmpty() && list.size() > 0) {
			return true;
		}
		return false;
	}

	
	/**
	 * 通过id找model
	 */
	@Override
	public AssetdamageModel getModelById(String id) {
		if(StringUtils.isNotEmpty(id)){
			AssetdamageModel assetdamageModel=assetdamageDao.getModel(id);
			return assetdamageModel;
		}
		return null;
	}

}
