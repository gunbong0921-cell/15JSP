<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>내장객체 - request</title></head>
<body>
<%
/* 
Tomcat 구 버전에서는 POST 방식으로 한글을 전송하는 경우 깨짐현상이 발생되어 인코딩 처리를 해야한다.
최신 버전에서는 해결되었지만, 간혹 발생하는 경우가 있으므로 필요할때 사용하면된다. */
request.setCharacterEncoding("UTF-8");
/* getParameter()
		: input 태그의 text, radio 처럼 하나의 값이 전송되는 겨웅에 사용한다. 일렵값이 문자, 숫자에 상관없이 
		String타입으로 전송된다.
	getParameterValues
		: checkbox와 같이 2개 이상의 값이 전송되는 경우에 사용. String 타입의 배열로 저장된다. */
String id = request.getParameter("id");
String sex = request.getParameter("sex");
String[] favo = request.getParameterValues("favo");
String favoStr = "";
/* 체크박스는 체크한 항목만 전송되므로 값이 없는 경우에는 실행하지 않는다. */
if (favo != null) {
	/* 체크한 항목이 있다면 개수만큼 반복 */
	for (int i = 0; i < favo.length; i++) {
		favoStr += favo[i] + " ";
	}
}
/* 
textarea는 2줄 이상 입력이 가능하므로 엔터키에 ㄷ개한 줄바꿈 처리는 <br> 캐그를 적용한다. */
String intro = request.getParameter("intro").replace("\r\n", "<br/>");
%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관심사항 : <%= favoStr %></li>
	<li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>