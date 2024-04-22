package login;

import bean.Teacher;
import dao.TeacherDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginAction extends Action {
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        HttpSession session = request.getSession();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        TeacherDAO dao = new TeacherDAO();
        Teacher teacher = dao.search(login, password);

        if (teacher != null) {
            session.setAttribute("teacher", teacher); // セッション属性を "teacher" に変更
            return "menu.jsp";
        }

        return "login-error.jsp";
    }
}

//package login ;
//import bean.Teacher;
//import dao.TeacherDAO;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import tool.Action;
//

//public class LoginAction extends Action {
//	public String execute(
//		HttpServletRequest request, HttpServletResponse response
//	) throws Exception {
//
//		HttpSession session=request.getSession();
//		
//		String login=request.getParameter("login");
//		String password=request.getParameter("password");
//
//		TeacherDAO dao=new TeacherDAO();
//		Teacher Teacher=dao.serch(login, password);
//		
//		if (Teacher!=null) {
//			session.setAttribute("customer", customer);
//			return "login-out.jsp";
//		}
//		
//		return "login-error.jsp";
//	}
//}
//　public class LoginAction extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String id = request.getParameter("login");
//        String password = request.getParameter("password");
//
//        TeacherDAO teacherDAO = new TeacherDAO();
//        try {
//            Teacher teacher = teacherDAO.findTeacher(id, password);
//            if (teacher != null) {
//                HttpSession session = request.getSession();
//                session.setAttribute("teacher", teacher);
//                response.sendRedirect("login-out.jsp");
//            } else {
//                response.sendRedirect("login-error.jsp");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            // Handle database error
//            response.sendRedirect("login-error.jsp");
//            
//        }
//    }
//　}
