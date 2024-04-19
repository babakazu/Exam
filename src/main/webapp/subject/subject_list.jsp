<%@ page import="java.util.List" %>
<%@ page import="bean.Subject" %>
<%@ page import="dao.SubjectDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Subject List</title>
</head>
<body>
    <h1>Subject List</h1>
    <table border="1">
        <tr>
            <th>School Code</th>
            <th>Code</th>
            <th>Name</th>
        </tr>
        <%
            SubjectDAO subjectDAO = new SubjectDAO();
            List<Subject> subjects = subjectDAO.getAllSubjects();
            for (Subject subject : subjects) {
        %>
            <tr>
                <td><%= subject.getSchoolCode() %></td>
                <td><%= subject.getCode() %></td>
                <td><%= subject.getName() %></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
