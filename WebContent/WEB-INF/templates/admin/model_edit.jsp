<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" import="com.redcms.beans.Model"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�޸�ģ��</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="model" method="post">
<input type="hidden" name="action" value="saveEdit">

<%
  Model md=(Model)request.getAttribute("model");
if(null==md)
{
%>
<red:msgdig msg="ģ�� ����Ϊ��"/>
<%
}else
{
%>
<input type="hidden" name="id" value="<%=md.getId()%>">


<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="redtable">
  <tr>
    <th colspan="4" align="left">�޸�ģ��</th>
  </tr>
  <tr>
    <td width="9%" align="right">ģ������</td>
    <td width="32%"><input name="name" type="text" id="name" value="<%=md.getName()%>"></td>
    <td colspan="2" align="left">������
      <input name="tableName" type="text" id="tableName" size="10" disabled="true" value="<%=md.getTableName()%>">һ����Ӣ��</td>
    </tr>
  <tr>
    <td align="right">������</td>
    <td colspan="3"><textarea name="description" cols="40" rows="5" id="description"><%=md.getDescription()%></textarea></td>
    </tr>
  <tr>
    <td align="right">ģ�棺</td>
    <td colspan="3"><p>��ҳ��
       
        <select name="indexTemp" id="indexTemp">
        <%
          String[] indexs=(String[])request.getAttribute("indexs");
          if(null!=indexs&&indexs.length>0)
          {
        	 for(String tem:indexs)
        	 {
        		    
         %>
          <option value="<%=tem%>" <%=tem.equals(md.getIndexTemp())?"selected='selected'":""%>><%=tem %></option>
        <%}} %>
        </select>
        �б�
        <select name="listTemp" id="listTemp">
          <%
          String[] lists=(String[])request.getAttribute("lists");
          if(null!=indexs&&indexs.length>0)
          {
        	 for(String tem:lists)
        	 {
       %>
          <option value="<%=tem%>"  <%=tem.equals(md.getListTemp())?"selected='selected'":""%>><%=tem %></option>
          <%}} %>
          </select>���ݣ�
        <select name="contentTemp" id="contentTemp">
          <%
          String[] contents=(String[])request.getAttribute("contents");
          if(null!=indexs&&indexs.length>0)
          {
        	 for(String tem:contents)
        	 {
       %>
          <option value="<%=tem%>"  <%=tem.equals(md.getContentTemp())?"selected='selected'":""%>><%=tem %></option>
          <%}} %>
            </select></p>      </td>
    </tr>
  <tr>
    <td align="right">����ͼ��</td>
    <td>��
      <input name="titleWidth" type="text" id="titleWidth" value="<%=md.getTitleWidth()%>" size="5">
      �ߣ�
      <input name="titleHeight" type="text" id="titleHeight" value="<%=md.getTitleHeight()%>" size="5"></td>
    <td width="31%" align="right">����ͼ::</td>
    <td width="28%">��
      <input name="contentWidth" type="text" id="contentWidth" value="<%=md.getContentWidth()%>" size="5">
      �ߣ�
      <input name="contentHeight" type="text" id="contentHeight" value="<%=md.getContentHeight()%>" size="5"></td>
  </tr>
  <tr>
    <td align="right">�Ƿ�Ĭ�ϣ�</td>
    <td><input type="radio" name="isDef" value="1" 
    <%
       if(md.getIsDef()==1) out.println(" checked");
    %>
    >
      ��
      <input name="isDef" type="radio" value="0"    <%
       if(md.getIsDef()==0) out.println(" checked");
    %>>
      ��</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" align="center" valign="middle"><input type="submit" name="Submit" value="�޸�">
      &nbsp; <input type="reset" name="Submit2" value="����"></td>
    </tr>
</table>
<%} %>
</form>
</body>
<red:msgdig/>
</html>