<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <header class="header">
        <h1 class="header-title">得点管理システム</h1>
        <c:if test="${not empty loggedInUser}">
            <a href="../login/logout-out.jsp">ログアウト</a>
        </c:if>
    </header>
</body>
</html>