<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>내장객체 - request</title></head>
<body>
    <h2>1. 로그인 폼</h2>
    <%
    /* IoginErr 파라미터가 있는 경우에만 "로그인실패"를 웹브라우저에 출력한다. 첫 실행시에는
    아무것도 출력되지 않는다. */
    String loginErr = request.getParameter("loginErr");
    if (loginErr != null) out.print("로그인 실패");
    %>
    <!-- 로그인과 같이 개인정보들은 숨김처리를 위해 POST방식으로 전송한다. -->
    <form action="./ResponseLogin.jsp" method="post">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="text" name="user_pwd" /><br />
        <input type="submit" value="로그인" />
    </form>
</body>
</html>
