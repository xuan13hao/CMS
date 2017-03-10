<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>RedCMS��̨����</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../res/treeview/jquery.treeview.css" />
<script src="../res/js/jquery-1.7.1.min.js" language="javascript"></script>
<script src="../res/treeview/jquery.treeview.js" type="text/javascript"></script>
<style type="text/css">
#top,#main{ width:1005px; margin:0 auto;}
/*ͷ����*/
#top{ height:68px; background:url(../res/img/admin/topbak.png) no-repeat; position:relative;}
#top #top_top{ width:400px; position:absolute; left:589px; top:8px;}
#top #top_top li{ float:right;}
#top #top_top li a{ text-decoration:none; color:#FFFFFF; font-weight:bold; margin:0 10px;}
#top #top_top li a:hover{ text-decoration:underline; color:#FFFFFF;}
/*��ӭ��ʾ*/
#top p{ position:absolute; left:269px; top:10px; color:#FFFFFF; letter-spacing:3px; font-size:14px;}

/*����*/
#top #nav{width:719px;position:absolute;left:277px;top:38px;height:30;}
#top #nav li{ float:left; text-align:center;  width:80px; text-align:center; line-height:30px; background:url(../res/img/admin/lotline.png) no-repeat right top;}
#top #nav li a{ font-size:16px; font-weight:bold; color:#666; display:block; width:70px; text-align:center; height:30px; line-height:30px; margin-left:4px; text-decoration:none; }
#top #nav li a:hover{ font-size:16px; background:url(../res/img/admin/nav_bak.png) no-repeat; color:#FFFFFF; text-decoration:none;}

#right #nav_pointer{ height:30px; line-height:30px; font-weight:bold; border-bottom:1px #CCCCCC solid; padding-left:10px;}


/*�������*/
#main #left{ float:left; width:180px; height:100%; background:#F9F9F9;}
#main #left dl{ width:170px; margin:0 auto; display:none;}
#main #left dl dt{ border-bottom:1px #CCCCCC solid; height:28px; line-height:28px; padding-left:10px; font-size:16px; font-weight:bold; letter-spacing:5px; margin-top:10px; background:url(../res/img/admin/dot_down.png) no-repeat 150px 13px; cursor:pointer;}

#main #left dl dd{ margin-left:20px;font-size:14px; line-height:30px;}
#main #left dl dd a{ text-decoration:none; color:#333333;}
#main #left dl dd a:hover{ text-decoration:underline;}

#main #middle{width:10px; height:auto; float:left; background:#F7F7F7 url(../res/img/admin/dot_left.png) no-repeat 2px 50%; cursor:pointer; }
#main #middle:hover{ background-color:#DBDBDB;}

#main #right{ width:810px; height:auto; float:left;}

