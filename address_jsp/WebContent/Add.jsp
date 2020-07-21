<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
<!DOCTYPE html>



<%
	//サーブレットから値を受け取っている
	String name=(String)request.getAttribute("name");
	String address=(String)request.getAttribute("address");
	String tel=(String)request.getAttribute("tel");
	String errmsg=(String)request.getAttribute("errmsg");

%>
<html>
<head>
<link rel="stylesheet" href="Css.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>住所録管理システム：住所録登録</p>


 <% //jspからサーブレットへ値を渡している%>
<form method="GET" action="./AddBL">

<table  class="sampleTable">
	<tr>
		<td width="100" align="right">名前* : </td>
		 																<% //サーブレットから受け取った値をテキストボックスに入れている(value=)%>
		<td class="texter box" align="left"><input type="text" name="name" width="100"></td>
		<td></td>

	</tr>

	<tr>
		<td width="100" align="right">住所* : </td>
		<td class="add box" colspan="2" align="left"><input type="text" name="address"  width="200" size="48"></td>


	</tr>

	<tr>
		<td width="100" align="right">電話番号 : </td>
		<td class="texter box" align="left"><input type="tel" name="tel"  width="100"></td>
		<td></td>

	</tr>

	<tr>
		<td width="100"></td>
		<td width="100"align="left"><input type="submit" value="確認" class="btn btn1">
						 </td>
		<td width="100"><input type="submit" value="戻る" class="btn btn2"></td>
	</tr>


</table>
<%if(errmsg!=null){ %>
	<%= errmsg%>
<%} %>
</form>

</body>
</html>