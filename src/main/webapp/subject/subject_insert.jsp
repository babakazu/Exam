<%@ page import="dao.SubjectDAO" %>
<%@ page import="bean.Subject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Subject</title>
</head>
<body>
    <h1>Insert Subject</h1>
    <form method="post" action="subject_insert.jsp">
        School Code: <input type="text" name="schoolCode"><br>
        Code: <input type="text" name="code"><br>
        Name: <input type="text" name="name"><br>
        <input type="submit" value="Submit">
    </form>
    <%
        if (request.getMethod().equals("POST")) {
            String schoolCode = request.getParameter("schoolCode");
            String code = request.getParameter("code");
            String name = request.getParameter("name");
            SubjectDAO subjectDAO = new SubjectDAO();
            Subject subject = new Subject(schoolCode, code, name);
            subjectDAO.insertSubject(subject);
            out.println("Subject inserted successfully.");
        }
    %>
</body>
</html>
