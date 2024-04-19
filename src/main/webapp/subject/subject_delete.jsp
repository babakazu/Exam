<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Subject</title>
</head>
<body>
    <h1>Delete Subject</h1>
    <form action="deleteSubject" method="post">
        Subject Code to Delete: <input type="text" name="code"><br>
        <input type="submit" value="Delete">
    </form>
    <br>
    <a href="subject_list.jsp">Subject List</a>
    <a href="subject_insert.jsp">Insert Subject</a>
    <a href="subject_update.jsp">Update Subject</a>
</body>
</html>
 