.folder a,.file a{color:#000; text-decoration:none;}
.forlder a:hover,.file a:hover{text-decoration: underline;}

</style>


<script language="javascript" type="text/javascript">
var one_title="��ҳ";
var two_title="";
$(function(){
	$("#browser").treeview();
/*����������ͬ��*/
var mainheigh=$("#main").height();
$("#left").height(mainheigh);
$("#right").height(mainheigh);
$("#middle").height(mainheigh);

/*����Ч��*/
 $("#nav li:first a").css({color: "#FFF",background: "url(../res/img/admin/nav_bak.png) no-repeat"});
		$("#nav li a").mouseover(function(){
		   // $("#nav li:first a").css({color: "#666",background:"none"});
			$("#nav li a").css({color: "#666",background:"none"});
		    $(this).css({color: "#FFF",background: "url(../res/img/admin/nav_bak.png) no-repeat"});
		});
	
	
/*�м�Ч��*/
$("#middle").toggle(
  function () {
      $("#left").hide();
      $("#right").css("width","990px");
      $("#middle").css("background-image","url(../res/img/admin/dot_right.png)");
  },
  function () {
   $("#left").show();
    $("#right").css("width","810px");
	 $("#middle").css("background-image","url(../res/img/admin/dot_left.png)");
  }
);

/*����Ӳ˵��������۵�*/
  
   $("#left dl dt").toggle(
  function () {
     $(this).nextUntil("dt").hide();
	 $(this).css("background-image","url(../res/img/admin/dot_right.png)");
  },
  function () {
     $(this).nextUntil("dt").show();
  $(this).css("background-image","url(../res/img/admin/dot_down.png)");
  }
);
/*ʵ��������������Ӳ˵��Ĺ���*/


$("#top #nav li a").click(function()
{
   one_title=$(this).html();
   two_title="";
   
   $("#left dl").hide();
   var submenuid=$(this).attr("id").split("_")[0]+"_link";
   $("#left #"+submenuid).show();
   initlink();

});

$("#left dl dd a").click(function(){
   two_title=$(this).html();
   initlink();
});
	
});


function initlink()
{
     if(two_title=="")
	 {
     $("#right #nav_pointer").html("��ǰλ�ã�&nbsp;"+one_title);
	 }else
	 {
	 $("#right #nav_pointer").html("��ǰλ�ã�&nbsp;"+one_title+"&nbsp;->&nbsp;"+two_title);
	 }

}
</script>
</head>
<body>
  <div id="top">
  <p>��ã�${sessionScope.manager.email}</p>
  <ul id="top_top">
      <li><a href="login?action=logout">�˳�</a></li>
	  <li><a href="#">��վ��ͼ</a></li>
	  <li><a href="#">������ҳ</a></li>
  </ul>
  <ul id="nav">
      <li><a href="#" class="navcurrent" id="home_nav">��ҳ</a></li>
      <li><a href="#" id="model_nav">ģ��</a></li>
	  <li><a href="#" id="channel_nav">��Ŀ</a></li>
	  <li><a href="#" id="content_nav">����</a></li>
	   <li><a href="#" id="temp_nav">ģ��</a></li>
	   <li><a href="#" id="res_nav">��Դ</a></li>
	   <li><a href="#" id="modify_nav">ά��</a></li>
	   <li><a href="#" id="publish_nav">����</a></li>
  </ul>
  </div>
  <div id="main">
    <div id="left">
	<!--��ҳ��Ӧ������-->
	<dl id="home_link" style="display:block;">
	   <dt>��ʼ����</dt>
	   <dd><a  href="../forward?page=admin/welcome.jsp" target="main">��ӭҳ</a></dd>
	   <dd><a  href="../forward?page=admin/modify_password.jsp"  target="main">�޸�����</a></dd>
	   <dt>�˳�����</dt>
	   <dd><a  href="login?action=logout"  target="_parent">ע��</a></dd>
	   <dd><a  href="setinfo"  target="main">����</a></dd>
	</dl>
	<!--ģ��-->
	<dl id="model_link">
	  <dt>ģ�͹���</dt>
	  <dd><a  href="model?action=add"  target="main">����ģ��</a></dd>
	  <dd><a  href="model?action=tolist"  target="main">����ģ��</a></dd>
	</dl>
	<!--��Ŀ-->
	<dl id="channel_link">
	  <dt>��Ŀ����</dt>
	  <dd><a  href="channel?action=tolist"  target="main">������Ŀ</a></dd>
	  <dt>��������</dt>
	  <dd><a  href="#"  target="main">������Ŀ</a></dd>
	  <dd><a  href="#"  target="main">��������ҳ</a></dd>
	</dl>
		<!--����-->
	<dl id="content_link">
	<ul id="browser" class="filetree">
	<red:channelMenu/>
		<!-- <li><span class="folder">Folder 1</span>
			<ul>
				<li><span class="file">Item 1.1</span></li>
			</ul>
		</li>
		<li><span class="folder">Folder 2</span>
			<ul>
				<li><span class="folder">Subfolder 2.1</span>
					<ul id="folder21">
						<li><span class="file">File 2.1.1</span></li>
						<li><span class="file">File 2.1.2</span></li>
					</ul>
				</li>
				<li><span class="file">File 2.2</span></li>
			</ul>
		</li>
		<li class="closed"><span class="folder">Folder 3 (closed at start)</span>
			<ul>
				<li><span class="file">File 3.1</span></li>
			</ul>
		</li>
		<li><span class="file">File 4</span></li> -->
	</ul>

	</dl>
		<!--ģ�����-->
	<dl id="temp_link">
	  <dt>ģ�����</dt>
	  <dd><a  href="#"  target="main">������Ŀ</a></dd>
	  <dd><a  href="#"  target="main">������Ŀ</a></dd>
	  <dt>��������</dt>
	  <dd><a  href="#"  target="main">������Ŀ</a></dd>
	  <dd><a  href="#"  target="main">��������ҳ</a></dd>
	</dl>
		<!--��Դ-->
	<dl id="res_link">
	  <dt>��Դ����</dt>
	  <dd><a  href="#"  target="main">������Ŀ</a></dd>
	  <dd><a  href="#"  target="main">������Ŀ</a></dd>
	  <dt>��������</dt>
	  <dd><a  href="#">������Ŀ</a></dd>
	  <dd><a  href="#">��������ҳ</a></dd>
	</dl>
	
			<!--ά��-->
	<dl id="modify_link">
	  <dt>ά������</dt>
	  <dd><a  href="#">������Ŀ</a></dd>
	  <dd><a  href="#">������Ŀ</a></dd>
	  <dt>��������</dt>
	  <dd><a  href="#">������Ŀ</a></dd>
	  <dd><a  href="#">��������ҳ</a></dd>
	</dl>
	
				<!--����-->
	<dl id="publish_link">
	  <dt>���ɹ���</dt>
	  <dd><a  href="#">������Ŀ</a></dd>
	  <dd><a  href="#">������Ŀ</a></dd>
	  <dt>��������</dt>
	  <dd><a  href="#">������Ŀ</a></dd>
	  <dd><a  href="#">��������ҳ</a></dd>
	</dl>
	
    </div>
	<div id="middle"></div>
	<div id="right">
	 <div id="nav_pointer">��ǰλ��:</div>
	 <iframe src="../forward?page=admin/welcome.jsp" name="main" width="100%" marginwidth="0" height="550" marginheight="0" align="top" frameborder="0"></iframe>
	</div>
    <div style="clear:both;"></div>
  </div>
  
</body>
</html>