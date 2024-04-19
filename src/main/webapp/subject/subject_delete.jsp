<%@ page import="dao.SubjectDAO" %>
<%@ page import="bean.Subject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Subject</title>
</head>
<body>
    <h1>Delete Subject</h1>
    <form method="post" action="subject_delete.jsp">
        School Code: <input type="text" name="schoolCode"><br>
        Code: <input type="text" name="code"><br>
        <input type="submit" value="Delete">
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
