<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css">

<title>학생 커뮤니티</title>

<script type="text/javascript">
	function Check() {
		if (document.postFrm.title.value == "") {
			alert("제목을 입력해주세요");
			postFrm.title.focus();
			return;
		}
		if (document.postFrm.content.value =="") {
			alert("내용을 입력해주세요");
			postFrm.content.focus();
			return;
		}
		document.postFrm.submit();
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
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="modify.jsp">회원정보수정</a></li>
						<li><a href="u_delete.jsp">회원탈퇴</a></li>
						<li><a href="sessionLogout.jsp">로그아웃</a></li>
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
					<td><h3>글 쓰기</h3></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container">
		<div class="row"><!-- 게시 글 입력 폼 -->
			<form name="postFrm" method="post" action="n_postProc.jsp" 
				enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd" width="80%">

					<tr>
						<td width="20%">제 목</td>
						<td width="80%"><input type="text" name="title" size="50"
							maxlength="30"></td>
					</tr>
					<tr>
						<td width="20%">내 용</td>
						<td width="80%"><textarea name="content" rows="10" cols="50"></textarea></td>
					</tr>
					<tr>
						<td width="20%">파일찾기</td>
						<td width="80%"><input type="file" name="filename" size="50"
							maxlength="50"></td>
					</tr>
					<tr>
						<td>내용타입</td>
						<td>HTML<input type=radio name="contentType" value="HTTP">&nbsp;&nbsp;&nbsp;
							TEXT<input type=radio name="contentType" value="TEXT" checked>
						</td>
					</tr>
						<input type="hidden" name="pass" value="<%=userPW%>">
						<input type="hidden" name="id_"  value="<%=userID%>">
						
					<tr>
						<td colspan="2">
							<input type="button" value=" 등록 " onclick="Check()"> 
							<input type="reset" value=" 다시쓰기 "> 
							<input type="button" value=" 리스트 " onclick="location.href='notice_list.jsp' "></td>
					</tr>
				</table>
				<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
				<!-- request.getRemoteAddr()은 현재 ip 반환 -->
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