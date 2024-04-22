<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List"%>
<%@ page import="bean.Student" %>
<%@ page import="dao.SubjectDAO" %>
<%@ include file="../header.jsp" %>


<h2>学生管理</h2>

<div class="menu-links">
    <a href="student_insert.jsp">学生登録</a>
    <a href="student_update.jsp">学生変更</a>
    <a href="../grades/grades_insert.jsp">成績登録</a>
    <a href="../grades/grades_list.jsp">成績参照</a>
    <a href="subject-management.jsp">科目管理</a>
    <a href="../login/login-out.jsp">ログアウト</a>
</div>

<h3>学生一覧</h3>

<table border="1">
    <tr>
        <th>学籍番号</th>
        <th>名前</th>
        <th>入学年度</th>
        <th>クラス番号</th>
        <th>出席状況</th>
        <th>学校コード</th>
        
        <c:forEach var="s" items="${list}">
		<tr>
			<th>${student.no}</th><th>${student.name}</th><th>${student.entyear}</th><th>${student.class_num}</th><th>${student.is_attend}</th><th>${student.school_cd}</th><br>
		</tr>
		</c:forEach>
    </tr>
</table>
<%@include file="../footer.jsp" %>