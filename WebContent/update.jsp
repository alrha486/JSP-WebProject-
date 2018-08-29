<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean) session.getAttribute("bean");
	String title = bean.getTitle();
	String id_ = bean.getId_();
	String content = bean.getContent();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css">
<title>글 수정</title>
<script>
	function check() {
		if (document.updateFrm.pass.value == "") {
			alert("수정을 위해 패스워드를 입력하세요.");
			document.updateFrm.pass.focus();
			return false;
		}
		document.updateFrm.submit();
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

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td><h3>글 수정</h3></td>
				</tr>


			</table>
		</div>
		<div class="container">
			<div class="row">
				<form name="updateFrm" method="post" action="updateProc.jsp">
					<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
						type="hidden" name="idx" value="<%=idx%>"> <input
						type="hidden" name="id_" value="<%=id_%>">
					<table class="table table-striped" width="70%"
						style="text-align: center; border: 1px solid #dddddd" width="80%">
						<tr>
							<td width="20%">제 목</td>
							<td width="80%"><input type="text" name="title" size="50"
								maxlength="50" value="<%=title%>"></td>
						<tr>
							<td width="20%">내 용</td>
							<td width="80%"><textarea name="content" rows="10" cols="50"><%=content%></textarea>
							</td>
						</tr>
						<tr>
							<td width="20%">비밀 번호</td>
							<td width="80%"><input type="password" name="pass" size="15"
								maxlength="15"> 수정시에는 비밀번호가 필요합니다.</td>
						</tr>
						<tr>
							<td colspan="2" height="5"><hr /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value=" 수정완료 "
								onClick="check()"> <input type="reset" value=" 다시수정 ">
								<input type="button" value=" 뒤로 " onClick="history.go(-1)">
							</td>
						</tr>
					</table>
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