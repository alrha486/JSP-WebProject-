<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴하기</title>
</head>
<body>
	<form name="regFrm" method="post" action="u_deletePro.jsp">
		비밀번호 <input id="passwd" name="passwd" type="password" size="20"
			placeholder="비밀번호를 입력해주세요 " maxlength="16">
		<p>
			<input type="submit" value=" 탈퇴 "> <input type="button"
				onClick="javascript:location.href='main.jsp'" value=" 취소 ">
	</form>

</body>
</html>