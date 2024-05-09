package login;

import bean.Teacher;
import dao.TeacherDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if (login == null || login.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "IDまたはパスワードが未入力です");
            return "login-in.jsp";
        }

        TeacherDAO dao = new TeacherDAO();
        Teacher teacher = dao.search(login, password);

        if (teacher != null) {
            session.setAttribute("teacher", teacher);
            return "menu.jsp";
        } else {
            request.setAttribute("errorMessage", "IDまたはパスワードが正しくありません");
            return "login-in.jsp";
        }
    }
}
