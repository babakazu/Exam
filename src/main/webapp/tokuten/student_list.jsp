<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生一覧</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    .container {
        display: flex;
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .container-left {
        flex: 1;
        padding: 20px;
        background-color: #007bff;
        color: white;
        border-radius: 5px 0 0 5px;
    }

    .container-left ul {
        list-style-type: none;
        padding: 0;
    }

    .container-left li {
        margin-bottom: 10px;
    }

    .container-left button {
        display: block;
        width: 100%;
        padding: 10px;
        text-align: center;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .container-left button:hover {
        background-color: #0056b3;
    }

    .container-right {
        flex: 3;
        padding: 20px;
    }

    header {
        background-color: #007bff;
        color: white;
        padding: 10px 0;
        text-align: center;
        border-radius: 5px 5px 0 0;
    }
</style>
</head>
<body>
    <header>
        <h1>得点管理システム</h1>
    </header>
    <div class="container">
        <div class="container-left">
            <ul>
                <li><button onclick="location.href='../login/logout-in.jsp'">ログアウト</button></li>
                <li><button onclick="location.href='student_insert.jsp'">学生登録</button></li>
                <li><button onclick="location.href='student_update.jsp'">学生変更</button></li>
                <li><button onclick="location.href='../login/menu.jsp'">メインメニュー</button></li>
                <li><button onclick="location.href='record-grade.jsp'">成績登録</button></li>
                <li><button onclick="location.href='view-grade.jsp'">成績参照</button></li>
                <li><button onclick="location.href='manage-subject.jsp'">科目管理</button></li>
            </ul>
        </div>
        <div class="container-right">
            <h2>学生一覧</h2>
            <!-- ここに学生一覧を表示する処理を追加 -->
        </div>
    </div>
</body>
</html>
</html>