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
		//id는 사용자가 회원가입을 하기위해서 입력한 아이디 
		String id = request.getParameter("id");
		//DB처리빈인 LogonDBBean클래스의 객체를 얻어낸다. 
		LogonDBBean manager = LogonDBBean.getInstance();
		//사용자가 입력한 id값을 가지고 LogonDBBean클래스의 confirmId()메소드 호출 //중복아이디 체크 confirmId()메소드의 실행결과로 check에는 1또는 -1값이 리턴 됨 
		int check= manager.confirmId(id); 
		
		
		if(check==1) {
			out.println(id+"는 이미 존재하는 ID입니다.<p>");
			} else { 
			out.println(id+"는 사용 가능 합니다.<p>"); }
	%>
	<a href="#" onClick="self.close()"> 닫기 </a>
</body>
</html>