package com.ams.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ams.system.dao.LoginLogDao;
import com.ams.system.entity.LoginLog;
import com.core.dao.impl.BaseDaoImpl;

/**
 * 登录日志管理
 * @author Wymann
 * @Date 2014-5-10 下午09:51:03
 *
 */
@Repository
public class LoginLogDaoImpl extends BaseDaoImpl<LoginLog> implements LoginLogDao{

}
