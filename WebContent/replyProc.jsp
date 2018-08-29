<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<jsp:useBean id="reBean" class="board.BoardBean" />
<jsp:setProperty property="*" name="reBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		bMgr.replyUpBoard(reBean.getRef(), reBean.getPos()); // 답변에 위치 값 증가
		bMgr.replyBoard(reBean);
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("board_list.jsp? & nowPage=" + nowPage);		
	
		//response.sendRedirect("board_list.jsp");
	%>
</body>
</html>