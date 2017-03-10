package com.redcms.dao.core;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

/**
 * ����Connection�Ĺ����࣬���ڵõ�Connection
 * @author Administrator
 *
 */
public abstract class ConnectionManager
{
	 private static final String CONNECTIONIMP="ConnectionManager";
	 private static final Logger log=Logger.getLogger(ConnectionManager.class);
     private static ThreadLocal<Connection> cons=new ThreadLocal<Connection>();
     private static String impclass=null;
     public static ConnectionManager cm=null;
     //��ʼ����ǰ���ʵ������
     static
     {
    	 ResourceBundle  res=ResourceBundle.getBundle("jdbc");
    	 impclass=res.getString(CONNECTIONIMP);    
     }
     private Connection con=null;
     /**
      * ���һ��Connection����
      * @return
      */
     public Connection getConnection()
     {
    	con=cons.get();
    	
    	if(null==con)
    	{
    		con=this.getRealConnection();
    		cons.set(con);
    	}
    	
    	return con;
     }
    
     /**
     * �����õ�Connection�ķ���
     * @return
     */
     public abstract Connection getRealConnection();
    
     public void setAutoCommit(boolean auto)
     {
/*    	 if(null==con)
    	 {
           con=getConnection();
    	 }*/
		 try
			{
				cm.getConnection().setAutoCommit(auto);
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
     }
     
     public void commit()
     {
    
    		 try
			{
				cm.getConnection().commit();
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    
     }
     public void rollback()
     {
    	
    		 try
			{
    			if(!cm.getConnection().getAutoCommit())
				   cm.getConnection().rollback();
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	 
     }
     
     /**
     * �ر�����
     */
     public void closeConnection()
     {
    	
    		 try
			{
				 cm.getConnection().close();
				cons.remove();
				//if(con.isClosed())con=null;
			} catch (SQLException e)
			{
				log.error("ERROR_0001_ConnectionManager_CloseConnection"+e);
				//e.printStackTrace();
			}
    	
     }
     /**
      * ���ڵõ���ǰConnectionManager����ķ���
      * һ���ǵõ��������
      * @return
      */
     public static ConnectionManager getInstance()
     {
    	 if(null==cm)
    	 {
 
	    	try
			{
				cm=(ConnectionManager)Class.forName(impclass).newInstance();
			} catch (Exception e)
			{
				log.error("ERROR_0002_ConnectionManager_getInstance_(jdbc.properties)�����ļ�����"+e);
			}
    	 }
    	
         return cm;

     }

}
