<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="market.dto.Product" %>
<%@ page import="market.dao.ProductRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String realPath = request.getServletContext().getRealPath("resources/images"); // 파일이 저장될 경로.
    File dir = new File(realPath);
    if (!dir.exists()) { // 해당 디렉토리가 존재하지 않으면
        dir.mkdirs();
    }

    String filename = "";
    String encType = "utf-8"; // 인코딩 타입
    int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기 5Mb

    MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());

    String productId = multi.getParameter("productId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String manufacturer = multi.getParameter("manufacturer");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

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


    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

//    ProductRepository dao = ProductRepository.getInstance();

//    Product newProduct = new Product();
//    newProduct.setProductId(productId);
//    newProduct.setPname(name);
//    newProduct.setUnitPrice(price);
//    newProduct.setDescription(description);
//    newProduct.setManufacturer(manufacturer);
//    newProduct.setCategory(category);
//    newProduct.setUnitsInStock(stock);
//    newProduct.setCondition(condition);
//    newProduct.setFilename(fileName);
//
//    dao.addProduct(newProduct);

    String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    pstmt.setString(2, name);
    pstmt.setInt(3, price);
    pstmt.setString(4, description);
    pstmt.setString(5, category);
    pstmt.setString(6, manufacturer);
    pstmt.setLong(7, stock);
    pstmt.setString(8, condition);
    pstmt.setString(9, fileName);
    pstmt.executeUpdate();

    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();

    response.sendRedirect("products.jsp");
%>

