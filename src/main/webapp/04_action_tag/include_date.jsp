<%--
  Created by IntelliJ IDEA.
  User: kihaeng
  Date: 2022/12/20
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Action Tag</title>
</head>
<body>
  <p>오늘의 날짜 및 시각</p>
  <p><%=(new java.util.Date()).toLocaleString()%></p>
</body>
</html>
