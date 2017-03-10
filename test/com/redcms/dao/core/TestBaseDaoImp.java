package com.redcms.dao.core;

import java.sql.SQLException;

import org.junit.Test;

public class TestBaseDaoImp
{
	@Test
   public void TestUpdateBySql()
   {
	   BaseDao bd=new BaseDaoImp();
	   try
	{
		//bd.updateBySql("create table t1(f1 int);", null);
		   bd.updateBySql("insert into t1 values(?)", 10);
	} catch (SQLException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
   }
}
