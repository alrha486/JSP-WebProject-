<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="User.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="User.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	//폼으로 부터 넘어오지 않는 데이터인 가입날짜를 직접 데이터저장빈에 세팅
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean manager = LogonDBBean.getInstance(); //사용자가 입력한 데이터저장빈 객체를 가지고 회원가입 처리 메소드호출
	int result=manager.insertMember(member);
	if (result == 1) {
%>
<script type="text/javascript">
	alert("회원가입을 하였습니다.");
	location.href = "login.jsp";
</script>
<%
	} else if(result == 2) {
%>
<script type="text/javascript">
	alert("이미 존재하는 ID입니다.");
	history.back();
</script>
<%
	}
%>

