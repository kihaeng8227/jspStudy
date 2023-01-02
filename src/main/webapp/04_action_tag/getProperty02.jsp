<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Action Tag</title>
</head>
<body>
  <%--
  setProperty 액션 태그에 자바빈즈 Person으로 아이디와 이름을 설정하여 출력하기.
  1) 자바빈즈로 Person 클래스를 사용하도록 useBean 액션 태그를 작성
  2) useBean 액션 태그의 id 속성 값을 통해 자바빈드 Person의 프로퍼티 id와 name에 값을 저장하도록 setProperty 액션 태그를 작성.
  3) useBean 액션 태그의 id 속성 값을 통해 Person 클래스의 getId(), getName() 메서드를 호출하여 반환된 값을
  out 내장 객체 변수를 이용하여 출력하도록 스크립틀릿 태그를 작성
  --%>
  <jsp:useBean id="person" class="user.Person" scope="request"/>
  <jsp:setProperty name="person" property="id" value="19921106" />
  <jsp:setProperty name="person" property="name" value="김아영" />
  <p> 아이디 : </p> <jsp:getProperty property="id" name="person"/>
  <p> 이 름 : </p> <jsp:getProperty property="name" name="person"/>
</body>
</html>
