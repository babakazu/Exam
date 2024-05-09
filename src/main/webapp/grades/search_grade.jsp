<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import="bean.Test" %>
<%@ page import="bean.Student" %>
<%@ page import="dao.GradesDAO" %>
<%@ page import="dao.StudentDAO" %>
<%@page import="java.util.List"%>
<%@ include file="../login/menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績管理</title>
</head>
<body>

    <h3>成績管理</h3>

    <div>
        <form method="get" action="search_grade.jsp">
            <label for="entYear">入学年度:</label>
            <select id="entYear" name="entYear">
            <option value="2021">2021</option>
            <option value="2023">2022</option>
            <option value="2024">2023</option>
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
    String studentNo = request.getParameter("student_no");
    String classNum = request.getParameter("class_num");
    String subjectCd = request.getParameter("subject_cd");
    String no = request.getParameter("no");
    List<Test> grades;
    GradesDAO gradesDAO = new GradesDAO();
    StudentDAO studentDAO = new StudentDAO(); // StudentDAOをインスタンス化
    if ((studentNo != null && !studentNo.isEmpty()) || (classNum != null && !classNum.isEmpty()) || (subjectCd != null && !subjectCd.isEmpty()) || (no != null && !no.isEmpty())) {
        grades = gradesDAO.searchGrades(studentNo, classNum, subjectCd, no);
        if (!grades.isEmpty()) {
            // 入学年度を取得してgradesにセットする
            for (Test grade : grades) {
                Student student = studentDAO.getStudentByStudentNo(grade.getStudent_No());
                if (student != null) {
                    grade.setEnt_year(student.getEnt_year()); // 入学年度を設定
                }
            }
        }
    } else {
        grades = gradesDAO.getAllGrades();
    }

    if (grades.isEmpty()) { %>
        <p>成績情報が存在しません</p>
    <% } else { %>
        <p>検索結果: <%= grades.size() %>件</p>
        <table class="table-center" border="1">
            <tr>
                <th>入学年度</th>
                <th>科目コード</th>
                <th>学校コード</th>
                <th>回数</th>
                <th>得点</th>
                <th>クラス番号</th>
            </tr>
            <% for (Test grade : grades) { %>
                <tr>
                    <td><%= grade.getEnt_year() %></td>
                    <td><%= grade.getSubject_Cd() %></td>
                    <td><%= grade.getSchool_Cd() %></td>
                    <td><%= grade.getNo() %></td>
                    <td><%= grade.getPoint() %></td>
                    <td><%= grade.getClass_Num() %></td>
                </tr>
            <% } %>
        </table>
    <% } %>

</body>
</html>
