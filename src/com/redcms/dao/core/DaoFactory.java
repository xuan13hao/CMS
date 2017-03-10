package com.redcms.dao.core;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

public class DaoFactory
{
	public static Map<Class,Object> daos=new HashMap<Class,Object>();
	/**
	 *  ModelDao md=(ModelDao)DaoFactory.getDao(ModelDao.class);
	 * @param clazz
	 * @return
	 */
    public static Object getDao(Class clazz)
    {
    	Object result=null;
    	result=daos.get(clazz);
    	if(null==result)
    	{
	    	ResourceBundle res= ResourceBundle.getBundle("dao");
	    	String imp=res.getString(clazz.getName());
	    	
	    	try
			{
				result=Class.forName(imp).newInstance();
				daos.put(clazz, result);
			} catch (InstantiationException | IllegalAccessException
					| ClassNotFoundException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	return result;
    }
}
