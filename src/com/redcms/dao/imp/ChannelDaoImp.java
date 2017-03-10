package com.redcms.dao.imp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.dao.ChannelDao;
import com.redcms.dao.core.BaseDaoImp;

public class ChannelDaoImp extends BaseDaoImp<Channel> implements ChannelDao
{

	@Override
	public List<Channel> getAllChannel() throws SQLException
	{
		List<Channel> all=new ArrayList<Channel>();
		
		List<Channel> parent=this.getParentChannel();
		if(null!=parent&&parent.size()>0)
		{
			for(Channel parc:parent)
			{
				all.add(parc);
				List<Channel> subs=this.getSubChannel(parc.getId());
				if(null!=subs&&subs.size()>0)
				{
					for(Channel subc:subs)
					{
						all.add(subc);
					}
				}
				
			}
		}

		return all;
	}

	@Override
	public List<Channel> getParentChannel() throws SQLException
	{
		// TODO Auto-generated method stub
		return this.getAll(Channel.class, "select * from channel where parent_id is null order by orderlist", null);
	}

	@Override
	public List<Channel> getSubChannel(Integer parentId) throws SQLException
	{
		
		return this.getAll(Channel.class, "select * from channel where parent_id=? order by orderlist", new Object[]{parentId});
	}

}
