<%@page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ログイン</title>
    <link rel="stylesheet" type="text/css" href="../css/login-style.css">
</head>
<body>
    <form action="Login.action" method="post">
        <p>ID<input type="text" name="login"></p>
        <p>password<input type="password" name="password"></p>
        <p><input type="submit" value="ログイン"></p>
    </form>
</body>
