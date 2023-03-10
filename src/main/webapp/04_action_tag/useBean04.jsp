<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Action Tag</title>
</head>
<body>
  <%--
  useBean 액션 태그에 생성한 자바빈즈 Person으로 아이디와 이름을 설정하여 출력하기.
  1) useBean 액션 태그에 id 속성 값을 통해 Person 클래스의 setId(), setName() 메서드를 호출하여
  새로운 값을 저장하도록 스크립틀릿 태그를 작성.
  2) 외부 파일 useBean03.jsp의 내용을 포함하도록 include 액션 태그의 page 속성을 작성.
  --%>
  <jsp:useBean id="person" class="user.Person" scope="request" />
  <p> 아이디 : <%=person.getId()%></p>
  <p> 이 름 : <%=person.getName()%></p>
  <%
    person.setId(19921106);
    person.setName("김아영");
  %>
  <jsp:include page="useBean03.jsp" />
</body>
</html>
