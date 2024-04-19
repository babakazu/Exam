<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Subject</title>
</head>
<body>
    <h1>Update Subject</h1>
    <form action="updateSubject" method="post">
        Subject Code to Update: <input type="text" name="code"><br>
        New Subject Name: <input type="text" name="newName"><br>
        <input type="submit" value="Update">
    </form>
    <br>
    <a href="subject_list.jsp">Subject List</a>
    <a href="subject_insert.jsp">Insert Subject</a>
    <a href="subject_delete.jsp">Delete Subject</a>
</body>
</html>
