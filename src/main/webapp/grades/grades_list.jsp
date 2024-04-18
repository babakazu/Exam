<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績管理</title>
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

    .container-left a {
        display: block;
        padding: 10px;
        text-align: center;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        text-decoration: none;
    }

    .container-left a:hover {
        background-color: #0056b3;
    }

    .container-right {
        flex: 3;
        padding: 20px;
    }

    input[type="number"], input[type="text"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    header {
        background-color: #007bff;
        color: white;
        padding: 10px 0;
        text-align: center;
        border-radius: 5px 5px 0 0;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <header>
        <h1>成績管理システム</h1>
    </header>
    <div class="container">
        <div class="container-left">
            <ul>
                <li><a href="../login/menu.jsp">メインメニュー</a></li>
                <li><a href="../tokuten/student_list.jsp">学生一覧</a></li>
                <li><a href="../tokuten/student_insert.jsp">学生登録</a></li>
                <li><a href="../tokuten/student_update.jsp">学生登録</a></li>
                <li><a href="grades_insert.jsp">成績登録</a></li>
                <li><a href=".jsp">成績参照</a></li>
                <li><a href="">科目管理</a></li>
                 <li><a href="../login/menu.jsp">ログアウト</a></li>
            </ul>
        </div>
        <div class="container-right">
            <h2>成績検索</h2>
            <form action="search-grade.jsp" method="get">
                <label for="enrollmentYear">入学年度:</label>
                <input type="number" id="enrollmentYear" name="enrollmentYear"><br>
                <label for="className">クラス:</label>
                <input type="text" id="className" name="className"><br>
                <label for="subject">科目:</label>
                <input type="text" id="subject" name="subject"><br>
                <label for="examNumber">回数:</label>
                <input type="number" id="examNumber" name="examNumber"><br>
                <input type="submit" value="検索">
            </form>
            <!-- 検索結果を表示する部分 -->
            <!-- 検索結果のテーブルなどを表示 -->
        </div>
    </div>
</body>
</html>
