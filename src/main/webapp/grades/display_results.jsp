<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績一覧</title>
</head>
<body>
    <h1>成績一覧</h1>
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
            if (resultsList != null) {
                for (Map<String, Object> row : resultsList) {
                    String entYear = (String) row.get("ENT_YEAR");
                    String classNum = (String) row.get("CLASS_NUM");
                    String no = (String) row.get("NO");
                    String name = (String) row.get("NAME");
                    int point = (int) row.get("POINT");
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
            <td colspan="5">該当する成績がありません。</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
