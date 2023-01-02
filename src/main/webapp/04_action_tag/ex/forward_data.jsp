<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Action Tag</title>
</head>
<body>


<%
    for (int i = 1; i < 10; i++) { %>
<%=request.getParameter("dan")%> <%= " x " + i + " = " %> <%=Integer.valueOf(request.getParameter("dan")) * i%>
</br>
<%}
%>


<%--
<%
    String strNum = request.getParameter("num");
    int intNum = Integer.parseInt(strNum);
%>
<%
    for (int i = 1; i < 10; i++) {
    out.print(intNum + " * " + i + " = " + (intNum * i) + "<br>");
    }
%>
--%>

</body>
</html>
