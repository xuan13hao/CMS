<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<%@taglib prefix="red" uri="/redcms-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>��Ŀ����</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<table class="redtable" width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6">
    <form name="form1" method="post" action="channel">
    <input type="hidden" name="action" value="add"/>
    <input type="hidden" name="parentId" value="0"/>
      ѡ��ģ�ͣ�<red:modelList/>
	  <input type="submit" name="Submit" value="���Ӷ������">
    </form>    </td>
  </tr>
  <tr>
    <th width="44" align="center">���</th>
    <th width="43" align="center">����</th>
    <th width="348" align="center">��Ŀ����</th>
    <th width="68" align="center">����ģ��</th>
    <th width="169" align="center">��������Ŀ </th>
    <th width="88" align="center">����</th>
  </tr>
  <red:channellist/>
<!-- 
  <tr>
    <td align="center" valign="middle"></td>
    <td align="center" valign="middle"></td>
    <td align="left" valign="top">
    </td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center"><form name="form2" method="post" action="">
      <select name="select2">
        <option value="1">����</option>
        <option value="2">ͼƬ</option>
      </select>
        <input type="submit" name="Submit2" value="�������Ŀ">
    </form>
    </td>
    <td align="center"><a href="#">�޸�</a>&nbsp; <a href="#">ɾ��</a> </td>
  </tr> -->

 <!--  <tr>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
  </tr> -->
</table>



<red:msgdig/>
</body>
</html>