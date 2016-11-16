package com.util.page;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.ams.BaseConst;
import com.ams.system.entity.Dictionary;
import com.util.enums.PageSizeEnum;
import com.util.load.DictionaryTranslate;

public class PagerHelper
{ 
	/**
	 * 
	 * @param request
	 * @param pageSize :默认每页数量
	 * @return
	 * @author Whymann 2014-1-15 上午10:44:00
	 */
    public static Pager getInstance(HttpServletRequest request, PageSizeEnum pageEnum)
    {
    	Dictionary dic=DictionaryTranslate.getInstance().getDicByCode(BaseConst.DIC_PAGE_SIZE, pageEnum.toString());
    	int pageSize=0;
    	if(null!=dic && StringUtils.isNotEmpty(dic.getValue())){
    		pageSize=Integer.parseInt(dic.getValue());
    	}
        Pager pager = new Pager();
        
        //每页数量
         if(request.getParameter("pagesize")!=null)
        {
            try
            {
                pager.setPageSize(Integer.parseInt(request.getParameter("pagesize")));
                
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }else{//设置每页默认数量
        	if(pageSize>0){
        		pager.setPageSize(pageSize);
        	}else{
        		pager.setPageSize(10);
        	}
        }
        //当前分页
         if(request.getParameter("page")!=null)
         {
             try
             {
                 pager.setPage(Integer.parseInt(request.getParameter("page")));
             }
             catch (Exception e) {
             	e.printStackTrace();
             }
         }

        request.setAttribute("pager", pager);
        return pager;
    }
    
}
