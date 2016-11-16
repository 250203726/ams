package com.ams.system.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ams.BaseConst;
import com.ams.system.entity.LoginLog;
import com.ams.system.entity.Menu;
import com.ams.system.entity.Role;
import com.ams.system.entity.User;
import com.ams.system.model.UserModel;
import com.ams.system.service.AuthService;
import com.ams.system.service.LoginLogService;
import com.ams.system.service.RoleService;
import com.ams.system.service.UserService;
import com.core.action.BaseAction;
import com.core.model.UserSession;
import com.util.datetime.DateTimeUtils;
import com.util.json.JackJsonUtils;
import com.util.load.MenuTranslate;
import com.util.tools.ToolSecurityIDEA;
import com.util.tools.ToolString;
import com.util.tools.ToolWeb;

/**
 * 用户登录
 * @author Wymann
 * @Date 2014-5-11 下午11:53:07
 *
 */
@Controller
@Scope("prototype")
public class loginAction extends BaseAction{

	private static final long serialVersionUID = -3662483004771753780L;
	
	@Resource
	private UserService userService;
	
	@Resource
	private LoginLogService loginLogService;
	
	@Resource
	private AuthService authService;
	
	@Resource
	private RoleService roleService;
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping(value="/logon")
	public String toLogin(ModelMap map){
//		User user = getCurrentUser(getRequest(), true); // cookie认证自动登陆处理
//		if(null!=user){
//			return "redirect:/index";
//		}
		String flag="";
		if(null!=map && map.containsKey("msgflag")){
			flag=(String)map.get("msgflag");
		}
		if(StringUtils.isNotEmpty(flag)){
			String error="";
			if("1".equals(flag)){
				error="用户名或密码不能为空！";
			}
			if("2".equals(flag)){
				error="验证码不能为空！";
			}
			if("3".equals(flag)){
				error="验证码不正确！";
			}
			if("4".equals(flag)){
				error="用户名或密码不正确！";
			}
			map.addAttribute("error", error);
		}
		return "login";
	}
	
