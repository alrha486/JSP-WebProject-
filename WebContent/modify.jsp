<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 수정하기</title> 
</head>
<body>
	<form name="regFrm" method="post" action="modifyForm.jsp"> <!-- 회원 정보 수정하기위한 비밀번호 입력 폼 -->
		비밀번호 <input id="passwd" name="passwd" type="password" size="20"
			placeholder="6~16 자 숫자 / 문자 " maxlength="16">
		<p>
			<input type="button" onClick="javascript:regFrm.submit()"
				value=" 수정 ">
	</form>
</body>
</html>