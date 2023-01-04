<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="bookDto.Book" %>
<%@ page import="bookDao.BookRepository" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="dbconn.jsp"%>

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

//  BookRepository dao = BookRepository.getInstance();

//  Book newBook = new Book();
//  newBook.setBookId(bookId);
//  newBook.setName(name);
//  newBook.setUnitPrice(price);
//  newBook.setDescription(description);
//  newBook.setPublisher(publisher);
//  newBook.setCategory(category);
//  newBook.setUnitsInStock(stock);
//  newBook.setCondition(condition);
//  newBook.setAuthor(author);
//  newBook.setTotalPages(pages);
//  newBook.setReleaseDate(releaseDate);
//  newBook.setFileName(fileName);
//
//  dao.addBook(newBook);

  String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,?,?)";

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
  pstmt.executeUpdate();

  if (pstmt != null)
    pstmt.close();
  if (conn != null)
    conn.close();

  response.sendRedirect("books.jsp");
%>