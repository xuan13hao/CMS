package com.redcms.service.core;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.util.ResourceBundle;

import com.redcms.dao.core.ConnectionManager;
import com.redcms.service.UserService;

public class ServiceFactory
{
    public static Object getService(Class clazz)
    {
    	ResourceBundle res=ResourceBundle.getBundle("service");
    	String imp=res.getString(clazz.getName());
    	 Object obj=null;
    	
    	try
		{
			obj=Class.forName(imp).newInstance();
		} catch (InstantiationException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return Proxy.newProxyInstance(obj.getClass().getClassLoader(), obj.getClass().getInterfaces(),new TransactionManager(obj));
    }
    
    public static void main(String[] args)
	{
		UserService us=(UserService)ServiceFactory.getService(UserService.class);
		System.out.println(us);
	}
}
