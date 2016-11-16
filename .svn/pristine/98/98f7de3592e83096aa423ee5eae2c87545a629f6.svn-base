package com.ams.system.service;

import java.util.List;

import com.ams.system.entity.User;
import com.ams.system.model.UserModel;
import com.util.page.Pager;


/**
 * 用户管理
 * @author Wymann
 * @Date 2014-5-10 下午10:00:26
 *
 */
public interface UserService{
	/**
	 * 保存用户
	 * @param user
	 * @return
	 */
	public User save(User user);
	
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public User update(User user);

	/**
	 * 根据编码获取用户
	 * @param id
	 * @return
	 */
	public User getById(String id);
	
	/**
	 * 用户登录检查
	 * @param username
	 * @param password
	 * @return
	 */
	public User queryUserByUser(String username,String password);

	/**
	 * 条件查询
	 * @param model
	 * @param page
	 * @return
	 */
	public List<User> findByCondition(UserModel model, Pager page);

	/**
	 * 设置用户状态
	 * @param id
	 * @param state
	 */
	public void updateState(String id, String state);

	/**
	 * 删除用户
	 * @param id
	 */
	public void delete(String id);

	/**
	 * 修改密码
	 * @param user 
	 * @param model
	 */
	public boolean updatePwd(User user, UserModel model);

	/**
	 * 检查用户名是否存在
	 * @param userName
	 * @return
	 */
	public boolean checkUser(String userName);
	


}
