<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="market.dto.Product" %>
<%@ page import="market.dao.ProductRepository" %>
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
            <h1 class="display-3">상품 목록</h1>
        </div>
    </div>
    <%
        ProductRepository dao = ProductRepository.getInstance();
        ArrayList<Product> listOfProducts = dao.getAllProducts();
    %>

    <div class="container">
        <div class="row" align="center">
            <%@ include file="dbconn.jsp"%>
            <%
                String sql = "select * from product";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
            %>

<%--            <%--%>
<%--                for (int i = 0; i < listOfProducts.size(); i++) {--%>
<%--                    Product product = listOfProducts.get(i);--%>
<%--            %>--%>
            <div class="col-md-4">
<%--                <img src="${pageContext.request.contextPath}/resources/images/<%=product.getFilename()%>"--%>
<%--                style="width: 100%" alt="">--%>
<%--                <h3><%=product.getPname()%></h3>--%>
<%--                <p><%=product.getDescription()%></p>--%>
<%--                <p><%=product.getUnitPrice()%>원</p>--%>
                    <img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%" alt="">
                    <h3><%=rs.getString("p_name")%></h3>
                    <p><%=rs.getString("p_description")%></p>
                    <p><%=rs.getString("p_UnitPrice")%>원</p>
<%--                <p><a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button">--%>
<%--                    상세 정보 &raquo;</a>--%>
                    <p>
                        <a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">
                        상세 정보 &raquo;</a>
            </div>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>
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
