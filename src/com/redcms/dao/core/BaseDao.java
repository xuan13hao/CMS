package com.redcms.dao.core;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import com.redcms.page.PageDiv;
/**
 * 封装操作数据的基本方法，操作的是对象
 * @param <T>
 */
public interface BaseDao<T extends Serializable>
{
	/**
	 * 通过sql语句,进行insert update delete create 等操作
	 * insert into stu(name,age ) values(?,?);  'zhangsan' 18
	 * @param sql
	 * @param param
	 * @return
	 */
	public int updateBySql(String sql,Object...param)throws SQLException;
	/**
	 * 批量执行更新修改操作，
	 * delete from admin where id=? and name=?
	 * @param sql 用于PreparedStatement的SQL语句
	 * @param params 二维对象数组，每行是一条SQL语句的参数。
	 * @return 执行完影响的记录数
	 */
	public int[] executeBatch(String sql,Object[]...params)throws SQLException; 
	/**
	 * 批处理sql语句，组装多条语句，一起发给数据库
	 * set autocommit=0
	 * create table cc(id int,i int);
	 * insert into cc(12,22);
	 * insert into cc(18,23);
	 * commit | ROLLBACK
	 * @param sql
	 * @return
	 */
	public int[] addBatch(String[]sql)throws SQLException;
	

	/**
	 * 增加一个对象，将t对像的所有成员构造sql语句，插入数据表
	 * @param t  和表对应的bean
	 * @retuen 最后加入数据的id值
	 * @throws SQLException
	 */
	public int add(T t)throws SQLException;
	/**
	 * 修改一个对象，根据t对像的id,所以t的id不能为空
	 * @param t
	 * @throws SQLException
	 */
	public void update(T t)throws SQLException;
	/**
	 * 根据t中的id删除对应数据
	 * @param t
	 * @throws SQLException
	 */
	public void delete(Class<T> clazz,Integer id)throws SQLException;
	/**
	 * 通过id得到一个对象
	 * @param clazz
	 * @return
	 * @throws SQLException
	 */
	public T getById(Class<T> clazz,Integer id)throws SQLException; 
	/**
	 * 得到指定类的所有数据
	 * @param clazz
	 * @param sql
	 * @param params Null
	 * @return
	 * @throws SQLException
	 */
	public List<T> getAll(Class<T> clazz,String sql,Object...params)throws SQLException;
	/**
	 * 得到分页数据
	 * @param clazz  查找表对应的bean
	 * @param pageNo  当前页码
	 * @param PageSize  //每页条数
	 * @return
	 */
   // public PageDiv<T> getByPage(Class<T> clazz,int pageNo,int PageSize,Finder[] find,Order[] order)throws SQLException;
    /**
     * 得到总条数
     * @param clazz
     * @param sql
     * @return
     */
    public int getTotalCount(String sql,Object...params)throws SQLException;
    
    
    /**
     * 通过sql语句找第一条数据
     * @param clazz 目标对象的clazz
     * @param sql   select * from aa;
     * @param param 预处理参数，可以为null
     * @return  对应的实体对象
     */
    public T getByUniq(Class<T> clazz,String sql,Object...params)throws SQLException;
    /**
     * 找出前几条数据
     * @param clazz
     * @param sql
     * @param 要几条数据
     * @param params
     * @return
     */
    public List<T> getByTop(Class<T> clazz,String sql,int top,Object...params)throws SQLException;
    /**
     * 通过sql语句分页找数据
     * @param clazz
     * @param sql
     * @param pageNo
     * @param pageSize
     * @param params
     * @return
     */
    public PageDiv<T> getByPage(Class<T> clazz,String sql,int pageNo,int pageSize,Object...params)throws SQLException; 
    
}
