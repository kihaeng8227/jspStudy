<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Cookie</title>
</head>
<body>
  <%
    boolean loginState = false;
    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; i++) {
      if (cookies[i].getName().equals("userID")) {
        out.println(cookies[i].getValue() + "님 반값습니다.");
        loginState = true;
      }
    }

    if (loginState) {
//      out.println("<a href=\"cookie_out\">로그아웃</a>");
    }
    else {
      response.sendRedirect("cookie.jsp");
    }

  %>
  <a href="cookie_out.jsp">로그아웃</a>
</body>
</html>
