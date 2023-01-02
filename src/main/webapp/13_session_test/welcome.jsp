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
        boolean loginState = false;
        Enumeration en = session.getAttributeNames();
        while (en.hasMoreElements()) {
            if (en.nextElement().toString().equals("userID")) {
                out.println("admin님 반갑습니다.");
                loginState = true;
            }
        }

        if (loginState) {

        }
        else {
            response.sendRedirect("session.jsp");
        }

    %>
    <a href="session_out.jsp">로그아웃</a>
</body>
</html>
