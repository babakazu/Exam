<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Student" %>
<%@ page import="dao.StudentDAO" %>
<%@ include file="../login/menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登録フォーム</title>
</head>
<body>
    <div class="content">
        <h3 class="list-title">学生登録フォーム</h3>
        <div class="search-form">
    <form method="post" action="/test/main/Student_Insert">
        <label for="ent_year">入学年度:</label><br>
        <input type="number" id="ent_year" name="ent_year" required><br>
        <label for="no">学籍番号:</label><br>
        <input type="text" id="no" name="no" required><br>
        <label for="name">氏名:</label><br>
        <input type="text" id="name" name="name" required><br>
        <label for="class_num">クラス:</label><br>
        <input type="text" id="class_num" name="class_num" required><br><br>
        
        <input type="submit" value="登録"><br><br>
        <input type="button" value="戻る" onclick="location.href='student_list.jsp'">
    </form>
    
    <%-- 学生情報の登録処理 --%>
    <%
        if (request.getMethod().equals("POST")) {
            String no = request.getParameter("no");
            String name = request.getParameter("name");
            String ent_year = request.getParameter("ent_year");
            String class_num = request.getParameter("class_num");
            StudentDAO studentDAO = new StudentDAO();
            studentDAO.insertStudent(no , name , ent_year ,class_num );
        }
    %>
  
    </div>
    </div>
</body>
</html>

