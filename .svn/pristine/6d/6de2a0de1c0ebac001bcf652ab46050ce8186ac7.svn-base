package com.ams.system.dao;

import java.util.List;

import com.ams.system.entity.Code;
import com.ams.system.model.CodeModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 合同简码管理
 * @author Wymann
 * @Date 2014-6-11 下午08:24:12
 *
 */
public interface CodeDao extends BaseDao<Code>{

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	List<CodeModel> findByCondition(CodeModel model, Pager page);

	/**
	 * 根据模块分类，查找合同编号简码
	 * @param moduleType
	 * @param contractType
	 * @return
	 */
	List<Code> getCode(String moduleType);

}
