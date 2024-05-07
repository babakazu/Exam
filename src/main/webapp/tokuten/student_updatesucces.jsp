<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="../login/menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生一覧</title>
    <style>
        /* スタイルは省略 */
    </style>
</head>
<body>
    <h2>学生管理</h2>

    <div class="menu-links">
        <a href="student_insert.jsp">学生登録</a>
        <a href="student_update.jsp">学生変更</a>
        <a href="../grades/grades_insert.jsp">成績登録</a>
        <a href="../grades/grades_list.jsp">成績参照</a>
        <a href="../subject/subject_list.jsp">科目管理</a>
        <a href="../login/login-out.jsp">ログアウト</a>
    </div>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生変更完了</title>
</head>
<body>
    <h2>学生変更完了</h2>
    <p>学生情報が正常に変更されました。</p>
    <a href="student_list.jsp">学生一覧に戻る</a>
</body>
</html>
