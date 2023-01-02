<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
    <%
        out.println("회원 전용 페이지 입니다");
        boolean loginState = false;
        Enumeration en = session.getAttributeNames();
        while (en.hasMoreElements()) {
            if (en.nextElement().toString().equals("userID")) {
                loginState = true;
            }
        }
        if (loginState) {

        }
        else {
            response.sendRedirect("login.jsp");
        }
    %>
    <br>
    <a href="logout.jsp">로그 아웃</a>
</body>
</html>
