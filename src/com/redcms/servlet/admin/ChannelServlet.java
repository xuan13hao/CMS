package com.redcms.servlet.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Channel;
import com.redcms.beans.Files;
import com.redcms.beans.Model;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.ImageIOUtil;
@WebServlet("/admin/channel")
public class ChannelServlet extends ServletBase
{
	/**
	 * 初始化模版数据
	 * @param req
	 * @throws IOException
	 */
	public  void initTemp(HttpServletRequest req)throws IOException
	{
		 String path=this.getServletContext().getRealPath("/WEB-INF/templates/web");
	        File f=new File(path);
	        String[] indexs=f.list(new FilenameFilter()
			{
				@Override
				public boolean accept(File dir, String name)
				{
					if(name.indexOf("_index.jsp")!=-1)
					return true;
					else
					return false;
				}
			});
	        String lists[]=f.list(new FilenameFilter()
			{
				
				@Override
				public boolean accept(File dir, String name)
				{
					if(name.indexOf("_list.jsp")!=-1)
					return true;
					else
					return false;
				}
			});
	        String contents[]=f.list(new FilenameFilter()
			{
				
				@Override
				public boolean accept(File dir, String name)
				{
					if(name.indexOf("_content.jsp")!=-1)
					return true;
					else
					return false;
				}
			});
	        req.setAttribute("indexs",indexs);
	        req.setAttribute("lists",lists);
	        req.setAttribute("contents", contents);
	}
	/**
	 * 跳转到增加栏目页面
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		try
		{
			//List<Model> model_list=modelDao.getAllModel();
			List<Channel> channel_list=channelDao.getAllChannel();
			
			//req.setAttribute("model_list", model_list);
			req.setAttribute("channel_list",channel_list);
			int modelId=this.getInt(req, "modelId");
			int parentId=this.getInt(req,"parentId");
			
			Model model=modelDao.getById(Model.class, modelId);
			req.setAttribute("model",model);
			
			
			req.setAttribute("modelId", modelId);
			req.setAttribute("parentId",parentId);
			this.initTemp(req);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		this.forward(req, resp, "admin/channel_add.jsp");	
	}
	/**
	 * 增加栏目
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveAdd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		Channel channel=new Channel();
		channel.setCreatetime(new Date());
		this.getBean(req, channel);
		if(null!=channel.getParentId()&&channel.getParentId()==0)
		{
			channel.setParentId(null);
		}
        ConnectionManager cm=ConnectionManager.getInstance();
		try
		{
			cm.setAutoCommit(false);
			//对栏目图进行裁切
			if(null!=channel.getPic()&&channel.getPic().toLowerCase().indexOf("http://")==-1)
			{
				
				int index=channel.getPic().indexOf("res/uppics");
				String substr=channel.getPic().substring(index);
				
				String filepath=this.getServletContext().getRealPath(substr);
				
				File orgfile=new File(filepath);
				orgfile.renameTo(new File(filepath+"_"));
				
				FileInputStream fi=new FileInputStream(filepath+"_");
				BufferedImage img=ImageIO.read(fi);
				
				
				ImageIOUtil.write(channel.getPicWidth(), channel.getPicHeight(), filepath, fi, img);
			    
				new File(filepath+"_").delete();
			}
			int reid=channelDao.add(channel);
			//对文件资源进行更新
			String filesids=this.getString(req,"filesId");
			if(null!=filesids&&!filesids.trim().equals(""))
			{
			String []fids=filesids.split("[,]");
			if(fids!=null&&fids.length>0)
			{
				for(String fid:fids)
				{
					Files f=filesDao.getById(Files.class,Integer.parseInt(fid.trim()));
				    f.setChannelId(reid);
				    f.setModelId(channel.getModelId());
				    f.setIsvalid(1);
				    filesDao.update(f);
				}
			}
			}
			cm.commit();
			req.setAttribute("errors", "增加栏目成功");
		} catch (SQLException e)
		{
			cm.rollback();
			e.printStackTrace();
		}finally{
			cm.closeConnection();
		}
	    tolist(req,resp);
		
	}
	
	
	public void tolist(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		this.forward(req, resp, "admin/channel_list.jsp");
	}
	/**
	 * 跳转到修改页面
	 */
	public void edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		
		int id=this.getInt(req, "id");
		if(id<=0)
		{
			req.setAttribute("errors", "请选择要修改的栏目");
		}else
		{
			initTemp(req);//初始化模版
			try
			{
				Channel channel=channelDao.getById(Channel.class, id);
			    Model model=modelDao.getById(Model.class, channel.getModelId());
			    List<Channel> channel_list=channelDao.getAllChannel();
				req.setAttribute("channel_list",channel_list);
			    
			    req.setAttribute("model",model);
				req.setAttribute("channel", channel);
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			this.forward(req, resp, "admin/channel_edit.jsp");
			
		}
		
	}
	/**
	 * 保存修改
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveEdit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		if(id<=0)
		{
			req.setAttribute("errors", "请选择要修改的栏目");
		}else
		{
			ConnectionManager cm=ConnectionManager.getInstance();
			try
			{
				
				Channel channel=channelDao.getById(Channel.class, id);
				this.getBean(req, channel);
				Channel temchannel=new Channel();
				this.getBean(req, temchannel);
				//对栏目图进行裁切
				if(null==channel.getPic()||"".equals(channel.getPic()))
				{
				     if(null!=temchannel.getPic()&&temchannel.getPic().toLowerCase().indexOf("http://")==-1)
				     {
				    	 int index=channel.getPic().indexOf("res/uppics");
							String substr=channel.getPic().substring(index);
							
							String filepath=this.getServletContext().getRealPath(substr);
							
							File orgfile=new File(filepath);
							orgfile.renameTo(new File(filepath+"_"));
							
							FileInputStream fi=new FileInputStream(filepath+"_");
							BufferedImage img=ImageIO.read(fi);
							
							
							ImageIOUtil.write(channel.getPicWidth(), channel.getPicHeight(), filepath, fi, img);
						    
							new File(filepath+"_").delete();
				     }
				}//end 切图

				channelDao.update(channel);
				//对文件资源进行更新
				String filesids=this.getString(req,"filesId");
				if(null!=filesids&&!filesids.trim().equals(""))
				{
					String []fids=filesids.split("[,]");
					if(fids!=null&&fids.length>0)
					{
						for(String fid:fids)
						{
							Files f=filesDao.getById(Files.class,Integer.parseInt(fid.trim()));
						    f.setChannelId(channel.getId());
						    f.setModelId(channel.getModelId());
						    f.setIsvalid(1);
						    filesDao.update(f);
						}
					}
				}
				req.setAttribute("errors","修改栏目成功");
				
			} catch (SQLException e)
			{
				
				e.printStackTrace();
			}finally
			{
				cm.closeConnection();
			}
			tolist(req, resp);
		
		}
		
	}
	public void delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		if(id<=0)
		{
			req.setAttribute("errors", "请选择要删除的栏目");
		}else
		{
			try
			{
				/**
				 * 删除栏目下的所有资源
				 */
				filesDao.updateFilesBychannel(id);
				/**
				 * 删除栏目之前，一定要确定此栏目没有对应的文章，才可删除，删除栏目，将栏目下的
				 * 所有文章级联删除
				 */
				channelDao.delete(Channel.class, id);
			
				req.setAttribute("errors", "删除成功!");
				
				
			} catch (SQLException e)
			{
				// TODO: handle exception
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		}
	   tolist(req, resp);
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
	   tolist(req, resp);
	}
    
}
