<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Test, bean.Student, dao.GradesDAO, dao.StudentDAO"%>
<%@page import="java.util.List"%>
<%@ include file="../login/menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績管理</title>
</head>
<body>

    <div class="content">
        <h3 class="list-title">成績管理</h3>

    <div class="search-form"> 
        <form method="get" action="search_grade.jsp">
            <label for="entYear">入学年度:</label>
            <select id="entYear" name="entYear">
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
            </select><br><br>
            <label for="class_num">クラス番号:</label>
            <select id="class_num" name="class_num">
                <option value="201">201</option>
                <option value="131">131</option>
                <option value="101">101</option>
            </select><br><br> 
            <label for="subject_cd">科目</label>
            <input type="text" id="subject_cd" name="subject_cd" required><br>
            <label for="no">回数</label>
            <input type="number" id="no" name="no" required><br>
            <input type="submit" value="検索">
        </form>
    </div>
    <% 
    String studentNo = request.getParameter("studentNo");
    String classNum = request.getParameter("class_num");
    String subjectCd = request.getParameter("subject_cd");
    String no = request.getParameter("no");
    String entYear = request.getParameter("entYear");
    String Point = request.getParameter("Point");
    List<Test> grades;
    GradesDAO gradesDAO = new GradesDAO();
    StudentDAO studentDAO = new StudentDAO();
    if ((studentNo != null && !studentNo.isEmpty()) || (classNum != null && !classNum.isEmpty()) || (subjectCd != null && !subjectCd.isEmpty()) || (no != null && !no.isEmpty()) || (entYear != null && !entYear.isEmpty())) {
        grades = gradesDAO.searchGrades(studentNo, classNum, subjectCd, no, entYear);
        if (!grades.isEmpty()) {
            for (Test grade : grades) {
                Student student = studentDAO.getStudentByStudentNo(grade.getStudent_No());
                if (student != null) {
                    grade.setEnt_year(student.getEnt_year());
                    grade.setNo(student.getNo());
                    grade.setName(student.getName());
                }
            }
        }
    } else {
        grades = gradesDAO.getAllGrades();
    }

    if (grades.isEmpty()) { %>
    <p>成績情報が存在しません</p>
    <% } else { %>
    <form method="post" action="/test/main/UpdateGradesServlet">
    </form>
    <div class="back-button2">
        <a href = "grades_succes.jsp">登録</a>
        </div>
        <div class="search results">
        <p>
            <% if (subjectCd != null && !subjectCd.isEmpty()) { %>
            科目: <%= subjectCd %>（<%= no %>回）
            <% } %>
        </p>
        </div>
        <table class="table-center" border="1">
            <tr>
                <th>入学年度</th>
                <th>クラス</th>
                <th>学生番号</th>
                <th>氏名</th>
                <th>点数</th>
            </tr>
            <% for (Test grade : grades) { %>
            <tr>
                <td><%= grade.getEnt_year() %></td>
                <td><%= grade.getClass_Num() %></td>
                <td><%= grade.getNo() %></td>
                <td><%= grade.getName() %></td>
                <td><input type="number" name="point" value="<%= grade.getPoint() %>" min="0" max="100"></td>
            </tr>
            <% } %>
        </table>
    </form>
    <% } %>

</div>
</body>
</html>