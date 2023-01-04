<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="edu.BookBean" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
    <c:set var="name" value="Amy"/>
    <c:out value="${name}" /><br>

    <c:remove var="name"/>
    <c:out value="${name}" /><br>

    <%
        BookBean bookBean = new BookBean("The Secret", "Byrne, Rhonda", "Atria Books");
        request.setAttribute("bookOne", bookBean);
    %>

    <c:set var="title" value="${bookOne.title}"/>
    <c:out value="${title}" /><br>

    <c:set var="author" value="<%=bookBean.getAuthor()%>"/>
    <c:out value="${author}" /><br>

    <hr>

    <c:set var="name">Tobey</c:set>
    <c:out value="${name}" /><br>

    <%
        BookBean bookBean1 = new BookBean("The Last Lecture", "Randy Pausch", "hyperion");
        request.setAttribute("bookTwo", bookBean1);
    %>

    <c:set var="title">${bookTwo.title}</c:set>
    <c:out value="${title}" /><br>

    <c:set var="author" value="<%=bookBean1.getAuthor()%>"/>
    <c:out value="${author}" /><br>
</body>
</html>
