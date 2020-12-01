<%--
  Created by IntelliJ IDEA.
  User: 전병수
  Date: 2020-11-19
  Time: 오후 7:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원관리 시스템 회원가입 페이지</title>
</head>
<body>
<form name="joinform" action="joinProcess.jsp" method="post">
<div style="text-align: center;">
<table border="1">
    <tr>
        <td colspan="2" align="center">
            <b><span style="font-size: large; ">회원가입 페이지</span></b>
        </td>
    </tr>
    <tr><td>아이디:</td><td><input type="text" name="id"/></td></tr>
    <tr><td>비밀번호:</td><td><input type="password" name="pass"/></td></tr>
    <tr><td>이름:</td><td><input type="text" name="name"/></td></tr>
    <tr><td>나이:</td><td><input type="text" name="age" maxlength="2" size="5"/></td></tr>
    <tr>
        <td>성별:</td>
        <td>
            <input type="radio" name="gender" value="남" checked/>남자
            <input type="radio" name="gender" value="여"/>여자
        </td>
    </tr>
    <tr><td>이메일 주소:</td><td><input type="text" name="email" size="30"/></td></tr>
    <tr>
        <td colspan="2" align="center">
            <a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
            <a href="javascript:joinform.reset()">다시작성</a>
        </td>
    </tr>
</table>
</div>
</form>
</body>
</html>