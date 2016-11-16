package com.ams.system.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ams.system.entity.Menu;
import com.ams.system.service.MenuService;
import com.core.action.BaseAction;
import com.core.model.OutputMessage;
import com.util.enums.dic.StateEnum;
import com.util.json.JackJsonUtils;
import com.util.load.MenuTranslate;

/**
 * 菜单管理
 * @author Wymann
 * @Data 2015-1-8 上午09:32:09
 *
 */
@Controller
public class MenuAction extends BaseAction{

	private static final long serialVersionUID = -4259734773554687336L;
	
	@Resource
	private MenuService menuService;
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping(value="/menu/add")
	public String toAdd(String parentId,ModelMap map){
		Menu menu=new Menu();
		menu.setParentId(parentId);
		menu.setEnable(StateEnum.VALID.toString());
		if(StringUtils.isNotEmpty(parentId)){
			Menu parent=menuService.getById(parentId);
			map.addAttribute("parent", parent);
		}
		map.addAttribute("menu", menu);
		return SYSTEM+"menuEdit";
	}
	
	/**
	 * 跳转到编辑页面
	 * @return
	 */
	@RequestMapping(value="/menu/edit")
	public String toEdit(String id,ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			Menu menu=menuService.getById(id);
			if(null!=menu){
				Menu parent=menuService.getById(menu.getParentId());
				map.addAttribute("parent", parent);
			}
			map.addAttribute("menu", menu);
			return SYSTEM+"menuEdit";
		}else{
			returnException("菜单编号不存在！");
		}
		return ERROR;
	}
	
	/**
	 * 保存
	 * @return
	 */
	@RequestMapping(value="/menu/save",produces="text/plain;charset=UTF-8")
	public @ResponseBody String save(Menu menu){
		OutputMessage msg=new OutputMessage();
		if(null!=menu){
			if(StringUtils.isNotEmpty(menu.getMenuId())){//修改
				menu=menuService.update(menu);
				msg=setOutputMessage(true, "修改成功！", menu.getMenuId());
			}else{
				menu=menuService.save(menu);
				msg=setOutputMessage(true, "保存成功！", menu.getMenuId());
			}
			MenuTranslate.getInstance().refresh();
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
	@RequestMapping(value="/menu/detail",produces="text/plain;charset=UTF-8")
	public @ResponseBody String detail(String id){
		if(StringUtils.isNotEmpty(id)){
			Menu menu=menuService.getById(id);
			if(null!=menu && StringUtils.isNotEmpty(menu.getMenuId())){
				return JackJsonUtils.toJSon(menu);
			}
		}
		return null;
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(value="/menu/delete",produces="text/plain;charset=UTF-8")
	public @ResponseBody String delete(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			boolean flag= menuService.delete(id);
			if(flag){
				MenuTranslate.getInstance().refresh();
				msg=setOutputMessage(true, "操作成功！", id);
			}else{
				msg=setOutputMessage(false, "操作失败！", id);
			}
		}else{
			msg=setOutputMessage(false, "操作失败，菜单Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}

	/**
	 * 跳转到菜单列表
	 * @return
	 */
	@RequestMapping(value="/menu/list")
	public String toList(ModelMap map){
		List<Menu> list=new ArrayList<Menu>();
		list.addAll(MenuTranslate.getInstance().getAll());
		Menu m=new Menu();
		m.setParentId("-1");
		m.setMenuId("0");
		m.setName("根节点");
		m.setEnable(StateEnum.VALID.toString());
		list.add(0, m);
		map.addAttribute("menuList", JackJsonUtils.toJSon(list));
		return SYSTEM+"menuList";
	}
}
