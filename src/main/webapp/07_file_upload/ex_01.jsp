<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <!-- 이미지 파일 업로드 후 출력하기 -->
    <form name="frmUpload" method="post" action="ex_01_action.jsp" enctype="multipart/form-data">
        <p>이미지 : <input type="file" name="img">
        <p><input type="submit" value="등록"></p>
    </form>
</body>
</html>
