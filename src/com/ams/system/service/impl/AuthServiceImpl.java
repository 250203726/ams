package com.ams.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.system.dao.AuthDao;
import com.ams.system.entity.Auth;
import com.ams.system.entity.User;
import com.ams.system.service.AuthService;
import com.util.generator.IdGenerator;

/**
 * 权限管理
 * @author Wymann
 * @Date 2014-5-10 下午09:46:03
 *
 */
@Service
public class AuthServiceImpl implements AuthService{
	
	@Resource
	private AuthDao authDao;
	
	/**
	 * 保存
	 * @param auth
	 * @return
	 */
	public Auth save(Auth auth) {
		if(null!=auth){
			auth.setAuthId(IdGenerator.getInstance().getId());
			authDao.save(auth);
		}
		return auth;
	}

	/**
	 * 修改
	 * @param auth
	 * @return
	 */
	public Auth update(Auth model) {
		if(null!=model && StringUtils.isNotEmpty(model.getAuthId())){
			Auth auth=authDao.get(model.getAuthId());
			if(null!=auth){
				auth.setAuthName(model.getAuthName());
				auth.setAuthority(model.getAuthority());
				auth.setEnable(model.getEnable());
				auth.setParentId(model.getParentId());
				auth.setSortCode(model.getSortCode());
				authDao.update(auth);
			}
		}
		return model;
	}

	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public boolean delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			Auth auth=authDao.get(id);
			if(null!=auth){
				if("0".equals(auth.getParentId())){
					authDao.deleteByParentId(id);
				}
				authDao.delete(auth);
				return true;
			}
		}
		return false;
	}

	/**
	 * 根据id获取权限
	 * @param id
	 * @return
	 */
	public Auth getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			return authDao.get(id);
		}
		return null;
	}

	/**
	 * 查询用户权限值
	 * @param user
	 * @return 
	 * @author Whymann 2014-5-11 下午05:31:12
	 */
	public List<String> getPtree(User user) {
		if(null!=user){
			return authDao.getPtree(user);
		}
		return null;
	}

	/**
	 * 根据角色获取权限列表
	 * @param id
	 * @return 
	 * @author Whymann 2014-5-12 下午03:59:13
	 */
	public List<Auth> getByRoleId(String id) {
		return authDao.getByRoleId(id);
	}

	/**
	 * 查找所有权限
	 * @return 
	 * @author Whymann 2014-5-12 下午04:49:15
	 */
	public List<Auth> findAll() {
		return authDao.findAll();
	}

}
