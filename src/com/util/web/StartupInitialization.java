package com.util.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import com.util.load.AuthTranslate;
import com.util.load.DictionaryTranslate;
import com.util.load.MenuTranslate;
import com.util.load.UrlFilterTranslate;

/**
 * 系统初始化
 * @author Wymann
 * 2013-9-23 下午04:26:02
 */
public class StartupInitialization extends HttpServlet{

	private static final long serialVersionUID = 8536066575746733421L;
	
	private static final Logger log=Logger.getLogger(StartupInitialization.class);
	
	@Override
	public void init() throws ServletException{
		
		if(log.isInfoEnabled()) log.info("正在初始化系统数据");
		
		// 1、加载资源文件数据
		if (log.isInfoEnabled()) log.info("...............1、加载资源文件数据............................. ");
		ResourceContext.getInstance();
		
		// 2、加载字典表数据
		if (log.isInfoEnabled()) log.info("...............2、加载字典表数据............................... ");
		DictionaryTranslate.getInstance();
		
		// 3、加载url
		if (log.isInfoEnabled()) log.info("...............3、加载url表数据............................... ");
		UrlFilterTranslate.getInstance();
		//4、加载菜单
		if(log.isInfoEnabled()) log.info("...............4、加载菜单表数据............................... ");
		MenuTranslate.getInstance();
		//5、加载权限
		if(log.isInfoEnabled()) log.info("...............5、加载权限表数据............................... ");
		AuthTranslate.getInstance();
	}
	
	@Override
	public void destroy(){
		
	}
	
}
