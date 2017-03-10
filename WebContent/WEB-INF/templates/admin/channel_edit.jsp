<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>增加栏目</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<script charset="utf-8" src="../res/editor_4_1_4/kindeditor.js"></script>
<script charset="utf-8" src="../res/editor_4_1_4/lang/zh_CN.js"></script>
<script type="text/javascript">


        var editor;
       
        KindEditor.ready(function(K) {
                    editor =  K.create('#content', {
                    uploadJson : '../admin/upload_pic',
                    allowFileManager : false,
                    afterUpload : function( url, data, name) {
                        var reId=data.filesId;
                    	
                    	var ins=K.query('#filesId');
                    	if(ins.value=="")
                    		{
                    		ins.value=reId+',';
                    		}else
                    		{
                    		 ins.value=ins.value+reId+",";
                    		}
                        
                    }
              });
  
        /*         editor = K.create('#metaDes', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : true,
					uploadJson : '../admin/upload_pic',
	                allowFileManager : false,
 					items : []
				 }); */
                var picWidth=document.getElementById("picWidth").value;
                var picHeight=document.getElementById("picHeight").value;
                K("#picWidth").change(function(){
                    picWidth=K(this).val();
                });
                K("#picHeight").change(function(){
                	picHeight=K(this).val();
                });
 
                K('#image1').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							imageWidth : picWidth,
							imageHeight : picHeight,
							imageUrl : K('#url1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url1').val(url);
								//k('#image1').src=url;
								
								editor.hideDialog();
						 		var image1=document.getElementById("image1");
								image1.src=url;
								image1.width=120;
								image1.height=65; 
						
								
							}
						});
					});
				}); 
        });
</script>

</head>
<body>
<%
Channel channel=(Channel)request.getAttribute("channel");
if(null==channel)
{
%>
<red:msgdig msg="要修改的栏目为空！"/>
<%	
return ;
}
%>
<form action="channel" method="post" name="form1">
<input type="hidden" name="action" value="saveEdit"/>
<input type="hidden" name="id" value="<%=channel.getId()%>"/>
  <table class="redtable" width="780" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <th colspan="6" align="left">增加栏目</th>
    </tr>
    <tr>
      <td width="73" align="right">标题：</td>
      <td width="168"><input name="name" type="text" id="name" value="<%=channel.getName()==null?"":channel.getName()%>"></td>
      <td width="69">模型：</td>
      <td width="188">
      <red:modelList selectId="${channel.modelId}"/>
      </td>
      <td width="76">父栏目：</td>
      <td width="206">
      <select name="parentId" id="parentId">
        
        <%
        int parentId=channel.getParentId();//(Integer)request.getAttribute("parentId");
        if(parentId==0)
        out.println("<option value='0'>顶级栏目</option>");
        else
        {
        List<Channel> channel_list=(List<Channel>)request.getAttribute("channel_list");
        if(null!=channel_list&&channel_list.size()>0)
        {
        	for(Channel cnn:channel_list)
        	{
                 if(parentId==cnn.getId())
                	 out.println("<option value='"+cnn.getId()+"' >"+cnn.getName()+"</option>");

        	}
        }
        }
        %>
      </select> 
</td>
    </tr>
    <tr>
      <td align="right">路径：</td>
      <td><input name="path" type="text" id="path" size="10" value="<%=channel.getPath()==null?"":channel.getPath()%>"/>
      英文</td>
      <td>MateTitle:</td>
      <td><input name="metaTitle" type="text" id="mateTitle" value="<%=channel.getMetaTitle()==null?"":channel.getMetaTitle()%>"></td>
      <td>MateKey:</td>
      <td><input name="metaKey" type="text" id="mateKey" value="<%=channel.getMetaKey()==null?"":channel.getMetaKey()%>"></td>
    </tr>

    <tr>
      <td align="right">metaDes：</td>
      <td colspan="3">
        
      <textarea name="metaDes" cols="50" rows="3" id="metaDes" style="width:420px; height:60px;"><%=channel.getMetaDes()==null?"":channel.getMetaDes()%></textarea></td>
      <td>图片：</td>
      <td>
	 <input type="hidden" name="pic" id="url1" value="" /> 
	 <input type="hidden" name="filesId" id="filesId" value=""/>
	 <%
	    String imgsrc="../res/img/admin/upload-pic.png";
	    if(null!=channel.getPic()&&!"".equals(channel.getPic()))
	    {
	    	imgsrc=channel.getPic();
	    }
	 %>
	 <img id="image1" width="60" height="60"  src="<%=imgsrc%>" style="cursor:pointer; " align="left"/>
	 宽：<input name="picWidth" type="text" id="picWidth" value="<%=channel.getPicWidth()%>" size="10" style="width:30px;">
