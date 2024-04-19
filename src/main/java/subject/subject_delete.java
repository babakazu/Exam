package subject;

import java.io.IOException;

import dao.SubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/subject_delete")
public class subject_delete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String schoolCode = request.getParameter("schoolCode");
        String code = request.getParameter("code");
        SubjectDAO subjectDAO = new SubjectDAO();
        subjectDAO.deleteSubject(schoolCode, code);
        response.sendRedirect("subject_list.jsp");
    }
}
