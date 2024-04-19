package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

public class StudentDAO extends DAO {

    public List<Student> getStudentList() {
        List<Student> studentList = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM student");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Student student = new Student();
                student.setNo(resultSet.getString("no"));
                student.setName(resultSet.getString("name"));
                student.setEnt_year(resultSet.getString("ent_year"));
                student.setClass_num(resultSet.getString("class_num"));
                student.setIs_attend(resultSet.getString("is_attend"));
                student.setSchool_cd(resultSet.getString("school_cd"));
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return studentList;
    }
}