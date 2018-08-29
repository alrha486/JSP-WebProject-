<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<%
	request.setCharacterEncoding("UTF-8");
	String nowPage = request.getParameter("nowPage");
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제하기</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body>
	<!-- CONTENT -->
	<h3>게시글 삭제</h3>
	<h5>사용자의 비밀번호를 입력해주세요.</h5>
	<form name="delFrm" method="post"
		action="deletePro.jsp">
		<table>
			<tr>
				<td align="right">비밀번호</td>
				<td colspan="2"><input type="password" name="pass" size="20"
					maxlength="15"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><input type="button" value=" 삭제완료 "
					onClick="check()"> <input type="reset" value=" 다시쓰기 ">
					<input type="button" value=" 뒤로 " onClick="history.go(-1)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
			type="hidden" name="idx" value="<%=idx%>">
	</form>
</body>
</html>