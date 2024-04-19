<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Subject</title>
</head>
<body>
    <h1>Insert Subject</h1>
    <form action="insertSubject" method="post">
        School Code: <input type="text" name="schoolCode"><br>
        Subject Code: <input type="text" name="code"><br>
        Subject Name: <input type="text" name="name"><br>
        <input type="submit" value="Insert">
    </form>
    <br>
    <a href="subject_list.jsp">Subject List</a>
    <a href="subject_delete.jsp">Delete Subject</a>
    <a href="subject_update.jsp">Update Subject</a>
</body>
</html>
