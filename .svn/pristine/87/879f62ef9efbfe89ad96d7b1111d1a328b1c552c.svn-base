package com.util.handler;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.exception.SQLGrammarException;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.exceptions.MySQLSyntaxErrorException;

/**
 * 异常拦截器
 * @author Wymann
 * @Date 2013-12-23 下午01:01:41
 *
 */
public class MyExceptionHandler implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception ex) {
		String viewName="";
		String message="";
		// 根据不同错误转向不同页面
		if(ex instanceof NumberFormatException){
			ex.printStackTrace();
			message="格式化字符错误！";
			viewName="error/404";
		}else if(ex instanceof BindException){
			ex.printStackTrace();
			message="输入字符不规范！";
			viewName="error/404";
		}else if(ex instanceof SQLGrammarException || ex instanceof MySQLSyntaxErrorException){
			ex.printStackTrace();
			message="数据库错误！";
			viewName="error/404";
		}else if(ex instanceof NullPointerException){
			ex.printStackTrace();
			message="空指针异常！";
			viewName="error/404";
		}else if(ex instanceof RuntimeException){
			ex.printStackTrace();
			message="运行时异常！";
			viewName="error/404";
		}else if(ex instanceof FileNotFoundException){
			ex.printStackTrace();
			message="文件未找到！";
			viewName="error/404";
		}else if(ex instanceof Exception){
			ex.printStackTrace();
			message="未知错误！";
			viewName="error/404";
		}
		if(StringUtils.isNotEmpty(viewName)){
			 if (!(request.getHeader("accept").indexOf("application/json") > -1 
					 || (request.getHeader("X-Requested-With")!= null 
					 && request.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) { //jsp返回
				 request.setAttribute("exception", message);
			    return new ModelAndView(viewName); 
			} else {// JSON格式返回  
                try {  
                    PrintWriter writer = response.getWriter();  
                    writer.write(message);  
                    writer.flush();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
                return null;  
            }  
		}
        return null;  
	}
}