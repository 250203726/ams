package com.ams.system.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ams.system.dao.LoginLogDao;
import com.ams.system.entity.LoginLog;
import com.ams.system.service.LoginLogService;
import com.util.generator.IdGenerator;

/**
 * 登录日志管理
 * @author Wymann
 * @Date 2014-5-10 下午09:50:45
 *
 */
@Service
public class LoginLogServiceImpl implements LoginLogService{
	
	@Resource
	private LoginLogDao loginLogDao;

	/**
	 * 保存登录消息
	 * @param loginLog 
	 * @author Whymann 2014-5-10 下午10:42:50
	 */
	public void save(LoginLog loginLog) {
		loginLog.setLoginLogId(IdGenerator.getInstance().getId());
		loginLog.setLoginTime(new Date());
		loginLogDao.save(loginLog);
	}

}
