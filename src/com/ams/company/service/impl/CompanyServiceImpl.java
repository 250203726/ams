package com.ams.company.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.company.dao.CompanyDao;
import com.ams.company.entity.Company;
import com.ams.company.model.CompanyModel;
import com.ams.company.service.CompanyService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 单位管理
 * @author Wymann
 * @Data 2014-12-12 下午06:11:32
 *
 */
@Service
public class CompanyServiceImpl implements CompanyService{
	
	@Resource
	private CompanyDao companyDao;

	/**
	 * 保存单位
	 * @param model
	 * @return
	 */
	public Company save(Company company) {
		if(null!=company){
			company.setCompanyId(IdGenerator.getInstance().getId());
			companyDao.save(company);
		}
		return company;
	}

	/**
	 * 修改单位
	 * @param model
	 * @return
	 */
	public Company update(Company model) {
		if(null!=model && StringUtils.isNotEmpty(model.getCompanyId())){
			Company company=companyDao.get(model.getCompanyId());
			if(null!=company){
				company.setAddress(model.getAddress());
				company.setCompanyName(model.getCompanyName());
				company.setCompanyType(model.getCompanyType());
				company.setPerson(model.getPerson());
				company.setPhone(model.getPhone());
				company.setRemark(model.getRemark());
				companyDao.update(company);
				return company;
			}
		}
		return model;
	}

	/**
	 * 删除单位信息
	 * @param id
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Company company=companyDao.get(id);
			companyDao.delete(company);
		}
	}

	/**
	 * 根据id查找单位信息
	 * @param id
	 * @return
	 */
	public Company getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			Company company=companyDao.get(id);
			return company;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<CompanyModel> findByCondition(CompanyModel model, Pager page) {
		return companyDao.findByCondition(model,page);
	}

	/**
	 * 检查当前单位是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	public boolean checkCompany(String name, String id) {
		List<Company> list=companyDao.checkCompany(name,id);
		if(!list.isEmpty() && list.size()>0){
			return true;
		}
		return false;
	}

	/**
	 * 根据名称获取单位信息
	 * @param name
	 * @return
	 */
	public Company getByName(String name) {
		return companyDao.getByName(name);
	}

}
