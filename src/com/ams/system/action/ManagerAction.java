package com.ams.system.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ams.system.entity.Manager;
import com.ams.system.entity.User;
import com.ams.system.model.ManagerModel;
import com.ams.system.model.UserModel;
import com.ams.system.service.ManagerService;
import com.ams.system.service.UserService;
import com.core.action.BaseAction;
import com.core.model.OutputMessage;
import com.util.enums.PageSizeEnum;
import com.util.enums.dic.StateEnum;
import com.util.json.JackJsonUtils;
import com.util.page.Pager;
import com.util.page.PagerHelper;

/**
 * 项目经理管理
 * @author Wymann
 * @Data 2015-1-2 下午01:42:04
 *
 */
@Controller
public class ManagerAction extends BaseAction{

	private static final long serialVersionUID = 479838928863384753L;
	
	@Resource
	private ManagerService managerService;
	
	@Resource
	private UserService userService;

	/**
	 * 新增项目经理
	 * @return
	 */
	@RequestMapping(value="/manager/add")
	public String add(ModelMap map){
		Manager manager=new Manager();
		manager.setEnable(StateEnum.VALID.toString());
		map.addAttribute("manager", manager);
		UserModel userModel=new UserModel();
		userModel.setEnable("1");
		List<User> userList=userService.findByCondition(userModel, null);
		map.addAttribute("userList", userList);
		return SYSTEM+"managerEdit";
	}
	
	/**
	 * 修改项目经理信息
	 * @param manager
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/manager/save",produces="text/plain;charset=UTF-8")
	public @ResponseBody String save(Manager manager){
		OutputMessage msg=new OutputMessage();
		if(null!=manager){
			boolean flag=true;
			if(StringUtils.isNotEmpty(manager.getManagerId())){//修改
				flag=managerService.checkCode(manager.getCode(),manager.getManagerId());
				if(!flag){
					manager=managerService.update(manager);
					msg=setOutputMessage(true, "修改成功！", manager.getManagerId());
				}else{
					msg=setOutputMessage(false, "输入的工号有冲突！", manager.getManagerId());
				}
			}else{
				flag=managerService.checkCode(manager.getCode(),"");
				if(!flag){
					manager.setCreateUser(this.getUser().getUserId());
					manager=managerService.save(manager);
					msg=setOutputMessage(true, "新增成功！", manager.getManagerId());
				}else{
					msg=setOutputMessage(false, "输入的工号有冲突！", manager.getManagerId());
				}
			}
		}else{
			msg=setOutputMessage(false, "项目经理填写信息不完整！", "");
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 跳转到修改项目经理信息
	 * @return
	 */
	@RequestMapping(value="/manager/edit")
	public String toEdit(String id,ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			Manager manager=managerService.getById(id);
			map.addAttribute("manager", manager);
			UserModel userModel=new UserModel();
			userModel.setEnable("1");
			List<User> userList=userService.findByCondition(userModel, null);
			map.addAttribute("userList", userList);
			return SYSTEM+"managerEdit";
		}else{
			this.returnException("项目经理编号不不存在，不能编辑！");
		}
		return ERROR;
	}
	
	/**
	 * 物理删除项目经理
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/manager/delete",produces="text/plain;charset=UTF-8")
	public @ResponseBody  String delete(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			boolean flag= managerService.delete(id);
			if(flag) msg=setOutputMessage(flag, "删除成功！", id);
			else msg=setOutputMessage(flag, "删除失败！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，项目经理Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 停用项目经理
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/manager/disable",produces="text/plain;charset=UTF-8")
	public @ResponseBody String disable(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			managerService.updateState(id,StateEnum.INVALID.toString());
			msg=setOutputMessage(true, "操作成功！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，项目经理Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 启用项目经理
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/manager/enable",produces="text/plain;charset=UTF-8")
	public @ResponseBody String enable(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			managerService.updateState(id,StateEnum.VALID.toString());
			msg=setOutputMessage(true, "操作成功！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，项目经理Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 项目经理详细
	 * @return
	 */
	@RequestMapping(value="/manager/detail")
	public String toDetail(String id, ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			Manager manager=managerService.getById(id);
			map.addAttribute("manager", manager);
			User user=userService.getById(manager.getRefuser());
			map.addAttribute("user", user);
			return SYSTEM+"managerDetail";
		}else{
			this.returnException("项目经理编码不存在，查看不了详细！");
		}
		return ERROR;
	}
	
	/**
	 * 跳转到列表页面
	 * @return
	 */
	@RequestMapping(value="/manager/toList")
	public String toList(){
		return SYSTEM+"managerList";
	}
	
	/**
	 * 列表页面
	 * @return
	 */
	@RequestMapping(value="/manager/list",produces="text/plain;charset=UTF-8")
	public @ResponseBody String list(ManagerModel model){
		Pager page=PagerHelper.getInstance(this.getRequest(), PageSizeEnum.MIDDLE);
		List<ManagerModel> managerList=managerService.findByCondition(model,page);
		page.setRows(managerList);
		return JackJsonUtils.toJSon(page);
	}
}
