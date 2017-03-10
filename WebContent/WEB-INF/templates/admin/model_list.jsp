<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>模型列表</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="redtable">
  <tr>
    <th width="48" align="center" valign="middle">序号</th>
    <th width="91" align="center" valign="middle">模型名</th>
    <th width="118" align="center" valign="middle">描述</th>
    <th width="101" align="center" valign="middle">表名</th>
    <th width="54" align="center" valign="middle">默认</th>
    <th width="188" align="center" valign="middle">操作</th>
  </tr>
  <%
    List<Model> list=(List<Model>)request.getAttribute("list");
  if(null!=list&&list.size()>0)
  {
	  for(Model mo:list)
	  {
  %>
  <tr>
    <td align="center" valign="middle"><%=mo.getId() %></td>
    <td align="center" valign="middle"><%=mo.getName() %></td>
    <td align="center" valign="middle"><%=mo.getDescription()%></td>
    <td align="center" valign="middle"><%=mo.getTableName()%></td>
    <td><%=1==mo.getIsDef()?"是":"不是" %></td>
    <td align="center" >
    <a class="l1" href="model?action=edit&id=<%=mo.getId()%>">修改</a>&nbsp; 
    <a class="l1" href="model?action=delete&id=<%=mo.getId()%>">删除</a> &nbsp;
    <a class="l1" href="model?action=tofield&id=<%=mo.getId()%>">内容字段</a></td>
  </tr>
  <%
  }}
  %>
</table>
   <red:msgdig/>
</body>
</html>