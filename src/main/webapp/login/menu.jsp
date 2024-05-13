<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/style.css">

<% if (request.getRequestURI().endsWith("/menu.jsp")) { %>

<div class="title-container">
    <h3>メニュー</h3>
</div>

<div class="menu-container">
    <div class="menu-item student-manage">
        <a href="../tokuten/student_list.jsp">学生管理</a>
    </div>
   
    <div class="menu-item grade-manage">
        <p>成績管理</p>
        <a href="../grades/search_grade.jsp">成績登録</a>
        <a href="../grades/test_list.jsp">成績参照</a>
    </div>
  
    <div class="menu-item subject-manage">
        <a href="../subject/subject_list.jsp">科目管理</a>
    </div>
</div>
<% } %>

<div id="sidebar">
    <div class="menu-links">
        <a href="../login/menu.jsp">メニュー</a>
        <a href="../tokuten/student_list.jsp">学生管理</a>
        <p>成績管理</p> <!-- 非リンクテキストとして追加 -->
        <a href="../grades/search_grade.jsp">&nbsp;&nbsp;&nbsp;成績登録</a>
        <a href="../grades/test_list.jsp">&nbsp;&nbsp;&nbsp;成績参照</a>
        <a href="../subject/subject_list.jsp">科目管理</a>
    </div>
</div>



<%@ include file="../footer.jsp" %>
