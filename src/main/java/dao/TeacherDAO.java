package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.Teacher;

public class TeacherDAO {
    private DataSource dataSource;

    public TeacherDAO() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/kouka");
        } catch (NamingException e) {
            e.printStackTrace(); // エラーハンドリングは適切に行うべきです
        }
    }

    public Teacher search(String id, String password) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Teacher teacher = null;

        try {
            connection = dataSource.getConnection();

            String query = "SELECT * FROM teacher WHERE ID = ? AND PASSWORD = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                teacher = new Teacher();
                teacher.setId(resultSet.getString("ID"));
                teacher.setPassword(resultSet.getString("PASSWORD"));
                teacher.setName(resultSet.getString("NAME"));
                teacher.setSchoolCd(resultSet.getString("SCHOOL_CD"));
            }
        } finally {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }

        return teacher;
    }

    // Other methods as needed
}
