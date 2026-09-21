<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 1</title>
</head>
<body>
	<!-- 변수 선언 : 여기서는 가장 좁은 page영역에 저장된다. value에는 일반값, EL, 표현식 모두
	사용할 수 있다. -->
	<!-- 
	set 태그
		: 변수를 선언할때 사용. JSP의 setAttribute() 매서드와 동일하게 4가지 영역에 속성을 저장한다.
		var : 속성명(변수명) 을 지정
		value : 속성에 저장할 값
		scope : 4가지 영역명을 지정. 생략시 가장 좁은 page영역 지정됨.
		target : set태그를 통해 생성된 자바빈(인스턴스)의 이름 지정.
		property : target으로 지정한 자바빈의 멤버변수의 값 설정.
	 -->
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value="${ directVar mod 5 }" />
	<c:set var="expVar" value="<%= new Date() %>" />
	<c:set var="betweenVar">변수값 요렇게 설정</c:set>
	
	<!-- 속설명이 중복되지 않는다면 영역을 포시하는 내장객체를 생략할 수 있다. -->
	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${ pageScope.directVar }</li>
		<li>elVar : ${ elVar }</li>
		<li>expVar : ${ expVar }</li>
		<li>betweenVar : ${ betweenVar }</li>
	</ul>
	
	<h4>자바빈즈 생성 1 - 생성자 사용</h4>
	<!-- 
	클래스의 생성자를 통해 인스턴스를 생성한 후 request영역에 저장.
	 -->
	<c:set var="personVar1" value='<%= new Person("박문수", 50) %>'
			scope="request" />
	<ul>
		<!-- 자바빈의 getter를 통해 멤버변수의 값을 출력한다. -->
		<li>이름 : ${ requestScope.personVar1.name }</li>
		<li>나이 : ${ personVar1.age }</li>
	</ul>		
	
	<h4>자바빈즈 생성 2 - target, property 사용</h4>
	<!-- 
	초기값이 없는 상태로 인스턴스를 먼저 생성한 후 target, property를 통해 멤버변수의 값을 설정한다. 
	이때는 자바빈의 setter가 사용된다. 
	 -->
	 <!-- target으로 자바빈을 지정하고, property로 멤버변수를 지정하여 값을 할당한다. -->
	<c:set var="personVar2" value="<%= new Person() %>" scope="request" />
	<c:set target="${ personVar2 }" property="name" value="정약용" />
	<c:set target="${ personVar2 }" property="age" value="60" />
	<ul>
		<li>이름 : ${ personVar2.name }</li>
		<li>나이 : ${ requestScope.personVar2.age }</li>
	</ul>
</body>
</html>
