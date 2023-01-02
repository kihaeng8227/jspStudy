<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--  <div class="container" align="center">--%>
<%--    <div class="col-md-4 col-md-offset-4">--%>
<%--      <h3 class="form-signin-heading">Please sign in</h3>--%>
<%--      <%--%>
<%--        String error = request.getParameter("error");--%>
<%--        if (error != null) {--%>
<%--          out.println("<div class='alert alert-danger'>");--%>
<%--          out.println("아이디와 비밀번호를 확인해 주세요");--%>
<%--          out.println("</div>");--%>
<%--        }--%>
<%--      %>--%>
<%--      <form class="form-signin" action="j_security_check" method="post">--%>
<%--        <div class="form-group">--%>
<%--          <label for="inputUserName" class="sr-only">User Name</label>--%>
<%--          <input type="text" class="form-control" placeholder="ID">--%>
<%--        </div>--%>
<%--      </form>--%>
<%--    </div>--%>
<%--  </div>--%>
    <form name="LoginForm" action="j_security_check" method="post">
      <p> 사용자명 : <input type="text" name="j_username">
      <p> 비밀번호 : <input type="password" name="j_password">
      <p><input type="submit" value="전송">
    </form>
</body>
</html>
