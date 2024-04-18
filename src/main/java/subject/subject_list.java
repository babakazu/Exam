package subject ;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.SubjectDAO;

public class subject_list {
    public void displaySubjectList() {
        SubjectDAO dao = new SubjectDAO();
        try {
            Connection connection = dao.getConnection(); // ここでエラーが発生しないように修正
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM SUBJECT_TABLE");
            while (rs.next()) {
                System.out.println("School Code: " + rs.getString("SCHOOL_CD"));
                System.out.println("Subject Code: " + rs.getString("CD"));
                System.out.println("Subject Name: " + rs.getString("NAME"));
                System.out.println("------------------------");
            }
            rs.close();
            stmt.close();
            dao.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
