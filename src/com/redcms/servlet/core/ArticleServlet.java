package com.redcms.servlet.core;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Model;
@WebServlet("/article")
public class ArticleServlet extends ServletBase
{

	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
			{
		        
;		         System.out.println("--------add-----");
			}
	
	public void delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
			{
		          System.out.println("--------delete-----");
			}
    public void update(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
			{
    	  System.out.println("--------update-----");
			}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 Model mod=new Model();
		 this.getBean(req, mod);
		 
		 System.out.println(mod.getName());
		 System.out.println(mod.getIsDef());
		
		
		  System.out.println("--------execute-----");
		
	}
}
