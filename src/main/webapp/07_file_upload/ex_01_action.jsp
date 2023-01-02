<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setCharacterEncoding("UTF-8");

  String realPath = request.getServletContext().getRealPath("resources/images");
  out.println(realPath + "<br>");
  File dir = new File(realPath);

  if (!dir.exists()) {
    dir.mkdirs();
  }

  DiskFileUpload upload = new DiskFileUpload();
  List items = upload.parseRequest(request);
  Iterator params = items.iterator();

  String fileName = null;
  while (params.hasNext()) {
    FileItem fileItem = (FileItem) params.next();
    if (!fileItem.isFormField()) {
      fileName = fileItem.getName();
      fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
      File file = new File(realPath + "/" + fileName);
      fileItem.write(file);
    }
  }
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
  <img src="${pageContext.request.contextPath}/resources/images/<%=fileName%>">
  <%-- 이거 안됨 맥이라서 다름--%>
</body>
</html>
