package com.util.json;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Test {
	
	private int id;
	private String name;
	private Date date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public static void main(String[] args){
		List<Test> list=new ArrayList<Test>();
		for(int i=0;i<3;i++){
			Test test=new Test();
			test.setId(i);
			test.setName("名称"+i);
			test.setDate(new Date());
			list.add(test);
		}
		String jsonStr=JackJsonUtils.toJSon(list);
		System.out.println(jsonStr);
		Test[] testArray=JackJsonUtils.readValue(jsonStr, Test[].class);
		List<Test> list2=Arrays.asList(testArray);
		System.out.println(list2);
	}

}

