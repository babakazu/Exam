<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.Grades" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績入力</title>
</head>
<body>
    <h1>成績入力</h1>
    <form action="/test/grades/SearchGradeServlet" method="post">
        <label for="entYear">入学年度:</label>
        <input type="text" id="entYear" name="entYear"><br>
        <label for="classNum">クラス番号:</label>
        <input type="text" id="classNum" name="classNum"><br>
        <input type="submit" value="検索">
    </form>

    <c:if test="${not empty students}">
        <h2>検索結果:</h2>
        <table border="1">
            <tr>
                <th>入学年度</th>
                <th>クラス</th>
                <th>学籍番号</th>
                <th>氏名</th>
                <th>点数</th>
            </tr>
            <c:forEach var="grade" items="${grades}">
                <tr>
                    <td>${grade.entYear}</td>
                    <td>${grade.classNum}</td>
                    <td>${grade.studentNo}</td>
                    <td>${grade.studentName}</td>
                    <td><input type="text" name="point_${grade.studentNo}" value=""></td>
                </tr>
            </c:forEach>
        </table>
        <input type="submit" value="点数入力">
    </c:if>
</body>
</html>