<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - if</title>
</head>
<body>
	<!-- 
	if 태그
		: 조건을 확인하여 실행여부를 판단한다.
	속성
		test : EL을 이용해서 조건식 삽입
		var : test 속성에서 판단한 결과값 저장	
	 -->
	<!-- 변수 선언 -->
	<c:set var="number" value="100"></c:set>
	<c:set var="string" value="JSP" />
	
	<h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
	<!-- 
	if(number%2==0)와 동일한 조건으로, 해당 조건의 결과가 result에 저장된다. 
	 -->
	<c:if test="${ number mod 2 eq 0 }" var= "result">
		${ number }는 짝수입니다. <br />
	</c:if>
	<!-- 위 조건의 결과는 true이므로 아래에서 출력된다. -->
	result : ${ result } <br />
	
	<h4>문자열 비교와 else 구문 흉내내기</h4>
	<!-- 
	JSTL의 if태그는 else 구문이 별도로 없으므로, if문과 반대의 조건을 만들어서 2개의
	if태그를 사용해야한다. 
	 -->
	<c:if test="${ string eq 'Java' }" var="result2">
		<!-- Java에서는 비교연산자 ==과 equal()가 서로 다르지만, EL에서는 eq를 통해
		기본자료형과 인스턴스에 대한 비교를 모두 할 수 있다. -->
		문자열은 Java입니다. <br />
	</c:if>
	<!-- result2는 false이므로 not을 추가하여 반대의 조건을 만든다. 따라서 else와 같은 구문이 된다. -->
	<c:if test="${ not result2 }">
		'Java'가 아닙니다. <br />
	</c:if>	 	
	
	<h4>조건식 주의사항</h4>
	<!-- 조건식에는 EL이 들어가야한다. -->
	<c:if test="100" var="result3">
		EL이 아닌 정수를 지정하면 false
	</c:if>
	result3 : ${ result3 } <br />
	<c:if test= "tRuE" var="result4">
		대소문자 구분 없이 "tRuE"인 경우 true <br />
	</c:if>
	result4 : ${ result4 } <br />
	<!-- test 속성이 앞뒤로 공백이 하나라도 들어가면 무조건 false를 반환하므로 주의해야한다.
	EL 식 내부의 공백은 상관없다. -->
	<c:if test="${ true } " var="result5">
		EL 양쪽에 빈 공백이 있는 경우 false <br />
	</c:if>	
	result5 : ${ result5 } <br />
	
	<h4>연습문제 : if태그</h4>
	<!--  
	아이디, 패스워드를 입력후 submit버튼을 누르면 EL식을 통해 파라미터를
	받은 후 kosmo/1234 인 경우에는 ‘코스모님, 하이룽~'이라고 출력한다. 
	만약 틀렸다면 "아이디/비번을 확인하세요"라고 출력한다. 
	EL과 JSTL의 if태그만을 이용해서 구현하시오.
	-->
	<form method="get">
		아이디 : <input type="text" name="user" />
		<br />
		패스워드 : <input type="text" name="pass" />
		<br />
		<input type="submit" value="로그인" />
	</form>

	<%-- Nalaka a Solusyon para iti 연습문제 --%>
	<%-- 1. Sukimatren no na-submit ti form (no saan nga empty ti param.user ken param.pass) --%>
	<c:if test="${ not empty param.user and not empty param.pass }">
		
		<%-- 2. No ti ID ket 'kosmo' ken ti Password ket '1234' --%>
		<c:if test="${ param.user eq 'kosmo' and param.pass eq '1234' }" var="loginResult">
			코스모님, 하이룽~ <br />
		</c:if>
		
		<%-- 3. No babbassit wenno madi ti ID/Password (else 구문 흉내내기) --%>
		<c:if test="${ not loginResult }">
			아이디/비번을 확인하세요 <br />
		</c:if>		
	</c:if>
</body>
</html>
