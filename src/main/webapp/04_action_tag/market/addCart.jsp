<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="market.dto.Product" %>
<%@ page import="market.dao.ProductRepository" %>

<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("products.jsp");
        return;
    }

    ProductRepository dao = ProductRepository.getInstance();

    Product product = dao.getProductById(id);
    if (product == null) {
        response.sendRedirect("exceptionNoProductId.jsp");
    }


    ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Product>();
        session.setAttribute("cartlist", list);
    }

    int cnt = 0; // 기존 장바구니에 담긴 상품인지 확인하기 위한 용도
    Product goodsQnt = new Product();
    for (int i = 0; i < list.size(); i++) {
        goodsQnt = list.get(i);
        if (goodsQnt.getProductId().equals(id)) {
            cnt++;
            int orderQuantity = goodsQnt.getQuantity() + 1;
            goodsQnt.setQuantity(orderQuantity);
        }
    }

    if (cnt == 0) {
        product.setQuantity(1);
        list.add(product);
    }

    response.sendRedirect("product.jsp?id=" + id);
%>