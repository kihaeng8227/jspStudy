<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Session</title>
</head>
<body>
    <%--
        세션에 저장된 모든 세션 속성 이름과 값 가져와 출력하기.
        1) 세션에 저장된 모든 세션 속성 이름을 가져오도록 session 내장 객체의 getAttributeNames() 메서드 작성.
        2) Enumeration 객체의 hasMoreElements() 메서드를 통해
        저장된 세션 속성 이름이 있을 때까지 반복하도록 while 문을 작성.
        3) 세션 속성 이름을 가져오도록 Enumeration 객체의 nextElement() 메서드 작성.
        4) 세션 속성 이름의 속성 값을 가져오도록 session 내장 객체의 getAttribute() 메서드를 작성.
    --%>
    <%
        String name;
        String value;

        Enumeration en = session.getAttributeNames();
        int i = 0;

        while (en.hasMoreElements()) {
            i++;
            name = en.nextElement().toString();
            value = session.getAttribute(name).toString();
            out.println("설정된 세션의 속성 이름 [ " + i + " ] : " + name + "<br>");
            out.println("설정된 세션의 속성 값 [ " + i + " ] : " + value + "<br>");
        }
    %>
</body>
</html>
