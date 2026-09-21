<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 
request영역
	: 클라이언트가 요청을 할때마다 새로운 request객체가 생성되어 같은 요청을 처리하는데
	사용되는 모든 JSP가 영역을 공유하게된다. 
*/
request.setAttribute("requestString", "request 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근", 31));
/* 
request를 포함한 4가지 영역에서 속성(데이터)를 저장할때는 setAttribute()매서드를 사용한다.
저장을 위한 Key-Value를 지정하여 마치 Map과 같은 형태로 저장된다. 
영역에는 모든 클래스의 인스턴스를 저장할 수 있으므로 Object를 기반으로 한다.  
*/
%>    
<!DOCTYPE html>
<html>
<head><title>request 영역</title></head>
<body>
	<h2>request 영역의 속성값 읽기</h2>
	<%
	Person rPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<li>String 객체 : <%= request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
	</ul>
	<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
	<%
	request
	.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English")
	.forward(request, response);
	%>
	%>
</body>
</html>