x
高：<input name="picHeight" type="text" id="picHeight" value="<%=channel.getPicHeight()%>" size="10"  style="width:30px;">
	 
	  </td>
    </tr>
    <tr>
      <td align="right">外链：</td>
      <td colspan="3"><input name="link" type="text" id="link" style="width:330px;" value="<%=channel.getLink()==null?"":channel.getLink()%>"></td>
      <td>排序:</td>
      <td><select name="orderlist">
       <%
          for(int z=10;z>0;z--)
        	  { 
        	      if(channel.getOrderlist()==z)
        	      {
     		         %>
			          <option value="<%=z%>" selected="selected"><%=z%></option>
			         <%  
        	      }else
        	      {
			         %>
			          <option value="<%=z%>"><%=z%></option>
			         <%
        	      }
        	  }
         %>
        </select>      </td>
    </tr>
    <tr>
      <td align="right">描述：</td>
      <td colspan="5"><textarea name="content" cols="50" rows="6" id="content" style="width:710px; height:260px;"><%=channel.getContent()%></textarea></td>
    </tr>
    <tr>
      <td align="right" style="font-size:12px;">首页模版：</td>
      <td>
      <select name="indexTemp" id="indexTemp">
        <%
          Model model=(Model)request.getAttribute("model");
        
          String[] indexs=(String[])request.getAttribute("indexs");
          if(null!=indexs&&indexs.length>0)
          {
        	 for(String tem:indexs)
        	 {
        		  if(tem.equals(model.getIndexTemp()))
        		  {
        			  %>
        	             <option value="<%=tem%>" selected="selected"><%=tem %></option>
        	           <%	  
        		  }else
        		  {
           %>
             <option value="<%=tem%>"><%=tem %></option>
           <%
        		  }
              }
        	 
          } %>
      </select>      </td>
      <td  style="font-size:12px;">列表模版：</td>
      <td>
      <select name="listTemp" id="listTemp">
        <%
          String[] lists=(String[])request.getAttribute("lists");
          if(null!=indexs&&indexs.length>0)
          {
        	 for(String tem:lists)
        	 {
        		 if(tem.equals(model.getListTemp()))
        		 {
        			 %>
        		     <option value="<%=tem%>" selected="selected"><%=tem %></option>
        		   <%	 
        		 }else
        		 {
           %>
          <option value="<%=tem%>"><%=tem %></option>
          <%
        	    }
        	 }
        	 
          } %>
      </select></td>
      <td  style="font-size:12px;">内容模版：</td>
      <td>
      <select name="contentTemp" id="contentTemp">
        <%
          String[] contents=(String[])request.getAttribute("contents");
          if(null!=indexs&&indexs.length>0)
          {
        	 for(String tem:contents)
        	 {
        	   if(tem.equals(model.getContentTemp()))
        	   {
        		   %>
        	          <option value="<%=tem%>" selected="selected"><%=tem %></option>
        	          <%  
        	   }else
        	   {
          %>
          <option value="<%=tem%>"><%=tem %></option>
          <%
        	   }
        	   }
        	 
          } %>
      </select></td>
    </tr>
    <tr>
      <td colspan="6" align="center" valign="middle"><input type="submit" name="Submit" value="增加栏目">
        &nbsp;&nbsp; <input type="reset" name="Submit2" value="重置"></td>
    </tr>
  </table>
</form>
<red:msgdig/>

</body>
</html>