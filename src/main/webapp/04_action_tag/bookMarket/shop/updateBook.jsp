<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>도서 수정</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">도서 수정</h1>
    </div>
</div>
<%@ include file="dbconn.jsp"%>
<%
    String bookId = request.getParameter("id");

    String sql = "select * from book where bookId = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, bookId);
    rs = pstmt.executeQuery();
    if (rs.next()) {
%>

<div class="container">
    <div class="row" align="center">
        <div class="col-md-5">
            <img src="../resources/images/<%=rs.getString("fileName")%>" style="width: 100%" alt="">
        </div>
        <div class="col-md-7">
            <form name="newBook" action="processUpdateBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
                <input type="hidden" id="bookId" name="bookId" value='<%=rs.getString("bookId")%>'>
                <div class="form-group row">
                    <label class="col-sm-2">도서명</label>
                    <div class="col-sm-3">
                        <input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("name")%>">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">가격</label>
                    <div class="col-sm-3">
                        <input type="text" name="unitPrice" class="form-control" value='<%=rs.getString("unitPrice")%>'>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">저자</label>
                    <div class="col-sm-3">
                        <input type="text" name="author" class="form-control" value='<%=rs.getString("author")%>'>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">상세정보</label>
                    <div class="col-sm-5">
                        <textarea name="description" cols="50" rows="2" class="form-control" ><%=rs.getString("description")%></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">출판사</label>
                    <div class="col-sm-3">
                        <input type="text" name="publisher" class="form-control" value='<%=rs.getString("publisher")%>'>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2">분류</label>
                    <div class="col-sm-3">
                        <input type="text" name="category" class="form-control" value='<%=rs.getString("category")%>'>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">재고 수</label>
                    <div class="col-sm-3">
                        <input type="text" name="unitsInStock" class="form-control" value='<%=rs.getString("unitsInStock")%>'>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">페이지 수</label>
                    <div class="col-sm-3">
                        <input type="text" name="totalPages" class="form-control" value='<%=rs.getString("totalPages")%>'>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">출판일</label>
                    <div class="col-sm-3">
                        <input type="text" name="releaseDate" class="form-control" value='<%=rs.getString("releaseDate")%>'>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">상태</label>
                    <div class="col-sm-5">
                        <input type="radio" name="condition" value="신간 도서" <% if (rs.getString("condition").equals("신간 도서")) out.print(" checked");%>> 신간 도서
                        <input type="radio" name="condition" value="중고 도서" <% if (rs.getString("condition").equals("중고 도서")) out.print(" checked");%>> 중고 도서
                        <input type="radio" name="condition" value="eBook" <% if (rs.getString("condition").equals("eBook")) out.print(" checked");%>> eBook
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">이미지</label>
                    <div class="col-sm-5">
                        <input type="file" name="productImage" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10 ">
                        <input type="submit" class="btn btn-primary" value="수정" >
                    </div>
                </div>
            </form>
        </div>
    </div>
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
</body>
</html>
