package com.redcms.dao.imp;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Files;
import com.redcms.dao.FilesDao;
import com.redcms.dao.core.BaseDaoImp;

public class FilesDaoImp extends BaseDaoImp<Files> implements FilesDao
{

	@Override
	public List<Files> getFilesByChannel(Integer channelId) throws SQLException
	{
	
		return null;
	}

	@Override
	public void updateFilesBychannel(Integer channelId) throws SQLException
	{
	     String sql="update files set isvalid=0 where channel_id=?";
	     this.updateBySql(sql, new Object[]{channelId});
	}

}
