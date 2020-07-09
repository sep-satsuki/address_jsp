<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.ResultSet" %>
<!DOCTYPE html>

<%
ResultSet rs=(ResultSet)request.getAttribute("Result");
int listCnt=(int)request.getAttribute("listCnt");
String nowPage=(String)request.getAttribute("Page");
int maxPage=0;



//maxPageにlistCnt /10で割った値を設定、4の計算に余りがあった場合、maxPageに1を追加する
maxPage=(listCnt / 10);
if(listCnt % 10 > 0){
	maxPage ++;
}

%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>住所録管理システム：住所録一覧</p>
<form method="GET" action="./ListBL">
<input type="submit" value="新規登録" >
</form>
<input type="text" name="SerchName">
<input type="submit" value="検索" >
<form>

	<table border="1">
		<tr >
			<td width="50" >No.</td>
			<td width="100" >名前</td>
			<td width="300">住所</td>
			<td width="120">電話番号</td>
			<td width="80"></td>
		</tr>


		<%//繰り返し処理　while(繰り返し処理)　 %>
		<% while(rs.next()){ %>

				<%String tel=rs.getString("tel");%>
				<%String tel1=tel.substring(0,3); %>
				<%String tel2=tel.substring(3,7); %>
				<%String tel3=tel.substring(7,11);%>
				<%tel=tel1 + "-"  + tel2 + "-" + tel3; %>

		<form method="get" name="<%= rs.getString("id")%>">

			<tr>
				<td width="50" ><%=rs.getString("id") %><input type="hidden" name="id" value="<%= rs.getString("id")%>"></td>
				<td width="100"><%=rs.getString("name") %><input type="hidden" name="name"  value="<%= rs.getString("name")%>"></td>
				<td width="300"><%=rs.getString("address") %><input type="hidden" name="address" value="<%= rs.getString("address")%>"></td>
				<td width="120"><%=tel %><input type="hidden" name="tel" value="<%= tel%>"></td>
				<td width="100"><input type="submit" value="編集" formaction="./Edit.jsp"><input type="submit" value="削除" formaction="./Delete.jsp"></td>
			</tr>
		</form>
		<% }%>
	</table>
</form>
<form method="GET" action="./Add.jsp">
<input type="submit" value="新規登録">
</form>

</body>
</html>