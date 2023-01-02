<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int num1 = 5;
    %>
    <%-- include해도 num2가 선언안됨. 결과만 들고옴. --%>
    <jsp:include page="sample_01_include.jsp" flush="false" />
    <br>
    <%
        out.println(num1 * num2);
    %>
</body>
</html>
