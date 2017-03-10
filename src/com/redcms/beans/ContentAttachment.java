package com.redcms.beans;

import java.io.Serializable;

import com.redcms.annotation.Column;
import com.redcms.annotation.Table;

@Table("content_attachment")
public class ContentAttachment implements Serializable
{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 7218633042585698521L;
	private Integer id;
	 @Column("content_id")
	 private Integer contentId;
	 @Column("model_id")
	 private Integer modelId;
	 private String path;
	 private String name;
	 private String mime;
	 private String filename;
	 private int orderlist;
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public Integer getContentId()
	{
		return contentId;
	}
	public void setContentId(Integer contentId)
	{
		this.contentId = contentId;
	}
	public Integer getModelId()
	{
		return modelId;
	}
	public void setModelId(Integer modelId)
	{
		this.modelId = modelId;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getMime()
	{
		return mime;
	}
	public void setMime(String mime)
	{
		this.mime = mime;
	}
	public String getFilename()
	{
		return filename;
	}
	public void setFilename(String filename)
	{
		this.filename = filename;
	}
	public int getOrderlist()
	{
		return orderlist;
	}
	public void setOrderlist(int orderlist)
	{
		this.orderlist = orderlist;
	}
	 
	 
}
