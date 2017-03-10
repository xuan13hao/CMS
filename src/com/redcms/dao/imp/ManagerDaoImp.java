package com.redcms.dao.imp;

import java.sql.SQLException;

import com.redcms.beans.Manager;
import com.redcms.dao.ManagerDao;
import com.redcms.dao.core.BaseDaoImp;

public class ManagerDaoImp extends BaseDaoImp<Manager> implements ManagerDao
{

	@Override
	public Manager checkLogin(String email, String password)
			throws SQLException
	{
		String sql="select * from manager where email=? and passwd=?";
		//select * from manager where email='admin' or 1=1--' and passwd='cc'
		
		return this.getByUniq(Manager.class, sql, new Object[]{email,password});
	}

}
