<%@page contentType="text/html; charset=UTF-8" %>


<h2>学生管理</h2>

<div class="menu-links">
    <a href="student-registration.jsp">学生登録</a>
    <a href="student-update.jsp">学生変更</a>
    <a href="grade-registration.jsp">成績登録</a>
    <a href="grade-reference.jsp">成績参照</a>
    <a href="subject-management.jsp">科目管理</a>
    <a href="logout.jsp">ログアウト</a>
</div>

    <div class="container-right">
        <h2>学生変更フォーム</h2>
        <form action="edit-student-process.jsp" method="post">
            <!-- 変更前の学生情報を表示 -->
            <label for="enrollmentYear">入学年度:</label>
            <input type="number" id="enrollmentYear" name="enrollmentYear" value="入学年度を取得して設定" required><br>
            <label for="studentNumber">学生番号:</label>
            <input type="text" id="studentNumber" name="studentNumber" value="学生番号を取得して設定" required><br>
            <label for="name">氏名:</label>
            <input type="text" id="name" name="name" value="氏名を取得して設定" required><br>
            <label for="class">クラス:</label>
            <input type="text" id="class" name="class" value="クラスを取得して設定" required><br>
            <!-- 編集内容を入力するためのフォーム -->
            <label for="newEnrollmentYear">新しい入学年度:</label>
            <input type="number" id="newEnrollmentYear" name="newEnrollmentYear" required><br>
            <label for="newStudentNumber">新しい学生番号:</label>
            <input type="text" id="newStudentNumber" name="newStudentNumber" required><br>
            <label for="newName">新しい氏名:</label>
            <input type="text" id="newName" name="newName" required><br>
            <label for="newClass">新しいクラス:</label>
            <input type="text" id="newClass" name="newClass" required><br>
            <input type="submit" value="変更">
            <input type="button" value="戻る" onclick="location.href='student-list.jsp'">
        </form>
    </div>
</div