package com.redcms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Manager;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.Md5Encrypt;
@WebServlet("/admin/manager")
public class ManagerServelt extends ServletBase
{
	public void modifypwd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		   Manager manager=(Manager)req.getSession().getAttribute("manager");
		   String org=this.getString(req, "orgpwd");
		   String pwd=this.getString(req,"pwd");
		   String repwd=this.getString(req,"repwd");
		   if(Md5Encrypt.md5(org).equals(manager.getPasswd()))
		   {
			   if(pwd.equals(repwd))
			   {
				   manager.setPasswd(Md5Encrypt.md5(pwd));
				   try
				{
					managerDao.update(manager);
				} catch (SQLException e)
				{
					 req.setAttribute("errors", "修改密码失败!");
					   this.forward(req, resp, "admin/modify_password.jsp");  
					e.printStackTrace();
				}finally{
					ConnectionManager.getInstance().closeConnection();
				}
				   req.setAttribute("errors", "修改密码成功!");
				   this.forward(req, resp, "admin/modify_password.jsp");   
				   
			   }else
			   {
				   req.setAttribute("errors", "两次输入的密码不一玫!");
				   this.forward(req, resp, "admin/modify_password.jsp");  
			   }
		   }else
		   {
			   req.setAttribute("errors", "当前密码不对!");
			   this.forward(req, resp, "admin/modify_password.jsp");
		   }
	}

	
	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		

	}

}
