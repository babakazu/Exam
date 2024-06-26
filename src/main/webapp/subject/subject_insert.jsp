<%@ page import="dao.SubjectDAO" %>
<%@ page import="bean.Subject" %>
<%@ include file="../login/menu.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目追加</title>
</head>
<body>
	
    <div class="content">
        <h3 class="list-title">科目追加</h3>
        </div>
        <div class="search-form2">
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
            out.println("正常に登録されました");
        }
    %>
    </div>
                <div class="back-button3">
            <a href="subject_list.jsp">戻る</a>
            </div>
    
</body>
</html>
