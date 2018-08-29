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
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "Confirm.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}
</script>
<script type="text/javascript">
	function Check() { // 회원 가입 예외처리 함수
		if (document.joinForm.id.value == "") {
			alert("ID을 입력해주세요");
			postFrm.id.focus();
			return;
		}
		if (document.joinForm.passwd.value =="") {
			alert("PW를 입력해주세요");
			postFrm.passwd.focus();
			return;
		}
		if (document.joinForm.name.value =="") {
			alert("이름을 입력해주세요");
			postFrm.name.focus();
			return;
		}
		if (document.joinForm.address.value =="") {
			alert("주소를 입력해주세요");
			postFrm.address.focus();
			return;
		}
		if (document.joinForm.tel.value =="") {
			alert("전화번호를 입력해주세요");
			postFrm.tel.focus();
			return;
		}
		if (document.joinForm.passwd.value != document.joinForm.repass.value) {
			alert("비밀번호를 확인해주세요");
			postFrm.repass.focus();
			return;
		}
		document.joinForm.submit();
	}
</script>
</head>
<body>
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
				<li><a href="board_list.jsp">게시판</a></li>
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
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form name = "joinForm"method="post" action="registerPro.jsp">  <!-- 회원 가입 폼 -->
					<h3 style="text-align: center;">회원 가입화면</h3>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" maxlength="20">
					</div>

					<div class="form-group">
						<input type="button" value="ID 중복확인 "
							onClick="idCheck(this.form.id.value)">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="passwd" maxlength="20">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" id="repass"
							name="repass" placeholder=" 비밀번호재입력 " maxlength="20">
					</div>


					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="name" maxlength="20">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="주소"
							name="address" maxlength="20">
					</div>


					<div class="form-group">
						<input type="text" class="form-control" placeholder="전화번호"
							name="tel" maxlength="20">
					</div>



					<input type="button" class="btn btn-primary form-control"
						value="회원가입" onclick="Check()">  <!-- 버튼 누르면 함수 호출 -->
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery 3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>