package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

public class StudentDAO extends DAO {
    public List<Student> search(String keyword) throws Exception {
        List<Student> list = new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
                "SELECT * FROM student WHERE name LIKE ?");
        st.setString(1, "%" + keyword + "%");
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Student student = new Student();
            student.setEnrollmentYear(rs.getInt("enrollmentYear"));
            student.setStudentNumber(rs.getInt("studentNumber"));
            student.setName(rs.getString("name"));
            student.setClassName(rs.getString("className"));
            student.setEnrolled(rs.getBoolean("isEnrolled"));
            list.add(student);
        }

        st.close();
        con.close();

        return list;
    }

    public int insert(Student student) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
                "INSERT INTO student (enrollmentYear, studentNumber, name, className, isEnrolled) VALUES (?, ?, ?, ?, ?)");
        st.setInt(1, student.getEnrollmentYear());
        st.setInt(2, student.getStudentNumber());
        st.setString(3, student.getName());
        st.setString(4, student.getClassName());
        st.setBoolean(5, student.isEnrolled());
        int result = st.executeUpdate();
        st.close();
        con.close();
        return result;
    }
}