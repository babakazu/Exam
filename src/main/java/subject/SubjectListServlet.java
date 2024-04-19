import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SubjectListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // JDBCドライバをロード
        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            out.println("JDBCドライバのロードに失敗しました：" + e.getMessage());
            return;
        }

        // データベース接続
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<String[]> subjects = new ArrayList<>();

        try {
            conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/schooln", "username", "password");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT school_code, subject_code, subject_name FROM subjects");

            // 結果セットからデータを取得してリストに追加
            while (rs.next()) {
                String schoolCode = rs.getString("school_code");
                String subjectCode = rs.getString("subject_code");
                String subjectName = rs.getString("subject_name");
                subjects.add(new String[]{schoolCode, subjectCode, subjectName});
            }
        } catch (SQLException e) {
            out.println("データベースの操作中にエラーが発生しました：" + e.getMessage());
            return;
        } finally { 
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("データベースのクローズ中にエラーが発生しました：" + e.getMessage());
            }
        }

        // 取得した科目リストをリクエスト属性に設定
        request.setAttribute("subjects", subjects);

        // JSPにフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/subject_list.jsp");
        dispatcher.forward(request, response);
    }
}
