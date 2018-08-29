<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(idx);//조회수 증가 
	BoardBean bean = bMgr.getBoard(idx);//게시물 가져오기 
	String id_ = bean.getId_();
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	String ip = bean.getIp();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css">
<title>글보기</title>
</head>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "board_list.jsp";
		document.listFrm.submit();
	}
	function update(idx) {
		document.updateFrm.idx.value = idx;
		document.updateFrm.action = "update.jsp";
		document.updateFrm.submit();
	}
	function reply(idx) {
		document.replyFrm.idx.value = idx;
		document.replyFrm.action = "reply.jsp";
		document.replyFrm.submit();
	}
	function del(idx) {
		document.delFrm.idx.value = idx;
		document.delFrm.action = "delete.jsp";
		document.delFrm.submit();
	}
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
</script>
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
					<td><h3>글 보기</h3></td>
				</tr>


			</table>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<table border="0" cellpadding="3" cellspacing="0" width=100%
				class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td align="center" bgcolor="#DDDDDD" width="10%">작성자</td>
					<td bgcolor="#FFFFE8"><%=id_%></td>
					<td align="center" bgcolor="#DDDDDD" width=10%>등록날짜</td>
					<td bgcolor="#FFFFE8"><%=reg_date%></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#DDDDDD">제 목</td>
					<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#DDDDDD">첨부파일</td>
					<td bgcolor="#FFFFE8" colspan="3">
						<%
							if (filename != null && !filename.equals("")) {
						%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
						&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
					</font> <%
 	} else {
 %> 등록된 파일이 없습니다.<%
 	}
 %>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#DDDDDD">내용</td>
					<td bgcolor="#FFFFE8" colspan="4"><br /><%=content%><br /></td>
				</tr>
				<tr>
					<td colspan="4" align="right"><%=ip%> 로 부터 글을 남기셨습니다 ./ 조회수 <%=count%>
					</td>
				</tr>
			</table>
			<hr />
<% 
if(id_.equals(userID)){
%>
			[ <a href="javascript:list() "> 리스트 </a> |
			  <a href="javascript:reply('<%=idx%>')"> 답 변 </a> |
			  <a href="javascript:update('<%=idx%>') "> 수 정 </a> | 
			  <a href="javascript:del('<%=idx%>')"> 삭 제 </a> ] <br>
<% 
}else if(!id_.equals(userID)){
%>
			[ <a href="javascript:list() "> 리스트 </a> |
			  <a href="javascript:reply('<%=idx%>')"> 답 변 </a> ] <br>				
<% } %>
			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="filename">
			</form>
			<form name="listFrm" method="post">
				<input type="hidden" name="pagefile" value="board_list"> <input
					type="hidden" name="idx" value="<%=idx%>"> <input
					type="hidden" name="nowPage" value="<%=nowPage%>">
				<%
					if (!(keyWord == null || keyWord.equals("null"))) {
				%>
				<input type="hidden" name="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
				<%
					}
				%>
			</form>
			<form name="updateFrm" method="get">
				<input type="hidden" name="pagefile" value="update"> <input
					type="hidden" name="idx" value="<%=idx%>"> <input
					type="hidden" name="nowPage" value="<%=nowPage%>">
			</form>
			<form name="replyFrm" method="get">
				<input type="hidden" name="pagefile" value="reply"> <input
					type="hidden" name="idx" value="<%=idx%>"> <input
					type="hidden" name="nowPage" value="<%=nowPage%>">
			</form>
			<form name="delFrm" method="get">
				<input type="hidden" name="pagefile" value="delete"> <input
					type="hidden" name="idx" value="<%=idx%>"> <input
					type="hidden" name="nowPage" value="<%=nowPage%>">
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