package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class student_list {
    public static void main(String[] args) {
        // データベースのURL、ユーザー名、パスワードを指定
        String url = "jdbc:mysql://localhost:3306/your_database_name";
        String username = "your_username";
        String password = "your_password";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            if (conn != null) {
                System.out.println("Connected to the database!");

                // ステートメントを作成してクエリを実行
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM students");  

                // 結果セットから学生情報を取得して表示
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    int age = rs.getInt("age");
                    String major = rs.getString("major");
                    System.out.println("ID: " + id + ", Name: " + name + ", Age: " + age + ", Major: " + major);
                }

                // リソースをクローズ
                rs.close();
                stmt.close();
            }
        } catch (SQLException e) {
            // SQLエラーが発生した場合の処理
            System.out.println("SQLException: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("VendorError: " + e.getErrorCode());
        }
    }
}