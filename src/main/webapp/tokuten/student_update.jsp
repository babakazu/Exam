<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Student" %>
<%@ page import="dao.StudentDAO" %>
<%@page import="java.util.List"%>
<%@ include file="../login/menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報変更</title>
    <style>
        /* スタイルは省略 */
    </style>
</head>
<body>
    <h2>学生情報変更</h2>

    <div>
        <form method="post" action="/test/main/StudentUpdateServlet" onsubmit="return validateForm()">
            <input type="hidden" name="no" value="<%= request.getParameter("no") %>">
            <input type="hidden" name="entYear" value="<%= request.getParameter("entYear") %>">
            <label for="no">学籍番号:</label>
            <span id="noLabel"></span><br>
            <label for="entYear">入学年度:</label>
            <span id="entYearLabel"></span><br>
            <label for="name">氏名:</label>
            <input type="text" id="name" name="name">
            <label for="classNum">クラス番号:</label>
            <input type="text" id="classNum" name="classNum">
            <label for="isAttend">出席状況:</label>
            <label for="isAttend">出席状況:</label>
            <select id="isAttend" name="isAttend">
            <option value="〇">〇</option>
            <option value="×">×</option>
            </select>
            <input type="submit" value="変更">
        </form>
    </div>

    <script>
        document.getElementById("noLabel").textContent = "<%= request.getParameter("no") %>";
        document.getElementById("entYearLabel").textContent = "<%= request.getParameter("entYear") %>";

        function validateForm() {
            var name = document.getElementById("name").value;
            var classNum = document.getElementById("classNum").value;
            if (name.trim() === "" || classNum.trim() === "") {
                alert("氏名とクラス番号の両方を入力してください");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
