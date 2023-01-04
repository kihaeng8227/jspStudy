<%@ page import="bookDao.BookRepository" %>
<%@ page import="bookDto.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    /* 장바구니에서 상품을 개별 삭제 */
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("books.jsp");
        return;
    }

    BookRepository dao = BookRepository.getInstance();

    Book book = dao.getBookById(id);
    if (book == null) {
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
    Book goodsQnt = new Book();
    for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
        goodsQnt = cartList.get(i);
        if (goodsQnt.getBookId().equals(id)) {
            cartList.remove(goodsQnt);
        }
    }
    response.sendRedirect("cart.jsp");
%>