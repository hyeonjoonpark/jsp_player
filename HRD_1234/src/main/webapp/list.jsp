<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>선수조회</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>선수조회</h1>
		<table border="1">
			<tr>
				<td>선수ID</td>
				<td>선수이름</td>
				<td>포지션</td>
				<td>선수등록일</td>
				<td>팀 이름</td>
			</tr>
			<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				String sql = "select * from tbl_player_20221205";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("player_id") %></td>
				<td><%=rs.getString("player_name") %>></td>
				<td><%=rs.getString("player_position") %></td>
				<td><%=rs.getString("player_date") %></td>
				<td><%=rs.getString("team_id") %></td>
			</tr>
			<%
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>