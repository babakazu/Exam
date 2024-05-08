<%@page import="javax.servlet.RequestDispatcher" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Subject" %>
<%@ page import="dao.SubjectDAO" %>
<%@ include file="../login/menu.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>変更完了</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <div class="container">
        <h1>変更が完了しました</h1>
        <p><a href="subject_list.jsp">科目一覧に戻る</a></p>
    </div>
</body>
</html>
