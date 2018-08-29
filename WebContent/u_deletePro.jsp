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
		String id = (String) session.getAttribute("id");
		String passwd = request.getParameter("passwd");
		LogonDBBean manager = LogonDBBean.getInstance(); //회원탈퇴처리 메소드 수행 후 탈퇴 상황 값 반환
		int check = manager.deleteMember(id,passwd);		
			if (check == 1) {
				session.invalidate();//세션을 무효화
	%>
	<script type="text/javascript">
		alert("회원 탈퇴되었습니다.");
		location.href = "main.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("회원탈퇴에 실패 하였습니다.");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>