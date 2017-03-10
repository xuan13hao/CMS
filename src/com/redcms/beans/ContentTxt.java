package com.redcms.beans;

import java.io.Serializable;

import com.redcms.annotation.Column;
import com.redcms.annotation.Modify;

public class ContentTxt implements Serializable
{
	private Integer id;
	@Column("content_id")
	private Integer contentId;
	private String txt;
	@Column("txt_pics")
	private String txtPics;
	@Modify
	private String tableName;
	
	
	public String getTableName()
	{
		return tableName;
	}
	public void setTableName(String tableName)
	{
		this.tableName = tableName;
	}
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
	public String getTxt()
	{
		return txt;
	}
	public void setTxt(String txt)
	{
		this.txt = txt;
	}
	public String getTxtPics()
	{
		return txtPics;
	}
	public void setTxtPics(String txtPics)
	{
		this.txtPics = txtPics;
	}
	
	
}
