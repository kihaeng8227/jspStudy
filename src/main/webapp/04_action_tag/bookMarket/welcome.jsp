<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="menu.jsp"%>
<%!String greeting = "도서 웹 쇼핑몰";
    String tagline = "welcome to web market";%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            <%=greeting%>
        </h1>
    </div>
</div>
<div class="container">
    <div class="text-center">
        <h3>
            <%=tagline%>
        </h3>
        <%
            Date day = new Date();
            String am_pm;
            int hour = day.getHours();
            int minute = day.getMinutes();
            int second = day.getSeconds();
            if (hour / 12 == 0) {
                am_pm = "AM";
            } else {
                am_pm = "PM";
                hour = hour - 12;
            }
            String CT = hour + ":" + minute + ":" + second + " " + am_pm;
            out.println("현재 접속 시작: " + CT + "\n");
        %>
    </div>
    <hr>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>

<%--
2. 다음 조건에 맞게 도서 웹 쇼핑몰을 위한 웹 애플리케이션을 만들고 실행 결과를 확인하시오.

1) 생성된 BookMarket 프로젝트를 사용합니다
2) 이클립스의 Server 프로젝트에 있는 tomcat-users.xml 파일의 사용자와 역할에 대해 다음 내용을 추가 작성합니다.
<role rolename="guest" />
<user username= "guest" password="guest1234" roles="guest" />
3) webapp의 WEB-INF 폴더에 웹 애플리케이션 배포 설명자 web.xml 파일을 생성하고 시큐리타 태그를 작성합니다.
- 접근을 제한할 요청 페이지 addBook.jsp의 경로를 설정하도록 작성합니다.
- FORM 인증 처리 기법을 설정하도록 작성합니다.
4) 로그인 페이지 login.jsp 파일을 생성하고 폼 기반 인증을 처리하도록 작성합니다.
5) 로그인 실패 페이지 login_failled.jsp 파일을 생성하고, 인증 실패시 로그인 페이지로 이동하도록 작성합니다.
6) 로그아웃 페이지 logout.jsp 파일을 생성하고, 설정된 세션을 삭제한 후 addBook.jsp로 이동하도록 작성합니다.
7) 상품 등록 페이지 addBook.jsp 파일에 <로그아웃> 버튼을 추가 작성합니다.
8) 웹브라우저에서 실행 결과를 확인합니다.
--%>