package com.ams.system.service;

import java.util.List;

import com.ams.system.model.CodeModel;
import com.util.page.Pager;

/**
 * 合同简码管理
 * @author Wymann
 * @Date 2014-6-11 下午08:23:27
 *
 */
public interface CodeService {

	/**
	 * 根据模块分类，查找合同编号简码
	 * @param moduleType
	 * @param contractType
	 * @return
	 */
	String getCode(String moduleType);
	
	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<CodeModel> findByCondition(CodeModel model, Pager page);


}
