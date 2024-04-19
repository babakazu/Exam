package subject ;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.SubjectDAO;

public class subject_insert {
    public void insertSubject(String schoolCode, String code, String name) {
        SubjectDAO dao = new SubjectDAO(); // SubjectDAO クラスのインスタンスを作成
        Connection connection = null;
        try {
            connection = dao.getConnection(); // ここでインスタンス化された SubjectDAO を使用する
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO SUBJECT_TABLE (SCHOOL_CD, CD, NAME) VALUES (?, ?, ?)");
            pstmt.setString(1, schoolCode);
            pstmt.setString(2, code);
            pstmt.setString(3, name);
            pstmt.executeUpdate();
            pstmt.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dao.closeConnection(connection);
        }
    }
}
