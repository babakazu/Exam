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
        <form method="get" action="test_list.jsp">
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
            <input type="submit" value="検索">
        </form>
    </div>
    
    <h3>学生情報</h3>
    
    <div>
    <form method="get" action="test_list.jsp">
        <label for="No">学生番号</label>
        <input type="text" id="studentNo" name="studentNo" required><br>
        <input type="submit" value="検索">
    </form>
</div>
    <% 
    String studentNo = request.getParameter("studentNo");
    String classNum = request.getParameter("class_num");
    String subjectCd = request.getParameter("subject_cd");
    String no = request.getParameter("no");
    String entYear = request.getParameter("entYear");
    List<Test> grades = null; // 初期化を追加
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

    if (grades == null || grades.isEmpty()) { %>
        <p></p>
    <% } else { %>
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
                    <td><%= grade.getPoint() %></td>
                </tr>
            <% } %>
        </table>
    <% } %>

</body>
</html>
