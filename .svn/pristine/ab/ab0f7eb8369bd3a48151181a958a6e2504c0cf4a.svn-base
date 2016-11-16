package com.ams.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.system.dao.RoleAuthDao;
import com.ams.system.dao.RoleDao;
import com.ams.system.entity.Role;
import com.ams.system.entity.RoleAuth;
import com.ams.system.model.RoleModel;
import com.ams.system.service.RoleService;
import com.util.generator.IdGenerator;
import com.util.page.Pager;

/**
 * 角色管理
 * @author Wymann
 * @Date 2014-5-10 下午10:02:26
 *
 */
@Service
public class RoleServiceImpl implements RoleService{
	
	@Resource
	private RoleDao roleDao;
	
	@Resource
	private RoleAuthDao roleAuthDao;

	/**
	 * 根据用户编码获取用户角色
	 * @param userId
	 * @return 
	 * @author Whymann 2014-5-12 上午12:07:16
	 */
	public List<Role> getByUserId(String userId) {
		return roleDao.getByUserId(userId);
	}

	/**
	 * 查找所有角色
	 * @return 
	 * @author Whymann 2014-5-12 下午02:51:02
	 */
	public List<Role> findAll() {
		return roleDao.findAll();
	}

	/**
	 * 获取角色
	 * @param id
	 * @return 
	 * @author Whymann 2014-5-12 下午03:58:29
	 */
	public Role getByRoleId(String id) {
		if(StringUtils.isNotEmpty(id)){
			return roleDao.get(id);
		}
		return new Role();
	}

	/**
	 * 保存角色和角色关联权限
	 * @param role
	 * @param auth 
	 * @author Whymann 2014-5-12 下午05:17:26
	 */
	public void save(Role role, String auth) {
		if(null!=role){
			/**
			 * 第一步，保存角色
			 */
			role.setRoleId(IdGenerator.getInstance().getId());
			roleDao.save(role);
			
			/**
			 * 第二步，保存角色关联权限
			 */
			if(StringUtils.isNotEmpty(auth)){
				for(String authId:auth.split(",")){
					RoleAuth roleAuth=new RoleAuth();
					roleAuth.setRoleAuthId(IdGenerator.getInstance().getId());
					roleAuth.setRoleId(role.getRoleId());
					roleAuth.setAuthId(authId);
					roleAuthDao.save(roleAuth);
				}
			}
		}
		
	}

	/**
	 * 更新角色和角色关联权限
	 * @param role
	 * @param auth 
	 * @author Whymann 2014-5-12 下午05:17:39
	 */
	public void update(Role role, String auth) {
		if(null!=role && StringUtils.isNotEmpty(role.getRoleId())){
			/**
			 * 第一步，修改角色
			 */
			Role oldRole=roleDao.get(role.getRoleId());
			if(null!=oldRole){
				oldRole.setRoleName(role.getRoleName());
				roleDao.update(oldRole);
				
				/**
				 * 第二步，删除角色关联权限
				 */
				roleAuthDao.deleteByRoleId(role.getRoleId());
				
				/**
				 * 第三步，保存角色关联权限
				 */
				if(StringUtils.isNotEmpty(auth)){
					for(String authId:auth.split(",")){
						RoleAuth roleAuth=new RoleAuth();
						roleAuth.setRoleAuthId(IdGenerator.getInstance().getId());
						roleAuth.setRoleId(role.getRoleId());
						roleAuth.setAuthId(authId);
						roleAuthDao.save(roleAuth);
					}
				}
			}
		}
		
	}

	/**
	 * 删除角色和角色关联权限
	 * @param id 
	 * @author Whymann 2014-5-12 下午05:17:55
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			/**
			 * 第一步，删除角色关联权限
			 */
			roleAuthDao.deleteByRoleId(id);
			
			/**
			 * 第二步，删除角色
			 */
			Role role=roleDao.get(id);
			roleDao.delete(role);
			
		}
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return 
	 * @author Whymann 2014-5-12 下午05:47:42
	 */
	public List<Role> findByCondition(RoleModel model, Pager page) {
		return roleDao.findByCondition(model,page);
	}

}
