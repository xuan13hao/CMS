package com.redcms.tld;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.redcms.beans.Channel;
import com.redcms.dao.ChannelDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;

public class ChannelMenu extends SimpleTagSupport
{
	
	 ChannelDao channelDao=(ChannelDao)DaoFactory.getDao(ChannelDao.class);
	// ModelDao modelDao=(ModelDao)DaoFactory.getDao(ModelDao.class);
	@Override
	public void doTag() throws JspException, IOException
	{
		 StringBuilder sb=new StringBuilder();
		 try
		{
			 List<Channel> parents=channelDao.getParentChannel();
			 leftMenu(sb, parents);
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		 
		 this.getJspContext().getOut().write(sb.toString());
	}
	
	private void leftMenu(StringBuilder sb, List<Channel> list)
	{
		 try
		{
			if(null!=list&&list.size()>0)
			 {
				 //取一级类别
			      for(Channel parent:list)
			      {
			    	  List<Channel> subs=channelDao.getSubChannel(parent.getId());
			          if(null!=subs&&subs.size()>0)
			          {
			        	 	        	  
			        	 sb.append("<li><span class='folder'><a href='content?action=list&channelId="+parent.getId()+"&modelId="+parent.getModelId()+"' target='main'>"+parent.getName()+"</a></span>");
			             sb.append("<ul>");
			        	 leftMenu(sb, subs);
			        	 sb.append("</ul></li>");
			          }else
			          {
			        	  sb.append("<li><span class='file'><a href='content?action=list&channelId="+parent.getId()+"&modelId="+parent.getModelId()+"' target='main'>"+parent.getName()+"</a></span></li>");
			          }
			    	  
			      }
			 }
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
	}

	
}
