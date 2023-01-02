<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String passwd = request.getParameter("passwd");
        String name = request.getParameter("name");

        ResultSet rs = null;
        PreparedStatement pstmt = null; // PreparedStatement 참조변수를 null로 초기화.
        try {
            // member 테이블의 폼 페이지에서 전송된 id와 일치하는 레코드를 찾아 id, passwd 필드 값을 가져오도록 SELECT 문을 작성.
            String sql = "select id, passwd from member where id = ?";
            // Statement 객체를 생성하도록 createStatement() 메서드를 작성.
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery(); // INSERT문을 실행하도록 PreparedStatement 객체의 executeUpdate() 메서드를 작성.

            // select 문으로 가져온 레코드가 있으면 실행.
            if (rs.next()) {
                String rId = rs.getString("id");
                String rPasswd = rs.getString("passwd");

                if (id.equals(rId) && passwd.equals(rPasswd)) {
                    // member 테이블에서 폼 페이지로 부터 전송된 id와 일치하는 레코드를 찾아
                    // name 필드 값을 변경하도록 UPDATE문을 작성.
                    sql = "update member set name = ? where id = ?";
                    // statememt 객체를 생성하도록 createStatement() 메서드를 작성.
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, id);
                    // UPDATE 문을 실행하도록 Statement 객체의 executeUpdate() 메서드를 작성.
                    pstmt.executeUpdate();
                    out.println("Member 테이블을 수정했습니다.");
                } else
                    out.println("일치하는 비밀번호가 아닙니다.");
            } else
                out.println("Member 테이블에 일치하는 아이디가 없습니다.");
        } catch (SQLException ex) {
            out.println("SQLException: " + ex.getMessage());
        } finally {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        }
    %>
</body>
</html>
