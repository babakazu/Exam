 <%@page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" type="text/css" href="../css/style.css">

<h2>成績管理</h2>

<div class="menu-links">
    <a href="student-registration.jsp">学生登録</a>
    <a href="student-update.jsp">学生変更</a>
    <a href="grade-registration.jsp">成績登録</a>
    <a href="grade-reference.jsp">成績参照</a>
    <a href="subject-management.jsp">科目管理</a>
    <a href="logout.jsp">ログアウト</a>
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
