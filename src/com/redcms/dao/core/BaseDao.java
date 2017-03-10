package com.redcms.dao.core;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import com.redcms.page.PageDiv;
/**
 * ��װ�������ݵĻ����������������Ƕ���
 * @param <T>
 */
public interface BaseDao<T extends Serializable>
{
	/**
	 * ͨ��sql���,����insert update delete create �Ȳ���
	 * insert into stu(name,age ) values(?,?);  'zhangsan' 18
	 * @param sql
	 * @param param
	 * @return
	 */
	public int updateBySql(String sql,Object...param)throws SQLException;
	/**
	 * ����ִ�и����޸Ĳ�����
	 * delete from admin where id=? and name=?
	 * @param sql ����PreparedStatement��SQL���
	 * @param params ��ά�������飬ÿ����һ��SQL���Ĳ�����
	 * @return ִ����Ӱ��ļ�¼��
	 */
	public int[] executeBatch(String sql,Object[]...params)throws SQLException; 
	/**
	 * ������sql��䣬��װ������䣬һ�𷢸����ݿ�
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
	 * ����һ�����󣬽�t��������г�Ա����sql��䣬�������ݱ�
	 * @param t  �ͱ��Ӧ��bean
	 * @retuen ���������ݵ�idֵ
	 * @throws SQLException
	 */
	public int add(T t)throws SQLException;
	/**
	 * �޸�һ�����󣬸���t�����id,����t��id����Ϊ��
	 * @param t
	 * @throws SQLException
	 */
	public void update(T t)throws SQLException;
	/**
	 * ����t�е�idɾ����Ӧ����
	 * @param t
	 * @throws SQLException
	 */
	public void delete(Class<T> clazz,Integer id)throws SQLException;
	/**
	 * ͨ��id�õ�һ������
	 * @param clazz
	 * @return
	 * @throws SQLException
	 */
	public T getById(Class<T> clazz,Integer id)throws SQLException; 
	/**
	 * �õ�ָ�������������
	 * @param clazz
	 * @param sql
	 * @param params Null
	 * @return
	 * @throws SQLException
	 */
	public List<T> getAll(Class<T> clazz,String sql,Object...params)throws SQLException;
	/**
	 * �õ���ҳ����
	 * @param clazz  ���ұ��Ӧ��bean
	 * @param pageNo  ��ǰҳ��
	 * @param PageSize  //ÿҳ����
	 * @return
	 */
   // public PageDiv<T> getByPage(Class<T> clazz,int pageNo,int PageSize,Finder[] find,Order[] order)throws SQLException;
    /**
     * �õ�������
     * @param clazz
     * @param sql
     * @return
     */
    public int getTotalCount(String sql,Object...params)throws SQLException;
    
    
    /**
     * ͨ��sql����ҵ�һ������
     * @param clazz Ŀ������clazz
     * @param sql   select * from aa;
     * @param param Ԥ�������������Ϊnull
     * @return  ��Ӧ��ʵ�����
     */
    public T getByUniq(Class<T> clazz,String sql,Object...params)throws SQLException;
    /**
     * �ҳ�ǰ��������
     * @param clazz
     * @param sql
     * @param Ҫ��������
     * @param params
     * @return
     */
    public List<T> getByTop(Class<T> clazz,String sql,int top,Object...params)throws SQLException;
    /**
     * ͨ��sql����ҳ������
     * @param clazz
     * @param sql
     * @param pageNo
     * @param pageSize
     * @param params
     * @return
     */
    public PageDiv<T> getByPage(Class<T> clazz,String sql,int pageNo,int pageSize,Object...params)throws SQLException; 
    
}
