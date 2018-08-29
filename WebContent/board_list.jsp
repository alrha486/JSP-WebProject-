<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0; //전체레코드수
	int numPerPage = 10; // 페이지당 레코드 수
	int pagePerBlock = 15; //블럭당 페이지수
	int totalPage = 0; //전체 페이지 수
	int totalBlock = 0; //전체 블럭수
	int nowPage = 1; // 현재페이지
	int nowBlock = 1; //현재블럭
	int start = 0; //디비의 select 시작번호
	int end = 10; //시작번호로 부터 가져올 select 갯수
	int listSize = 0; //현재 읽어온 게시물의 수
	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;//getBoardList()메소드의 리턴 타입을 vector<boradBean>으로 선언
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null) {
		if (request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = start + numPerPage;
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,0 initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css">
<title>게시판</title>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "board_list";
		document.listFrm.submit();
	}

	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(value) {
		document.readFrm.nowPage.value =
<%=pagePerBlock%>
	* (value - 1) + 1;
		document.readFrm.submit();
	}
	function read(idx) {
		document.readFrm.idx.value = idx;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
</script>
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
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="board_list.jsp">자유 게시판</a></li>
				<li><a href="job_list.jsp">취업 게시판</a></li>
				<li><a href="public_list.jsp">공채 게시판</a></li>
				<li><a href="notice_list.jsp">공지사항</a></li>	
			</ul>
			<%
				if (userID == null) { // 세션 ID가 없다몀(로그인 하기 전)
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
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
					aria-expanded="false">마이페이지<span class="caret"></span></a>
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
	<!-- CONTENT -->


	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td><h3>자유 게시판</h3></td>
				</tr>

				<tr>
					<td>Total : <%=totalRecord%>Articles(<font color="red">
							<%=nowPage%>/<%=totalPage%>Pages
					</font>)
					</td>
				</tr>
			</table>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<colgroup>
					<col width="10%" />
					<col width="60%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<tr>
					<th style="text-align: center; background-color: #eeeeee;"col">글번호</th>
					<th style="text-align: center; background-color: #eeeeee;"col">글제목</th>
					<th style="text-align: center; background-color: #eeeeee;"col">글쓴이</th>
					<th style="text-align: center; background-color: #eeeeee;"col">날짜</th>
				</tr>
				<%
					vlist = bMgr.getBoardList(keyField, keyWord, start, end);
					listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
					if (vlist.isEmpty()) {
				%>
				<tr>
					<td colspan="4" align="center">등록된 게시물이 없습니다.</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < numPerPage; i++) {
							if (i == listSize)
								break;
							BoardBean bean = vlist.get(i);
							int idx = bean.getIdx();
							String id_ = bean.getId_();
							String title = bean.getTitle();
							String reg_date = bean.getReg_date();
							int depth = bean.getDepth();
							int count = bean.getCount();
				%><tr>
					<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
					<td>
						<%
							if (depth > 0) {
										for (int j = 0; j < depth; j++) {
											out.println("&nbsp;&nbsp;");
										}
									}
						%> <a href="javascript:read('<%=idx%>')"><%=title%></a>
					</td>
					<td><%=id_%></td>
					<td><%=reg_date%></td>
				</tr>
				<%
					}
					}
				%>
						
			</table>
<input type="button" onclick="location.href='post.jsp'"
						value="글쓰기">
		</div>
	</div>


	<br />

	<!-- 페이징 및 블럭 처리 Start-->

	<div class="paging">
		<ol>
			<%
				int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
				int pageEnd = ((pageStart + pagePerBlock) < totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
				//하단 페이지 끝번호
				if (totalPage != 0) {
					if (nowBlock > 1) {
			%>
			<li><a href="javascript:block('<%=nowBlock - 1%>')">[이전]</a> <%
 	}
 %>&nbsp;</li>
			<%
				for (; pageStart < pageEnd; pageStart++) {
			%>
			<li><a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %> <font color="blue"><Strong> <%
 	}
 %> [<%=pageStart%>] <%
 	if (pageStart == nowPage) {
 %></Strong></font> <%
 	}
 %></a></li>
			<%
				} //for
			%>&nbsp;
			<%
				if (totalBlock > nowBlock) {
			%>
			<li><a href="javascript:block('<%=nowBlock + 1%>')">[다음]</a></li>
			<%
				}
			%>&nbsp;
			<%
				}
			%>
		</ol>
	</div>
<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
	<form name="searchFrm" method="post" action="board_list.jsp">
		<div class="boardSearch">
			<select name="keyField">
				<option value="title" selected="selected">제목</option>
				<option value="mem_name">글쓴이</option>
				<option value="content">내용</option>
			</select> <input type="text" id="txt" name="keyWord" /> <input type="button"
				value="검색" onClick="javascript:check()" /> <input type="hidden"
				name="nowPage" value="1">
		</div>
	</form>
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="pagefile" value="board_list"> <input
			type="hidden" name="idx"> <input type="hidden" name="nowPage"
			value="<%=nowPage%>"> <input type="hidden" name="keyField"
			value="<%=keyField%>"> <input type="hidden" name="keyWord"
			value="<%=keyWord%>">
	</form>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
<!-- 페이징 및 블럭 처리 End-->