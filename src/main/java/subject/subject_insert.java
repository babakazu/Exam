package subject;

import java.io.IOException;

import bean.Subject;
import dao.SubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/subject_insert")
public class subject_insert extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String schoolCode = request.getParameter("schoolCode");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        
        // SubjectDAOのインスタンスを生成
        SubjectDAO subjectDAO = new SubjectDAO();

        // 新しい科目のインスタンスを生成
        Subject subject = new Subject(schoolCode, code, name);
        try {
            // 科目をデータベースに挿入
            subjectDAO.insertSubject(subject);
            // 科目一覧ページにリダイレクト
            response.sendRedirect("subject_list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // エラー処理を追加する
        }
    }
}
