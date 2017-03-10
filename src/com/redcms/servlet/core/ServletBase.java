package com.redcms.servlet.core;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.dao.ChannelDao;
import com.redcms.dao.ContentAttachmentDao;
import com.redcms.dao.ContentDao;
import com.redcms.dao.ContentTxtDao;
import com.redcms.dao.FilesDao;
import com.redcms.dao.ManagerDao;
import com.redcms.dao.ModelDao;
import com.redcms.dao.ModelItemDao;
import com.redcms.dao.core.DaoFactory;

public abstract class ServletBase extends HttpServlet
{
//protected Configuration cfg=null;
private static final long serialVersionUID = 6784238681394572773L;
protected ModelDao modelDao=(ModelDao)DaoFactory.getDao(ModelDao.class);
protected ManagerDao managerDao=(ManagerDao)DaoFactory.getDao(ManagerDao.class); 
protected ModelItemDao modelItemDao=(ModelItemDao)DaoFactory.getDao(ModelItemDao.class);
protected ChannelDao channelDao=(ChannelDao)DaoFactory.getDao(ChannelDao.class);
protected FilesDao filesDao=(FilesDao)DaoFactory.getDao(FilesDao.class);
protected ContentDao contentDao=(ContentDao)DaoFactory.getDao(ContentDao.class);
protected ContentTxtDao contentTxtDao=(ContentTxtDao)DaoFactory.getDao(ContentTxtDao.class);
protected ContentAttachmentDao contentAttachmentDao=(ContentAttachmentDao)DaoFactory.getDao(ContentAttachmentDao.class);
//....


@Override
public void init() throws ServletException
{
    // Initialize the FreeMarker configuration;
    // - Create a configuration instance
   // cfg = new Configuration();
    // - Templates are stoted in the WEB-INF/templates directory of the Web app.
  //  cfg.setServletContextForTemplateLoading(
    //        getServletContext(), "WEB-INF/templates");
    // - Set update dealy to 0 for now, to ease debugging and testing.
    //   Higher value should be used in production environment.
    //cfg.setTemplateUpdateDelay(0);
    // - Set an error handler that prints errors so they are readable with
    //   a HTML browser.
   // cfg.setTemplateExceptionHandler( TemplateExceptionHandler.HTML_DEBUG_HANDLER);
    //// - Use beans wrapper (recommmended for most applications)
   // cfg.setObjectWrapper(ObjectWrapper.BEANS_WRAPPER);
    // - Set the default charset of the template files
   // cfg.setDefaultEncoding("ISO-8859-1");
    // - Set the charset of the output. This is actually just a hint, that
    //   templates may require for URL encoding and for generating META element
    //   that uses http-equiv="Content-type".
   // cfg.setOutputEncoding("GBK");
    // - Set the default locale
   // cfg.setLocale(Locale.US);
}
/**
 * ���ڷ���ؽ�ģ�����ݺϲ���ģ�沢������ͻ���
 * @param resp   response
 * @param root   ģ�����ݿ�����null
 * @param template   freemarkerģ���ļ�
 * @throws IOException
 */
/*public void mage(HttpServletResponse resp,Map<String,Object> root,String template) throws IOException
{
	resp.setContentType("text/html;charset=gbk");
	resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, "
            + "post-check=0, pre-check=0");
    resp.setHeader("Pragma", "no-cache");
    resp.setHeader("Expires", "Thu, 01 Dec 1994 00:00:00 GMT");

	PrintWriter out=resp.getWriter();

    Template t = cfg.getTemplate(template);
	try
	{
		t.process(root, out);
	} catch (TemplateException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}*/


/**
 * ServletĬ��Ҫ���ʵķ���
 * @param req
 * @param resp
 * @throws ServletException
 * @throws IOException
 */
public abstract void execute(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException;

/**
 * ����action���������û�����ת��Servlet��action��Ӧ�ķ���
 * 
 */
@Override
protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
{
	response.setContentType("text/html;charset=gbk");
	String action=request.getParameter("action");
	if(null==action||"".equals(action.trim()))
	{
		action="execute";
	}
	
	Class clazz[]=new Class[]{HttpServletRequest.class,HttpServletResponse.class};
	try
	{
		Method method=this.getClass().getMethod(action, clazz);
		method.invoke(this, new Object[]{request,response});
	} catch (NoSuchMethodException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SecurityException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IllegalAccessException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IllegalArgumentException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (InvocationTargetException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}


public String getString(HttpServletRequest req,String param)
{
      String result=null!=req.getParameter(param)?req.getParameter(param):"";
      return result;
}
public String[] getStringArray(HttpServletRequest req,String param)
{
     String []result=req.getParameterValues(param);
     return result;
}

public int getInt(HttpServletRequest req,String param)
{
	 int re=0;
      String str=this.getString(req, param);
      if(str.matches("\\d+"))
      {
    	 re=Integer.parseInt(str); 
      }
    return re;
}
public int[] getIntArray(HttpServletRequest req,String param)
{
	 int re[]=null;
	 int temint=0;
     String strarr[]=this.getStringArray(req, param);
     if(null!=strarr&&strarr.length>0)
     {
    	 re=new int[strarr.length];
    	 for(int i=0;i<re.length;i++)
    	 {
    		 if(strarr[i].matches("\\d+"))
    	      {
    	    	 re[i]=Integer.parseInt(strarr[i]); 
    	      } 
    	 }
     }
      
    return re;
}
/**
 * ���û���������ﶨ��һ��bean����
 * Article art=new Article();
 * this.getBean(req,art);
 * 
 * @param req
 * @param bean
 * @return
 */
public void getBean(HttpServletRequest req,Object bean)
{
	SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if(null!=bean)
	{
		Class clazz=bean.getClass();
		Field [] allField=clazz.getDeclaredFields();
		for(Field field:allField)
		{
			field.setAccessible(true);
			String fieldName=field.getName();
			//�ҿ�ͨ��req.getParams(fieldName);String
			String paramValue=this.getString(req, fieldName);
			if(null!=paramValue&&!"".equals(paramValue))
			{
				//ȡ����ֵ 
				Class fieldType=field.getType();
				try {
					if(fieldType==java.lang.String.class)
					{
						//�ַ���
						field.set(bean, paramValue);
					}else  if(fieldType==java.lang.Integer.class)
					{
						field.set(bean, Integer.parseInt(paramValue));
						
					}else if(fieldType==int.class)
					{
						field.set(bean, Integer.parseInt(paramValue));
					}else if(fieldType==java.util.Date.class)
					{
						String pattern="\\d{4}[-]\\d{1,2}[-]\\d{1,2}[ ]\\d{1,2}[:]\\d{1,2}[:]\\d{1,2}";
						if(paramValue.matches(pattern))
						{
							field.set(bean,sf.parse(paramValue));
						}
						String datepattern="\\d{4}[-]\\d{1,2}[-]\\d{1,2}";
						if(paramValue.matches(datepattern))
						{
							field.set(bean, new SimpleDateFormat("yyyy-MM-dd").parse(paramValue));
						}
						
					}
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		
	}
}

public void forward(HttpServletRequest req,HttpServletResponse resp,String path)
{
   RequestDispatcher  rd=req.getRequestDispatcher("/WEB-INF/templates/"+path);
	   try
	{
		rd.forward(req,resp);
	} catch (ServletException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e)
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}


}
