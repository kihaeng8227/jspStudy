<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
<form method="post" action="insert02_process.jsp">
    <p> 아이디 : <input type="text" name="id">
    <p> 비밀번호 : <input type="password" name="passwd">
    <p> 이름 : <input type="text" name="name">
    <p> <input type="submit" name="전송">
</form>
</body>
</html>
