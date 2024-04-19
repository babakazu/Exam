package subject ;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
        String oldName = request.getParameter("oldName");
        String schoolCd = request.getParameter("schoolCd");
        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        String jdbcURL = "jdbc:h2:tcp://localhost/~/school";
        String dbUser = "sa";
        String dbPassword = "";

        try {
            Class.forName("org.h2.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // 更新を実行する
            String updateQuery = "UPDATE SUBJECT SET SCHOOL_CD=?, CD=?, NAME=? WHERE SCHOOL_CD=? AND CD=? AND NAME=?";
            PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
            updateStatement.setString(1, schoolCd);
            updateStatement.setString(2, cd);
            updateStatement.setString(3, name);
            updateStatement.setString(4, oldSchoolCd);
            updateStatement.setString(5, oldCd);
            updateStatement.setString(6, oldName);
            
            int rowsUpdated = updateStatement.executeUpdate();
            if (rowsUpdated > 0) {
                response.getWriter().println("Subject updated successfully!");
            } else {
                response.getWriter().println("Subject update failed!");
            }

            updateStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
