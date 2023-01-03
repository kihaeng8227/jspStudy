<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bookDto.Book" %>
<%@ page import="bookDao.BookRepository" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>상품 목록</title>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">도서 목록</h1>
        </div>
    </div>
    <%
//        String realPath = request.getServletContext().getRealPath("resources/images");
//        out.print(realPath);
        BookRepository dao = BookRepository.getInstance();
        ArrayList<Book> books = dao.getAllBooks();
    %>

    <div class="container">
        <div class="row">
<%--            <%--%>
<%--                for (int i = 0; i < books.size(); i++) {--%>
<%--                    Book book = books.get(i);--%>
<%--            %>--%>
            <%@ include file="dbconn.jsp"%>
            <%
                String sql = "select * from product";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
            %>
            <div class="col-md-12">
<%--                <img src="${pageContext.request.contextPath}/resources/images/<%=book.getFileName()%>"--%>
<%--                     style="width: 300px" alt="책 이미지">--%>
<%--                <h3><%=book.getName()%></h3>--%>
<%--                <p><%=book.getDescription()%></p>--%>
<%--                <p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%></p>--%>
<%--                <p><%=book.getCategory()%></p>--%>
<%--                <p><%=book.getCondition()%></p>--%>
<%--                <p><%=book.getReleaseDate()%></p>--%>
<%--                <p><%=book.getTotalPages()%></p>--%>
<%--                <p><%=book.getUnitsInStock()%></p>--%>
<%--                <p><a href="./book.jsp?id=<%=book.getBookId()%>" class="btn btn-secondary" role="button">--%>
<%--                    상세 정보 &raquo;</a>--%>
                <img src="./resources/images/<%=rs.getString("b_fileName")%>" style="width: 300px" alt="">
                <h3><%=rs.getString("name")%></h3>
                <p><%=rs.getString("description")%></p>
                <p><%=rs.getString("author")%></p>
                <p><%=rs.getString("publisher")%></p>
                <p><%=rs.getString("unitPrice")%></p>
                <p><%=rs.getString("category")%></p>
                <p><%=rs.getString("condition")%></p>
                <p><%=rs.getString("b_releaseDate")%></p>
                <p><%=rs.getString("b_totalPages")%></p>
                <p><%=rs.getString("b_unitsInStock")%></p>
                <p>
                    <a href="./book.jsp?id=<%=rs.getString("bookId")%>" class="btn btn-secondary" role="button">
                        상세 정보 &raquo;</a>
                <hr>
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

    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
