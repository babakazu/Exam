package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Teacher;

public class StudentDAO extends DAO {
    public List<Teacher> search(String keyword) throws Exception {
        List<Teacher> list = new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
                "SELECT * FROM teacher WHERE name LIKE ?");
        st.setString(1, "%" + keyword + "%");
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Teacher teacher = new Teacher();
            teacher.setId(rs.getString("id"));
            teacher.setPassword(rs.getString("password"));
            teacher.setName(rs.getString("name"));
            teacher.setSchoolCd(rs.getString("schoolCd"));
            list.add(teacher);
        }

        st.close();
        con.close();

        return list;
    }

    public int insert(Teacher teacher) throws Exception {
        Connection con = getConnection();
        PreparedStatement st = con.prepareStatement(
                "INSERT INTO teacher (id, password, name, schoolCd) VALUES (?, ?, ?, ?)");
        st.setString(1, teacher.getId());
        st.setString(2, teacher.getPassword());
        st.setString(3, teacher.getName());
        st.setString(4, teacher.getSchoolCd());
        int result = st.executeUpdate();
        st.close();
        con.close();
        return result;
    }
}