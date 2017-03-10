package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.ModelItem;
import com.redcms.dao.core.BaseDao;

public interface ModelItemDao extends BaseDao<ModelItem>
{

	   public List<ModelItem> getByModelId(int id)throws SQLException;
	   public void addField(ModelItem []all)throws SQLException;
	   public void deleteField(int[]ids)throws SQLException;
}
