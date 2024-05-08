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
        
        <%-- oldSchoolCd を hidden input として追加 --%>
        <% String oldSchoolCd = request.getParameter("oldSchoolCd"); %>
        <input type="hidden" id="oldSchoolCd" name="oldSchoolCd" value="<%= oldSchoolCd %>">
        
        <%-- 学校コードの値は非表示にする --%>
        <input type="hidden" id="schoolCd" name="schoolCd" value="<%= oldSchoolCd %>">
        
        <%-- 現在の科目コード（CD）をhidden inputとしてフォームに追加 --%>
        <input type="hidden" id="cd" name="cd" value="<%= cd %>">
        
        <input type="submit" value="変更">
    </form>
</body>
</html>
