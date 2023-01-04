<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="market.dto.Product" %>
<%@ page import="market.dao.ProductRepository" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>


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
  <%
    String id = request.getParameter("id");
//    ProductRepository dao = ProductRepository.getInstance();
//    Product product = dao.getProductById(id);
  %>
  <div class="container">
    <div class="row">
      <%@ include file="dbconn.jsp"%>
      <div class="col-md-5">
        <%
          String sql = "select * from product WHERE p_id = ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, id);
          rs = pstmt.executeQuery();
          while (rs.next()) {
        %>
        <img src="./resources/images/<%=rs.getString("p_fileName")%>"
        style="width: 100%" />
      </div>
      <div class="col-md-6">
        <h3>상품 명 : <%=rs.getString("p_name")%></h3>
        <p>상품 설명 : <%=rs.getString("p_description")%></p>
        <p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
        <p><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
        <p><b>분류</b> : <%=rs.getString("p_category")%>
        <p><b>재고 수</b> : <%=rs.getString("p_unitsInStock")%>
        <h4><%=rs.getString("p_unitPrice")%>원</h4>
        <p>
            <form name="addForm" action="./addCart.jsp?id=<%=id%>" method="post">
              <a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a>
              <a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
              <a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
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
