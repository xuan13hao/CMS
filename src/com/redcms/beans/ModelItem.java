package com.redcms.beans;

import java.io.Serializable;

import com.redcms.annotation.Column;
import com.redcms.annotation.Table;
@Table("model_item")
public class ModelItem implements Serializable
{
	private static final long serialVersionUID = 4876107757349963168L;

	private int id;
	@Column("model_id")
	private int modelId;
	private String name;//字段名
	private String label;//显示的名字
	private int orderlist ;//排序
	@Column("def_value")
	private String defValue;
	public int getId()
	{
		return id;
	}
	public void setId(int id)
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
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getLabel()
	{
		return label;
	}
	public void setLabel(String label)
	{
		this.label = label;
	}
	public int getOrderlist()
	{
		return orderlist;
	}
	public void setOrderlist(int orderlist)
	{
		this.orderlist = orderlist;
	}
	public String getDefValue()
	{
		return defValue;
	}
	public void setDefValue(String defValue)
	{
		this.defValue = defValue;
	}
	
}
