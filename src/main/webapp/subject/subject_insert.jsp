<%@ page import="dao.SubjectDAO" %>
<%@ page import="bean.Subject" %>
<%@ include file="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目追加</title>
</head>
<body>
	<a href="../login/menu.jsp">メインメニュー</a>
 	<a href="subject_list.jsp">科目一覧</a>
    <a href="subject_delete.jsp">科目削除</a>
    <a href="updateSubject.jsp">科目変更</a>
    <a href="../login/logout-in.jsp">ログアウト</a>　
	
    <h1>科目追加</h1>
    <form method="post" action="subject_insert.jsp">
        学校コード: <input type="text" name="schoolCode"><br>
        科目コード: <input type="text" name="code"><br>
        科目名: <input type="text" name="name"><br>
        <input type="submit" value="追加">
    </form>
    <%
        if (request.getMethod().equals("POST")) {
            String schoolCode = request.getParameter("schoolCode");
            String code = request.getParameter("code");
            String name = request.getParameter("name");
            SubjectDAO subjectDAO = new SubjectDAO();
            Subject subject = new Subject(schoolCode, code, name);
            subjectDAO.insertSubject(subject);
            out.println("Subject inserted successfully.");
        }
    %>
</body>
</html>
<%@ include file="../footer.jsp" %>