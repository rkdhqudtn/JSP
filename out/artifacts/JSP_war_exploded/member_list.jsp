<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 7:42
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

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try{
        Context init = new InitialContext();
        String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        pstmt = conn.prepareStatement("SELECT * FROM member");
        rs = pstmt.executeQuery();
    }catch (Exception e){
        e.printStackTrace();
    }

%>
<html>
<head>
    <title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
<div style="text-align: center;">
<table border="1" width="300">
    <tr align="center"><td colspan="2">회원 목록</td></tr>
    <%while(rs.next()){%>
    <tr align="center">
        <td>
            <a href="member_info.jsp?id=<%=rs.getString("id")%>">
                <%=rs.getString("id")%>
            </a>
        </td>
        <td><a href="member_delete.jsp?id=<%=rs.getString("id")%>">삭제</a></td>
    </tr>
    <%} %>
</table>
</div>
</body>
</html>
