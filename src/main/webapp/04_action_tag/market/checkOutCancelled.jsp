<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <title>title</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">주문 취소</h1>
        </div>
    </div>
    <div class="container">
        <h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
    </div>
    <div class="container">
        <p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
    </div>
<%--
    2. 다음 조건에 맞게 도서 웹 쇼핑몰을 위한 웹 애플리케이션을 만들고 실행 결과를 확인하시오.

    1) 생성된 BookMarket 프로젝트를 사용합니다.
    2) 장바구니 페이지 cart.jsp 파일에 <주문하기> 버튼을 누르면 배송 정보 페이지로 이동하도록 작성합니다.
    3) 배송 정보 페이지 shippingInfo.jsp 파일을 생성하고 성명, 배송일, 국가, 우편번호, 주소 항목을 작성합니다.
    4) 배송 정보 처리 페이지 processShippingInfo.jsp 파일을 생성하고 장바구니 아이디, 성명, 배송일, 국가,
    우편번호, 주소 등을 전달받도록 작성합니다.
    5) 주문 정보 페이지 orderConfirmation.jsp 파일을 생성하고 성명, 우편번호, 주소, 배송일 등을
    출력하도록 작성합니다.
    6) 주문 완료 페이지 thankCustomer.jsp 파일을 생성하고 배송일과 주문번호를 출력하도록 작성합니다.
    7) 주문 취소 페이지 checkOutCancelled.jsp 파일을 생성하고 주문 취소를 확인하도록 작성합니다.
    8) 웹브라우저에서 실행 결과를 확인합니다.
--%>
</body>
</html>
