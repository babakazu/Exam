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
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <div class="content">
        <h3 class="list-title">学生一覧</h3>
        
        <div class="shinki">
        <a href="student_insert.jsp">新規登録</a>
        </div>
        

<div class="search-form">   
        <form method="get" action="student_list.jsp">
        <div class="form-group">
            <label for="entYear">入学年度:</label>
            <br>
            <select id="entYear" name="entYear">
            <option value="2021">2021</option>
            <option value="2023">2022</option>
            <option value="2024">2023</option>
            </select>
            </div>
            <div class="form-group class-number">
            <label for="classNum">クラス番号:</label>
            <br>
            <select id="classNum" name="classNum">
            <option value="201">201</option>
            <option value="131">131</option>
            <option value="101">101</option>
            </select>
            </div>
            <div class="form-group">
            <label for="isAttend">在学中</label>
            <input type="checkbox" id="isAttend" name="isAttend" value="TRUE">
            <input type="hidden" name="isAttend" value="FALSE">
            </div>
            <div class="form-group">
            <input type="submit" value="絞込み">
            </div>
        </form>
    </div>
    
    <div class="search-results">
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
        <p>検索結果: <%= students.size() %>件</p>
            <table class="table-center" border="1">
                <tr>
                    <th>学生番号</th>
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
        </div>
        </div>
        
        
</body>
</html>

