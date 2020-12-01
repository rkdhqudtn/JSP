<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 7:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.xml.crypto.Data" %>
<%
    request.setCharacterEncoding("euc-kr");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");

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

        pstmt = conn.prepareStatement("INSERT INTO member VALUES (?,?,?,?,?,?)");
        pstmt.setString(1, id);
        pstmt.setString(2, pass);
        pstmt.setString(3, name);
        pstmt.setInt(4, age);
        pstmt.setString(5, gender);
        pstmt.setString(6, email);
        int result = pstmt.executeUpdate();

        if(result!=0) {
            out.println("<script>");
            out.println("location.href='loginForm.jsp'");
            out.println("</script>");
        }else {
            out.println("<script>");
            out.println("location.href='joinForm.jsp'");
            out.println("</script>");
        }
    }catch(Exception e){
        e.printStackTrace();
    }
%>