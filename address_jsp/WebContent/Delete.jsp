<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet" %>
<!DOCTYPE html>
<%
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String tel=request.getParameter("tel");
	ResultSet rs=null;
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>下記住所録を削除します。よろしいですか？</p>

	<form method="GET">
			<table  class="sampleTable">
				<tr>
					<input type="hidden" name="id" value=<%= id %>>
					<td width="100" align="left">名前　　　　：　</td>
					<td class="texter box" align="left"><%= name %><input type="hidden" name="name" value=<%= name %>></td>
					<td></td>

				</tr>

				<tr>
					<td width="100" align="left">住所　　　　：　</td>
					<td class="add box" colspan="2" align="left"><%= address %><input type="hidden" name="address" value=<%= address %>></td>


				</tr>

				<tr>
					<td width="100" align="left">電話番号　：　</td>
					<td class="texter box" align="left"><%= tel %><input type="hidden" name="tel" value=<%= tel %>></td>
					<td></td>

				</tr>

				<tr>
					<td width="100"></td>
																									<% //formactionは遷移先%>
					<td width="100"align="left"><input type="submit" value="OK" class="btn btn1" formaction="./DeleteCommitBL"></td>

					<td width="100"><input type="submit" value="キャンセル" class="btn btn2" formaction="./ListBL"></td>
				</tr>


			</table>




		</form>


</body>
</html>