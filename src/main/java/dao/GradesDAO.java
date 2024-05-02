package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import bean.Grades;

public class GradesDAO {
    private DataSource ds;

    public GradesDAO() {
        try {
            InitialContext initialContext = new InitialContext();
            ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/kouka");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Grades> searchGrades(String entYear, String classNum, String subjectCd, int no) {
        List<Grades> grades = new ArrayList<>();
        String query = "SELECT * FROM TEST WHERE student_no = ? AND SCHOOL_CD = ? AND CLASS_NUM = ? AND NO = ?";
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, no);
            ps.setString(2, subjectCd);
            ps.setString(3, "oom"); // assuming 'oom' is the school code
            ps.setString(4, classNum);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Grades grade = new Grades();
                    grade.setStudentNo(rs.getString("STUDENT_NO"));
                    grade.setSubjectCd(rs.getString("SUBJECT_CD"));
                    grade.setSchoolCd(rs.getString("SCHOOL_CD"));
                    grade.setNo(rs.getInt("NO"));
                    grade.setPoint(rs.getInt("POINT"));
                    grade.setClassNum(rs.getString("CLASS_NUM"));
                    grades.add(grade);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return grades;
    }
}