<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="market.dto.Product" %>
<%@ page import="market.dao.ProductRepository" %>
<%@ page import="java.net.URLEncoder" %>

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
//    String enName = URLEncoder.encode(fileName);

    ProductRepository dao = ProductRepository.getInstance();

    Product newProduct = new Product();
    newProduct.setProductId(productId);
    newProduct.setPname(name);
    newProduct.setUnitPrice(price);
    newProduct.setDescription(description);
    newProduct.setManufacturer(manufacturer);
    newProduct.setCategory(category);
    newProduct.setUnitsInStock(stock);
    newProduct.setCondition(condition);
    newProduct.setFilename(fileName);

    dao.addProduct(newProduct);

    response.sendRedirect("products.jsp");
%>

