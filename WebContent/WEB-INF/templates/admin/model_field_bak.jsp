<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,com.redcms.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�����ֶι���</title>
<link href="../res/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<table class="redtable" width="854" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="49" align="center">&nbsp;</th>
    <th width="100" align="center">�ֶ�</th>
    <th width="197" align="center">��ʾ</th>
    <th width="254" align="center">Ĭ��ֵ</th>
    <th width="254" align="center">����</th>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="type_id"/></td>
    <td>type_id</td>
    <td><input name="disp" type="text" id="disp" value="�������"/></td>
    <td align="center"><input name="defvalue" type="text" id="defvalue"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title"/></td>
    <td>title</td>
    <td><input name="disp2" type="text" id="disp2" value="����"/></td>
    <td align="center"><input name="defvalue2" type="text" id="defvalue2"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="tags"/></td>
    <td>tags</td>
    <td><input name="disp3" type="text" id="disp3" value="��ǩ"/></td>
    <td align="center"><input name="defvalue3" type="text" id="defvalue3"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="author"/></td>
    <td>author</td>
    <td><input name="disp4" type="text" id="disp4" value="����"/></td>
    <td align="center"><input name="defvalue4" type="text" id="defvalue4"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="origin"/></td>
    <td>origin</td>
    <td><input name="disp5" type="text" id="disp5" value="��Դ"/></td>
    <td align="center"><input name="defvalue5" type="text" id="defvalue5" value="ԭ��"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="origin_url"/></td>
    <td>origin_url</td>
    <td><input name="disp6" type="text" id="disp6" value="��Դurl"/></td>
    <td align="center"><input name="defvalue6" type="text" id="defvalue6"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="description"/></td>
    <td>description</td>
    <td><input name="disp7" type="text" id="disp7" value="����"/></td>
    <td align="center"><input name="defvalue7" type="text" id="defvalue7"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title_color"/></td>
    <td> title_color</td>
    <td><input name="disp8" type="text" id="disp8" value="������ɫ"/></td>
    <td align="center"><input name="defvalue8" type="text" id="defvalue8"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="is_bold"/></td>
    <td>is_bold</td>
    <td><input name="disp9" type="text" id="disp9" value="����Ӵ�"/></td>
    <td align="center"><input name="defvalue9" type="text" id="defvalue9"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="title_pic"/></td>
    <td>title_pic</td>
    <td><input name="disp10" type="text" id="disp10" value="����ͼ"/></td>
    <td align="center"><input name="defvalue10" type="text" id="defvalue10"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="content_pic"/></td>
    <td>content_pic</td>
    <td><input name="disp11" type="text" id="disp11" value="����ͼ"/></td>
    <td align="center"><input name="defvalue11" type="text" id="defvalue11"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="type_pic"/></td>
    <td>type_pic</td>
    <td><input name="disp12" type="text" id="disp12" value="���ͼ"/></td>
    <td align="center"><input name="defvalue12" type="text" id="defvalue12"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="link"/></td>
    <td>link</td>
    <td><input name="disp13" type="text" id="disp13" value="����"/></td>
    <td align="center"><input name="defvalue13" type="text" id="defvalue13"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="temp"/></td>
    <td>temp</td>
    <td><input name="disp14" type="text" id="disp14" value="ģ��"/></td>
    <td align="center"><input name="defvalue14" type="text" id="defvalue14"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="status"/></td>
    <td>status</td>
    <td><input name="disp15" type="text" id="disp15" value="״̬"/></td>
    <td align="center"><input name="defvalue15" type="text" id="defvalue15"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="orderlist"/></td>
    <td>orderlist</td>
    <td><input name="disp16" type="text" id="disp16" value="����"/></td>
    <td align="center"><input name="defvalue16" type="text" id="defvalue16"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="is_recommend"/></td>
    <td> is_recommend</td>
    <td><input name="disp17" type="text" id="disp17" value="�Ƽ�"/></td>
    <td align="center"><input name="defvalue17" type="text" id="defvalue17"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="txt"/></td>
    <td><p>txt</p>    </td>
    <td><input name="disp172" type="text" id="disp172" value="����"/></td>
    <td align="center"><input name="defvalue18" type="text" id="defvalue18"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td  colspan="5" align="center" bgcolor="#CCCCCC">�����ǲ���ʾ�ֶ�</td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="orderlist"/></td>
    <td>orderlist</td>
    <td><input name="disp16" type="text" id="disp16" value="����"/></td>
    <td align="center"><input name="defvalue182" type="text" id="defvalue182"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="is_recommend"/></td>
    <td> is_recommend</td>
    <td><input name="disp17" type="text" id="disp17" value="�Ƽ�"/></td>
    <td align="center"><input name="defvalue183" type="text" id="defvalue183"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input name="txtfield" type="checkbox" id="txtfield" value="txt"/></td>
    <td><p>txt</p></td>
    <td><input name="disp172" type="text" id="disp172" value="����"/></td>
    <td align="center"><input name="defvalue184" type="text" id="defvalue184"/></td>
    <td align="center"><a href="#">ɾ��</a></td>
  </tr>
  <tr>
    <td align="center"><input type="button" name="Submit" value="ȫѡ"></td>
    <td colspan="4" align="left"><input type="submit" name="Submit2" value="����"></td>
  </tr>
</table>
</body>
</html>