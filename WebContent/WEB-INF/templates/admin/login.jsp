<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>RedCMS后台登陆</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
 #container{ margin:200px auto; width:500px;}
  #container table td{ line-height:30px; font-size:12px;}
</style>

</head>
<body>

<div id="container">
<form method="post" action="login">
<input type="hidden" value="checkLogin" name="action"/> 
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" style="border-bottom:1px #CCCCCC solid; padding:5px 10px;"><img src="../res/img/admin/logo_login.png" width="279" height="34"></td>
    </tr>
  <tr>
    <td width="90" align="right" valign="middle">用户名/Email：</td>
    <td width="310" align="left"><input name="email" type="text" id="email" size="30" value="info@redwww.com"></td>
  </tr>
  <tr>
    <td align="right" valign="middle">密&nbsp; 码：</td>
    <td align="left"><input name="passwd" type="password" id="pwd" size="30"  title="请输入密码!" value="admin"></td>
  </tr>
  <tr>
    <td align="right" valign="middle">验证码：</td>
    <td align="left"><table width="300" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="76"><input name="randimg" type="text" size="10"></td>
        <td width="85"><img name="randimg" src="randimg" alt="验证码" style=" cursor:pointer;" onclick="this.src='randimg?aaa='+Math.random();"></td>
        <td width="139"><u>看不清，点击图片</u></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="left"><input type="submit" name="Submit" value="登陆" style=" width:120px;"></td>
  </tr>
</table>
</form>
</div>
<red:msgdig/>
</body>
</html>