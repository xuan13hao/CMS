package com.redcms.beans;

import java.io.Serializable;

import com.redcms.annotation.Column;

public class Model implements Serializable
{
   private static final long serialVersionUID = -4840375838687692424L;
   private int	 id;
   private String name;
   private String description;
   @Column("index_temp")
   private String indexTemp;
   @Column("list_temp")
   private String listTemp;
   @Column("content_temp")
   private String contentTemp;
   @Column("is_def")
   private int isDef;
   @Column("title_width")
   private int titleWidth;
   @Column("title_height")
   private int titleHeight;
   @Column("content_width")
   private int  contentWidth;
   @Column("content_height")
   private int contentHeight;
   @Column("table_name")
   private String tableName;
public int getId()
{
	return id;
}
public void setId(int id)
{
	this.id = id;
}
public String getName()
{
	return name;
}
public void setName(String name)
{
	this.name = name;
}
public String getDescription()
{
	return description;
}
public void setDescription(String description)
{
	this.description = description;
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
public int getIsDef()
{
	return isDef;
}
public void setIsDef(int isDef)
{
	this.isDef = isDef;
}
public int getTitleWidth()
{
	return titleWidth;
}
public void setTitleWidth(int titleWidth)
{
	this.titleWidth = titleWidth;
}
public int getTitleHeight()
{
	return titleHeight;
}
public void setTitleHeight(int titleHeight)
{
	this.titleHeight = titleHeight;
}
public int getContentWidth()
{
	return contentWidth;
}
public void setContentWidth(int contentWidth)
{
	this.contentWidth = contentWidth;
}
public int getContentHeight()
{
	return contentHeight;
}
public void setContentHeight(int contentHeight)
{
	this.contentHeight = contentHeight;
}
public String getTableName()
{
	return tableName;
}
public void setTableName(String tableName)
{
	this.tableName = tableName;
}
   
}
