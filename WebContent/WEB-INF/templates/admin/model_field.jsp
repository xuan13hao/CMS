<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�����ֶι���</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<script type="text/javascript">
   $(function(){
	   $("#selectall").click(function(){
		   var val=$(this).val();
		   if(val=="ȡ��")
			   {
			   $(":checkbox").removeAttr("checked");
			   $(this).val("ȫѡ");
			   }else
				{
				   $(":checkbox").attr("checked","checked");
				   $(this).val("ȡ��");
				}
	   });
	   
	   
   });
</script>
</head>
<body>

<%
List<ModelItem> list=(List<ModelItem>)request.getAttribute("list");
if(null==list||list.size()==0)
{
	   //��һ�η���
	  %>
<form action="model" method="post">
 <input type="hidden" name="action" value="savefield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">�ֶ�</th>
    <th width="197" align="center">��ʾ</th>
    <th width="254" align="center">Ĭ��ֵ</th>
    <th width="254" align="center">����</th>
  </tr>
  <tr>
    <td align="center">
     
     <script type="text/javascript">
      $(function(){
          $(":checkbox").attr("checked","checked");
   	   $("#selectall").val("ȡ��"); 
      });
    </script>
    
    
    <input name="txtfield"  type="checkbox" id="txtfield" value="type_id"/></td>
    <td>type_id</td>
    <td><input name="disp" type="text" id="disp" value="�������"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title"/></td>
    <td>title</td>
    <td><input name="disp" type="text" id="disp" value="����"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="tags"/></td>
    <td>tags</td>
    <td><input name="disp" type="text" id="disp" value="��ǩ"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="author"/></td>
    <td>author</td>
    <td><input name="disp" type="text" id="disp" value="����"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="origin"/></td>
    <td>origin</td>
    <td><input name="disp" type="text" id="disp" value="��Դ"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue" value="ԭ��"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="origin_url"/></td>
    <td>origin_url</td>
    <td><input name="disp" type="text" id="disp" value="��Դurl"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="description"/></td>
    <td>description</td>
    <td><input name="disp" type="text" id="disp" value="����"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title_color"/></td>
    <td> title_color</td>
    <td><input name="disp" type="text" id="disp" value="������ɫ"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="is_bold"/></td>
    <td>is_bold</td>
    <td><input name="disp" type="text" id="disp" value="����Ӵ�"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title_pic"/></td>
    <td>title_pic</td>
    <td><input name="disp" type="text" id="disp" value="����ͼ"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="content_pic"/></td>
    <td>content_pic</td>
    <td><input name="disp" type="text" id="disp" value="����ͼ"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="type_pic"/></td>
    <td>type_pic</td>
    <td><input name="disp" type="text" id="disp" value="���ͼ"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="link"/></td>
    <td>link</td>
    <td><input name="disp" type="text" id="disp" value="����"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="temp"/></td>
    <td>temp</td>
    <td><input name="disp" type="text" id="disp" value="ģ��"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="status"/></td>
    <td>status</td>
    <td><input name="disp" type="text" id="disp" value="״̬"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="orderlist"/></td>
    <td>orderlist</td>
    <td><input name="disp" type="text" id="disp" value="����"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="is_recommend"/></td>
    <td> is_recommend</td>
    <td><input name="disp" type="text" id="disp" value="�Ƽ�"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="txt"/></td>
    <td><p>txt</p>    </td>
    <td><input name="disp" type="text" id="disp" value="����"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
   <tr>
    <td align="center"><input type="button" name="selectall" value="ȫѡ" id="selectall"></td>
    <td colspan="4" align="left">
    <input type="submit" name="Submit2" value="����ϵͳ�ֶ�">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form>
<%
}else
{
	  //���ݱ�����������
 %>
 <form action="model" method="post">
 <input type="hidden" name="action" value="deletefield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">�ֶ�</th>
    <th width="197" align="center">��ʾ</th>
    <th width="254" align="center">Ĭ��ֵ</th>
    <th width="254" align="center">����</th>
  </tr>
	   <%

	   for(ModelItem mi:list)
	   {
	   %>
	   <tr>
	    <td align="center">
	    <input name="txtfield" type="checkbox" id="txtfield" value="<%=mi.getId()%>"/></td>
	    <td><p><%=mi.getName()%></p>    </td>
	    <td><input name="disp" type="text" id="disp" value="<%=mi.getLabel()%>"/></td>
	    <td align="center"><input name="defvalue" type="text" id="defvalue" value="<%=mi.getDefValue()%>"/></td>
	    <td align="center"><a href="model?action=deletefield?id=<%=mi.getId()%>">ɾ��</a></td>
	  </tr>
	<%  } 
	%>
	<tr>
    <td colspan="5" align="left">
    <input type="submit" name="Submit2" value="ɾ��ѡ���ֶ�">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form>	
<!-- ����û�е��ֶ� -->
<form action="model" method="post">
<input type="hidden" name="action" value="savefield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">�ֶ�</th>
    <th width="197" align="center">��ʾ</th>
    <th width="254" align="center">Ĭ��ֵ</th>
    <th width="254" align="center">����</th>
  </tr>
	<%
		String[][] allfield=(String[][])request.getAttribute("allfield");
		for(String [] field:allfield)
	   {
			boolean result=false;
			for(ModelItem mi:list)
			{ 
				if(field[0].equals(mi.getName()))
					result=true;
			}
			if(!result)			
				{
					%>
					<tr>
	    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="<%=field[0]%>"/></td>
	    <td><p><%=field[0]%></p>    </td>
	    <td><input name="disp" type="text" id="disp" value="<%=field[1]%>"/></td>
	    <td align="center"><input name="defvalue" type="text" id="defvalue" value="<%=field[2]%>"/></td>
	    <td align="center"><a href="model">����</a></td>
	  </tr>
					<%
				}
			 
	   }
	
	
   }
%>
	<tr>
    <td colspan="5" align="left">
    <input type="submit" name="Submit2" value="����Ϊϵͳ�ֶ�">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form>
<red:msgdig/>
</body>
</html>