<%@ page import="dao.SubjectDAO" %>
<%@ page import="bean.Subject" %>
<%@ include file="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除</title>
</head>
<body>


    <h1>科目削除</h1>
    <form method="post" action="subject_delete.jsp">
        学校コード: <input type="text" name="schoolCode"><br>
        科目コード: <input type="text" name="code"><br>
        <input type="submit" value="削除">
    </form>
    <%
        if (request.getMethod().equals("POST")) {
            String schoolCode = request.getParameter("schoolCode");
            String code = request.getParameter("code");
            SubjectDAO subjectDAO = new SubjectDAO();
            subjectDAO.deleteSubject(schoolCode, code);
            out.println("Subject deleted successfully.");
        }
    %>
</body>
</html>
<%@ include file="../footer.jsp" %>