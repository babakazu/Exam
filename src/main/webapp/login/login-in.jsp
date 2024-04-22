<%@page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ログイン</title>
    <link rel="stylesheet" type="text/css" href="../css/login-style.css"> <!-- CSSファイルのリンク -->
</head>
<body>
    <div class="login-title"></div> <!-- タイトルを追加 -->
    <form action="Login.action" method="post">
        <p>ID<input type="text" name="login"></p>
        <p>password<input type="password" name="password"></p>
        <p><input type="checkbox" id="showPasswordCheckbox">パスワードを表示</p> <!-- チェックボックスを追加 -->
        <p><input type="submit" value="ログイン"></p>
    </form>

    <script>
        // チェックボックスがクリックされたときにパスワードを表示する
        document.getElementById('showPasswordCheckbox').addEventListener('click', function() {
            var passwordInput = document.querySelector('input[name="password"]');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
            } else {
                passwordInput.type = 'password';
            }
        });
    </script>
</body>

