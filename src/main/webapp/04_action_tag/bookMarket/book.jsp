<%@ page import="bookDto.Book" %>
<%@ page import="bookDao.BookRepository" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>상품 상세 정보</title>
    <script type="text/javascript">
      function addToCart() {
        if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
          document.addForm.submit();
        } else {
          document.addForm.reset();
        }
      }
    </script>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">상품 정보</h1>
  </div>
</div>
<%--<%--%>
<%--  String id = request.getParameter("id");--%>
<%--  BookRepository dao = BookRepository.getInstance();--%>
<%--  Book book = dao.getBookById(id);--%>
<%--%>--%>
<div class="container">
  <div class="row">
    <%@ include file="dbconn.jsp"%>
    <div class="col-md-5">
      <%
        String bookId = request.getParameter("id");
//        String fileName = request.getParameter("fileName");

        String sql = "select * from book WHERE bookId = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, bookId);
        rs = pstmt.executeQuery();
        while (rs.next()) {
      %>
      <img src="./resources/images/<%=rs.getString("fileName")%>"
           style="width: 100%" />
    </div>
    <div class="col-md-6">
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
      <form name="addForm" action="./addCart.jsp?id=<%=bookId%>" method="post">
        <a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a>
        <a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
        <a href="./books.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
      </form>
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
<jsp:include page="footer.jsp"/>
</body>
</html>
