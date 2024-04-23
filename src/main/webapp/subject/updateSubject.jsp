<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>科目更新</title>
</head>
<body>

	
    <h2>科目更新フォーム</h2>
    <form action="UpdateSubjectServlet" method="post">
        <label for="oldSchoolCd">現在の学校コード:</label>
        <input type="text" id="oldSchoolCd" name="oldSchoolCd"><br><br>
        
        <label for="oldCd">現在の科目コード:</label>
        <input type="text" id="oldCd" name="oldCd"><br><br>
        
        <label for="oldName">現在の科目名:</label>
        <input type="text" id="oldName" name="oldName"><br><br>
        
        <label for="schoolCd">新しい学校コード:</label>
        <input type="text" id="schoolCd" name="schoolCd"><br><br>
        
        <label for="cd">新しい科目コード:</label>
        <input type="text" id="cd" name="cd"><br><br>
        
        <label for="name">新しい科目名:</label>
        <input type="text" id="name" name="name"><br><br>
        
        <input type="submit" value="Update">
    </form>
</body>
</html>
