<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Action Tag</title>
</head>
<body>
    <%--
    자바빈즈 Calculator를 생성하고 useBean 액션 태그에 Calculator 클래스를 사용하여 숫자 출력하기.
    1) 자바빈즈로 Calculator 클래스를 사용하도록 useBean 액션 태그를 작성
    2) useBean 액션 태그에 id 속성 값을 통해 Calculator 클래스의 process() 메서드를 호출하여
    반환된 결과 값을 out 내장 객체 변수를 통해 출력하도록 스크립틀릿 태그를 작성.
    --%>
    <jsp:useBean id="bean" class="user.Calculator"/>
    <%
        int m = bean.process(5);// id의 값인 bean은 참조변수라고 생각하면 됨.
        out.print("5의 3제곱 : " + m);
    %>
</body>
</html>
