<%@page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ログイン</title>
    <link rel="stylesheet" type="text/css" href="../css/login-style.css"> <!-- CSSファイルのリンク -->
</head>
<body>
    <div class="login-title"> <!-- ログインタイトルのコンテナ -->
        <h1>ログイン</h1> <!-- ログインタイトル -->
    </div>
    <div class="login-container"> <!-- ログイン枠のコンテナ -->
        <form action="Login.action" method="post">
    <p>ID<input type="text" name="login" id="login" placeholder="半角でご入力ください"></p>
    <p>password<input type="password" name="password" id="password"></p>
    <p><input type="checkbox" id="showPasswordCheckbox">パスワードを表示</p>
    <p><input type="submit" value="ログイン"></p>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
    <% } %>
</form>

<script>
    // ID入力欄の初期値設定と色の変更
    var loginInput = document.getElementById('login');
    var passwordInput = document.getElementById('password');

    loginInput.value = '半角でご入力ください';
    loginInput.style.color = '#999'; // 初期文字色を灰色に設定

    loginInput.addEventListener('focus', function() {
        if (loginInput.value === '半角でご入力ください') {
            loginInput.value = '';
            loginInput.style.color = '#000'; // 入力開始時に文字色を黒色に変更
        }
    });

    // パスワード入力欄の初期値設定と色の変更
    passwordInput.placeholder = '20文字以内の半角英数字でご入力ください';

    passwordInput.addEventListener('focus', function() {
        passwordInput.placeholder = ''; // 入力開始時にplaceholderを空にする
    });
</script>


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
        
    </div>
</body>
</html>
