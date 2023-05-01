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
		<h1>선수별 홈그라운드 조회</h1>
		<table border="1">
			<tr>
				<td>선수이름</td>
				<td>포지션</td>
				<td>팀 이름</td>
				<td>경기장이름</td>
				<td>좌석 수</td>
			</tr>
			<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				String sql = "select tp.player_name, player_position, tt.team_name, ts.stadium_name, ts.seat_count " +
							"from tbl_player_20221205 tp, tbl_stadium_20221205 ts, tbl_team_20221205 tt " +
							"where tp.team_id = tt.team_id and ts.stadium_id = tt.stadium_id and ts.seat_count >= 30000";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("player_name") %></td>
				<td><%=rs.getString("player_position") %>></td>
				<td><%=rs.getString("team_name") %></td>
				<td><%=rs.getInt("seat_count") %>개</td>
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