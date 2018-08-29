<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="User.LogonDBBean"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%-- 7~9라인: 수정된 정보를 가지고 데이터저장빈객체를 생성--%>
<jsp:useBean id="member" class="User.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		LogonDBBean manager = LogonDBBean.getInstance(); //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환
	int check = manager.updateMember(member); // updateMember의 결과에 따른 처리
		if (check == 1) {
	%>
	<script type="text/javascript">
		alert("정보를 수정 하였습니다.");
		location.href = "main.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("정보수정에 실패 하였습니다.");
		history.back();
	</script>
	<%
		}
	%>

</body>
</html>