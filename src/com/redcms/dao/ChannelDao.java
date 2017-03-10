package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.dao.core.BaseDao;

public interface ChannelDao extends BaseDao<Channel>
{
   public List<Channel> getAllChannel()throws SQLException;
   public List<Channel> getParentChannel()throws SQLException;
   public List<Channel> getSubChannel(Integer parentId)throws SQLException;
}
