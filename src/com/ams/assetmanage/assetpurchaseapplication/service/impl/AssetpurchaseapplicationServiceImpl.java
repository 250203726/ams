package com.ams.assetmanage.assetpurchaseapplication.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.ams.assetmanage.assetpurchaseapplication.dao.AssetpurchaseapplicationDao;
import com.ams.assetmanage.assetpurchaseapplication.entity.Assetpurchaseapplication;
import com.ams.assetmanage.assetpurchaseapplication.model.AssetpurchaseapplicationModel;
import com.ams.assetmanage.assetpurchaseapplication.service.AssetpurchaseapplicationService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 	资产购置信息管理
 *	@author simon
 */
@Service
public class AssetpurchaseapplicationServiceImpl implements AssetpurchaseapplicationService{
	
	@Resource
	private AssetpurchaseapplicationDao assetpurchaseapplicationDao;

	/**
	 * 保存资产购置申请
	 * @param model
	 * @return
	 */
	public Assetpurchaseapplication save(Assetpurchaseapplication model) {
		if(null!=model){
			model.setPurchaseapplicationId (IdGenerator.getInstance().getId());
			assetpurchaseapplicationDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改资产购置申请
	 * @param model
	 * @return
	 */
	public Assetpurchaseapplication update(Assetpurchaseapplication model) {
		if(null!=model && StringUtils.isNotEmpty(model.getPurchaseapplicationId ())){
			Assetpurchaseapplication assetpurchaseapplication=assetpurchaseapplicationDao.get(model.getPurchaseapplicationId ());
			if(null!=assetpurchaseapplication){
				assetpurchaseapplication.setPurchaseapplicationId(model.getPurchaseapplicationId());;
				assetpurchaseapplication.setUserId(model.getUserId());;
				assetpurchaseapplication.setPurchaseDepartment(model.getPurchaseDepartment());
				assetpurchaseapplication.setApplicant(model.getApplicant());
				assetpurchaseapplication.setApplicationTime(model.getApplicationTime());;
				assetpurchaseapplication.setAssetnameId(model.getAssetnameId());
				assetpurchaseapplication.setSpecificationModel(model.getSpecificationModel());
				assetpurchaseapplication.setPurchaseQuantity(model.getPurchaseQuantity());;
				assetpurchaseapplication.setBudgetFunds(model.getBudgetFunds());
				assetpurchaseapplication.setPurchaseReason(model.getPurchaseReason());
				assetpurchaseapplication.setRemark(model.getRemark());;
				assetpurchaseapplication.setApproveOpinion(model.getApproveOpinion());
				assetpurchaseapplication.setApprover(model.getApprover());
				assetpurchaseapplicationDao.update(assetpurchaseapplication);
				return assetpurchaseapplication;
			}
		}
		return null;
	}

	/**
	 * 删除资产购置申请信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Assetpurchaseapplication assetpurchaseapplication=assetpurchaseapplicationDao.get(id);
			assetpurchaseapplicationDao.delete(assetpurchaseapplication);
		}
	}

	/**
	 * 根据id查找资产购置申请信息entity
	 * @param id
	 * @return
	 */
	public Assetpurchaseapplication getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Assetpurchaseapplication assetpurchaseapplication=assetpurchaseapplicationDao.get(id);
			return assetpurchaseapplication;
		}
		return null;
	}
	
	/**
	 * 根据id查找资产购置申请信息entity
	 * @param id
	 * @return
	 */
	public AssetpurchaseapplicationModel getModelById(String id) {
		if(StringUtils.isNotEmpty(id)){
			AssetpurchaseapplicationModel assetpurchaseapplicationModel=assetpurchaseapplicationDao.getModel(id);
			return assetpurchaseapplicationModel;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<AssetpurchaseapplicationModel> findByCondition(AssetpurchaseapplicationModel model, Pager page) {
		return assetpurchaseapplicationDao.findByCondition(model,page);
	}

	/**
	 * 根据用户编号获取资产购置申请信息
	 * @param name
	 * @return
	 */
	public Assetpurchaseapplication getByName(String name) {
		return assetpurchaseapplicationDao.getByName(name);
	}

	/**
	 * 检查用户编号是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkAssetpurchaseapplication(String name, String id) {
		List<Assetpurchaseapplication> list=assetpurchaseapplicationDao.checkAssetpurchaseapplication(name, id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
