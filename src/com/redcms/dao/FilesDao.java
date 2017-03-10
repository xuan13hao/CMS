package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Files;
import com.redcms.dao.core.BaseDao;

public interface FilesDao extends BaseDao<Files>
{
    public List<Files> getFilesByChannel(Integer channelId)throws SQLException;
    public void updateFilesBychannel(Integer channelId)throws SQLException;
}
