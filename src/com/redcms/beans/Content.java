package com.redcms.beans;

import java.io.Serializable;
import java.util.Date;

import com.redcms.annotation.Column;
import com.redcms.annotation.Modify;
import com.redcms.annotation.Table;
/**
 * 这个类对应不同的模型表
 * @author Administrator
 *
 */
@Table("content")
public class Content implements Serializable
{
	private static final long serialVersionUID = 4493489959844810589L;
	private Integer id;
	@Column("channel_id")
	private Integer channelId;
	@Column("type_id")
	private Integer typeId;
	@Column("manager_id")
	private Integer managerId;
	private String title;
	private String tags;
	private String author;
	private String origin;
	@Column("origin_url")
	private String originUrl;
	private String description;
	@Column("create_date")
	private Date createDate;
	@Column("title_color")
	 private String titleColor;
	@Column("is_bold")
	 private int isBold;
	@Column("title_pic")
	 private String titlePic;
	@Column("content_pic")
	 private String contentPic;
	@Column("type_pic")
	 private String typePic;
	 private String link;
	 private String  temp;
	 private int status;
	 private int orderlist;
	 @Column("is_recommend")
	 private int isRecommend;
	 
	 @Modify
	 private String channelName;
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

	public Integer getChannelId()
	{
		return channelId;
	}

	public void setChannelId(Integer channelId)
	{
		this.channelId = channelId;
	}

	public Integer getTypeId()
	{
		return typeId;
	}

	public void setTypeId(Integer typeId)
	{
		this.typeId = typeId;
	}

	public Integer getManagerId()
	{
		return managerId;
	}

	public void setManagerId(Integer managerId)
	{
		this.managerId = managerId;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getTags()
	{
		return tags;
	}

	public void setTags(String tags)
	{
		this.tags = tags;
	}

	public String getAuthor()
	{
		return author;
	}

	public void setAuthor(String author)
	{
		this.author = author;
	}

	public String getOrigin()
	{
		return origin;
	}

	public void setOrigin(String origin)
	{
		this.origin = origin;
	}

	public String getOriginUrl()
	{
		return originUrl;
	}

	public void setOriginUrl(String originUrl)
	{
		this.originUrl = originUrl;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public Date getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(Date createDate)
	{
		this.createDate = createDate;
	}

	public String getTitleColor()
	{
		return titleColor;
	}

	public void setTitleColor(String titleColor)
	{
		this.titleColor = titleColor;
	}

	public int getIsBold()
	{
		return isBold;
	}

	public void setIsBold(int isBold)
	{
		this.isBold = isBold;
	}

	public String getTitlePic()
	{
		return titlePic;
	}

	public void setTitlePic(String titlePic)
	{
		this.titlePic = titlePic;
	}

	public String getContentPic()
	{
		return contentPic;
	}

	public void setContentPic(String contentPic)
	{
		this.contentPic = contentPic;
	}

	public String getTypePic()
	{
		return typePic;
	}

	public void setTypePic(String typePic)
	{
		this.typePic = typePic;
	}

	public String getLink()
	{
		return link;
	}

	public void setLink(String link)
	{
		this.link = link;
	}

	public String getTemp()
	{
		return temp;
	}

	public void setTemp(String temp)
	{
		this.temp = temp;
	}

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public int getOrderlist()
	{
		return orderlist;
	}

	public void setOrderlist(int orderlist)
	{
		this.orderlist = orderlist;
	}

	public int getIsRecommend()
	{
		return isRecommend;
	}

	public void setIsRecommend(int isRecommend)
	{
		this.isRecommend = isRecommend;
	}

	public String getChannelName()
	{
		return channelName;
	}

	public void setChannelName(String channelName)
	{
		this.channelName = channelName;
	}

	@Override
	public String toString()
	{
		// TODO Auto-generated method stub
		return this.getChannelName()+"\t"+this.getTitle();
	}
	 
	

}
