package com.redcms.dao.imp;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.Model;
import com.redcms.dao.ContentDao;
import com.redcms.dao.core.BaseDaoImp;
import com.redcms.page.PageDiv;

public class ContentDaoImp extends BaseDaoImp<Content> implements ContentDao
{

	@Override
	public PageDiv<Content> getContentByChannelId(Model model,int pageNo,int pageSize, List<Channel> channels)
			throws SQLException
	{
		//String sql="select t.name as channelName,c.* from "+model.getTableName()+" c left join channel t on t.id=c.channel_id and t.id in(?)";
	   String sql="select t.name channelName,c.* from "+model.getTableName()+" c,channel t where t.id in(?) and t.id=c.channel_id";
		StringBuilder sb=new StringBuilder();
	    for(int i=0;i<channels.size();i++)
	    {
	    	Channel ch=channels.get(i);
            sb.append(ch.getId());
            if(i<channels.size()-1)
            {
            	sb.append(",");
            }
	    }
	    
		return this.getByPage(Content.class, sql, pageNo, pageSize, sb.toString());
	}

}
