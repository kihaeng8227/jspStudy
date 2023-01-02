<%@ page import="java.util.ArrayList" %>
<%@ page import="market.dto.Product" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>
    <%
        String cartId = session.getId();
    %>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">장바구니</h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <table width="100%">
                <tr>
<%--                    <td align="left"><a href="./deleteCart.jsp" class="btn btn-danger">삭제하기</a></td>--%>
                    <td align="left"><input type="button" id="totalDel" value="삭제하기" class="btn btn-danger"></td>
                    <td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId%>" class="btn btn-success">주문하기</a></td>
                </tr>
            </table>
        </div>
        <div style="padding-top: 50px">
            <table class="table table-hover">
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>소계</th>
                    <th>비고</th>
                </tr>
                <%
                    int sum = 0;
                    ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
                    if (cartList == null) {
                        cartList = new ArrayList<Product>();
                        session.setAttribute("cartlist", cartList);
                    }

                    for (Product cart : cartList) {
                        Product product = cart;
                        int total = product.getUnitPrice() * product.getQuantity();
                        sum = sum + total;
                %>
                <tr>
                    <td><%=product.getProductId()%> - <%=product.getPname()%></td>
                    <td><%=product.getUnitPrice()%></td>
                    <td><%=product.getQuantity()%></td>
                    <td><%=total%></td>
                    <td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <th></th>
                    <th></th>
                    <th>총액</th>
                    <th><%=sum%></th>
                    <th></th>
                </tr>
            </table>
            <a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
        </div>
<%--        <form name="frmCart" method="post">--%>
<%--            <input type="hidden" name="id">--%>
<%--        </form>--%>
    </div>
    <script>
        let totalDel = document.querySelector("#totalDel");
        // const frm = document.frmCart;
        // let removeCartByID = function (ID) {
        //     if (confirm("삭제하시겠습니까?")) {
        //         frm.id.value = ID;
        //         frm.action = "removeCart.jsp";
        //         frm.submit();
        //     }
        // }
        totalDel.addEventListener("click", function () {
            if (confirm("전체 삭제 하시겠습니까?")) {
                location.href = "deleteCart.jsp";
            }
        })
    </script>
</body>
</html>
