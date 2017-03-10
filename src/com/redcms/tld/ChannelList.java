package com.redcms.tld;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.redcms.beans.Channel;
import com.redcms.beans.Model;
import com.redcms.dao.ChannelDao;
import com.redcms.dao.ModelDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;

public class ChannelList extends SimpleTagSupport
{
	int index=1;
	
	
	 ChannelDao channelDao=(ChannelDao)DaoFactory.getDao(ChannelDao.class);
	 ModelDao modelDao=(ModelDao)DaoFactory.getDao(ModelDao.class);
	 List<Model> modelList=null;
	@Override
	public void doTag() throws JspException, IOException
	{
		 StringBuilder sb=new StringBuilder();

		 try
		{
			 modelList=modelDao.getAllModel();
			List<Channel> parents=channelDao.getParentChannel();
			 if(null!=parents&&parents.size()>0)
			 {
				 //取一级类别
				 pingHtml(sb,parents,0);
			 }
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		 
		 
		 
		 this.getJspContext().getOut().write(sb.toString());
	}

	public void pingHtml(StringBuilder sb,List<Channel> list,int level)
	{
	
		if(null!=list&&list.size()>0)
		{
			for(int i=0;i<list.size();i++)
			{
				Channel parent=list.get(i);
                //组装一级栏目
				sb.append("<tr>");
			    sb.append("<td align='center' valign='middle'>"+(index++)+"</td>");
			    sb.append("<td align='center' valign='middle'>"+parent.getOrderlist()+"</td>");
			    sb.append("<td align='left' valign='top'>");
			    sb.append("&nbsp;");
		        for(int z=0;z<level;z++)
		        {
		        	if(z==level-1)
		        		sb.append("&nbsp;&nbsp;&nbsp;│──");
		        	else
		        		sb.append("&nbsp;&nbsp;&nbsp;");
		        }
			    sb.append(parent.getName());
			    sb.append("</td>");
			    sb.append("<td align='center' valign='middle'>");
			    for(Model model:modelList) 
		        {
			       if(model.getId()==parent.getModelId())
			       {
			    	   sb.append(model.getName());
			    	   break;
			       }
		        }
			    sb.append("</td>");
			    sb.append("<td align='center'><form method='post' action='channel'/>");
			    sb.append("<input type='hidden' name='action' value='add'/>");
			    sb.append("<input type='hidden' name='parentId' value='"+parent.getId()+"'/>");
			    
			    sb.append("<select name='modelId'>");
			        for(Model model:modelList) 
			        {
			          sb.append("<option value='"+model.getId()+"'");
			        if(parent.getModelId()==model.getId())
			          {
			        	  sb.append(" selected='selected'");
			          }
			          sb.append(">"+model.getName()+"</option>");
			        }
			      sb.append("</select>");
			        sb.append("<input type='submit' name='Submit2' value='添加子栏目'>");
			    sb.append("</form>");
			    sb.append("</td>");
			    sb.append("<td align='center'><a href='channel?action=edit&id="+parent.getId()+"'>修改</a>&nbsp;");
			    sb.append("<a href='channel?action=delete&id="+parent.getId()+"'>删除</a> ");
				sb.append("</td>");
			 sb.append("</tr>");
			 
			 
			 try
			{
				List<Channel> subs=channelDao.getSubChannel(parent.getId());
				 if(null!=subs&&subs.size()>0)
				 {
					 pingHtml(sb, subs,level+1);
				 }
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		}
	}
	
	}
	
}
