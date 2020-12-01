<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 6:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원관리 시스템 로그인 페이지</title>
</head>
<body>
<form name="loginform" action="loginProcess.jsp" method="post">
<div style="text-align: center;">
<table border=1>
    <tr>
        <td colspan="2" align="center">
            <b><span style="font-size: large;">로그인 페이지</span></b>
        </td>
    </tr>
    <tr><td>아이디:</td><td><input type="text" name="id"/></td></tr>
    <tr><td>비밀번호:</td><td><input type="password" name="pass"/></td></tr>
    <tr>
        <td colspan="2" align="center">
            <a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
            <a href="joinForm.jsp">회원가입</a>
        </td>
    </tr>
</table>
</div>
</form>
</body>
</html>
