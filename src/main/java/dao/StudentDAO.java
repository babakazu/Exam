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

    private DataSource dataSoure;

    public StudentDAO() {
        try {
            InitialContext initialContext = new InitialContext();
            dataSource = (DataSource) initialContext.lookup("java:comp/env/jdbc/kouka");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Student> getAllSubjects() throws Exception {
        List<Student> subjects = new ArrayList<>();
        String query = "SELECT SCHOOL_CD, CD, NAME FROM SUBJECT";

        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String schoolCode = rs.getString("SCHOOL_CD");
                String code = rs.getString("CD");
                String name = rs.getString("NAME");
                Subject subject = new Subject(schoolCode, code, name);
                subjects.add(subject);
            }
        }

        return subjects;
    }
}
