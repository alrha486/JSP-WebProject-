<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	bMgr.insertBoard3(request);  // 게시 글 입력 정보를 insertBoard3로 
	response.sendRedirect("public_list.jsp"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>



