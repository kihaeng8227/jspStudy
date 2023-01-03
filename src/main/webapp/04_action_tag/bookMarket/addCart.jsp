<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookDto.Book" %>
<%@ page import="bookDao.BookRepository" %>

<%
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


    ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Book>();
        session.setAttribute("cartlist", list);
    }

    int cnt = 0; // 기존 장바구니에 담긴 상품인지 확인하기 위한 용도
    Book goodsQnt = new Book();
    for (int i = 0; i < list.size(); i++) {
        goodsQnt = list.get(i);
        if (goodsQnt.getBookId().equals(id)) {
            cnt++;
            int orderQuantity = goodsQnt.getQuantity() + 1;
            goodsQnt.setQuantity(orderQuantity);
        }
    }

    if (cnt == 0) {
        book.setQuantity(1);
        list.add(book);
    }

    response.sendRedirect("book.jsp?id=" + id);
%>