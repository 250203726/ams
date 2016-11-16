package com.ams.system.dao;

import java.util.List;

import com.ams.system.entity.User;
import com.ams.system.model.UserModel;
import com.core.dao.BaseDao;
import com.util.page.Pager;

/**
 * 用户管理
 * @author Wymann
 * @Date 2014-5-10 下午10:05:22
 *
 */
public interface UserDao extends BaseDao<User>{


	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<User> findByCondition(UserModel model, Pager page);

	/**
	 * 用户登录验证
	 * @param username
	 * @param password
	 * @return
	 */
	public User queryUserByUser(String username, String password);

	/**
	 * 检查用户名是否存在
	 * @param userName
	 * @return
	 */
	public List<User> checkUser(String userName);
}
