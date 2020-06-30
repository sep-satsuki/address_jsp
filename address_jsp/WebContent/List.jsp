<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet;" %>
<!DOCTYPE html>

<%
ResultSet rs=(ResultSet)request.getAttribute("Result");
int listCnt=(int)request.getAttribute("listCnt");
String nowPage=(String)request.getAttribute("Page");
int maxPage=0;

maxPage=(listCnt / 10);


%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>住所録管理システム：住所録一覧</p>
<input type="submit" value="新規登録"><input type="text" name="SearchName">
<input type="submit" value="検索">
<form>

	<table border="1">
		<tr >
			<td width="50">No.</td>
			<td width="100">名前</td>
			<td width="300">住所</td>
			<td width="120">電話番号</td>
			<td width="80"></td>
		</tr>
		<%//繰り返し処理　while(繰り返し処理)　 %>
		<%while(rs.next()){ %>
		<tr>
			<td width="50"><%=rs.getString("id") %></td>
			<td width="100"><%=rs.getString("name") %></td>
			<td width="300"><%=rs.getString("address") %></td>
			<td width="120"><%=rs.getString("tel") %></td>
			<td width="80"></td>
		</tr>
		<% }%>
	</table>
</form>
<input type="submit" value="新規登録">


</body>
</html>