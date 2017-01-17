package com.ams.assetmanage.assettype.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import com.ams.assetmanage.assettype.dao.AssettypeDao;
import com.ams.assetmanage.assettype.entity.Assettype;
import com.ams.assetmanage.assettype.service.AssettypeService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 	资产类型管理
 *	@author 
 */
@Service
public class AssettypeServiceImpl implements AssettypeService{
	
	@Resource
	private AssettypeDao assettypeDao;

	/**
	 * 保存
	 * @param model
	 * @return
	 */
	public Assettype save(Assettype model) {
		if(null!=model){
			model.setAssettypeId(IdGenerator.getInstance().getId());
			assettypeDao.save(model);
			return model;
		}
		return null;
	}

	/**
	 * 修改
	 * @param model
	 * @return
	 */
	public Assettype update(Assettype model) {
		if(null!=model && StringUtils.isNotEmpty(model.getAssettypeId())){
			Assettype assettype = assettypeDao.get(model.getAssettypeId());
			if(null!=assettype){
				assettype.setAssettypeName(model.getAssettypeName());;
				assettype.setUnitId(model.getUnitId());
				assettypeDao.update(assettype);
				return assettype;
			}
		}
		return null;
	}

	/**
	 * 删除
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Assettype assettype=assettypeDao.get(id);
			assettypeDao.delete(assettype);
		}
	}

	/**
	 * 根据id查找资产类型信息
	 * @param id
	 * @return
	 */
	public Assettype getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Assettype assettype = assettypeDao.get(id);
			return assettype;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<Assettype> findByCondition(Assettype model, Pager page) {
		return assettypeDao.findByCondition(model,page);
	}

	/**
	 * 根据类型获取资产类型信息
	 * @param name
	 * @return
	 */
	public Assettype getByName(String name) {
		return assettypeDao.getByName(name);
	}

	/**
	 * 检查资产名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@Override
	public boolean checkAssettypeName(String name, String id) {
		List<Assettype> list=assettypeDao.checkAssettypeNam(name, id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

}
