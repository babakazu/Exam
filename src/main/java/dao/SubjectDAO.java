package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import bean.Subject;

public class SubjectDAO {
    private DataSource ds;

    public SubjectDAO() {
        try {
            InitialContext initialContext = new InitialContext();
            ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/kouka");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Subject> getAllSubjects() throws Exception {
        List<Subject> subjects = new ArrayList<>();
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

    public void insertSubject(Subject subject) throws Exception {
        String query = "INSERT INTO SUBJECT (SCHOOL_CD, CD, NAME) VALUES (?, ?, ?)";
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, subject.getSchoolCode());
            ps.setString(2, subject.getCode());
            ps.setString(3, subject.getName());
            ps.executeUpdate();
        }
    }

    public void updateSubject(Subject subject) throws Exception {
        String query = "UPDATE SUBJECT SET NAME = ? WHERE SCHOOL_CD = ? AND CD = ?";
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, subject.getName());
            ps.setString(2, subject.getSchoolCode());
            ps.setString(3, subject.getCode());
            ps.executeUpdate();
        }
    }

    public void deleteSubject(String schoolCode, String code) throws Exception {
        String query = "DELETE FROM SUBJECT WHERE SCHOOL_CD = ? AND CD = ?";
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, schoolCode);
            ps.setString(2, code);
            ps.executeUpdate();
        }
    }

    public String getCurrentSubjectCode(String schoolCd, String cd) throws Exception {
        String query = "SELECT CD FROM SUBJECT WHERE SCHOOL_CD = ? AND CD = ?";
        String currentCode = null;

        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, schoolCd);
            ps.setString(2, cd);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    currentCode = rs.getString("CD");
                }
            }
        }

        return currentCode;
    }
}