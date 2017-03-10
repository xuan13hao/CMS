package com.redcms.service.imp;

import java.util.List;

import com.redcms.beans.Model;
import com.redcms.dao.ModelDao;
import com.redcms.dao.core.DaoFactory;
import com.redcms.service.UserService;

public class UserServiceImp implements UserService
{

	@Override
	public List<Model> getAllModel()
	{
		List<Model> list=null;
		//得到所有模型，
		//还要得到所有模型下的栏目
		ModelDao md=(ModelDao)DaoFactory.getDao(ModelDao.class);
//      LogDao ld=(LogDao)DaoFacotory.getDao(LogDao.class);
		try
		{
			list=md.getAllModel();
			//Log log=new Log();
			//log.setMsg("2012-012-12 12:21:10取了数据");
			//ld.add(log);
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		
		return list;
	}

}
