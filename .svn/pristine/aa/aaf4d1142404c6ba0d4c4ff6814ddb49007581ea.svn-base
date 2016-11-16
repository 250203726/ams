package com.ams.assetmanage.assetchange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.assetmanage.assetchange.dao.AssetChangeDao;
import com.ams.assetmanage.assetchange.entity.AssetChange;
import com.ams.assetmanage.assetchange.model.AssetChangeModel;
import com.ams.assetmanage.assetchange.service.AssetChangeService;
import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.ams.infomanage.depart.dao.DepartDao;
import com.ams.infomanage.depart.entity.Depart;
import com.ams.infomanage.depart.model.DepartModel;
import com.ams.infomanage.depart.service.DepartService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 资产调业务层实现类
 * @author simon
 * @date 2016年11月1日 下午9:10:45
 */
@Service
public class AssetChangeServiceImpl implements AssetChangeService{
	
	@Resource
	private AssetChangeDao assetChangeDao;

	/**
	 * 保存
	 * @author simon
	 * @date 2016年11月1日 下午9:11:23
	 * @param model
	 * @return
	 */
	public AssetChange save(AssetChange model) {
		if(null!=model){
			model.setAciId(IdGenerator.getInstance().getId());
			assetChangeDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 更新
	 * @author simon
	 * @date 2016年11月1日 下午9:12:03
	 * @param model
	 * @return
	 */
	public AssetChange update(AssetChange model) {
		if(null!=model && StringUtils.isNotEmpty(model.getAciId())){
			AssetChange assetChange=assetChangeDao.get(model.getAciId());
			if(null!=assetChange){
				assetChange.setAssetId(model.getAssetId());
				assetChange.setOriginalDepartment(model.getOriginalDepartment());
				assetChange.setOriginalPrincipal(model.getOriginalPrincipal());
				assetChange.setNowDepartment(model.getNowDepartment());
				assetChange.setNowPrincipal(model.getNowPrincipal());
				assetChange.setChangeTmie(model.getChangeTmie());
				assetChange.setAssetStatus(model.getAssetStatus());
				assetChange.setAsseAttach(model.getAsseAttach());
				assetChange.setRemark(model.getRemark());
				assetChangeDao.update(assetChange);
				return assetChange;
			}
		}
		return null;
	}

	/**
	 * 删除
	 * @author simon
	 * @param id
	 * @return
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			AssetChange assetChange=assetChangeDao.get(id);
			assetChangeDao.delete(assetChange);
		}
	}

	/**
	 * 通过ID找实体
	 * @param id
	 * @return
	 */
	public AssetChange getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			AssetChange assetChange=assetChangeDao.get(id);
			return assetChange;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<AssetChangeModel> findByCondition(AssetChangeModel model, Pager page) {
		List<AssetChangeModel> list=assetChangeDao.findByCondition(model,page);
		//将1，0变成领用，归还
		for(int i=0;i<list.size();i++){
			if(list.get(i).getAssetStatus().equals("1")){
				list.get(i).setAssetStatus("领用中");
			}else if(list.get(i).getAssetStatus().equals("0")){
				list.get(i).setAssetStatus("已归还");
			}
		}
		return list;
	}

	/**
	 * 是否归还
	 * @author simon
	 * @param id
	 * @return
	 */
	public boolean isBack(String id) {
		AssetChangeModel assetChangeModel=new AssetChangeModel();
		assetChangeModel.setAssetId(id);
		assetChangeModel.setAssetStatus("1");//1表示领用，0表示归还
		List<AssetChangeModel> list=findByCondition(assetChangeModel, (new Pager()));
		if(list.size()>0){
			return false;//大于0则表示有已经领用的资产，则没有归还，返回错误
		}else {
			return true;
		}
	}

	/**
	 *  通过ID找model
	 */
	public AssetChangeModel getModelById(String id) {
		if(StringUtils.isNotEmpty(id)){
			AssetChangeModel assetChangeModel=assetChangeDao.getModel(id);
			return assetChangeModel;
		}
		return null;
	}
}
