<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // ログアウト処理が成功したかどうかの条件をここに書く（例えばセッションの破棄など）
    boolean logoutSuccess = true; // ログアウトが成功したかどうかの仮の値

    if (logoutSuccess) {
        response.sendRedirect("logout-out.jsp"); // ログアウトが成功したらlogout-out.jspにリダイレクト
    } else {
        response.sendRedirect("logout-error.jsp"); // ログアウトが失敗したらlogout-error.jspにリダイレクト
    }
%>
