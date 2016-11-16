package com.util.md5;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * md5加密算法
 * @author WyMann
 *
 */
public class Security {
	
	/**
	 * 返回加密字符串
	 * @param b
	 * @return 加密后的字符串
	 */
	private static String getStr(byte[] b){
		String str="";
		String stmp="";
		for(int i=0;i<b.length;i++){
			stmp=Integer.toHexString(b[i] & 0xFF);
			if(stmp.length()==1){
				str=str+"0"+stmp;
			}
			else{
				str=str+stmp;
			}
		}
		return str.toUpperCase();
	}
	
	/**
	 * MD5加密
	 * @param str：加密前字符串
	 * @return MD5加密后字符
	 */
	public static String md5(String str){
		MessageDigest ms=null;
		try {
			ms=MessageDigest.getInstance("MD5");
			ms.reset();
			ms.update(str.getBytes("UTF-8"));
		} catch (NoSuchAlgorithmException e) {
			System.out.println("MD5加密：非法摘要算法");
			e.printStackTrace();
		}catch(UnsupportedEncodingException e){
			System.out.println("MD5加密：非法编码");
			e.printStackTrace();
		}
		return getStr(ms.digest());
	}
	
	public static void main(String[] args){
		String str=Security.md5("admin");
		System.out.println(str);
	}

}
