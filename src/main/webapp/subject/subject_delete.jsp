<%@ page import="dao.SubjectDAO" %>
<%@ include file="../login/menu.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除</title>
</head>
<body>
    <div class="content">
        <h3 class="list-title">科目削除</h3>
        </div>
    <%
        String schoolCode = request.getParameter("schoolCd");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        
        if (request.getParameter("confirm") == null) {
    %>
    <div class="search-form2"> 
            <p>科目 <%= name %> を削除します。本当によろしいですか？</p>
            <form method="post" action="subject_delete.jsp">
                <input type="hidden" name="schoolCd" value="<%= schoolCode %>">
                <input type="hidden" name="code" value="<%= code %>">
                <input type="hidden" name="name" value="<%= name %>">
                <input type="hidden" name="confirm" value="true">
                <input type="submit" value="削除">
            </form>
            </div>
            
            <div class="back-button3">
            <a href="subject_list.jsp">戻る</a>
            </div>
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
    </div>
</body>
</html>

