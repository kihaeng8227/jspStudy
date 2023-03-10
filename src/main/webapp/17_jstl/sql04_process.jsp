<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
<%--
<sql:update> 태그로 DELETE 쿼리문 실행하기.
--%>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
%>
<sql:setDataSource var="dataSource"
                   url="jdbc:mariadb://localhost:3306/sample"
                   driver="org.mariadb.jdbc.Driver" user="root" password="9834"/>

<sql:update dataSource="${dataSource}" var="resultSet">
    <%-- member 테이블에 id, passwd 필드 값과 일치하는 값이 있으면
     해당 레코드를 수정하도록 <sql:update> 태그로 DELETE문을 작성. --%>
    DELETE FROM member  where id =? and passwd =?
    <%-- 폼 페이지에서 전송된 아이디, 이름, 비밀번호를 쿼리문의 물음표에 설정하도록 <sql:param> 태그를 작성. --%>
    <sql:param value="<%=id%>"/>
    <sql:param value="<%=passwd%>"/>
</sql:update>
<c:import var="url" url="sql01.jsp"/>
${url}
</body>
</html>
