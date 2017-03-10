package com.redcms.dao;

import java.util.List;

import com.redcms.beans.Model;
import com.redcms.dao.core.BaseDao;

public interface ModelDao extends BaseDao<Model>
{
     public List<Model> getAllModel()throws Exception;
}
