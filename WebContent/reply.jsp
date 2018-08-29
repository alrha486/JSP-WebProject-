<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<%
	String nowPage = request.getParameter("nowPage");
	String title = bean.getTitle();
	String content = bean.getContent();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css">
<title>게시물 답글</title>
<script>
	function check() {
		if (document.post.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.post.pass.focus();
			return false;
		}
		document.post.submit();
	}
</script>
</head>
<body>
	<%
		String userID = null;
		String userPW = null;
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
			userPW = (String) session.getAttribute("pw");
		}
		if (userID == null) {
	%>
	<script type="text/javascript">
		alert("로그인 후 이용해주세요");
		history.back();
	</script>
	<%
		} else if (userID != null) {
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">취업 커뮤니티</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="board_list.jsp">자유 게시판</a></li>
				<li><a href="job_list.jsp">취업 게시판</a></li>
				<li><a href="public_list.jsp">공채 게시판</a></li>
				<li><a href="notice_list.jsp">공지사항</a></li>	
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<!-- CONTENT -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td><h3>댓글 달기</h3></td>
				</tr>


			</table>
		</div>

		<div class="container">
			<div class="row">
				<form name="post" method="post" action="replyProc.jsp">
					<table  class="table table-striped" width="70%" 
					style="text-align: center; border: 1px solid #dddddd" width="80%">
					
						<tr>
							<td align="center" bgcolor="#DDDDDD" width="10%">제 목</td>
							<td bgcolor="#FFFFE8" width="80%"><input type="text" name="title" size="50"
								value=" [RE]: <%=title%>" maxlength="50" readonly></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#DDDDDD" width="10%">내 용</td>
							<td bgcolor="#FFFFE8" width="80%"><textarea name="content" rows="12" cols="50"><%=content%> </textarea></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#DDDDDD" width="10%">비밀 번호</td>
							<td bgcolor="#FFFFE8" width="80%"><input type="password" name="pass" size="50"
								maxlength="50"></td>
						</tr>
							<tr>
							<td colspan="2"><input type="hidden" name="id_"
								value="<%=userID%>">
								<hr /></td>
						</tr>

						<tr>
							<td colspan="2"><input type="button" value=" 답변등록 "
								onClick="check()"> <input type="reset" value=" 다시쓰기 ">
								<input type="button" value=" 뒤로 " onClick="history.back()"></td>
						</tr>
					</table>
					<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
					<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
						type="hidden" name="ref" value="<%=bean.getRef()%>"> <input
						type="hidden" name="pos" value="<%=bean.getPos()%>"> <input
						type="hidden" name="depth" value="<%=bean.getDepth()%>">
				</form>
			</div>
		</div>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>


		<%
			}
		%>
	
</body>
</html>