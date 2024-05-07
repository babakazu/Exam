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
        <label for="oldCd">現在の科目コード:</label>
        <% String cd = request.getParameter("currentSubjectCode"); %>
        <input type="text" id="oldCd" name="oldCd" value="<%= cd %>" readonly><br><br>
        
        <label for="name">新しい科目名:</label>
        <input type="text" id="name" name="name"><br><br>
        
        <input type="hidden" id="oldSchoolCd" name="oldSchoolCd" value="${oldSchoolCd}">
        
        <input type="submit" value="変更">
    </form>
</body>
</html>