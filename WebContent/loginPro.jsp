<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="User.LogonDBBean"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pass");
		LogonDBBean logon = LogonDBBean.getInstance();
		int check = logon.userCheck(id, pw);
		if (check == 1) {   // DB 정보와 비교해 맞으면 로그인
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			%>
			<script>
			alert("로그인 성공!");
			//history.go(-1);
		</script>
		<%
			response.sendRedirect("main.jsp");
		} else if (check == 0) { // 틀리면 오류 메시지
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디가 맞지 않습니다..");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>