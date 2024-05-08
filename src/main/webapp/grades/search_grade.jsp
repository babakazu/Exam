<!-- search_grade.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../login/menu.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績検索</title>
</head>
<body>
    <h2>成績検索</h2>
    <form action="/grades/SearchGradeServlet" method="post"> <!-- 正しいサーブレットのパスを指定 -->
        <label for="entYear">入学年度:</label>
        <input type="text" id="entYear" name="entYear"><br><br>
        
        <label for="classNum">クラス:</label>
        <input type="text" id="classNum" name="classNum"><br><br>
        
        <label for="subjectCd">科目:</label>
        <input type="text" id="subjectCd" name="subjectCd"><br><br>
        
        <label for="count">回数:</label>
        <input type="text" id="count" name="count"><br><br>
        
        <input type="submit" value="検索">
    </form>
    
    <hr>
    
    <h2>成績検索結果</h2>
    <table border="1">
        <tr>
            <th>入学年度</th>
            <th>クラス</th>
            <th>学生番号</th>
            <th>氏名</th>
            <th>点数</th>
        </tr>
        <% 
            List<Map<String, Object>> resultsList = (List<Map<String, Object>>) request.getAttribute("resultsList");
            if (resultsList != null && !resultsList.isEmpty()) {
                for (Map<String, Object> row : resultsList) {
                    String entYear = (String) row.get("ENT_YEAR");
                    String classNum = (String) row.get("CLASS_NUM");
                    String no = (String) row.get("NO");
                    String name = (String) row.get("NAME");
                    String point = (String) row.get("POINT"); // 点数はString型として扱う
        %>
        <tr>
            <td><%= entYear %></td>
            <td><%= classNum %></td>
            <td><%= no %></td>
            <td><%= name %></td>
            <td><%= point %></td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr>
            <td colspan="5">検索結果はありません</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
