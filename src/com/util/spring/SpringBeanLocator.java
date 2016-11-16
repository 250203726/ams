package com.util.spring;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;

/**
 * 获取spring配置文件（容器）的bean对象
 * 在spring容器中要声明该bean，
 * eg：<bean id="springBeanLocator" class="com.util.spring.SpringBeanLocator"/>
 * @version 1.0,2013-10-15
 * @author Wymann
 */
public class SpringBeanLocator implements BeanFactoryAware{
	private static BeanFactory beanFactory = null;

	@Override
	@SuppressWarnings("static-access")
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
	   this.beanFactory = beanFactory;
	}

	/*
	* 根据提供的bean名称获得相应的类
	* beanName - bean名称
	* */
	public static Object getBean(String beanName) {
	   return beanFactory.getBean(beanName);
	}
}
