<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<jsp:useBean id="upBean" class="board.BoardBean" />
<jsp:setProperty property="*" name="upBean" />
<%
	String nowPage = request.getParameter("nowPage"); //bean에 있는 pass와 upBean pass를 비교(read.jsp)
	String upPass = upBean.getPass(); // DB에 저장 된 PW
	String inPass = bean.getPass();// 입력 한 PW
	if (upPass.equals(inPass)) { // 위의 두 PW가 같다면
		bMgr.updateBoard(upBean); //업데이트
		
		String url = "read.jsp? &nowPage=" + nowPage + "&idx=" + upBean.getIdx(); 
		response.sendRedirect(url);
	} else {
%>
	<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>