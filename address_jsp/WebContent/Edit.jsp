<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<!DOCTYPE html>

<%
	String id=(String)request.getParameter("id");
	String name=(String)request.getParameter("name");
	String address=(String)request.getParameter("address");
	String tel=(String)request.getParameter("tel");;
	//String errmsg=(String)request.getParameter("errmsg");
	String errmsg=(String)request.getAttribute("errmsg");
	ResultSet rs=null;


%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<p>住所録管理システム：住所録編集</p>


	 <% //jspからサーブレットへ値を渡している%>
	<form method="GET">

		<table  class="sampleTable">
			<tr>
				<input type="hidden" name="id" value=<%= id %>>
				<td width="100" align="right">名前* : </td>
				 																<% //サーブレットから受け取った値をテキストボックスに入れている(value=)%>
				<td class="texter box" align="left"><input type="text" name="name" width="100" value=<%= name %>></td>
				<td></td>

			</tr>

			<tr>
				<td width="100" align="right">住所* : </td>
				<td class="add box" colspan="2" align="left"><input type="text" name="address"  width="200" size="48"value=<%= address %>></td>


			</tr>

			<tr>
				<td width="100" align="right">電話番号 : </td>
				<td class="texter box" align="left"><input type="tel" name="tel"  width="100" value=<%= tel %>></td>
				<td></td>

			</tr>

			<tr>
				<td width="100"></td>
				<td width="100"align="left"><input type="submit" value="確認" formaction="./EditBL">
								 </td>
				<td width="100"><input type="submit" value="戻る" formaction="./ListBL"></td>
			</tr>


		</table>
	<%if(errmsg!=null){ %>
	<%= errmsg%>
	<%} %>

	</form>

</body>
</html>