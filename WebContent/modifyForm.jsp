<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="User.LogonDataBean"%>
<%@ page import="User.LogonDBBean"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css">
<title>정보 수정</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String passwd = request.getParameter("passwd");
		LogonDBBean manager = LogonDBBean.getInstance(); //아이디와 비밀번호에 해당하는 사용자의 정보를 얻어냄
		LogonDataBean m = manager.getMember(id, passwd);
		try {//얻어낸 사용자 정보를 화면에 표시
	%>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form name="regFrm" method="post" action="modifyPro.jsp"> <!-- 회원 정보 수정 폼 -->
					<h3 style="text-align: center;">회원 정보 수정</h3>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" maxlength="20" value="<%=id%>" readonly>
					</div>

					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="passwd" maxlength="20">
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

					<input type="submit" class="btn btn-primary form-control"
						value="수정"> 
					<input type="button" class="btn btn-primary form-control"
						onclick="javascript:location.href='main.jsp;" value=" 취소 ">
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%
		} catch (Exception e) {
		}
	%>
</body>
</html>