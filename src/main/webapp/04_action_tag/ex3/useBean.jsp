<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Action Tag</title>
</head>
<body>
  <h4>구구단 출력하기</h4>
  <jsp:useBean id="gugu" class="gugu.GuGuDan" />
  <%
    int num = 5;

    for (int i = 1; i < 10; i++) {
      out.print(num + " * " + i + " = " + gugu.process(num, i) + "<br>");
    }
  %>


</body>
</html>
