<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ include file="../login/menu.jsp" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>成績参照</title>
</head>
<body>
    <h2>成績参照</h2>
    <form action="/grades/SearchGradeServlet" method="post"> <!-- 正しいサーブレットのパスを指定 -->
    
    <h3>科目情報</h3>
     <form action="/grades/SearchGradeServlet" method="post">
        <label for="entYear">入学年度:</label>
        <select id="entYear" name="entYear">
            <% 
                int currentYear = Calendar.getInstance().get(Calendar.YEAR);
                for (int year = currentYear - 3; year <= currentYear; year++) {
            %>
                <option value="<%= year %>"><%= year %></option>
            <% } %>
        </select><br><br>
        
        <label for="classNum">クラス:</label>
        <select id="entYear" name="entYear">
            <option value="201">201</option>
            <option value="131">131</option>
            <option value="101">101</option>
        </select><br><br>
        <label for="subjectCd">科目:</label>
        <select id="additionalSubject" name="additionalSubject">
    <option value="国語">国語</option>
    <option value="理科">理科</option>
    <option value="情報処理基礎知識Ⅰ">情報処理基礎知識Ⅰ</option>
    <option value="英語コミュニケーション概論">英語コミュニケーション概論</option>
    <option value="Javaフレームワーク">Javaフレームワーク</option>
    <option value="Git">Git</option>
    <option value="H2">H2</option>
    <option value="ID管理術">ID管理術</option>
    <option value="Javaシステム開発">Javaシステム開発</option>
    <option value="AWS">AWS</option>
    <option value="Bean">Bean</option>
    <option value="C言語">C言語</option>
    <option value="DB">DB</option>
    <option value="エラー対処術">エラー対処術</option>
    <option value="Flutter">Flutter</option>
    <option value="Go言語">Go言語</option>
    <option value="ハードウエア">ハードウエア</option>
    <option value="IT概論">IT概論</option>
    <option value="Java基礎">Java基礎</option>
    <option value="科目1">科目1</option>
    <option value="科目2">科目2</option>
    <option value="科目3">科目3</option>
    <option value="科目4">科目4</option>
    <option value="科目5">科目5</option>
</select>    
        <input type="submit" value="検索">
    </form>
    
    
    <h3>学生情報</h3>
    <form action="/grades/SearchGradeServlet" method="post">
    <label for="entYear">学生番号:</label>
            <input type="text" id="class_num" name="class_num">
            <input type="submit" value="検索">
</body>
</html>