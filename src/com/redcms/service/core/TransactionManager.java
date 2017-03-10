package com.redcms.service.core;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.sql.Connection;

import com.redcms.dao.core.ConnectionManager;

public class TransactionManager implements InvocationHandler
{
	private ConnectionManager cm=null;
	private Connection con=null;
	private Object org=null;
	public TransactionManager(Object org)
	{
		cm=ConnectionManager.getInstance();
		this.org=org;
	}

	public Connection getConnection()
	{
		System.out.println(cm.getConnection());
		return cm.getConnection();
	}
	
	
	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable
	{
		Object result=null;
		 
		 this.getConnection().setAutoCommit(false);
		 try
		{
			result=method.invoke(org, args);
			this.getConnection().commit();
			
		} catch (Exception e)
		{
		   this.getConnection().rollback();
			e.printStackTrace();
		}finally
		{
			this.getConnection().close();
		}
		
		return result;
	}

}
