<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("page_01.jsp");
%>
</body>
</html>
