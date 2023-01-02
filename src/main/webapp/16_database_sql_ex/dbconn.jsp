<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    String url = "jdbc:mariadb://localhost:3306/sample";
    String user = "root";
    String password = "9834";

    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
%>