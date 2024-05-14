package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import bean.Test;

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

    public List<Test> getAllGrades() {
        List<Test> grades = new ArrayList<>();
        String query = "SELECT NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM FROM TEST";

        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Test test = new Test();
                test.setStudent_No(rs.getString("STUDENT_NO"));
                test.setSubject_Cd(rs.getString("SUBJECT_CD"));
                test.setSchool_Cd(rs.getString("SCHOOL_CD"));
                test.setNo(rs.getInt("NO"));
                test.setPoint(rs.getInt("POINT"));
                test.setClass_Num(rs.getString("CLASS_NUM"));
                grades.add(test);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return grades;
    }


    public List<Test> searchGrades(String student_No, String class_Num, String subject_No, String no, String entYear) {
        List<Test> grades = new ArrayList<>();
        String query = "SELECT STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM FROM TEST WHERE ";
        List<String> conditions = new ArrayList<>();

        if (student_No != null && !student_No.isEmpty()) {
            conditions.add("STUDENT_NO = ?");
        }

        if (class_Num != null && !class_Num.isEmpty()) {
            conditions.add("CLASS_NUM = ?");
        }

        if (subject_No != null && !subject_No.isEmpty()) {
            conditions.add("SUBJECT_CD = ?");
        }

        if (no != null && !no.isEmpty()) {
            conditions.add("NO = ?");
        }

        query += String.join(" AND ", conditions);

        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            int index = 1;
            if (student_No != null && !student_No.isEmpty()) {
                ps.setString(index++, student_No);
            }

            if (class_Num != null && !class_Num.isEmpty()) {
                ps.setString(index++, class_Num);
            }

            if (subject_No != null && !subject_No.isEmpty()) {
                ps.setString(index++, subject_No);
            }

            if (no != null && !no.isEmpty()) {
                ps.setString(index++, no);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Test grade = new Test();
                    grade.setStudent_No(rs.getString("STUDENT_NO"));
                    grade.setSubject_Cd(rs.getString("SUBJECT_CD"));
                    grade.setSchool_Cd(rs.getString("SCHOOL_CD"));
                    grade.setNo(rs.getInt("NO"));
                    grade.setPoint(rs.getInt("POINT"));
                    grade.setClass_Num(rs.getString("CLASS_NUM"));
                    grades.add(grade);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return grades;
    }

    
    public void updateGrade(String student_No, String class_Num, String subject_No, String no, int point) {
        String query = "UPDATE TEST SET POINT = ? WHERE STUDENT_NO = ? AND CLASS_NUM = ? AND SUBJECT_CD = ? AND NO = ?";
        
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, point);
            ps.setString(2, student_No);
            ps.setString(3, class_Num);
            ps.setString(4, subject_No);
            ps.setString(5, no);
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            // エラー処理を追加する
        }
    }}






