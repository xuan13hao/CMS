package com.redcms.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;

import com.redcms.beans.Files;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.partupload.PartException;
import com.redcms.partupload.PartUitl;
import com.redcms.servlet.core.ServletBase;
@MultipartConfig
@WebServlet("/admin/upload_pic")
public class UploadPictureServlet extends ServletBase
{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		resp.setContentType("text/html;charset=gbk");
		PrintWriter out=resp.getWriter();
		
		Part part=req.getPart("imgFile");
		String realPath=this.getServletContext().getRealPath("res/uppics");
		
		PartUitl pu=new PartUitl(part, "image/jpeg,image/gif,image/bmp,image/png",".jpg,.bmp,.gif,.png", realPath, 1024*1024*2);
		
		try
		{
			pu.upload();
		} catch (PartException e)
		{
			out.println(getError("上传文件失败"+e));
			//out.println("<script language='javascript'>alert('"+e.getMessage()+"');history.back(-1);</script>");
			e.printStackTrace();
		}
/*		 out.println("<h1>上传成功!</h1><ul>");
		  out.println("<li>客户端文件名："+pu.getFileName()+"</li>");
		  out.println("<li>ContentType："+pu.getContentType()+"</li>");
		  out.println("<li>长度："+part.getSize()+"</li>");
		  out.println("<li>服务器上："+pu.getRealPath()+File.separator+pu.getNewName()+"</li>");
		  out.println("</ul>");*/
		
		
		   int modelId=this.getInt(req,"modelId");
		   int contentId=this.getInt(req,"contentId");
		   
		   int channelId=this.getInt(req,"channelId");
		   Files files=new Files();
		   if(modelId>0)files.setModelId(modelId);
		   if(contentId>0)files.setContentId(contentId);
		   if(channelId>0)files.setChannelId(channelId);
		   
		   files.setName(pu.getFileName());
		   files.setPath("res/uppics/"+pu.getNewName());
		   files.setIsvalid(0);//0表示没有文章或栏目引用
		  
		   int reid=0;
			try
			{
				reid=filesDao.add(files);
			} catch (SQLException e)
			{
				// TODO: handle exception
			}finally{
				ConnectionManager.getInstance().closeConnection();
			}
		   
		    JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url",req.getContextPath()+"/res/uppics/"+pu.getNewName());
			obj.put("filesId", reid);
			out.println(obj.toJSONString());
		  
		out.close();
		
	}
	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}

}
