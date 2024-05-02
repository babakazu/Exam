<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Student" %>
<%@ page import="dao.StudentDAO" %>
<%@page import="java.util.List"%>
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

    <h3>学生一覧</h3>

    <div>
        <form method="get" action="student_list.jsp">
            <label for="entYear">入学年度:</label>
            <input type="text" id="entYear" name="entYear">
            <label for="classNum">クラス番号:</label>
            <input type="text" id="classNum" name="classNum">
            <label for="isAttend">出席状況:</label>
            <select id="isAttend" name="isAttend">
            <option value="TRUE">〇</option>
            <option value="FALSE">×</option>
            </select>
            <input type="submit" value="検索">
        </form>
    </div>
    
    <% 
        String entYear = request.getParameter("entYear");
        String classNum = request.getParameter("classNum");
        String isAttend = request.getParameter("isAttend");
        List<Student> students;
        StudentDAO studentDAO = new StudentDAO();
        if ((entYear != null && !entYear.isEmpty()) || (classNum != null && !classNum.isEmpty()) || (isAttend != null && !isAttend.isEmpty())) {
            students = studentDAO.searchStudents(entYear, classNum, "TRUE".equals(isAttend));
        } else {
            students = studentDAO.getAllStudents();
        }
        
        if (students.isEmpty()) { %>
            <p>学生情報が存在しません</p>
        <% } else { %>
            <table border="1">
                <tr>
                    <th>学籍番号</th>
                    <th>名前</th>
                    <th>入学年度</th>
                    <th>クラス番号</th>
                    <th>出席状況</th>
                    <th>学校コード</th>
                </tr>
                <% for (Student student : students) { %>
    <tr>
        <td><%= student.getNo() %></td>
        <td><%= student.getName() %></td>
        <td><%= student.getEnt_year() %></td>
        <td><%= student.getClass_num() %></td>
        <td><%= student.getIs_attend().equals("TRUE") ? "〇" : "×" %></td>
        <td><%= student.getSchool_cd() %></td>
        <td><a href="student_update.jsp?no=<%= student.getNo() %>&entYear=<%= student.getEnt_year() %>">変更</a></td>
    </tr>
<% } %>
            </table>
        <% } %>
</body>
</html>

