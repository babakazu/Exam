package main;

import java.io.IOException;

import dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/main/StudentUpdateServlet")
public class StudentUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        String entYear = request.getParameter("entYear");
        String name = request.getParameter("name");
        String classNum = request.getParameter("classNum");
        String isAttend = request.getParameter("isAttend");

        String isAttendValue = "FALSE";
        if ("〇".equals(isAttend)) {
            isAttendValue = "TRUE";
        }

        // TODO: DAO を使って学生情報を更新する処理を記述
        StudentDAO studentDAO = new StudentDAO();
        studentDAO.updateStudent(no, entYear, name, classNum, isAttendValue);

        // 学生一覧にリダイレクト
        response.sendRedirect("http://localhost:8080/test/tokuten/student_updatesucces.jsp");
    }
}