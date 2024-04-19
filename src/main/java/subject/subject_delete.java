package subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.SubjectDAO;

public class subject_delete {
    public void deleteSubject(String code) {
        SubjectDAO dao = new SubjectDAO(); // SubjectDAO クラスのインスタンスを作成
        Connection connection = null;
        try {
            connection = dao.getConnection(); // ここでインスタンス化された SubjectDAO を使用する
            PreparedStatement pstmt = connection.prepareStatement("DELETE FROM SUBJECT_TABLE WHERE CD = ?");
            pstmt.setString(1, code);
            pstmt.executeUpdate(); 
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dao.closeConnection(connection);
        }
    }
}
