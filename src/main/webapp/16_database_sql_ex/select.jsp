<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <style>
        td { text-align: center}
    </style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<table border="1">
    <tr>
        <th>학번</th>
        <th style="width: 70px;">학과</th>
        <th style="width: 50px;">이름</th>
        <th style="width: 50px;">주소</th>
        <th style="width: 120px">연락처</th>
    </tr>

    <%
        ResultSet rs = null;
        Statement stmt = null;

        try {
            String sql = "SELECT * FROM student";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String num = rs.getString("num");
                String depart = rs.getString("depart");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
    %>
    <tr>
        <td><%=num%></td>
        <td><%=depart%></td>
        <td><%=name%></td>
        <td><%=address%></td>
        <td><%=phone%></td>
    </tr>
    <%
            }
        } catch (SQLException ex) {
            out.println("Member 테이블 호출이 실패했습니다.<br>");
            out.println("SQLException: " + ex.getMessage());
        } finally {
            // 생성한 객체를 해제.
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</table>

</body>
</html>
