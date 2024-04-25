package main;

import java.io.IOException;
import java.io.PrintWriter;

import dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/main/Student_Insert")
public class Student_Insert extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String entYear = request.getParameter("ent_year");
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String classNum = request.getParameter("class_num");

        // TODO: DAO を使って学生情報を挿入する処理を記述
        StudentDAO studentDAO = new StudentDAO();
        studentDAO.insertStudent(entYear, no, name, classNum);

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>学生情報登録完了</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>学生情報登録完了</h2>");
        out.println("<p>入学年度: " + entYear + "</p>");
        out.println("<p>学籍番号: " + no + "</p>");
        out.println("<p>氏名: " + name + "</p>");
        out.println("<p>クラス: " + classNum + "</p>");
        out.println("<p>の情報を登録しました。</p>");
        out.println("</body>");
        out.println("</html>");
    }
}