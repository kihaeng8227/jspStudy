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
<%--    <%--%>
<%--//        String realPath = request.getServletContext().getRealPath("resources/images");--%>
<%--//        out.print(realPath);--%>
<%--//        BookRepository dao = BookRepository.getInstance();--%>
<%--//        ArrayList<Book> books = dao.getAllBooks();--%>
<%--    %>--%>

    <div class="container">
        <div class="row">
<%--            <%--%>
<%--                for (int i = 0; i < books.size(); i++) {--%>
<%--                    Book book = books.get(i);--%>
<%--            %>--%>
            <%@ include file="dbconn.jsp"%>
            <%
                String sql = "select * from book";
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
                <img src="../resources/images/<%=rs.getString("fileName")%>" style="width: 300px" alt="">
                <h3>도서명 : <%=rs.getString("name")%></h3>
                <p>도서 아이디 : <%=rs.getString("bookId")%></p>
                <p>가격 : <%=rs.getString("unitPrice")%>원</p>
                <p>저자 : <%=rs.getString("author")%></p>
                <p>설명 : <%=rs.getString("description")%></p>
                <p>출판사 : <%=rs.getString("publisher")%></p>
                <p>카테고리 : <%=rs.getString("category")%></p>
                <p>재고 수 : <%=rs.getString("unitsInStock")%></p>
                <p>페이지 수 : <%=rs.getString("totalPages")%></p>
                <p>출판일 : <%=rs.getString("releaseDate")%></p>
                <p>상태 : <%=rs.getString("condition")%></p>
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
