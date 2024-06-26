package subject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.SubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/subject/UpdateSubjectServlet")
public class UpdateSubjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldSchoolCd = request.getParameter("oldSchoolCd");
        String oldCd = request.getParameter("oldCd");
        String name = request.getParameter("name");
        String schoolCd = request.getParameter("schoolCd");
        String cd = request.getParameter("cd");

        String jdbcURL = "jdbc:h2:tcp://localhost/~/school";
        String dbUser = "sa";
        String dbPassword = "";

        try {
            Class.forName("org.h2.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            SubjectDAO subjectDAO = new SubjectDAO();
            String currentCd = subjectDAO.getCurrentSubjectCode(oldSchoolCd, oldCd);

            if (currentCd != null && currentCd.equals(oldCd)) {
                if (schoolCd != null) {
                    String updateQuery = "UPDATE SUBJECT SET SCHOOL_CD=?, CD=?, NAME=? WHERE SCHOOL_CD=? AND CD=?";
                    PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
                    updateStatement.setString(1, schoolCd);
                    updateStatement.setString(2, cd);
                    updateStatement.setString(3, name);
                    updateStatement.setString(4, oldSchoolCd);
                    updateStatement.setString(5, oldCd);

                    int rowsUpdated = updateStatement.executeUpdate();
                    if (rowsUpdated > 0) {
                        // 更新が成功した場合、指定されたJSPページにリダイレクトする
                        response.sendRedirect(request.getContextPath() + "/subject/subject_update_Done.jsp");
                    } else {
                        response.getWriter().println("科目の更新に失敗しました！");
                    }

                    updateStatement.close();
                } else {
                    response.getWriter().println("エラー：学校コードが指定されていません！");
                }
            } else {
                response.getWriter().println("対象の科目が見つかりませんでした！");
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("データベースエラー：" + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("エラー：" + e.getMessage());
        }
    }
}
