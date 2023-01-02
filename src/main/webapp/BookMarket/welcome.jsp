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
<%--
2. src 폴더에 dto 패키지를 생성하고 이 패키지에 Book 클래스를 생성합니다.
- 다음과 같이 멤버 변수를 선언합니다.
private String booktId; //도서 아이디
private string name; //도서명
private Integer unitPrice; // 가격
private String author; // 저자
private String description; //설명
private String publisher; //출판사
private String category; //분류
private long unitsInStock; //재고 수
private long totalPages; //페이지 수
private String releaseDate; //출판 일(월/년)
private String condition; //신규 도서 or 중고 도서 or E-Book

- 기본 생성자와 선언된 멤버 변수인 도서 아이디, 도서명, 가격을 매개 변수로 하는 생성자를 생성합니다.

- 모든 멤버 변수의 Setter / Getter 메소드를 각각작성합니다.

3. src폴더에 dao패키지를 생성하고 이 패키지에 BookRepository 클래스를 생성합니다.
- 멤버변수 ArrayList<Book> 객체 타입의 listOfBooks를 선언합니다.
- 기본 생성자를 생성하고 여기에 멤버 변수를 초기화하도록 값을 설정합니다.
- 상품 목록을 가져오는 ArrayList<Book> 객체 타입의 getAIlBooks() 메소드를 작성합니다.

4. WebContent 폴더에 books.jsp 파일을 생성하고 자바빈즈 BookRepository 클래스를 이용하여 상품 목록을 출력합니다.

5. 웹 브라우저에서 실행결과를 확인합니다.
--%>
</body>
</html>
