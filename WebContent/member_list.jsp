<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM member");
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">취업 커뮤니티</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="board_list.jsp">자유 게시판</a></li>
				<li><a href="job_list.jsp">취업 게시판</a></li>
				<li><a href="notice_list.jsp">공지사항</a></li>				
			</ul>
			<%
				if (userID == null) { // 세션 ID가 없다몀(로그인 하기 전)
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else if (userID.equals("운영자")) { // 세션의 ID가 관리자 ID라면
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">관리자메뉴<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="member_list.jsp">회원리스트</a></li>
						<li><a href="#">게시물리스트</a></li>
						<li><a href="sessionLogout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				} else { //일반 회원일 때 
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">마이페이지<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="modify.jsp">회원정보수정</a></li>
						<li><a href="u_delete.jsp">회원탈퇴</a></li>
						<li><a href="sessionLogout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<center>
		<table table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd" width="80%">
			<tr align=center>
				<td>회원 목록</td>
			</tr>
			<%
				while (rs.next()) { // 한 줄씩 읽기
			%>
			<tr align=center>
				<td><a href="member_info.jsp?id=<%=rs.getString("mem_id")%>">
						<%=rs.getString("mem_id")%>  <!-- DB에 저장되어 있는 회원의 ID -->
				</a></td>
				<td><a href="member_delete.jsp?id=<%=rs.getString("mem_id")%>">
						삭제 </a></td> <!-- 삭제 버튼 누르면 member_delete로 -->
			</tr>
			<%
				}
			%>
		</table>
	</center>
	<script src="https://code.jquery.com/jquery 3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>