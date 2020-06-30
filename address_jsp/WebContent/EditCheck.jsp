<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String name=(String)request.getAttribute("name");
	String address=(String)request.getAttribute("address");
	String tel=(String)request.getAttribute("tel");
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>住所録確認システム：住所録編集</p>
		<form method="GET">
			<table  class="sampleTable">
				<tr>
					<td width="100" align="right">名前* : </td>
					<td class="texter box" align="left"><%= name %><input type="hidden" name="name" value=<%= name %>></td>
					<td></td>

				</tr>

				<tr>
					<td width="100" align="right">住所* : </td>
					<td class="add box" colspan="2" align="left"><%= address %><input type="hidden" name="address" value=<%= address %>></td>


				</tr>

				<tr>
					<td width="100" align="right">電話番号 : </td>
					<td class="texter box" align="left"><%= tel %><input type="hidden" name="tel" value=<%= tel %>></td>
					<td></td>

				</tr>

				<tr>
					<td width="100"></td>
																									<% //formactionは遷移先%>
					<td width="100"align="left"><input type="submit" value="編集" formaction="./EditCommitBL"></td>

					<td width="100"><input type="submit" value="戻る" formaction="./Edit.jsp"></td>
				</tr>


			</table>




		</form>

</body>
</html>