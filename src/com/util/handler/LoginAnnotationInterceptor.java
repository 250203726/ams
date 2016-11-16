package com.util.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ams.BaseConst;
import com.ams.system.entity.Urlfilter;
import com.core.model.UserSession;
import com.util.enums.dic.StateEnum;
import com.util.load.UrlFilterTranslate;

/**
 * pring MVV拦截器
 * 1.未登录用户拦截
 * 2.已登录越权操作
 * @author WyMann
 *
 */
public class LoginAnnotationInterceptor extends HandlerInterceptorAdapter  {
	
	/**
	 * 用户登录会话
	 */
	private UserSession usersession=new UserSession();

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object obj) throws Exception {
		HandlerMethod handle=(HandlerMethod)obj;
		HttpSession session=request.getSession();
		RequestMapping requestMap=handle.getMethodAnnotation(RequestMapping.class);
		String url=requestMap.value()[0];
		Urlfilter urlFilter=UrlFilterTranslate.getInstance().getByUrl(url);
		if(null!=urlFilter && StateEnum.VALID.toString().equals(urlFilter.getRowFilter())){//需要登录验证的页面
			//获取用户会话
			usersession=(UserSession)session.getAttribute(BaseConst.USERSESSION);
			String head = request.getHeader("x-requested-with");
			if (head != null && head.equalsIgnoreCase("XMLHttpRequest")) {  //ajax请求路径
				if(null==usersession || null==usersession.getUser()){//未登录，或session失效
					//直接定位到登录页面
					response.sendError(BaseConst.AJAX_999); //添加respone报错信息
					return false;
				}else{
					if(StateEnum.VALID.toString().equals(urlFilter.getPrivilegess())){//需要权限验证
						if(!checkPower(urlFilter.getAuthoritys())){
							//没有权限
							response.sendError(BaseConst.AJAX_998); //没有权限
							return false;
						}
					}else{
						return true;
					}
				}
			}else{//普通url请求
				if(null==usersession || null==usersession.getUser()){//未登录
					//直接定位到登录页面
					response.sendRedirect(getBasePath(request)); 
					return true;
				}
				if(StateEnum.VALID.toString().equals(urlFilter.getPrivilegess())){//需要权限验证
					if(!checkPower(urlFilter.getAuthoritys())){
						response.sendRedirect(getBasePath(request)+"/noPower");
						return true;
					}
				}else{
					return true;
				}
			}
		}
		return true;
	}
	
	/**
	 * 权限验证，当用户权限树拥有权限钥匙时，验证通过
	 * @param ptree:
	 * @return
	 */
	private boolean checkPower(String authoritys){
		boolean flag=false;
		if(null!=usersession && !usersession.getPtree().isEmpty() && usersession.getPtree().size()>0){
			List<String> pStr=usersession.getPtree();
			String[] ptree=authoritys.split(",");
			for(int i=0;i<ptree.length;i++){
				if(pStr.contains(String.valueOf(ptree[i]))){
					flag=true;
					break;
				}
			}
		}
		return flag;
	}
	
	private String getBasePath(HttpServletRequest request){
		//return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		return request.getContextPath();
	}
}
