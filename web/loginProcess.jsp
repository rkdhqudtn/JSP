<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 7:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;

    try {
        Context init = new InitialContext();
        String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        if(rs.next()) {
            if(pass.equals(rs.getString("password"))) {
                session.setAttribute("id", id);

                out.println("<script>");
                out.println("location.href='main.jsp'");
                out.println("</script>");
            }
        }

        out.println("<script>");
        out.println("location.href='loginForm.jsp'");
        out.println("</script>");
    }catch (Exception e) {
        e.printStackTrace();
    }
%>