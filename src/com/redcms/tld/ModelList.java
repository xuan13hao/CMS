package com.redcms.tld;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.redcms.beans.Model;
import com.redcms.dao.ModelDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;

public class ModelList extends SimpleTagSupport
{
	 int selectId=0;
	 String fieldname="modelId";
	 String isHeader="false";
	 ModelDao modelDao=(ModelDao)DaoFactory.getDao(ModelDao.class);
    
	@Override
	public void doTag() throws JspException, IOException
	{
		 StringBuilder sb=new StringBuilder();
		 try
		{
			List<Model> list=modelDao.getAllModel();
			 
			 sb.append("<select name='"+fieldname+"'>");
			 if(isHeader.equals("true"))
			 sb.append("<option value='0'>ÇëÑ¡ÔñÄ£ÐÍ</option>");
			 if(null!=list&&list.size()>0)
			 {
				 for(Model model:list)
				 {
					 if(model.getId()==selectId)
						 sb.append("<option value='"+model.getId()+"' selected='selected'>"+model.getName()+"</option>");
					 else
					    sb.append("<option value='"+model.getId()+"'>"+model.getName()+"</option>");
				 }
			 }
			 
			 sb.append("</select>");
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		 
		 
		 this.getJspContext().getOut().write(sb.toString());
	}

	public int getSelectId()
	{
		return selectId;
	}

	public void setSelectId(int selectId)
	{
		this.selectId = selectId;
	}

	public String getFieldname()
	{
		return fieldname;
	}

	public void setFieldname(String fieldname)
	{
		this.fieldname = fieldname;
	}

	public String getIsHeader()
	{
		return isHeader;
	}

	public void setIsHeader(String isHeader)
	{
		this.isHeader = isHeader;
	}


}
