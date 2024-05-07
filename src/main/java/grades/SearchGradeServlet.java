package grades;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/grades/SearchGradeServlet")
public class SearchGradeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ここでデータベースから成績を取得するロジックを実装する
        // 以下はダミーデータの例
        List<Map<String, Object>> resultsList = new ArrayList<>();
        Map<String, Object> student1 = new HashMap<>();
        student1.put("ENT_YEAR", "2022");
        student1.put("CLASS_NUM", "A");
        student1.put("NO", "001");
        student1.put("NAME", "田中太郎");
        student1.put("POINT", 85);
        resultsList.add(student1);
        
        Map<String, Object> student2 = new HashMap<>();
        student2.put("ENT_YEAR", "2022");
        student2.put("CLASS_NUM", "B");
        student2.put("NO", "002");
        student2.put("NAME", "山田花子");
        student2.put("POINT", 92);
        resultsList.add(student2);

        // 検索結果をリクエスト属性に設定
        request.setAttribute("resultsList", resultsList);

        // JSPにフォワード
        request.getRequestDispatcher("/grades/search_grade.jsp").forward(request, response);
    }
}
