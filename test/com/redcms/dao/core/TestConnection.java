package com.redcms.dao.core;

import java.sql.Connection;

import org.junit.Test;

public class TestConnection
{
	@Test
   public void testConnection1()
   {
	 final ConnectionManager  cm=ConnectionManager.getInstance();
	  Connection con=cm.getConnection();
	  System.out.println(cm.getConnection());
	  //cm.closeConnection();
	  System.out.println(cm.getConnection());
	  new Thread(new Runnable()
	{
		
		@Override
		public void run()
		{
		   System.out.println(cm.getConnection());
			
		}
	}).start();

   }
}
