<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head><title>request 영역</title></head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
	<%
	/* 
	Person 인스턴스는 아직 저장되어 있으므로, 값을 얻어온 후 Person타입으로 형변환한다.
	영역에 저장 시 Object로 자동형변환 되므로, 사용 시에는 강제형변환 해야한다. 
	*/
	Person pPerson = (Person)(request.getAttribute("requestPerson")); 
	%>
	<ul>
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %><li>
	</ul>
	<h4>매개변수로 전달된 값 출력하기</h4>
	<%
		request.setCharacterEncoding("UTF-8");
		out.println(request.getParameter("paramHan"));
		out.println(request.getParameter("paramEng"));
	%>
</body>
</html>
