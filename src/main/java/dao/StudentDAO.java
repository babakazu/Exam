package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import bean.Student;

public class StudentDAO {
    private DataSource ds;

    public StudentDAO() {
        try {
            InitialContext initialContext = new InitialContext();
            ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/kouka");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String query = "SELECT NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD FROM student";

        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Student student = new Student();
                student.setNo(rs.getString("NO"));
                student.setName(rs.getString("NAME"));
                student.setEnt_year(rs.getString("ENT_YEAR"));
                student.setClass_num(rs.getString("CLASS_NUM"));
                student.setIs_attend(rs.getString("IS_ATTEND"));
                student.setSchool_cd(rs.getString("SCHOOL_CD"));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }



public void addStudent(Student student) {
    String query = "INSERT INTO student (NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?, ?)";
    try (Connection conn = ds.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        ps.setString(1, student.getNo());
        ps.setString(2, student.getName());
        ps.setString(3, student.getEnt_year());
        ps.setString(4, student.getClass_num());
        ps.setString(5, student.getIs_attend());
        ps.setString(6, student.getSchool_cd());

        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public List<Student> searchStudents(String entYear, String classNum, boolean isAttend) {
    List<Student> students = new ArrayList<>();
    String query = "SELECT NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD FROM student WHERE ";
    List<String> conditions = new ArrayList<>();

    if (entYear != null && !entYear.isEmpty()) {
        conditions.add("ENT_YEAR = ?");
    }

    if (classNum != null && !classNum.isEmpty()) {
        conditions.add("CLASS_NUM = ?");
    }

    if (isAttend) {
        conditions.add("IS_ATTEND = 'TRUE'");
    } else {
        conditions.add("IS_ATTEND IS FALSE");
    }

    query += String.join(" AND ", conditions);

    try (Connection conn = ds.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        int index = 1;
        if (entYear != null && !entYear.isEmpty()) {
            ps.setString(index++, entYear);
        }

        if (classNum != null && !classNum.isEmpty()) {
            ps.setString(index++, classNum);
        }

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student student = new Student();
                student.setNo(rs.getString("NO"));
                student.setName(rs.getString("NAME"));
                student.setEnt_year(rs.getString("ENT_YEAR"));
                student.setClass_num(rs.getString("CLASS_NUM"));
                student.setIs_attend(rs.getString("IS_ATTEND"));
                student.setSchool_cd(rs.getString("SCHOOL_CD"));
                students.add(student);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return students;
}

public void updateStudent(String no, String entYear, String name, String classNum, String isAttend) {
    String query = "UPDATE student SET NAME = ?, CLASS_NUM = ?, IS_ATTEND = ? WHERE NO = ? AND ENT_YEAR = ?";
    try (Connection conn = ds.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        ps.setString(1, name);
        ps.setString(2, classNum);
        ps.setString(3, isAttend);
        ps.setString(4, no);
        ps.setString(5, entYear);

        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
}

