<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String score = request.getParameter("score");

        Integer sc = Integer.valueOf(score);
    %>

<%--    <c:set var="sc" value="${sc}" />--%>
    <c:set var="sc" value="<%=sc%>" />
    점수 <c:out value="<%=sc%>" />은
    <c:choose>
        <c:when test="${sc >= 90}">A학점입니다.</c:when>
        <c:when test="${sc >= 80}">B학점입니다.</c:when>
        <c:when test="${sc >= 70}">C학점입니다.</c:when>
        <c:when test="${sc >= 60}">D학점입니다.</c:when>
        <c:otherwise>F학점입니다.</c:otherwise>
    </c:choose>
</body>
</html>
