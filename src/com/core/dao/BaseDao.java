package com.core.dao;

/**
 * DAO父类接口
 *
 * @version 1.0,2013-8-31
 * @author Wymann
 * @param <T> 实体模型
 */
public interface BaseDao<T> {
	
	/**
	 * 保存
	 * @param t：实体
	 * @return
	 */
	public T save(T t);
	
	/**
	 * 更新
	 * @param t：实体
	 */
	public void update(T t);
	
	/**
	 * 删除
	 * @param id：实体t
	 */
	public void delete(T t);
	
	/**
	 * 根据id查找
	 * @param id：实体id
	 * @return
	 */
	public T get(String id);
	
	/**
	 * 根据id查找
	 * @param id
	 * @return
	 */
	public T get(int id);


}
