package com.util.generator;

import java.util.UUID;

/**
 * 主键生成器
 * @author Wymann
 * 2013-9-23 下午04:27:50
 */
public class IdGenerator {
	
	private static IdGenerator idGenerator;
	private static final String PK_FILL_CHARACTER = "0";
	
	private IdGenerator(){}
	
	public static IdGenerator getInstance(){
		
		if(idGenerator == null){
			idGenerator = new IdGenerator();
			System.out.println("正在初始化主键生成器。");
		}
		return idGenerator;
	}
	
	/**
	 * 根据长度填充字符
	 * @param oriC
	 * @param len
	 * @return
	 * @author Whymann 2014-2-15 下午02:24:31
	 */
	public synchronized String getFilleId(String oriC,int len){
		String str=fillCharacter(oriC, PK_FILL_CHARACTER, len);
		System.out.println("当前生成的主键是："+str);
		return str;
	}
	
	/**
	 * 根据UUID生成id
	 * @return
	 * @author Whymann 2013-12-17 下午04:48:42
	 */
	public synchronized String getShortId(){
		String uuid=String.valueOf(UUID.randomUUID().getLeastSignificantBits());
		System.out.println("当前生成的主键是："+uuid.replace("-", ""));
		return String.valueOf(uuid);
	}
	
	/**
	 * 根据时间生成一定长度的id
	 * @return
	 */
	public synchronized String getId(){
		String id=String.valueOf(System.currentTimeMillis());
		int ran=(int)(Math.random()*10000);
		id+=fillCharacter(String.valueOf(ran),PK_FILL_CHARACTER,3);
		System.out.println("当前生成的主键是："+id);
		return id;
	}
	
	/**
	 * 填充字符
	 * @param oriC  原始字符
	 * @param fullC 填充字符
	 * @param size  总长度
	 * @return
	 */
	private String fillCharacter(String oriC,String fillC,int size){
		String res = "";
		if(oriC != null){
			int oriCLen = oriC.length();
			for(int i = size - oriCLen;i>0;i--){
				res += fillC;
			}
		}
		res += oriC;
		return res;
	}
	
	public static void main(String[] args) {
		for(int i=0;i<100;i++){
			IdGenerator.getInstance().getId();
		}
	}
	
}
