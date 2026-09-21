<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>내장객체 - request</title></head>
<body>
<%
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
/* 문자열을 통한 단순비굘 로그인 정보 확인. 만약 정보가 일치하면 웰컴 페이지로 이동한다. */
if (id.equalsIgnoreCase("must") && pwd.equalsIgnoreCase("1234")) {
	//JS의 location.href와 동일한 기능으로, 특정 페이지로 이동한다. 
	response.sendRedirect("ResponseWelcome.jsp");
}
else {
	/* 
	인증에 실패한 경우 메인페이지로 포워드한다. 포워드란 페이지 이동과는 다르게 현재 페이지가 받은
	요청을 다음 페이지로 전달하는 기능을 말한다. 웹브라우저의 주소표시줄에는 ResponseLogin.jsp가 
	표시되지만, 실제 출력되는 내용은 ResponseMain.jsp가 된다. 즉 현재페이지에서 요청을 전달한 다음
	페이지의 내용을 출력하게된다. */
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
}
%>
</body>
</html>
