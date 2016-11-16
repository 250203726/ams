package com.ams.system.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.system.dao.UserDao;
import com.ams.system.dao.UserRoleDao;
import com.ams.system.entity.User;
import com.ams.system.entity.UserRole;
import com.ams.system.service.UserRoleService;
import com.util.enums.dic.StateEnum;
import com.util.generator.IdGenerator;
import com.util.md5.Security;

/**
 * 用户角色管理
 * @author Wymann
 * @Date 2014-5-12 下午03:05:43
 *
 */
@Service
public class UserRoleServiceImpl implements UserRoleService{
	
	@Resource
	private UserDao userDao;
	
	@Resource
	private UserRoleDao userRoleDao;

	/**
	 * 新建用户和角色
	 * @param user
	 * @param role 
	 * @author Whymann 2014-5-12 下午03:06:13
	 */
	public void save(User user, String role) {
		if(null!=user){
			/**
			 * 第一步，保存用户信息
			 */
			user.setUserId(IdGenerator.getInstance().getId());
			user.setPassword(Security.md5(user.getPassword()));
			user.setEnable(StateEnum.VALID.toString());
			userDao.save(user);
			
			/**
			 * 第二步，保存用户角色关联信息
			 */
			if(StringUtils.isNotEmpty(role)){
				for(String roleId : role.split(",")){
					UserRole userRole=new UserRole();
					userRole.setUserRoleId(IdGenerator.getInstance().getId());
					userRole.setUserId(user.getUserId());
					userRole.setRoleId(roleId);
					userRoleDao.save(userRole);
				}
			}
		}
	}

	/**
	 * 修改用户和角色
	 * @param user
	 * @param role 
	 * @author Whymann 2014-5-12 下午03:06:31
	 */
	public void update(User user, String role) {
		if(null!=user && StringUtils.isNotEmpty(user.getUserId())){
			/**
			 * 第一步，修改用户信息
			 */
			User oldUser=userDao.get(user.getUserId());
			if(null!=oldUser){
				oldUser.setPhone(user.getPhone());
				oldUser.setRealName(user.getRealName());
				userDao.update(oldUser);
				
				
				/**
				 * 第二步，删除用户关联角色
				 */
				userRoleDao.deleteByUserId(user.getUserId());
				
				/**
				 * 第三步，重新保存用户角色关联信息
				 */
				if(StringUtils.isNotEmpty(role)){				
					for(String roleId : role.split(",")){
						UserRole userRole=new UserRole();
						userRole.setUserRoleId(IdGenerator.getInstance().getId());
						userRole.setUserId(user.getUserId());
						userRole.setRoleId(roleId);
						userRoleDao.save(userRole);
					}
				}
			}
		}
		
	}

}
