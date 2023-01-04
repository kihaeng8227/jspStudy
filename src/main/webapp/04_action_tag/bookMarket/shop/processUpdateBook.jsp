<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String realPath = request.getServletContext().getRealPath("resources/images"); // 파일이 저장될 경로.
    String filename = "";
    String encType = "utf-8"; // 인코딩 타입
    int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기 5Mb

    MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());

    String bookId = multi.getParameter("bookId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String publisher = multi.getParameter("publisher");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");
    String author = multi.getParameter("author");
    String totalPages = multi.getParameter("totalPages");
    String releaseDate = multi.getParameter("releaseDate");

    Integer price;

    if(unitPrice.isEmpty())
        price = 0;
    else
        price = Integer.valueOf(unitPrice);

    long stock;

    if (unitsInStock.isEmpty())
        stock = 0;
    else
        stock = Long.valueOf(unitsInStock);

    long pages;

    if (totalPages.isEmpty()) {
        pages = 0;
    }
    else {
        pages = Long.valueOf(totalPages);
    }

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    String sql = "select * from book where bookId = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, bookId);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        if (fileName != null) {
            sql = "UPDATE book SET bookId=?, `name`=?, unitPrice=?, author=?, description=?, publisher=?, category=?, "
                    + "unitsInStock=?, totalPages=?, releaseDate=?, `condition`=?, fileName=? WHERE bookId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookId);
            pstmt.setString(2, name);
            pstmt.setInt(3, price);
            pstmt.setString(4, author);
            pstmt.setString(5, description);
            pstmt.setString(6, publisher);
            pstmt.setString(7, category);
            pstmt.setLong(8, stock);
            pstmt.setLong(9, pages);
            pstmt.setString(10, releaseDate);
            pstmt.setString(11, condition);
            pstmt.setString(12, fileName);
            pstmt.setString(13, bookId);
            pstmt.executeUpdate();
        } else {
            sql = "UPDATE book SET bookId=?, `name`=?, unitPrice=?, author=?, description=?, publisher=?, category=?, " +
                    "unitsInStock=?, totalPages=?, releaseDate=?, `condition`=? WHERE bookId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookId);
            pstmt.setString(2, name);
            pstmt.setInt(3, price);
            pstmt.setString(4, author);
            pstmt.setString(5, description);
            pstmt.setString(6, publisher);
            pstmt.setString(7, category);
            pstmt.setLong(8, stock);
            pstmt.setLong(9, pages);
            pstmt.setString(10, releaseDate);
            pstmt.setString(11, condition);
            pstmt.setString(12, bookId);
            pstmt.executeUpdate();
        }
    }
    if (rs != null)
        rs.close();
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();

    response.sendRedirect("editBook.jsp?edit=update");

%>

