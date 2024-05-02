package grades;

import java.io.IOException;
import java.util.List;

import bean.Grades;
import dao.GradesDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/grades/SearchGradeServlet")
public class SearchGradeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォームからの入力を取得
        String entYear = request.getParameter("entYear");
        String classNum = request.getParameter("classNum");
        String subjectCd = request.getParameter("subjectCd");
        String noParam = request.getParameter("no");
        int no;
        if (noParam != null && !noParam.isEmpty()) {
            no = Integer.parseInt(noParam);
        } else {
            // デフォルト値を設定するなど、適切な処理を行う
            no = 0; // ここではデフォルト値として 0 を設定していますが、適切な値を設定してください
        }

        // DAO を使用して成績情報を取得
        GradesDAO gradeDAO = new GradesDAO();
        List<Grades> grades = gradeDAO.searchGrades(entYear, classNum, subjectCd, no);

        // 成績情報をリクエスト属性に設定して JSP に転送
        request.setAttribute("grades", grades);
        request.getRequestDispatcher("grades_list.jsp").forward(request, response);
    }
}