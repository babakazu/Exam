package grades;

import java.io.IOException;

import dao.GradesDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/main/UpdateGradesServlet")
public class UpdateGradesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // パラメータを取得
        String studentNo = request.getParameter("studentNo");
        String classNum = request.getParameter("class_num");
        String subjectCd = request.getParameter("subject_cd");
        String no = request.getParameter("no");
        String[] pointParams = request.getParameterValues("point");
        if (pointParams != null) {
            for (String pointParam : pointParams) {
                int point = Integer.parseInt(pointParam);
                GradesDAO gradesDAO = new GradesDAO(); // GradesDAO のインスタンスを作成
                gradesDAO.updateGrade(studentNo, classNum, subjectCd, no, point);
            }
        }

        response.sendRedirect("http://localhost:8080/test/grades/grades_succes.jsp");
    }
}
