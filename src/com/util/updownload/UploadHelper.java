package com.util.updownload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

/***
 * 上传文件助手
 * @author simon
 * @date 2016年11月24日 下午5:17:37
 */
public class UploadHelper {
	
	/***
	 * 上传文件路径根路径
	 */
	static String UPLOADPATH="upload"; 
	
	/***
	 * 文件上传 
	 * @author simon
	 * @date 2016年11月24日 下午5:18:47
	 * @param file 要上传的文件
	 * @param request 页面的请求
	 * @throws IOException
	 */
	public static void upload(MultipartFile file,HttpServletRequest request) throws IOException {
		byte[] bytes = file.getBytes();  
        System.out.println(file.getOriginalFilename());  
        String uploadDir = request.getRealPath("/")+UPLOADPATH;  
        File dirPath = new File(uploadDir);  
        if (!dirPath.exists()) {  
            dirPath.mkdirs();  
        }  
        String sep = System.getProperty("file.separator");  
        File uploadedFile = new File(uploadDir + sep  
                + file.getOriginalFilename());  
        FileCopyUtils.copy(bytes, uploadedFile);
	}
}
