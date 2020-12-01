<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 7:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
    String id = null;

    if((session.getAttribute("id")==null) ||
            (!((String)session.getAttribute("id")).equals("admin"))){
        out.println("<script>");
        out.println("location.href='loginForm.jsp'");
        out.println("</script>");
    }

    String delete_id = request.getParameter("id");

    Connection conn=null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try{
        Context init = new InitialContext();
        String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        pstmt = conn.prepareStatement("DELETE FROM member WHERE id=?");
        pstmt.setString(1, delete_id);
        pstmt.executeUpdate();

        out.println("<script>");
        out.println("location.href='member_list.jsp'");
        out.println("</script>");
    }catch (Exception e){
        e.printStackTrace();
    }
%>