<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>得点管理システム</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
    }

    button {
        display: block;
        width: 100%;
        padding: 10px 20px;
        margin: 10px 0;
        font-size: 16px;
        color: #fff;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>得点管理システム</h1>
        <button onclick="location.href='logout.jsp'">ログアウト</button>
        <button onclick="location.href='register.jsp'">新規登録</button>
        <button onclick="location.href='main-menu.jsp'">メインメニュー</button>
        <button onclick="location.href='record-grade.jsp'">成績登録</button>
        <button onclick="location.href='view-grade.jsp'">成績参照</button>
        <button onclick="location.href='manage-subject.jsp'">科目管理</button>
    </div>
</body>
</html>