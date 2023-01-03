<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>title</title>
    <script type="text/javascript">
        function deleteConfirm(id) {
            if (confirm("해당 상품을 삭제합니다!!") == true)
                location.href = "./deleteBook.jsp?id=" + id;
            else
                return;
        }
    </script>
</head>
<%
    String edit = request.getParameter("edit");
%>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">도서 편집</h1>
    </div>
</div>

<div class="container">
    <div class="row" align="center">
        <%@ include file="dbconn.jsp"%>
        <%
            String sql = "select * from book";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
        %>

        <div class="col-md-4">

            <img src="./resources/images/<%=rs.getString("fileName")%>" style="width: 100%" alt="">
            <h3><%=rs.getString("name")%></h3>
            <p><%=rs.getString("description")%></p>
            <p><%=rs.getString("unitPrice")%>원</p>
            <p>
                    <%
                        if (edit.equals("update")) {
                    %>
                <a href="./updateBook.jsp?id=<%=rs.getString("bookId")%>" class="btn btn-success" role="button">
                    수정 &raquo;</a>
                    <%
                            } else if (edit.equals("delete")) {
                    %>
                <a href="#" onclick="deleteConfirm('<%=rs.getString("bookId")%>')" class="btn btn-danger" role="button">
                    삭제 &raquo;</a>
                    <%
                            }
                    %>
        </div>
        <%
            }
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        %>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
