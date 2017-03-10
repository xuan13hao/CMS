package com.redcms.dao;

import java.sql.SQLException;

import com.redcms.beans.Manager;
import com.redcms.dao.core.BaseDao;

public interface ManagerDao extends BaseDao<Manager>
{
     public Manager checkLogin(String email,String password)throws SQLException;
}
