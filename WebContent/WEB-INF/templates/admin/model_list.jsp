<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ģ���б�</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="redtable">
  <tr>
    <th width="48" align="center" valign="middle">���</th>
    <th width="91" align="center" valign="middle">ģ����</th>
    <th width="118" align="center" valign="middle">����</th>
    <th width="101" align="center" valign="middle">����</th>
    <th width="54" align="center" valign="middle">Ĭ��</th>
    <th width="188" align="center" valign="middle">����</th>
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
    <td><%=1==mo.getIsDef()?"��":"����" %></td>
    <td align="center" >
    <a class="l1" href="model?action=edit&id=<%=mo.getId()%>">�޸�</a>&nbsp; 
    <a class="l1" href="model?action=delete&id=<%=mo.getId()%>">ɾ��</a> &nbsp;
    <a class="l1" href="model?action=tofield&id=<%=mo.getId()%>">�����ֶ�</a></td>
  </tr>
  <%
  }}
  %>
</table>
   <red:msgdig/>
</body>
</html>