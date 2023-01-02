<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Cookie</title>
</head>
<body>
<%
  Cookie[] cookies = request.getCookies();

  for (int i = 0; i < cookies.length; i++) {
    cookies[i].setMaxAge(0); // 단위는 초임
    response.addCookie(cookies[i]);
  }
  response.sendRedirect("cookie.jsp");
%>

</body>
</html>
