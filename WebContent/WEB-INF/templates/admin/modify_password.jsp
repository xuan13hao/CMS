<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
 <%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>修改密码</title>
<style type="text/css">
.redtable{ margin:10px auto; border-collapse:collapse;}
.redtable td{ border:1px #CCCCCC solid; line-height:30px;}
.redtable th{ padding-left:10px; background:#CC0000; color:#FFFFFF; font-weight:bold; line-height:34px;}

.redinput{ width:120px; line-height:26px;}

</style>
</head>
<body>
<form action="admin/manager" method="post">
<input type="hidden" name="action" value="modifypwd"/>
<table width="343" border="0" align="center" cellpadding="0" cellspacing="0" class="redtable">
  <tr>
    <th colspan="2" align="left">修改密码：</th>
  </tr>
  <tr>
    <td width="97" align="right">当前密码：</td>
    <td width="246"><input name="orgpwd" type="password" class="redinput" id="orgpwd"></td>
  </tr>
  <tr>
    <td align="right">新密码：</td>
    <td><input name="pwd" type="password" class="redinput" id="pwd"></td>
  </tr>
  <tr>
    <td align="right">重复密码：</td>
    <td><input name="repwd" type="password" class="redinput" id="repwd"></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input type="submit" name="Submit" value="提交">
      &nbsp;&nbsp; 
      <input type="reset" name="Submit2" value="重置"></td>
  </tr>
</table>
</form>
<red:msgdig/>
</body>
</html>