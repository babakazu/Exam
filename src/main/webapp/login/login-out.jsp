<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Teacher" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
%>

<link rel="stylesheet" type="text/css" href="../css/login-style.css">
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ユーザー情報</title>
</head>
<body>
    <h1>おいコラ、<%= teacher.getName() %> 。</h1>
    <a href="menu.jsp">メニューへ</a>
</body>
</html>
