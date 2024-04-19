<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject Update</title>
</head>
<body>
    <h2>Subject Update Form</h2>
    <form action="UpdateSubjectServlet" method="post">
        <label for="oldSchoolCd">Old School Code:</label>
        <input type="text" id="oldSchoolCd" name="oldSchoolCd"><br><br>
        
        <label for="oldCd">Old Code:</label>
        <input type="text" id="oldCd" name="oldCd"><br><br>
        
        <label for="oldName">Old Name:</label>
        <input type="text" id="oldName" name="oldName"><br><br>
        
        <label for="schoolCd">New School Code:</label>
        <input type="text" id="schoolCd" name="schoolCd"><br><br>
        
        <label for="cd">New Code:</label>
        <input type="text" id="cd" name="cd"><br><br>
        
        <label for="name">New Name:</label>
        <input type="text" id="name" name="name"><br><br>
        
        <input type="submit" value="Update">
    </form>
</body>
</html>
