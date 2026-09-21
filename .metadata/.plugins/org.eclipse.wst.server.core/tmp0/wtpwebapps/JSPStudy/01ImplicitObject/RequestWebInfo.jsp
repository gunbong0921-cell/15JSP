<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>내장 객체 - request</title></head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<!-- 전송방식은 get/post로 출력 -->
		<li>데이터 전송 방식 : <%= request.getMethod() %></li>
		<!-- 현재 실행경로의 전체를 반환 -->
		<li>URL : <%= request.getRequestURI() %></li>
		<!-- 전체 실행경로에서 HOST를 제외한 나머지 부분을 반환 -->
		<li>URI : <%= request.getRequestURI() %></li>
		<li>프로토콜 : <%= request.getProtocol() %></li>
		<li>서버명 : <%= request.getServerName() %></li>
		<li>서버 포트 : <%= request.getServerPort() %></li>
		<li>클라이언트 IP 주소 : <%= request.getRemoteAddr() %></li>
		<!-- 
		get방식으로 전송할 경로명 뒤에 클라이언트가 입력한 값을 Key-Value 형식으로 출력한다. 
		post방식에서는 출력되지 않는다. -->
		<li>쿼리스트링 : <%= request.getQueryString() %></li>
		<!-- 클라이언트가 파라미터로 전송한 값을 일어온 후 출력 -->
		<li>전송된 값 1 : <%= request.getParameter("eng") %></li>
		<li>전송됨 값 2 : <%= request.getParameter("han") %></li>
	</ul>
</body>
</html>