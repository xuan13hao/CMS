package com.redcms.servlet.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.ContentAttachment;
import com.redcms.beans.ContentTxt;
import com.redcms.beans.Files;
import com.redcms.beans.Model;
import com.redcms.beans.ModelItem;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.page.PageDiv;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.ImageIOUtil;
@WebServlet("/admin/content")
public class ContentServlet extends ServletBase
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

	        req.setAttribute("contents", contents);
	}
	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int modelId=this.getInt(req, "modelId");
		int channelId=this.getInt(req,"channelId");
		try
		{
			Channel channel=channelDao.getById(Channel.class, channelId);
			Model model=modelDao.getById(Model.class, modelId);
			List<ModelItem>  itemlist=modelItemDao.getByModelId(modelId);			
			req.setAttribute("itemlist",itemlist);
			req.setAttribute("channel",channel);
			req.setAttribute("model",model);
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		
		
		req.setAttribute("modelId",modelId);
		req.setAttribute("channelId",channelId);
		
		
		
		initTemp(req);
	    this.forward(req, resp, "admin/content_add.jsp");
	}
	public void addSave(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int modelId=this.getInt(req, "modelId");
		int channelId=this.getInt(req,"channelId");
		int managerId=this.getInt(req,"managerId");
		ConnectionManager cm=ConnectionManager.getInstance();
		cm.setAutoCommit(false);
        try
		{
			Model model=modelDao.getById(Model.class, modelId);
			Channel channel=channelDao.getById(Channel.class, channelId);
		    
			//增加content对应的分表
			Content content=new Content();
			content.setCreateDate(new Date());
			content.setTableName(model.getTableName());
			this.getBean(req, content);
         
			//对标题图进行截图
			cutPicture(req, content.getTitlePic(), this.getInt(req, "titleWidth"), this.getInt(req, "titleHeight"));
			cutPicture(req, content.getContentPic(), this.getInt(req, "contentWidth"), this.getInt(req, "contentHeight"));
			cutPicture(req, content.getTypePic(), this.getInt(req, "typeWidth"), this.getInt(req, "typeHeight"));

            //增加内容表
			int re=contentDao.add(content);
        	ContentTxt contentTxt=new ContentTxt();
        	contentTxt.setContentId(re);
        	contentTxt.setTableName(model.getTableName()+"_txt");
        	contentTxt.setTxt(this.getString(req, "content"));
        	contentTxtDao.add(contentTxt);
        	//增加附近件
        	ContentAttachment cam=new ContentAttachment();
        	this.getBean(req, cam);
        	cam.setContentId(re);
        	cam.setModelId(modelId);
   
        	contentAttachmentDao.add(cam);
       
        	
        	

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
				    f.setChannelId(channelId);
				    f.setModelId(modelId);
				    f.setContentId(re);
				    f.setIsvalid(1);
				    filesDao.update(f);
				}
			}
			}
        	
        	
        	
        	req.setAttribute("error","增加文章成功!");
        	
        	
        	
        	cm.commit();
		} catch (Exception e)
		{
			e.printStackTrace();
			cm.rollback();
		}finally
		{
			cm.closeConnection();
		}
		
	   list(req,resp);
	}
	
	
	public void list(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int pageNo=1;
		int pageSize=10;
		if(this.getInt(req, "pageNo")>0)
			pageNo=this.getInt(req, "pageNo");
		
		int modelId=this.getInt(req, "modelId");
		int channelId=this.getInt(req,"channelId");
		
		try
		{
			Model model=modelDao.getById(Model.class, modelId);
			List<Channel> subChannel=null;
			subChannel=channelDao.getSubChannel(channelId);
			if(null==subChannel||subChannel.size()==0)
			{
				subChannel=new ArrayList<Channel>();
				subChannel.add(channelDao.getById(Channel.class, channelId));
				
			}else
			{
				subChannel.add(channelDao.getById(Channel.class, channelId));
			}
			PageDiv<Content> pd=contentDao.getContentByChannelId(model, pageNo, pageSize, subChannel);
			
/*			for(Content ccc:pd.getList())
			{
				System.out.println(ccc.getChannelName()+"\t"+ccc.getTitle());
			}*/
			
			req.setAttribute("pd",pd);
		} catch (SQLException e)
		{
			// TODO: handle exception
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		
		
		
		req.setAttribute("modelId",modelId);
		req.setAttribute("channelId",channelId);
		
		
		
	    this.forward(req, resp, "admin/content_list.jsp");
	}
	/**
	 * 对图片进行缩略
	 * @param req
	 * @param picture
	 * @param newWith
	 * @param newHeight
	 */
	public void cutPicture(HttpServletRequest req,String picture,int newWith,int newHeight)
	{
		try
		{
			if(null!=picture&&(!picture.equals(""))&&picture.toLowerCase().indexOf("http://")==-1)
			{
				
				int index=picture.indexOf("res/uppics");
				String substr=picture.substring(index);
				
				String filepath=this.getServletContext().getRealPath(substr);
				
				File orgfile=new File(filepath);
				orgfile.renameTo(new File(filepath+"_"));
				
				FileInputStream fi=new FileInputStream(filepath+"_");
				BufferedImage img=ImageIO.read(fi);
				
				
				ImageIOUtil.write(newWith, newHeight, filepath, fi, img);
			    
				new File(filepath+"_").delete();
			}
		} catch (FileNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		
	}

}
