package com.ams.system.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ams.system.entity.Auth;
import com.ams.system.service.AuthService;
import com.core.action.BaseAction;
import com.core.model.OutputMessage;
import com.util.enums.dic.StateEnum;
import com.util.json.JackJsonUtils;
import com.util.load.AuthTranslate;

/**
 * 权限管理
 * @author Wymann
 * @Date 2014-5-10 下午09:46:13
 *
 */
@Controller
@Scope("prototype")
public class AuthAction extends BaseAction{

	private static final long serialVersionUID = 8109288700423089299L;
	
	@Resource
	private AuthService authService;
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping(value="/auth/add")
	public String toAdd(String parentId,ModelMap map){
		Auth auth=new Auth();
		auth.setParentId(parentId);
		auth.setEnable(StateEnum.VALID.toString());
		auth.setBase(StateEnum.INVALID.toString());
		if(StringUtils.isNotEmpty(parentId)){
			Auth parent=authService.getById(parentId);
			map.addAttribute("parent", parent);
		}
		map.addAttribute("auth", auth);
		return SYSTEM+"authEdit";
	}
	
	/**
	 * 跳转到编辑页面
	 * @return
	 */
	@RequestMapping(value="/auth/edit")
	public String toEdit(String id,ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			Auth auth=authService.getById(id);
			if(null!=auth){
				Auth parent=authService.getById(auth.getParentId());
				map.addAttribute("parent", parent);
			}
			map.addAttribute("auth", auth);
			return SYSTEM+"authEdit";
		}else{
			returnException("权限编号不存在！");
		}
		return ERROR;
	}
	
	/**
	 * 保存
	 * @return
	 */
	@RequestMapping(value="/auth/save",produces="text/plain;charset=UTF-8")
	public @ResponseBody String save(Auth auth){
		OutputMessage msg=new OutputMessage();
		if(null!=auth){
			if(StringUtils.isNotEmpty(auth.getAuthId())){//修改
				auth=authService.update(auth);
				msg=setOutputMessage(true, "修改成功！", auth.getAuthId());
			}else{
				auth=authService.save(auth);
				msg=setOutputMessage(true, "保存成功！", auth.getAuthId());
			}
			AuthTranslate.getInstance().refresh();
		}else{
			msg=setOutputMessage(false, "您填写信息不完整！", "");
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 详细
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/auth/detail",produces="text/plain;charset=UTF-8")
	public @ResponseBody String detail(String id){
		if(StringUtils.isNotEmpty(id)){
			Auth auth=authService.getById(id);
			if(null!=auth && StringUtils.isNotEmpty(auth.getAuthId())){
				return JackJsonUtils.toJSon(auth);
			}
		}
		return null;
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(value="/auth/delete",produces="text/plain;charset=UTF-8")
	public @ResponseBody String delete(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			boolean flag= authService.delete(id);
			if(flag){
				AuthTranslate.getInstance().refresh();
				msg=setOutputMessage(true, "操作成功！", id);
			}else{
				msg=setOutputMessage(false, "操作失败！", id);
			}
		}else{
			msg=setOutputMessage(false, "操作失败，权限Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}

	/**
	 * 跳转到权限列表
	 * @return
	 */
	@RequestMapping(value="/auth/list")
	public String toList(ModelMap map){
		List<Auth> list=new ArrayList<Auth>();
		list.addAll(AuthTranslate.getInstance().getAll());
		Auth a=new Auth();
		a.setParentId("-1");
		a.setAuthId("0");
		a.setAuthName("根节点");
		a.setEnable(StateEnum.VALID.toString());
		list.add(0, a);
		map.addAttribute("authList", JackJsonUtils.toJSon(list));
		return SYSTEM+"authList";
	}

}
