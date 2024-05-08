
<<<<<<< HEAD
<%@ page import="java.util.List" %>
<%@ page import="bean.Subject" %>
<%@ page import="dao.SubjectDAO" %>
<%@ include file="../login/menu.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

=======
<%@ page import="java.util.List"%>
<%@ page import="bean.Subject"%>
<%@ page import="dao.SubjectDAO"%>
<%@ include file="../header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<
>>>>>>> branch 'master' of https://github.com/babakazu/Exam.git
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>科目一覧</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/subject-list.css">
</head>
<body>
	<div class="subject-list-container">
		<h1>科目管理</h1>
		<a href="subject_insert.jsp" class="new-subject-link">新規登録</a>
		<table class="subject-list-table">
			<tr>
				<th>科目コード</th>
				<th>科目名</th>
				<th>操作</th>
			</tr>
			<%
			SubjectDAO subjectDAO = new SubjectDAO();
			List<Subject> subjects = subjectDAO.getAllSubjects();
			for (Subject subject : subjects) {
			%>
			<tr>
				<td><%=subject.getCode()%></td>
				<td><%=subject.getName()%></td>
				<td><a
					href="updateSubject.jsp?oldSchoolCd=<%=subject.getSchoolCode()%>&currentSubjectCode=<%=subject.getCode()%>&oldName=<%=subject.getName()%>">変更</a>
					<a
					href="subject_delete.jsp?schoolCd=<%=subject.getSchoolCode()%>&cd=<%=subject.getCode()%>">削除</a>
				</td>
			</tr>
			</form>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>

<%@ include file="../footer.jsp"%>
