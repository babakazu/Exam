package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import bean.Student;

public class StudentDAO extends DAO {

    private DataSource dataSource;

    public StudentDAO() {
        try {
            InitialContext initialContext = new InitialContext();
            dataSource = (DataSource) initialContext.lookup("java:comp/env/jdbc/kouka");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Student> search(String keyword) {
        List<Student> list = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM student WHERE name LIKE ?");
        ) {
            statement.setString(1, "%" + keyword + "%");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Student student = new Student();
                student.setNo(resultSet.getString("no"));
                student.setName(resultSet.getString("name"));
                student.setEnt_year(resultSet.getString("ent_year"));
                student.setClass_num(resultSet.getString("class_num"));
                student.setIs_attend(resultSet.getString("is_attend"));
                student.setSchool_cd(resultSet.getString("school_cd"));
                list.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
