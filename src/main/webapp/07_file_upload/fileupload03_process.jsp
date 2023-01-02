<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<%--
  Commons-FileUpload를 이용하여 파일 업로드하기.
  1) Commons-Fileupload 패키지를 사용하도록 page 디렉티브 태그의 import 속성 값에
      패키지 org.apache.commons.fileupload.*를 작성.
  2) 폼 페이지에서 전송된 파일을 저장할 서버의 경로를 작성.
  3) 파일 업로드를 위해 DiskF1leUpload 클래스를 생성.
  4) 폼 페이지에서 전송된 요청 파라미터를 전달받도록 DisKF11eupload 객체 타입의 parseRequest() 메서드를 작성.
  5) 폼 페이지에서 전송된 요청 파라미터를 Iterator 클래스로 변환.
  6) 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록 Iterator 객체 타입의 hasNext() 메서드를 작성.
  7) 폼 페이지에서 전송된 요청 파라미터의 이름을 가져오도록 Iterator 객체 타입의 next() 메서드를 작성.
  8) 폼 페이지에서 전송된 요청 파라미터가 파일이면 서버의 파일 저장 경로에 업로드 파일을 저장하도록 작성.
--%>
  <%
    String fileUploadPath = "./upload2"; // 상대경로여서 아파치 bin 폴더에 만들어짐
//    String fileUploadPath = "./";
    DiskFileUpload upload = new DiskFileUpload();

    List items = upload.parseRequest(request);

    Iterator params = items.iterator();

    while (params.hasNext()) {
      FileItem fileItem = (FileItem) params.next();
      if (!fileItem.isFormField()) {
        String fileName = fileItem.getName();
        out.print(fileName);
        fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
        File file = new File(fileUploadPath + "/" + fileName);
        fileItem.write(file);
      }
    }
  %>
</body>
</html>
