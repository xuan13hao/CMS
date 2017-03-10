package com.redcms.dao.imp;

import java.util.List;

import com.redcms.beans.Model;
import com.redcms.dao.ModelDao;
import com.redcms.dao.core.BaseDaoImp;

public class ModelDaoImp extends BaseDaoImp<Model> implements ModelDao
{

	@Override
	public List<Model> getAllModel() throws Exception
	{
		// TODO Auto-generated method stub
		return this.getAll(Model.class, "select * from model", null);
	}

}
