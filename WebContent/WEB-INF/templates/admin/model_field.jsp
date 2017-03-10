<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>内容字段管理</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<script type="text/javascript">
   $(function(){
	   $("#selectall").click(function(){
		   var val=$(this).val();
		   if(val=="取消")
			   {
			   $(":checkbox").removeAttr("checked");
			   $(this).val("全选");
			   }else
				{
				   $(":checkbox").attr("checked","checked");
				   $(this).val("取消");
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
	   //第一次访问
	  %>
<form action="model" method="post">
 <input type="hidden" name="action" value="savefield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">字段</th>
    <th width="197" align="center">显示</th>
    <th width="254" align="center">默认值</th>
    <th width="254" align="center">操作</th>
  </tr>
  <tr>
    <td align="center">
     
     <script type="text/javascript">
      $(function(){
          $(":checkbox").attr("checked","checked");
   	   $("#selectall").val("取消"); 
      });
    </script>
    
    
    <input name="txtfield"  type="checkbox" id="txtfield" value="type_id"/></td>
    <td>type_id</td>
    <td><input name="disp" type="text" id="disp" value="内容类别"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title"/></td>
    <td>title</td>
    <td><input name="disp" type="text" id="disp" value="标题"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="tags"/></td>
    <td>tags</td>
    <td><input name="disp" type="text" id="disp" value="标签"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="author"/></td>
    <td>author</td>
    <td><input name="disp" type="text" id="disp" value="作者"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="origin"/></td>
    <td>origin</td>
    <td><input name="disp" type="text" id="disp" value="来源"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue" value="原创"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="origin_url"/></td>
    <td>origin_url</td>
    <td><input name="disp" type="text" id="disp" value="来源url"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="description"/></td>
    <td>description</td>
    <td><input name="disp" type="text" id="disp" value="描述"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title_color"/></td>
    <td> title_color</td>
    <td><input name="disp" type="text" id="disp" value="标题颜色"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="is_bold"/></td>
    <td>is_bold</td>
    <td><input name="disp" type="text" id="disp" value="标题加粗"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title_pic"/></td>
    <td>title_pic</td>
    <td><input name="disp" type="text" id="disp" value="标题图"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="content_pic"/></td>
    <td>content_pic</td>
    <td><input name="disp" type="text" id="disp" value="内容图"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="type_pic"/></td>
    <td>type_pic</td>
    <td><input name="disp" type="text" id="disp" value="类别图"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="link"/></td>
    <td>link</td>
    <td><input name="disp" type="text" id="disp" value="外链"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="temp"/></td>
    <td>temp</td>
    <td><input name="disp" type="text" id="disp" value="模版"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="status"/></td>
    <td>status</td>
    <td><input name="disp" type="text" id="disp" value="状态"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="orderlist"/></td>
    <td>orderlist</td>
    <td><input name="disp" type="text" id="disp" value="排序"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="is_recommend"/></td>
    <td> is_recommend</td>
    <td><input name="disp" type="text" id="disp" value="推荐"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="txt"/></td>
    <td><p>txt</p>    </td>
    <td><input name="disp" type="text" id="disp" value="内容"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">删除</a></td>
  </tr>
   <tr>
    <td align="center"><input type="button" name="selectall" value="全选" id="selectall"></td>
    <td colspan="4" align="left">
    <input type="submit" name="Submit2" value="保存系统字段">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form>
<%
}else
{
	  //数据表中已有数据
 %>
 <form action="model" method="post">
 <input type="hidden" name="action" value="deletefield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">字段</th>
    <th width="197" align="center">显示</th>
    <th width="254" align="center">默认值</th>
    <th width="254" align="center">操作</th>
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
	    <td align="center"><a href="model?action=deletefield?id=<%=mi.getId()%>">删除</a></td>
	  </tr>
	<%  } 
	%>
	<tr>
    <td colspan="5" align="left">
    <input type="submit" name="Submit2" value="删除选中字段">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form>	
<!-- 表中没有的字段 -->
<form action="model" method="post">
<input type="hidden" name="action" value="savefield"/>
<input type="hidden" name="modelId" value="${modelId}"/>
<table class="redtable" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">字段</th>
    <th width="197" align="center">显示</th>
    <th width="254" align="center">默认值</th>
    <th width="254" align="center">操作</th>
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
	    <td align="center"><a href="model">保存</a></td>
	  </tr>
					<%
				}
			 
	   }
	
	
   }
%>
	<tr>
    <td colspan="5" align="left">
    <input type="submit" name="Submit2" value="保存为系统字段">&nbsp;&nbsp;
     </td>
  </tr>
</table>
</form>
<red:msgdig/>
</body>
</html>