<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*,com.redcms.page.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>文章列表</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
   #sub_container{
   width:780px;
   margin:0 auto;}
</style>
</head>
<body>
<div id="sub_container">
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="526">&nbsp;</td>
    <td width="254">
	<form name="form1" method="post" action="content">
	<input type="hidden" name="action" value="add"/>
	<input type="hidden" name="modelId" value="${modelId}"/>
	<input type="hidden" name="channelId" value="${channelId}"/>
	<input type="submit" name="Submit" value="添加新文章">
        </form>
    </td>
  </tr>
</table>
<!--文章列表-->
<table width="780" border="0" cellspacing="0" cellpadding="0" class="redtable">
  <tr>
	<th width="47"><input type="checkbox" name="checkbox2" value="checkbox"></th>
	<th width="39">序号</th>
	<th width="85">栏目</th>
	<th width="286">标题</th>
	<th width="81">类型</th>
	<th width="84">时间</th>
	<th width="57">状态</th>
	<th width="101">操作</th>
  </tr>
  <%
    PageDiv<Content> pd=(PageDiv<Content>)request.getAttribute("pd");
    if(null!=pd)
    {
    	List<Content> list=pd.getList();
    	if(null!=list&&list.size()>0)
    	{
    		for(Content content:list)
    		{
    			%>

  <tr>
    <td align="center" valign="middle"><input type="checkbox" name="checkbox" value="checkbox"></td>
    <td align="center" valign="middle">1</td>
    <td align="center" valign="middle"><%=content.getChannelName() %></td>
    <td align="left" valign="middle"><%=content.getTitle() %></td>
    <td align="center" valign="middle"><%%></td>
    <td align="center" valign="middle"><%=content.getCreateDate() %></td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">发布 修改 删除 </td>
  </tr>
      			<%
    		}
    	}
    	
    }
  %>
<!--   <tr>
    <td align="center" valign="middle"><input type="checkbox" name="checkbox3" value="checkbox"></td>
    <td align="center" valign="middle">2</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="left" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="middle"><input type="checkbox" name="checkbox4" value="checkbox"></td>
    <td align="center" valign="middle">3</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="left" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="middle"><input type="checkbox" name="checkbox5" value="checkbox"></td>
    <td align="center" valign="middle">4</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="left" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="left" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
  </tr> -->
</table>
</div>

<red:msgdig/>
</body>
</html>