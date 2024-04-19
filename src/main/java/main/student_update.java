package main ;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edit-student-process")
public class EditStudentProcessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォームから送信された新しい学生情報を取得
        String newEnrollmentYearStr = request.getParameter("newEnrollmentYear");
        String newStudentNumber = request.getParameter("newStudentNumber");
        String newName = request.getParameter("newName");
        String newClass = request.getParameter("newClass");
s
        // 入学年度を整数に変換
        int newEnrollmentYear = Integer.parseInt(newEnrollmentYearStr);

        // データベース接続情報
        String url = "jdbc:mysql://localhost:3306/your_database_name";
        String user = "your_username";
        String password = "your_password";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            // 更新用のSQLクエリを準備
            String sql = "UPDATE students SET enrollmentYear=?, studentNumber=?, name=?, className=? WHERE id=?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                // SQLクエリのパラメータを設定
                stmt.setInt(1, newEnrollmentYear);
                stmt.setString(2, newStudentNumber);
                stmt.setString(3, newName);
                stmt.setString(4, newClass);
                // ここで変更対象の学生IDを取得する必要があります
                stmt.setInt(5, /* 変更対象の学生ID */);
                // 更新を実行
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリング（例外処理）
        }

        // 更新が完了したらリダイレクトして学生リストを表示
        response.sendRedirect("student-list.jsp");
    }
}