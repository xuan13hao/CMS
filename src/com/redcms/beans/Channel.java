package com.redcms.beans;

import java.io.Serializable;
import java.util.Date;

import com.redcms.annotation.Column;

public class Channel implements Serializable
{
	private static final long serialVersionUID = -991504573894419049L;
	private Integer id;
	@Column("model_id")
	private int modelId;
	@Column("parent_id")
	private Integer parentId;
	private String name;
	private String path;
	private int orderlist;
	private String link;
	private String pic;
	@Column("pic_width")
	private int picWidth;
    @Column("pic_height")
    private int  picHeight;
	private Date createtime;
	@Column("meta_title")
	private String metaTitle;
	 @Column("meta_key")
	private String metaKey;
	 @Column("meta_des")
	 private String metaDes;
	 @Column("index_temp")
	 private String indexTemp;
	 @Column("list_temp")
	 private String listTemp;
	 @Column("content_temp")
	 private String contentTemp;
	 
	 private String content;
	 @Column("content_pic")
	 private String  contentPic;
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public int getModelId()
	{
		return modelId;
	}
	public void setModelId(int modelId)
	{
		this.modelId = modelId;
	}
	public Integer getParentId()
	{
		return parentId;
	}
	public void setParentId(Integer parentId)
	{
		this.parentId = parentId;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public int getOrderlist()
	{
		return orderlist;
	}
	public void setOrderlist(int orderlist)
	{
		this.orderlist = orderlist;
	}
	public String getLink()
	{
		return link;
	}
	public void setLink(String link)
	{
		this.link = link;
	}
	public String getPic()
	{
		return pic;
	}
	public void setPic(String pic)
	{
		this.pic = pic;
	}
	public int getPicWidth()
	{
		return picWidth;
	}
	public void setPicWidth(int picWidth)
	{
		this.picWidth = picWidth;
	}
	public int getPicHeight()
	{
		return picHeight;
	}
	public void setPicHeight(int picHeight)
	{
		this.picHeight = picHeight;
	}
	public Date getCreatetime()
	{
		return createtime;
	}
	public void setCreatetime(Date createtime)
	{
		this.createtime = createtime;
	}
	public String getMetaTitle()
	{
		return metaTitle;
	}
	public void setMetaTitle(String metaTitle)
	{
		this.metaTitle = metaTitle;
	}
	public String getMetaKey()
	{
		return metaKey;
	}
	public void setMetaKey(String metaKey)
	{
		this.metaKey = metaKey;
	}
	public String getMetaDes()
	{
		return metaDes;
	}
	public void setMetaDes(String metaDes)
	{
		this.metaDes = metaDes;
	}
	public String getIndexTemp()
	{
		return indexTemp;
	}
	public void setIndexTemp(String indexTemp)
	{
		this.indexTemp = indexTemp;
	}
	public String getListTemp()
	{
		return listTemp;
	}
	public void setListTemp(String listTemp)
	{
		this.listTemp = listTemp;
	}
	public String getContentTemp()
	{
		return contentTemp;
	}
	public void setContentTemp(String contentTemp)
	{
		this.contentTemp = contentTemp;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getContentPic()
	{
		return contentPic;
	}
	public void setContentPic(String contentPic)
	{
		this.contentPic = contentPic;
	}
	

	
}
