<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    String path = "C:\\hyeahyun\\uploadFile";
    MultipartRequest multi = new MultipartRequest(request,
            path,
            5 * 1024 * 1024,
            "utf-8",
            new DefaultFileRenamePolicy()
    );
    // 요청 파라미터 이름, 실제 파일 이름, 저장 파일 이름, 파일 컨텐츠 유형, 파일 크기
    Enumeration files = multi.getFileNames();
    while(files.hasMoreElements()){
        String paramName = (String)files.nextElement();
        String fileName = multi.getFilesystemName(paramName);
        String originalName = multi.getOriginalFileName(paramName);
        String contentType = multi.getContentType(paramName);

        long fileSize = 0;
        File file = multi.getFile(paramName);
        if(file != null){
            fileSize = file.length();
        }

        out.println("요청 파라미터 이름 : " + paramName + "<br>");
        out.println("실제 파일 이름 : " + fileName + "<br>");
        out.println("저장 파일 이름 : " + originalName + "<br>");
        out.println("파일 컨텐츠 유형 : " + contentType + "<br>");
        out.println("파일 크기 : " + fileSize + "<br>");
    }
%>
</body>
</html>