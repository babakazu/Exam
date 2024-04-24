package main;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/main/StudentUpdateServlet")
public class StudentUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String no = request.getParameter("no");
        String entYear = request.getParameter("entYear");
        String name = request.getParameter("name");
        String classNum = request.getParameter("classNum");
        String isAttend = request.getParameter("isAttend");

        // TODO: DAO を使って学生情報を更新する処理を記述

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>学生情報変更完了</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>学生情報変更完了</h2>");
        out.println("<p>学籍番号: " + no + "</p>");
        out.println("<p>入学年度: " + entYear + "</p>");
        out.println("<p>氏名: " + name + "</p>");
        out.println("<p>クラス番号: " + classNum + "</p>");
        out.println("<p>出席状況: " + isAttend + "</p>");
        out.println("<p>の情報を変更しました。</p>");
        out.println("</body>");
        out.println("</html>");
    }
}