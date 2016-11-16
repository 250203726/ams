package com.util.stream;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * 流处理
 * @author Wymann
 * @Date 2013-12-21 下午04:58:56
 *
 */
public class PrinterWriterHelper {

	/**
	 * 返回页面流
	 * @param response
	 * @param str
	 * @author Whymann 2013-12-26 下午12:39:09
	 */
	public static void writeString(HttpServletResponse response,String str){
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out=response.getWriter();
			out.print(str);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
