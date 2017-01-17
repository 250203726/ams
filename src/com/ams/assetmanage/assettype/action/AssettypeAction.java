package com.ams.assetmanage.assettype.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ams.assetmanage.assettype.entity.Assettype;
import com.ams.assetmanage.assettype.model.AssettypeModel;
import com.ams.assetmanage.assettype.service.AssettypeService;
import com.ams.infomanage.unit.entity.Unit;
import com.ams.infomanage.unit.service.UnitService;
import com.core.action.BaseAction;
import com.core.model.OutputMessage;
import com.util.enums.PageSizeEnum;
import com.util.json.JackJsonUtils;
import com.util.page.Pager;
import com.util.page.PagerHelper;

/**
 * 	资产类型Action
 *	@author 
 */
@Controller
public class AssettypeAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9043863563506939011L;
	@Resource
	private AssettypeService assettypeService;
	@Resource
	private UnitService unitService;
	/**
	 * 跳转到新建页面
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/add")
	public String add(ModelMap map){
		//assetclaList
				List<Unit> unitList=unitService.findByCondition(new Unit(),	null);
				map.addAttribute("unitList", unitList);
		return ASSETTYPE+"edit";
	}
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/save",produces="text/plain;charset=UTF-8")
	public @ResponseBody String save(Assettype model){
		OutputMessage msg=new OutputMessage();
		if(null!=model){
			if(StringUtils.isNotEmpty(model.getAssettypeId())){//修改
				Assettype assettype=assettypeService.getById(model.getAssettypeId());
				if(null!=assettype){
					assettypeService.update(model);
					msg=setOutputMessage(true, "修改成功！", model.getAssettypeId());
				}else{
					msg=setOutputMessage(false, "修改失败！", model.getAssettypeId());
				}
			}else{//保存
				if(checkAssettypeName(model.getAssettypeName(),null).equals("false")){//如果资产类型不存在
					assettypeService.save(model);
					msg=setOutputMessage(true, "新建成功！", model.getAssettypeId());
				}else{
					msg=setOutputMessage(false, "资产名已存在！", model.getAssettypeId());
				}
				
			}
		}else{
			msg=setOutputMessage(false, "数据为空", null);
		}
		return JackJsonUtils.toJSon(msg);
	}

	/**
	 * 跳转到编辑页面
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/edit")
	public String edit(String id,ModelMap map){
		//assetclaList
		List<Unit> unitList=unitService.findByCondition(new Unit(),	null);
		map.addAttribute("unitList", unitList);
		
		if(StringUtils.isNotEmpty(id)){
			Assettype model=assettypeService.getById(id);
			map.addAttribute("model", model);
			return ASSETTYPE+"edit";
		}else{
			this.returnException("资产类型编号不存在，不能编辑！");
		}
		return ERROR;
		
	}
	
	/**
	 * 跳转到详细页面
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/detail")
	public String detail(String id,ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			Assettype model=assettypeService.getById(id);
			map.addAttribute("model", model);
			return ASSETTYPE+"detail";
		}else{
			this.returnException("资产类型编号不存在，查看不了详细！");
		}
		return ERROR;
	}
	
	/**
	 * 物理删除资产类型信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/delete",produces="text/plain;charset=UTF-8")
	public @ResponseBody String delete(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			assettypeService.delete(id);
			msg=setOutputMessage(true, "操作成功！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，资产类型编号为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 跳转到列表页面
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/toList")
	public String toList(){
		return ASSETTYPE+"list";
	}
	
	/**
	 * 局部刷新翻页
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/list",produces="text/plain;charset=UTF-8")
	public @ResponseBody String list(Assettype model){
		Pager page=PagerHelper.getInstance(this.request, PageSizeEnum.MIDDLE);
		List<Assettype> list=assettypeService.findByCondition(model,page);
		page.setRows(list);
		return JackJsonUtils.toJSon(page);
	}
	
	
	
	/**
	 * 弹出框局部刷新
	 */
	@RequestMapping(value="/assetmanage/assettype/popList",produces="text/plain;charset=UTF-8")
	public @ResponseBody String popList(Assettype model){
		Pager page=PagerHelper.getInstance(this.request, PageSizeEnum.MIDDLE);
		List<Assettype> list=assettypeService.findByCondition(model,page);
		page.setRows(list);
		return JackJsonUtils.toJSon(page);
	}
	
	/**
	 * 检查资产名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/assetmanage/assettype/checkAssetnam",produces="text/plain;charset=UTF-8")
	public @ResponseBody String checkAssettypeName(String name, String id) {
		boolean flag=false;
		flag=assettypeService.checkAssettypeName(name, id);
		return String.valueOf(flag);
	}
	
}
