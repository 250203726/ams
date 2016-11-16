package com.ams.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ams.system.dao.CodeDao;
import com.ams.system.entity.Code;
import com.ams.system.model.CodeModel;
import com.ams.system.service.CodeService;
import com.util.page.Pager;

/**
 * 合同简码管理
 * @author Wymann
 * @Date 2014-6-11 下午08:23:44
 *
 */
@Service
public class CodeServiceImpl implements CodeService{
	
	@Resource
	private CodeDao codeDao;

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return 
	 * @author Whymann 2014-6-11 下午08:35:11
	 */
	public List<CodeModel> findByCondition(CodeModel model, Pager page) {
		return codeDao.findByCondition(model,page);
	}

	/**
	 * 根据模块分类，和合同类型，查找合同编号简码
	 * @param moduleType
	 * @param contractType
	 * @return 
	 * @author Whymann 2014-6-12 下午01:48:54
	 */
	public String getCode(String moduleType) {
		List<Code> list=codeDao.getCode(moduleType);
		if(!list.isEmpty() && list.size()>0){
			return list.get(0).getCode();
		}
		return "";
	}

}
