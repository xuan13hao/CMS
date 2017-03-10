package com.redcms.beans;

import java.io.Serializable;
import java.util.Date;

public class Manager implements Serializable
{
	private int id;
	private String email;
	private String passwd;
	private String lastip;
	private Date lasttime;
	private int  activation;
	private String purview;
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getPasswd()
	{
		return passwd;
	}
	public void setPasswd(String passwd)
	{
		this.passwd = passwd;
	}
	public String getLastip()
	{
		return lastip;
	}
	public void setLastip(String lastip)
	{
		this.lastip = lastip;
	}
	public Date getLasttime()
	{
		return lasttime;
	}
	public void setLasttime(Date lasttime)
	{
		this.lasttime = lasttime;
	}
	public int getActivation()
	{
		return activation;
	}
	public void setActivation(int activation)
	{
		this.activation = activation;
	}
	public String getPurview()
	{
		return purview;
	}
	public void setPurview(String purview)
	{
		this.purview = purview;
	}
	
}
