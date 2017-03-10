package com.redcms.servlet.admin;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Model;
import com.redcms.beans.ModelItem;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
@WebServlet("/admin/model")
public class ModelServlet extends ServletBase
{
	private String[][]allfield=new String[][]{
			{"type_id","�������",""},
			{"title","����",""},
			{"tags","��ǩ",""},
			{"author","����","����Ա"},
			{"origin","��Դ","ԭ��"},
			{"origin_url","��Դurl",""},
			{"description","����",""},
			{"title_color","������ɫ",""},
			{"is_bold","����Ӵ�",""},
			{"title_pic","����ͼ",""},
			{"content_pic","����ͼ",""},
			{"type_pic","���ͼ",""},
			{"link","����",""},
			{"temp","ģ��",""},
			{"status","״̬",""},
			{"orderlist","����",""},
			{"is_recommend","�Ƽ�",""},
			{"txt","����",""}
			};
	/**
	 * ��ʼ��ģ������
	 * @param req
	 * @throws IOException
	 */
	public  void initTemp(HttpServletRequest req)throws IOException
	{
		 String path=this.getServletContext().getRealPath("/WEB-INF/templates/web");
	        File f=new File(path);
	        String[] indexs=f.list(new FilenameFilter()
			{
				@Override
				public boolean accept(File dir, String name)
				{
					if(name.indexOf("_index.jsp")!=-1)
					return true;
					else
					return false;
				}
			});
	        String lists[]=f.list(new FilenameFilter()
			{
				
				@Override
				public boolean accept(File dir, String name)
				{
					if(name.indexOf("_list.jsp")!=-1)
					return true;
					else
					return false;
				}
			});
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
	        req.setAttribute("indexs",indexs);
	        req.setAttribute("lists",lists);
	        req.setAttribute("contents", contents);
	}
	/**
	 * ��ת������ģ��ҳ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		initTemp(req);
        this.forward(req, resp, "admin/model_add.jsp");
        

	}
	/**
	 * �������ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveAdd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		Model model=new Model();
		this.getBean(req, model);
		
		try
		{

			modelDao.add(model);
            String []batch=new String[]{
            		"create table "+model.getTableName().trim()+" like content",
            		"create table "+model.getTableName().trim()+"_txt like content_txt",
            		"alter table "+model.getTableName().trim()+"_txt ADD CONSTRAINT FK_"+model.getTableName().trim()+"_txt_1  FOREIGN KEY FK_"+model.getTableName().trim()+"_txt_1(content_id) REFERENCES "+model.getTableName()+"(id) ON DELETE RESTRICT  ON UPDATE RESTRICT"
            };
			/*���ڰ�ȫ����*/
			modelDao.addBatch(batch);
			
			req.setAttribute("errors","����ģ�ͳɹ�!");
			
		} catch (SQLException e)
		{
			
			req.setAttribute("errors","����ģ��ʧ��!");
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
			this.add(req, resp);
		}

	}
	/**
	 * ��ת��ģ���б�
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void tolist(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 try
		{
			List<Model> list=modelDao.getAllModel();
			req.setAttribute("list",list);
		} catch (Exception e)
		{
			req.setAttribute("errors","��ѯģ�����ݳ���");
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
        this.forward(req, resp, "admin/model_list.jsp");
	}
	/**
	 * �޸�ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 int id=this.getInt(req, "id");
		 if(id==0)
		 {
			 req.setAttribute("error", "û��ָ��Ҫ�޸ĵ�����!");
			 tolist(req,resp);
		 }else
		 {
			 
			 initTemp(req);
			 try
			{
				Model model=modelDao.getById(Model.class, id);
				req.setAttribute("model",model);
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnectionManager.getInstance().closeConnection();
			}
			 this.forward(req, resp, "admin/model_edit.jsp");
		 }

	}
	/**
	 * �����޸�ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveEdit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		 if(id==0)
		 {
			 req.setAttribute("error", "û��ָ��Ҫ�޸ĵ�����!");
			 tolist(req,resp);
		 }else
		 {
		     try
			{
				Model model=modelDao.getById(Model.class, id);
				this.getBean(req, model);
				modelDao.update(model);
				req.setAttribute("errors","�޸����ݳɹ�");
				
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		     tolist(req, resp);
		
		 }

	}
	
	/**
	 * ɾ��ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		 if(id==0)
		 {
			 req.setAttribute("error", "û��ָ��Ҫ�޸ĵ�����!");
			 tolist(req,resp);
		 }else
		 {
			 try
				{
					Model model=modelDao.getById(Model.class, id);
                    modelDao.addBatch(new String[]{
                    		"drop table "+model.getTableName().trim()+"_txt",
                    		 "drop table "+model.getTableName().trim()
                    });
                    modelDao.delete(Model.class, id);
					
					req.setAttribute("errors","ɾ�����ݳɹ�");
					
				} catch (SQLException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					ConnectionManager.getInstance().closeConnection();
				}
			     tolist(req, resp);  	 
		
		 }

	}
	/**
	 * ��ת��ģ�����ݹ���
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void tofield(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		if(id==0)
		{
			id=(Integer)req.getAttribute("modelId");
		}
		
		
		if(id==0)
		{
			req.setAttribute("errors","û��Ҫ�����ģ��!");
			tolist(req, resp);
		}else
		{
			
			try
			{
				List<ModelItem> list=modelItemDao.getByModelId(id);
				
				req.setAttribute("list",list);
				req.setAttribute("modelId",id);
				req.setAttribute("allfield",allfield);
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			
			this.forward(req, resp, "admin/model_field.jsp");
		}
		
		
	}
	/**
	 * �����ֶ�
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void savefield(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int modelId=this.getInt(req,"modelId");
		req.setAttribute("modelId", modelId);
		String [] fields=this.getStringArray(req, "txtfield");
		String [] disps=this.getStringArray(req,"disp");
		String [] defvalues=this.getStringArray(req,"defvalue");
		ModelItem mis[]=new ModelItem[fields.length];
		for(int i=0;i<fields.length;i++)
		{
			ModelItem mi=new ModelItem();
			mi.setModelId(modelId);
			mi.setName(fields[i]);
			mi.setLabel(disps[i]);
			mi.setDefValue(defvalues[i]);
			mis[i]=mi;
			//System.out.println(fields[i]+"\t"+disps[i]+"\t"+defvalues[i]);
		}
		try
		{
			modelItemDao.addField(mis);
			req.setAttribute("errors", "����ϵͳ���ֳɹ�!");
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
	
	   tofield(req, resp);
		
	}
	
	
	public void deletefield(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		  int modelId=this.getInt(req,"modelId");
		  req.setAttribute("modelId", modelId);
		  int ids[]=this.getIntArray(req,"txtfield");
		  try
			{
				modelItemDao.deleteField(ids);
				req.setAttribute("errors", "ɾ���ֶγɹ�!");
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnectionManager.getInstance().closeConnection();
			}
		  tofield(req, resp);
	}
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
	tolist(req, resp);

	}
	


}
