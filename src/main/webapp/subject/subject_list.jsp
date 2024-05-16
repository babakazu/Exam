<%@ page import="java.util.List" %>
<%@ page import="bean.Subject" %>
<%@ page import="dao.SubjectDAO" %>
<%@ include file="../login/menu.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>科目一覧</title>
</head>
<body>
    <div class="content">
        <h3 class="list-title">科目管理</h3>
        </div>
        <div class="shinki">
        <a href="student_insert.jsp">新規登録</a>
        </div>
        <a href="subject_insert.jsp" class="new-subject-link">新規登録</a>
        <div class="search-form2">
        <table class="subject-list-table">
            <tr>
                <th>科目コード</th>
                <th>科目名</th>
                <th>操作</th>
            </tr>
            <%
            SubjectDAO subjectDAO = new SubjectDAO();
            List<Subject> subjects = subjectDAO.getAllSubjects();
            for (Subject subject : subjects) {
            %>
            <tr>
                <td><%=subject.getCode()%></td>
                <td><%=subject.getName()%></td>
                <td>
                    <a href="updateSubject.jsp?oldSchoolCd=<%=subject.getSchoolCode()%>&currentSubjectCode=<%=subject.getCode()%>&oldName=<%=subject.getName()%>">変更</a>
                    <a href="subject_delete.jsp?schoolCd=<%=subject.getSchoolCode()%>&code=<%=subject.getCode()%>&name=<%=subject.getName()%>">削除</a>
                </td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>

<%@ include file="../footer.jsp"%>
