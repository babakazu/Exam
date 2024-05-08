<%@ page import="dao.SubjectDAO" %>
<%@ include file="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除</title>
</head>
<body>
    <h1>科目削除</h1>
    <%
        String schoolCode = request.getParameter("schoolCd");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        
        if (request.getParameter("confirm") == null) {
    %>
            <p>科目 <%= name %> を削除します。本当によろしいですか？</p>
            <form method="post" action="subject_delete.jsp">
                <input type="hidden" name="schoolCd" value="<%= schoolCode %>">
                <input type="hidden" name="code" value="<%= code %>">
                <input type="hidden" name="name" value="<%= name %>">
                <input type="hidden" name="confirm" value="true">
                <input type="submit" value="削除">
                <a href="subject_list.jsp">戻る</a>
            </form>
    <%
        } else {
            SubjectDAO subjectDAO = new SubjectDAO();
            subjectDAO.deleteSubject(schoolCode, code);
    %>
            <p>科目 <%= name %> を削除しました。</p>
            <a href="subject_list.jsp">戻る</a>
    <%
        }
    %>
</body>
</html>
<%@ include file="../footer.jsp" %>
