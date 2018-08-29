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
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
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
				<li class="active"><a href=
				"main.jsp">메인</a></li> <!-- 각 게시판 별 링크  -->
				<li><a href="board_list.jsp">자유 게시판</a></li>  
				<li><a href="job_list.jsp">취업 게시판</a></li>
				<li><a href="public_list.jsp">공채 게시판</a></li>
				<li><a href="notice_list.jsp">공지사항</a></li>				
			</ul>
			<%
				if (userID == null) { // 세션 ID가 없다몀(로그인 하기 전)
			%>
			<ul class="nav navbar-nav navbar-right"> <!-- 드롭다운 메뉴 -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"  
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li> <!-- 메뉴 별 링크 -->
						<li><a href="join.jsp">회원가입</a></li> 
					</ul></li>
			</ul>
			<%
				} else if (userID.equals("운영자")) { // 세션의 ID가 관리자 ID라면
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">관리자메뉴<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="member_list.jsp">회원리스트</a></li>
						<li><a href="#">게시물리스트</a></li>
						<li><a href="sessionLogout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				} else { //일반 회원일 때 
			%>
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
			<%
				}
			%>
		</div>
	</nav>
		<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner"> <!-- 이미지 슬라이드 -->
				<div class="item active">
					<img src="images/3.jpg">
				</div>

				<div class="item">
					<img src="images/3.jpg">
				</div>

				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span class="glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>채팅방</h1>  <!-- 서버 소켓을 이용한 채팅 방 -->
				<fieldset>

					<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>

					<br /> <input id="inputMessage" type="text" /> <input type="submit"
						value="send" onclick="send()" />

				</fieldset>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>

<script type="text/javascript">   <!-- 채팅에서 사용되는 변수 및 함수 --> <!-- 채팅 부분 인터넷 참고했습니다. -->
	var textarea = document.getElementById("messageWindow");  <!-- 채팅 화면 -->
	var webSocket = new WebSocket('ws://localhost:8080/웹프+디비/broadcasting');  <!-- 로컬과 프로젝트 연결 -->
	var inputMessage = document.getElementById('inputMessage');  <!-- 메시지 -->
	webSocket.onerror = function(event) {  <!-- 함수 -->
		onError(event)
	};
	webSocket.onopen = function(event) { <!-- 함수  -->
		onOpen(event)
	};
	webSocket.onmessage = function(event) {  <!-- 함수 -->
		onMessage(event)
	};
	function onMessage(event) {
		textarea.value += "상대 : " + event.data + "\n";
	}
	function onOpen(event) {
		textarea.value += "연결 성공\n";
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		if(inputMessage.value == "나쁜놈","나쁜년"){  <!-- 욕설 예외처리, 예시로 2개 -->
		alert("바른 말 고운 말을 사용합시다.");	
		}else{
		textarea.value += "나 : " + inputMessage.value + "\n";  
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
		}
		}
</script>
</html>