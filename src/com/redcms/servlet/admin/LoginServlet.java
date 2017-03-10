package com.redcms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Manager;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.Md5Encrypt;

@WebServlet("/admin/login")
public class LoginServlet extends ServletBase
{
/**
	 * 
	 */
	private static final long serialVersionUID = 8141629767777520409L;

/**
 * ��ת��loginҳ��
 * @param req
 * @param resp
 * @throws ServletException
 * @throws IOException
 */
	public void tologin(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
			{
		    
			   //mage(resp, null, "admin/login.html");
		        this.forward(req, resp, "admin/login.jsp");
			}
		                 
	/**
	 * �˳���½
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
			{
		           req.getSession().invalidate();
		
		           this.forward(req, resp, "admin/login.jsp");
			}
	/**
	 * ��֤�û���������
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkLogin(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
			{
		         //  Map<String,Object> root=new HashMap<String,Object>();
		            String randimg=this.getString(req, "randimg");
		            String sessionimg=(String)req.getSession().getAttribute("randomCode");
		            
		            if(null!=sessionimg&&!"".equals(sessionimg)&&!"".equals(randimg)&&Md5Encrypt.md5(randimg).equals(sessionimg))
		            {
		            	Manager man=new Manager();
		            	this.getBean(req, man);
		                Manager newman=null;
		                try
						{
							newman=managerDao.checkLogin(man.getEmail(), Md5Encrypt.md5(man.getPasswd()));
						} catch (SQLException e)
						{
							// TODO Auto-generated catch block
							e.printStackTrace();
						}finally
						{
							ConnectionManager.getInstance().closeConnection();
						}
		                if(null!=newman&&newman.getEmail().equals(man.getEmail()))
		                {
		                	req.getSession().setAttribute("manager",newman);
		                    //�ɹ�
		                	 this.forward(req, resp, "admin/admin_index.jsp");
		                }else
		                {
		                	//ʧ��
		                	req.setAttribute("errors","�û��������벻��ȷ!");
		            	 this.forward(req, resp, "admin/login.jsp");
		                }
		            	
		            }else
		            {
		            	//��֤�벻��
		            	req.setAttribute("errors","��֤�벻��!");
		            	 this.forward(req, resp, "admin/login.jsp");
		            }
		     
		
			}
	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 tologin(req,resp);
		
	}

}
