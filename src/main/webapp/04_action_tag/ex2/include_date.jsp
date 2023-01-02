<%--
  Created by IntelliJ IDEA.
  User: kihaeng
  Date: 2022/12/20
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%--
3. 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행 결과를 확인하시오.

1) GuGuDan 클래스를 생성하여 곱셈을 계산하는 process() 메소드를 작성.
* uceRean 파일을 생성
useBean 액션태그에 GuGuDan 클래스를 사용하도록 작성.
<h4> 태그에 '구구단 출력하기'를 작성.
숫자 5에 대해 GuGuDan 클래스의 process(5, 1) 메소드를 호출, 30반환하여 구구단을 출력.
--%>
<%
  for (int i = 1; i < 10; i++) {
    out.print(5 + " * " + i + " = " + (5 * i) + "<br>");
  }
%>
</body>
</html>
