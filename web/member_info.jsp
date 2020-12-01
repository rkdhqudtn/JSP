<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 7:49
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

    String info_id = request.getParameter("id");

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

        pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
        pstmt.setString(1, info_id);
        rs = pstmt.executeQuery();
        rs.next();
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
<div style="text-align: center;">
<table border="1" width="300">
    <tr align="center"><td>아이디:</td><td><%=rs.getString("id")%></td></tr>
    <tr align="center"><td>비밀번호:</td><td><%=rs.getString("password")%></td></tr>
    <tr align="center"><td>이름:</td><td><%=rs.getString("name")%></td></tr>
    <tr align="center"><td>나이:</td><td><%=rs.getString("age")%></td></tr>
    <tr align="center"><td>성별:</td><td><%=rs.getString("gender")%></td></tr>
    <tr align="center"><td>이메일 주소:</td><td><%=rs.getString("email")%></td></tr>
    <tr align="center">
        <td colspan="2"><a href="member_list.jsp">리스트로 돌아가기</a></td>
    </tr>
</table>
</div>
</body>
</html>
