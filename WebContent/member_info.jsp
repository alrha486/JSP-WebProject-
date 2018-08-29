<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String info_id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE mem_id=?");  // 해당 mem_id 값에 대한 DB정보 검색
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
	<center>  <!-- 위의 DB검색 후 출력 -->
		<table border=1 width=300>
			<tr align=center>
				<td>아이디 :</td>
				<td><%=rs.getString("mem_id")%></td>
			</tr>
			<tr align=center>
				<td>비밀번호 :</td>
				<td><%=rs.getString("mem_pwd")%></td>
			</tr>
			<tr align=center>
				<td>이름 :</td>
				<td><%=rs.getString("mem_name")%></td>
			</tr>
			<tr align=center>
				<td>주소 :</td>
				<td><%=rs.getString("address")%></td>
			</tr>
			<tr align=center>
				<td>전화 :</td>
				<td><%=rs.getString("tel")%></td>
			</tr>
			<tr align=center>
				<td>가입일 :</td>
				<td><%=rs.getString("reg_date")%></td>
			</tr>
			<tr align=center>
				<td colspan=2><a href="member_list.jsp"> 리스트로 돌아가기 </a></td>
			</tr>
		</table>
	</center>
</body>
</html>
</html>