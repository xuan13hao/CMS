package com.redcms.partupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Part;
/**
 * ....
 * 
 * @author Administrator
 *
 */
public class PartUitl
{
   private String mimes;//�ϴ��ļ���mime���� image/jpeg,image/gif,image/bmp
   private long size;//  1024
   private String ext;//.jpg,.bmp,gif
   private Part part;//���ڷ�װ�ļ���part
   
   private String fileName;//�ļ�ԭʼ��
   private String newName;//�ļ�����
   private String realPath;//�ļ�·��
   private String contentType;

   private String error;
   
   
   
   public PartUitl(){}
   public PartUitl(Part part)
   {
	   this.part=part;
   }
   public PartUitl(Part part,String allowMime,String allowExt,String toPath,long allowSize)
   {
	   this.part=part;  
	   this.mimes=allowMime;
	   this.ext=allowExt;
	   this.realPath=toPath;
	   this.size=allowSize;
   }
   public void upload()throws IOException,PartException
   {
	   if(null==part)
	   {
		   error="û��ѡ���ļ�";
	   }else
	   {
		   this.fileName=this.getFileName(part);
		  	   
	
			this.contentType=part.getContentType();
			   if(this.mimes.indexOf(this.contentType.toLowerCase())==-1)
			   {
				   error="������������!";
				   part.delete();
				  
			   }else if(part.getSize()>this.size)
			   {
				   error="�ļ���С���ܳ���"+this.size/1024/1024.0+"M";
				   part.delete();
				  
			   }else if(this.ext.indexOf(this.getExtName(fileName).toLowerCase())==-1)
			   {
				   error="����������չ����ֻ��Ϊ"+this.ext;
				   part.delete();
				 
			   }else
			   {
				   //�ϴ�
				   SimpleDateFormat  sf=new SimpleDateFormat("yyyyMMddHHmmssSS");
				   this.newName=sf.format(new Date())+this.getExtName(fileName);				   
			       part.write(this.realPath+File.separator+this.newName);
			   }
	   }
	   if(null!=error)
	   {
		   throw new PartException(error);
	   }
	   
   }
   public String getExtName(String fileName)
	{
		String extName=null;
		int index=fileName.lastIndexOf(".");
		if(index!=-1)
		{
			extName=fileName.substring(index);//������
		}
		return extName;
	}
   public String getFileName(Part part)
   {
   	String fileName=null;
   	String hv=part.getHeader("content-disposition");
   	String pattern="(form-data; name=\"(.*?)\"; filename=\"(.*?)\")";
   	Matcher  match=Pattern.compile(pattern).matcher(hv);
   	if(match.find())
   	{
   		fileName=match.group(3);
   	}
   	return fileName;
   }
  //-------------------------------
public String getMimes()
{
	return mimes;
}
public void setMimes(String mimes)
{
	this.mimes = mimes;
}
public long getSize()
{
	return size;
}
public void setSize(long size)
{
	this.size = size;
}
public String getExt()
{
	return ext;
}
public void setExt(String ext)
{
	this.ext = ext;
}
public Part getPart()
{
	return part;
}
public void setPart(Part part)
{
	this.part = part;
}
public String getFileName()
{
	return fileName;
}
public void setFileName(String fileName)
{
	this.fileName = fileName;
}
public String getNewName()
{
	return newName;
}
public void setNewName(String newName)
{
	this.newName = newName;
}
public String getRealPath()
{
	return realPath;
}
public void setRealPath(String realPath)
{
	this.realPath = realPath;
}
public String getContentType()
{
	return contentType;
}
public void setContentType(String contentType)
{
	this.contentType = contentType;
}
public String getError()
{
	return error;
}
public void setError(String error)
{
	this.error = error;
}
   
   
   
   
}