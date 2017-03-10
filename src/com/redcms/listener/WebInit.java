package com.redcms.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.redcms.dao.ModelDao;
import com.redcms.dao.core.DaoFactory;

/**
 * Application Lifecycle Listener implementation class WebInit
 *
 */
@WebListener
public class WebInit implements ServletContextListener {
    ServletContext sc=null;
    /**
     * Default constructor. 
     */
    public WebInit() {
       
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)
    {
    	sc=sce.getServletContext();
    	ModelDao modelDao=(ModelDao)DaoFactory.getDao(ModelDao.class);
    	//ContentDao contentDao=...
    	sc.setAttribute("modelDao",modelDao);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
