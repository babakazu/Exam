package main;

import java.util.List;

import bean.Student;
import dao.StudentDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class Student_ListAction extends Action {
    public String execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        HttpSession session = request.getSession(); // セッションの開始

        StudentDAO dao = new StudentDAO();
        List<Student> list = dao.search(""); // 学生一覧を取得 

        session.setAttribute("list", list); // 学生一覧をlistという名前で保存

        return "studentlist.jsp"; // studentList.jspに遷移

    }
}