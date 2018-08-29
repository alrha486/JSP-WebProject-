<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%
	//소스코드가 위치하는 폴더 (WebContent)에 upload 폴더를 생성 
	String uploadPath=request.getRealPath("upload");
out.print(uploadPath); int size =10*1024*1024; String name="";
String subject=""; String filename1=""; String filename2="";
String origfilename1=" "; String origfilename2=" ";
try { MultipartRequest multi= new MultipartRequest(request, uploadPath, size, "euc-kr",new DefaultFileRenamePolicy()); name =multi.getParameter("name"); subject=multi.getParameter("subject"); Enumeration files = multi.getFileNames();
	String file1 = (String) files.nextElement();
	filename1 = multi.getFilesystemName(file1);
	origfilename1 = multi.getOriginalFileName(file1);
	String file2 = (String) files.nextElement();
	filename2 = multi.getFilesystemName(file2);
	origfilename2 = multi.getOriginalFileName(file2);
}catch(Exception e) { e.printStackTrace(); } %>
<html>
<head>
<title>파일 업로드</title>
</head>
<body>
	<form name="fileCheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>"> <input
			type="hidden" name="subject" value="<%=subject%>"> <input
			type="hidden" name="filename1" value="<%=filename1%>"> <input
			type="hidden" name="filename2" value="<%=filename2%>"> <input
			type="hidden" name="origfilename1" value="<%=origfilename1%>">
		<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
	</form>
	<a href="#" onclick="javascript:fileCheck.submit()"> 업로드 확인 및 다운로드
		페이지 이동 </a>
</body>
</html>
