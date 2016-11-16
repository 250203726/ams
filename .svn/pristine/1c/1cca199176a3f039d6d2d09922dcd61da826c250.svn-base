package com.ams.system.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ams.BaseConst;
import com.ams.system.entity.Role;
import com.ams.system.entity.User;
import com.ams.system.model.UserModel;
import com.ams.system.service.RoleService;
import com.ams.system.service.UserService;
import com.core.action.BaseAction;
import com.core.model.OutputMessage;
import com.core.model.UserSession;
import com.util.enums.PageSizeEnum;
import com.util.enums.dic.StateEnum;
import com.util.json.JackJsonUtils;
import com.util.md5.Security;
import com.util.page.Pager;
import com.util.page.PagerHelper;

/**
 * 用户管理
 */
@Controller
@Scope("prototype")
public class UserAction extends BaseAction{
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -3114691572126836671L;
	
	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;
	
	/**
	 * 修改个人信息
	 * @param user
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/user/save",produces="text/plain;charset=UTF-8")
	public @ResponseBody String save(User user){
		OutputMessage msg=new OutputMessage();
		if(null!=user){
			if(StringUtils.isNotEmpty(user.getUserId())){//修改
				user=userService.update(user);
				UserSession userSession=(UserSession)getRequest().getSession().getAttribute(BaseConst.USERSESSION);
				userSession.setUser(user);
				getRequest().getSession().setAttribute(BaseConst.USERSESSION, userSession);
				msg=setOutputMessage(true, "修改成功！", user.getUserId());
			}else{
				msg=setOutputMessage(false, "用户编码不存在，修改失败！", user.getUserId());
			}
		}else{
			msg=setOutputMessage(false, "用户填写信息不完整！", "");
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 跳转到修改个人信息
	 * @return
	 */
	@RequestMapping(value="/user/edit")
	public String toEdit(String id,ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			User user=userService.getById(id);
			map.addAttribute("user", user);
			return SYSTEM+"userEdit";
		}else{
			this.returnException("用户编号不不存在，不能编辑！");
		}
		return ERROR;
	}
	
	/**
	 * 跳转到修改密码
	 * @return
	 */
	@RequestMapping(value="/user/changePwd")
	public String updatePwd(){
		return SYSTEM+"passwordSetting";
	}
	
	/**
	 * 保存密码
	 * @return
	 */
	@RequestMapping(value="/user/savePwd",produces="text/plain;charset=UTF-8")
	public @ResponseBody String savePwd(UserModel model){
		OutputMessage msg=new OutputMessage();
		if(null!=model && StringUtils.isNotEmpty(model.getPass()) && StringUtils.isNotEmpty(model.getNewPwd())){
			UserSession userSession=(UserSession)getRequest().getSession().getAttribute(BaseConst.USERSESSION);
			User user=userSession.getUser();
			 boolean flag= userService.updatePwd(user, model);
			 if(flag){
				 msg=setOutputMessage(flag, "修改成功！", user.getUserId());
			 }else{
				 msg=setOutputMessage(flag, "修改失败！", user.getUserId()); 
			 }
		}else{
			msg=setOutputMessage(false, "用户填写信息不完整！", ""); 
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	
	/**
	 * 检查旧密码是否正确
	 * @return
	 */
	@RequestMapping(value="/user/checkOld",produces="text/plain;charset=UTF-8")
	public @ResponseBody String checkOld(String old){
		UserSession userSession=(UserSession)getRequest().getSession().getAttribute(BaseConst.USERSESSION);
		User user=userSession.getUser();
		if(null!=user && user.getPassword().equals(Security.md5(old))){
			return String.valueOf(true);
		}else{
			return String.valueOf(false);
		}
	}
	
	/**
	 * 物理删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/user/delete",produces="text/plain;charset=UTF-8")
	public @ResponseBody  String delete(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			userService.delete(id);
			msg=setOutputMessage(true, "操作成功！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，用户Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 停用用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/user/disable",produces="text/plain;charset=UTF-8")
	public @ResponseBody String disable(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			userService.updateState(id,StateEnum.INVALID.toString());
			msg=setOutputMessage(true, "操作成功！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，用户Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 启用用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/user/enable",produces="text/plain;charset=UTF-8")
	public @ResponseBody String enable(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			userService.updateState(id,StateEnum.VALID.toString());
			msg=setOutputMessage(true, "操作成功！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，用户Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 个人资料
	 * @return
	 */
	@RequestMapping(value="/user/userInfo")
	public String userInfo(String id, ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			User user=userService.getById(id);
			List<Role> roleList=roleService.getByUserId(id);
			map.addAttribute("user", user);
			map.addAttribute("roleList", roleList);
			return SYSTEM+"userInfo";
		}else{
			this.returnException("用户编码不存在，查看不了详细！");
		}
		return ERROR;
	}
	
	/**
	 * 用户详细
	 * @return
	 */
	@RequestMapping(value="/user/detail")
	public String toDetail(String id, ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			User user=userService.getById(id);
			List<Role> roleList=roleService.getByUserId(id);
			map.addAttribute("user", user);
			map.addAttribute("roleList", roleList);
			return SYSTEM+"userDetail";
		}else{
			this.returnException("用户编码不存在，查看不了详细！");
		}
		return ERROR;
	}
	
	/**
	 * 跳转到列表页面
	 * @return
	 */
	@RequestMapping(value="/user/toList")
	public String toList(){
		return SYSTEM+"userList";
	}
	
	/**
	 * 列表页面
	 * @return
	 */
	@RequestMapping(value="/user/list",produces="text/plain;charset=UTF-8")
	public @ResponseBody String list(UserModel model){
		Pager page=PagerHelper.getInstance(this.getRequest(), PageSizeEnum.MIDDLE);
		List<User> userList=userService.findByCondition(model,page);
		page.setRows(userList);
		return JackJsonUtils.toJSon(page);
	}

}
