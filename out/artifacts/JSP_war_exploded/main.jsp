<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 7:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = null;

    if(session.getAttribute("id")!=null){
        id = (String)session.getAttribute("id");
    }else{
        out.println("<script>");
        out.println("location.href='loginForm.jsp'");
        out.println("</script>");
    }
%>
<html>
<head>
    <title>회원관리 시스템 메인 페이지</title>
</head>
<body>
<h3><%=id %>로 로그인하셨습니다.</h3>
<%if(id.equals("admin")){%>
<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
<%}%>
</body>
</html>
