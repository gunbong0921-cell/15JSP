<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
	<h4>List 컬렉션 사용하기</h4>
	<%
	ArrayList<Person> pList = new ArrayList<Person>();
	pList.add(new Person("성삼문", 55));
	pList.add(new Person("박팽년", 60));
	%>
	<!-- request 영역에 저장 -->
	<c:set var="personList" value="<%= pList %>" scope="request"></c:set>
	<ul>
		<!-- 2개의 속성 중 0번 인덱스를 출력, List는 배열처럼 인덱스로 접근할 수 있다. 차후
		<for -->
		<li>이름 : ${ requestScope.personList[0].name }</li>
		<li>나이 : ${ personList[0].age }</li>
	</ul>
	
	<h4>Map 컬렉션 이용하기</h4>
	<%
	/* 
	Map의 Key는 String, Value는 Person으로 정의한 후 2개의 인스턴스를 저장한다.
	*/
	Map<String, Person> pMap = new HashMap<String, Person>();
	pMap.put("personArgs1", new Person("하위지", 65));
	pMap.put("personArgs2", new Person("이개", 67));
	%>
	<c:set var="personMap" value="<%= pMap %>" scope="request"></c:set>
	<!-- Map은 Key를 통해 접근하여 값을 출력한다. -->
	<ul>
		<li>아이디 : ${ requestScope.personMap.personArgs2.name }</li>
		<li>비번 : ${ personMap.personArgs2.age }</li>
	</ul>
</body>
</html>
