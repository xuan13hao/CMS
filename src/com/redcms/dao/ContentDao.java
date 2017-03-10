package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.Model;
import com.redcms.dao.core.BaseDao;
import com.redcms.page.PageDiv;

public interface ContentDao extends BaseDao<Content>
{
    public PageDiv<Content> getContentByChannelId(Model model,int pageNo,int pageSize,List<Channel> channels)throws SQLException;
}
