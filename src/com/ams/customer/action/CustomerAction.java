package com.ams.customer.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ams.customer.entity.Customer;
import com.ams.customer.model.CustomerModel;
import com.ams.customer.service.CustomerService;
import com.core.action.BaseAction;
import com.core.model.OutputMessage;
import com.util.enums.PageSizeEnum;
import com.util.json.JackJsonUtils;
import com.util.page.Pager;
import com.util.page.PagerHelper;

/**
 * 客户管理
 * @author Wymann
 * @Data 2014-12-3 下午02:30:07
 *
 */
@Controller
public class CustomerAction extends BaseAction{

	private static final long serialVersionUID = 7574469198524377555L;
	
	@Resource
	private CustomerService customerService;
	
	/**
	 * 跳转到新建页面
	 * @return
	 */
	@RequestMapping(value="/customer/add")
	public String add(){
		return CUSTOMER+"edit";
	}
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/customer/save",produces="text/plain;charset=UTF-8")
	public @ResponseBody String save(Customer model){
		OutputMessage msg=new OutputMessage();
		if(null!=model){
			if(StringUtils.isNotEmpty(model.getCustomerId())){//修改
				Customer customer=customerService.getById(model.getCustomerId());
				if(null!=customer){
					customerService.update(model);
					msg=setOutputMessage(true, "修改成功！", model.getCustomerId());
				}else{
					msg=setOutputMessage(false, "该客户已经被删除！", model.getCustomerId());
				}
			}else{//保存
				if(checkCustomer(model.getCustomerName(),null).equals("false")){//如果客户不存在
					customerService.save(model);
					msg=setOutputMessage(true, "新建成功！", model.getCustomerId());
				}else{
					msg=setOutputMessage(false, "客户名已存在！", model.getCustomerId());
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
	@RequestMapping(value="/customer/edit")
	public String edit(String id,ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			Customer model=customerService.getById(id);
			map.addAttribute("model", model);
			return CUSTOMER+"edit";
		}else{
			this.returnException("客户编号不不存在，不能编辑！");
		}
		return ERROR;
		
	}
	
	/**
	 * 跳转到详细页面
	 * @return
	 */
	@RequestMapping(value="/customer/detail")
	public String detail(String id,ModelMap map){
		if(StringUtils.isNotEmpty(id)){
			Customer model=customerService.getById(id);
			map.addAttribute("model", model);
			return CUSTOMER+"detail";
		}else{
			this.returnException("客户编码不存在，查看不了详细！");
		}
		return ERROR;
	}
	
	/**
	 * 物理删除客户信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/customer/delete",produces="text/plain;charset=UTF-8")
	public @ResponseBody String delete(String id){
		OutputMessage msg=new OutputMessage();
		if(StringUtils.isNotEmpty(id)){
			customerService.delete(id);
			msg=setOutputMessage(true, "操作成功！", id);
		}else{
			msg=setOutputMessage(false, "操作失败，客户Id为空！", id);
		}
		return JackJsonUtils.toJSon(msg);
	}
	
	/**
	 * 跳转到列表页面
	 * @return
	 */
	@RequestMapping(value="/customer/toList")
	public String toList(){
		return CUSTOMER+"list";
	}
	
	/**
	 * 局部刷新翻页
	 * @return
	 */
	@RequestMapping(value="/customer/list",produces="text/plain;charset=UTF-8")
	public @ResponseBody String list(CustomerModel model){
		Pager page=PagerHelper.getInstance(this.getRequest(), PageSizeEnum.MIDDLE);
		List<CustomerModel> list=customerService.findByCondition(model,page);
		page.setRows(list);
		return JackJsonUtils.toJSon(page);
	}
	
	/**
	 * 打开弹出框内容
	 * @return
	 */
	@RequestMapping(value="/customer/toPopList")
	public String toPopList(CustomerModel model,ModelMap map){
		map.addAttribute("model", model);
		return CUSTOMER+"customerPop";
	}
	
	/**
	 * 打开添加弹出框内容
	 * @return
	 */
	@RequestMapping(value="/customer/toPopAdd")
	public String toPopAdd(CustomerModel model,ModelMap map){
		map.addAttribute("model", model);
		return CUSTOMER+"addcustomerPop";
	}
	
	/**
	 * 弹出框局部刷新
	 */
	@RequestMapping(value="/customer/popList",produces="text/plain;charset=UTF-8")
	public @ResponseBody String popList(CustomerModel model){
		Pager page=PagerHelper.getInstance(this.getRequest(), PageSizeEnum.MIDDLE);
		List<CustomerModel> list=customerService.findByCondition(model,page);
		page.setRows(list);
		return JackJsonUtils.toJSon(page);
	}
	
	/**
	 * 检查客户名是否存在
	 * @param customerName
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/customer/checkCustomer",produces="text/plain;charset=UTF-8")
	public @ResponseBody String checkCustomer(String name, String id) {
		boolean flag=false;
		flag=customerService.checkCustomer(name,id);
		return String.valueOf(flag);
	}
	
	/**
	 * 根据客户名称查找
	 * @param name 客户名称
	 * @return 返回客户实体，无返回null
	 */
	@RequestMapping(value="/customer/readCustomerByName")
	public @ResponseBody String readCustomerByName(String name){
		Customer customer=customerService.readCustomerByName(name);
		return JackJsonUtils.toJSon(customer);
	}

}
