package com.ams.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ams.system.dao.UserDao;
import com.ams.system.dao.UserRoleDao;
import com.ams.system.entity.User;
import com.ams.system.model.UserModel;
import com.ams.system.service.UserService;
import com.util.enums.dic.StateEnum;
import com.util.generator.IdGenerator;
import com.util.md5.Security;
import com.util.page.Pager;

/**
 * 用户管理
 * @author Wymann
 * @Date 2014-5-10 下午10:03:20
 *
 */
@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	@Resource
	private UserRoleDao userRoleDao;
	
	/**
	 * 保存
	 * @param user
	 * @return 
	 * @author Whymann 2014-5-12 上午01:47:53
	 */
	public User save(User user) {
		user.setUserId(IdGenerator.getInstance().getId());
		user.setEnable(StateEnum.VALID.toString());
		userDao.save(user);
		return user;
	}

	/**
	 * 修改
	 * @param user
	 * @return 
	 * @author Whymann 2014-5-12 上午01:48:03
	 */
	public User update(User user) {
		if(null!=user && StringUtils.isNotEmpty(user.getUserId())){
			User oldUser=userDao.get(user.getUserId());
			if(null!=oldUser){
				oldUser.setPhone(user.getPhone());
				oldUser.setRealName(user.getRealName());
				userDao.update(oldUser);
				return oldUser;
			}
		}
		return user;
	}

	/**
	 * 根据编码获取用户
	 * @param id
	 * @return 
	 * @author Whymann 2014-5-12 上午01:48:16
	 */
	public User getById(String id) {
		if(StringUtils.isNotEmpty(id)){
			User user=userDao.get(id);
			return user;
		}
		return new User();
	}
	
	/**
	 * 用户登录验证
	 * @param username
	 * @param password
	 * @return 
	 * @author Whymann 2014-5-11 上午12:35:40
	 */
	public User queryUserByUser(String username,String password) {
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
			return null;
		}
		User queryUser = userDao.queryUserByUser(username,Security.md5(password));
		if(null != queryUser){
			return queryUser;
		}
		return null;
	}

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return 
	 * @author Whymann 2014-5-12 下午05:56:19
	 */
	public List<User> findByCondition(UserModel model, Pager page) {
		return userDao.findByCondition(model,page);
	}

	/**
	 * 设置状态
	 * @param id
	 * @param state 
	 * @author Whymann 2014-5-12 下午10:23:54
	 */
	public void updateState(String id, String state) {
		if(StringUtils.isNotEmpty(id)){
			User user=userDao.get(id);
			user.setEnable(state);
			userDao.update(user);
		}
	}

	/**
	 * 删除用户
	 * @param id 
	 * @author Whymann 2014-5-12 下午10:26:26
	 */
	public void delete(String id) {
		if(StringUtils.isNotEmpty(id)){
			/**
			 * 第一步，删除用户关联的角色
			 */
			userRoleDao.deleteByUserId(id);
			
			/**
			 * 第二步，删除用户
			 */
			User user=userDao.get(id);
			userDao.delete(user);
		}
	}

	/**
	 * 修改密码
	 * @param model 
	 * @author Whymann 2014-5-13 上午12:03:00
	 */
	public boolean updatePwd(User user,UserModel model) {
		if(null!=model && StringUtils.isNotEmpty(model.getPass()) && StringUtils.isNotEmpty(model.getNewPwd())){
			if(null!=user && StringUtils.isNotEmpty(user.getPassword())){
				if(user.getPassword().equals(Security.md5(model.getPass().trim()))){
					user.setPassword(Security.md5(model.getNewPwd()));
					userDao.update(user);
					return true;
				}else{//原密码不正确
					return false;
				}
			}
		}
		return false;
	}

	/**
	 * 检查用户名是否存在
	 * @param userName
	 * @return 
	 * @author Whymann 2014-5-13 上午11:48:37
	 */
	public boolean checkUser(String userName) {
		List<User> userList=userDao.checkUser(userName);
		if(!userList.isEmpty()){
			return true;
		}
		return false;
	}
	
}
