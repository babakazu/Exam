<%@page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" type="text/css" href="../css/style.css">

<h2>学生管理</h2>

<div class="container">
    <div class="container-left">
        <ul>
            <li><button onclick="location.href='../login/menu.jsp'">メインメニュー</button></li>
            <li><button onclick="location.href='student_insert.jsp'">学生一覧</button></li>
            <li><button onclick="location.href='student_update.jsp'">学生変更</button></li>
            <li><button onclick="location.href='../grades/grades_insert.jsp'">成績登録</button></li>
            <li><button onclick="location.href='../grades/grades_list.jsp'">成績参照</button></li>
            <li><button onclick="location.href='manage-subject.jsp'">科目管理</button></li>
            <li><button onclick="location.href='../login/logout-in.jsp'">ログアウト</button></li>
        </ul>
    </div>
    <div class="container-right">
        <h2>学生登録フォーム</h2>
        <form action="register-student-process.jsp" method="post">
            <label for="enrollmentYear">入学年度:</label>
            <input type="number" id="enrollmentYear" name="enrollmentYear" required><br>
            <label for="studentNumber">学生番号:</label>
            <input type="text" id="studentNumber" name="studentNumber" required><br>
            <label for="name">氏名:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="class">クラス:</label>
            <input type="text" id="class" name="class" required><br>
            <input type="submit" value="登録">
            <input type="button" value="戻る" onclick="location.href='student-list.jsp'">
        </form>
    </div>
</div>