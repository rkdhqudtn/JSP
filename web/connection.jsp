<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-17
  Time: 오후 7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Database Connection</title>
</head>
<body>
<%
    Connection conn = null;
    try
    {
        String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        out.print("JDBC Success");
        System.out.println("JDBC Success");
    }
    catch (SQLException ex)
    {
        out.print("JDBC Fail");
        System.out.println("JDBC Fail");
        System.out.println("SQLException: " + ex.getMessage());
    }
    finally
    {
        if (conn != null)
            conn.close();
    }
%>
</body>
</html>
