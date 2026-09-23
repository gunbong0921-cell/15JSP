<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 2</title>
</head>
<body>
	<h4>List 컬렉션 사용하기</h4>
	<%
	LinkedList<Person> lists = new LinkedList<Person>();
	/* 3개의 Person 인스턴스 저장 */
	lists.add(new Person("맹사성", 34));
	lists.add(new Person("장영실", 44));
	lists.add(new Person("신숙주", 54));
	%>
	<!-- set 태그로 page 영역에 속성 저장 -->
	<c:set var="lists" value="<%= lists %>"></c:set>
	<!-- 저장한 변수를 통해 확장 for문으로 실행한다. items에 지정한 컬렉션의
	크기만큼 반복하여 인출된다. -->
	<c:forEach items="${ lists }" var="list">
		<li>
			<!-- 저장된 순서대로 Person인스턴스의 getter를 호출하여 값을 출력한다. -->
			이름 : ${ list.name }, 나이 : ${ list.age }
		</li>	
	</c:forEach>
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
	/* Map 인스턴스 생성 */
	Map<String,Person> maps = new HashMap<String,Person>();
	maps.put("1st", new Person("맹사성", 34));
	maps.put("2nd", new Person("장영실", 44));
	maps.put("3rd", new Person("신숙주", 54));
	%>
	<!-- 영역에 변수 생성 -->
	<c:set var="maps" value="<%= maps %>"></c:set>
	<!-- Map 출력시 key를 별도로 얻어올 필요없이 key, value 속성을 통해 즉시 값을 얻어와서 
	출력할 수 있다. -->
	<c:forEach items="${ maps }" var="map">
		<li>Key => ${ map.key } <br />
			value => 이름 : ${ map.value.name }, 나이 : ${ map.value.age }</li> 
	</c:forEach>
	
	<h4>Java 코드를 통한 출력</h4>
	<%
	/* Map은 항상 key를 먼저 얻어와야한다. */
	Set<String> keys = maps.keySet();
	/* 얻어온 key를 통해 개수만큼 반복한다. */
	for(String key : keys){
		/* key를 통해 value를 얻어온다. */
		Person p = maps.get(key);
		/* 값 출력시에는 getter메서드를 호출한다. */
		out.println("key=>"+ key + "<br>");
		out.println("value=>"+ p.getName() + "<br>");
	}
	/* JSTL의 확장 for문을 사용하면 key를 별도로 얻어오지 않아도 되므로 편리하다. */
	%>
</body>
</html>
