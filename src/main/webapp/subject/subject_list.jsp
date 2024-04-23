<%@ page import="java.util.List" %>
<%@ page import="bean.Subject" %>
<%@ page import="dao.SubjectDAO" %>
<%@ include file="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目一覧</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/subject-list.css"> <!-- 追加 -->
</head>
<body>
    <a href="../login/menu.jsp">メインメニュー</a>
    <a href="subject_insert.jsp">科目追加</a>
    <a href="subject_delete.jsp">科目削除</a>
    <a href="updateSubject.jsp">科目変更</a>
    <a href="../login/logout-in.jsp">ログアウト</a>　
    <div class="subject-list-container"> <!-- 追加 -->
        <h1>科目一覧</h1>
        <table class="subject-list-table"> <!-- 追加 -->
            <tr>
                <th>科目コード</th>
                <th>科目名</th>
            </tr>
            <%
                SubjectDAO subjectDAO = new SubjectDAO();
                List<Subject> subjects = subjectDAO.getAllSubjects();
                for (Subject subject : subjects) {
            %>
                <tr>
                    <td><%= subject.getCode() %></td>
                    <td><%= subject.getName() %></td>
                </tr>
            <%
                }
            %>
        </table>
    </div> <!-- 追加 -->
</body>
</html>
<%@ include file="../footer.jsp" %>