	/**
	 * 登录验证
	 * @return
	 */
	@RequestMapping(value="/signIn")
	public String logon(UserModel model,RedirectAttributes redir,ModelMap map){
		if(StringUtils.isEmpty(model.getName()) || StringUtils.isEmpty(model.getPass())){
			redir.addFlashAttribute("msgflag", "1");
			return "redirect:/logon";
		}
		if(StringUtils.isEmpty(model.getAuthCode())){
			redir.addFlashAttribute("msgflag", "2");
			map.addAttribute("msgflag", 2);
			return "redirect:/logon";
		}
		//开发阶段屏蔽掉验证码功能方便调试
		/*boolean authCode = authCode();//判断验证码是否正确
		if(!authCode){
			redir.addFlashAttribute("msgflag", "3");
			return "redirect:/logon";
		}*/
		/**
		 * 保存用户登录日志
		 */
		LoginLog loginLog=new LoginLog();
		loginLog.setLoginIp(ToolWeb.getIpAddr(getRequest()));
		loginLog.setUserName(model.getName());
		
		User user = userService.queryUserByUser(model.getName(), model.getPass());
		if(null!=user){
			/**
			 * 保存用户实体到会话中
			 */
			UserSession userSession=new UserSession();
			userSession.setUser(user);
			
			/**
			 * 获得用户角色
			 */
			List<Role> userRole=roleService.getByUserId(user.getUserId());
			userSession.setUserRole(userRole);
			
			/**
			 * 获得用户权限
			 */
			List<String> ptree=authService.getPtree(user);
			userSession.setPtree(ptree);
			
			getRequest().getSession().setAttribute(BaseConst.USERSESSION, userSession);
			
			/**
			 * 保存用户登录日志
			 */
			loginLog.setLoginMessage("登录成功");
			loginLogService.save(loginLog);
			return "redirect:/index";
		}else {
			loginLog.setLoginMessage("用户名或密码不正确");
			loginLogService.save(loginLog);
			redir.addFlashAttribute("msgflag", "4");
			return "redirect:/logon";
		}
	}
	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value="/logonOut")
	public String logonOut(){
		UserSession userSession=null;
		getRequest().getSession().setAttribute(BaseConst.USERSESSION, userSession);
		return "redirect:/logon";
	}
	
	/**
	 * 没有权限
	 * @return
	 */
	@RequestMapping(value="/noPower")
	public String noPower(){
		returnException("您的操作由于未授权，无法完成，请联系系统管理员更改操作权限！");
		return ERROR;
	}
	
	/**
	 * 跳转到主页
	 */
	@RequestMapping(value="/index")
	public String index(ModelMap map){
		//获取子菜单
		List<Menu> menuList=MenuTranslate.getInstance().getSubMenus();
		map.addAttribute("navigateData", JackJsonUtils.toJSon(menuList));
		//获取一级菜单
		List<Menu> parentList=MenuTranslate.getInstance().getParentMenus();
		map.addAttribute("sidebarData", JackJsonUtils.toJSon(parentList));
		return "index";
	}
	
	/**
	 * 加载主页内容页
	 * @return
	 */
	@RequestMapping(value="/main")
	public String main(){
		return "main";
	}
	
	/**
	 * 获取当前登录用户
	 * @param request
	 * @param userAgentVali 是否验证 User-Agent
	 * @return
	 */
	public static User getCurrentUser(HttpServletRequest request, boolean userAgentVali) {
		String loginCookie = ToolWeb.getCookieValueByName(request, BaseConst.authmark);
		if (null != loginCookie && !loginCookie.equals("")) {
			// 1. Base64解码cookie令牌
			try {
				loginCookie = ToolString.decode(loginCookie);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 2. 解密cookie令牌
			byte[] securityByte = Base64.decodeBase64(loginCookie);

			String securityKey = BaseConst.securityKey;
			byte[] keyByte = Base64.decodeBase64(securityKey);

			byte[] dataByte = null;
			try {
				dataByte = ToolSecurityIDEA.decrypt(securityByte, keyByte);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String data = new String(dataByte);
			String[] datas = data.split(".#.");	//arr[0]：时间戳，arr[1]：USERID，arr[2]：USER_IP， arr[3]：USER_AGENT
			
			// 3. 获取数据
			long loginDateTimes = Long.parseLong(datas[0]);// 时间戳
			String userIds = datas[1];// 用户id
			String ips = datas[2];// ip地址
			String userAgent = datas[3];// USER_AGENT

			String newIp = ToolWeb.getIpAddr(request);
			String newUserAgent = request.getHeader("User-Agent");

			Date start = new Date();
			start.setTime(loginDateTimes);
			int day = DateTimeUtils.getDiscrepantDays(start, new Date());
			
			// 4. 验证数据有效性
			if (ips.equals(newIp) && (userAgentVali ? userAgent.equals(newUserAgent) : true) && day <= 365) {
				Object userObj = new User();
				if (null != userObj) {
					User user = (User) userObj;
					return user;
				}
			}
		}

		return null;
	}

	/**
	 * 设置当前登录用户
	 * @param request
	 * @param response
	 * @param user
	 * @param autoLogin
	 */
	public static void setCurrentUser(HttpServletRequest request, HttpServletResponse response, User user, boolean autoLogin) {
		// 1.设置cookie有效时间
		int maxAgeTemp = -1;
		if (autoLogin) {
			maxAgeTemp = BaseConst.maxAge;
		}

		// 2.设置用户名到cookie
		ToolWeb.addCookie(response, "", "/", true, BaseConst.userName, user.getUserName(), maxAgeTemp);

		// 3.生成登陆认证cookie
		String userIds = user.getUserId();
		String ips = ToolWeb.getIpAddr(request);
		String userAgent = request.getHeader("User-Agent");//当前游览器
		long date = new Date().getTime();

		StringBuilder token = new StringBuilder();// 时间戳#USERID#USER_IP#USER_AGENT
		token.append(date).append(".#.").append(userIds).append(".#.").append(ips).append(".#.").append(userAgent);
		String authToken = token.toString();
		byte[] authTokenByte = null;
		try {
			authTokenByte = authToken.getBytes(ToolString.encoding);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String securityKey = BaseConst.securityKey;
		byte[] keyByte = Base64.decodeBase64(securityKey);

		// 4. 认证cookie加密
		byte[] securityByte = null;
		try {
			securityByte = ToolSecurityIDEA.encrypt(authTokenByte, keyByte);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String securityCookie = Base64.encodeBase64String(securityByte);

		// 5. 认证cookie Base64编码
		try {
			securityCookie = ToolString.encode(securityCookie);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 6. 添加到Cookie
		ToolWeb.addCookie(response,  "", "/", true, BaseConst.authmark, securityCookie, maxAgeTemp);
	}
	
	/**
	 * 判断验证码是否正确
	 * 
	 * @author 
	 * @return
	 */
	protected boolean authCode() {
		String authCodePram = getPara("authCode");
		String authCodeCookie = getAuthCode();
		if (null != authCodePram && null != authCodeCookie) {
			authCodePram = authCodePram.toLowerCase();// 统一小写
			authCodeCookie = authCodeCookie.toLowerCase();// 统一小写
			if (authCodePram.equals(authCodeCookie)) {
				return true;
			}
		}
		return false;
	}
}
