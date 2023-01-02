<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <%
        int num1 = 5;
    %>
    <%@include file="sample_01_include.jsp"%>
    <br>
    <%
        out.println(num1 * num2);
    %>
</body>
</html>
