<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
    <h4>아이디, 비밀번호 인증을 이용한 이름 수정</h4>
    <form method="post" action="sql03_process.jsp">
        <p>아이디 : <input type="text" name="id">
        <p>비밀번호 : <input type="password" name="passwd">
        <p>이름 : <input type="text" name="name">
        <p><input type="submit" value="전송">
    </form>
</body>
</html>
