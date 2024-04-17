package tool;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "*.action" })
public class FrontController extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String path = request.getServletPath().substring(1);
            String name = path.replace(".a", "A").replace('/', '.');
            // クラスを動的にロード
            Class<?> clazz = Class.forName(name);
            // クラスがActionインターフェースを実装していることを確認
            if (Action.class.isAssignableFrom(clazz)) {
                // Actionインターフェースを実装したクラスのインスタンス化
                Action action = (Action) clazz.getDeclaredConstructor().newInstance();
                String url = action.execute(request, response);
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                throw new ServletException("Invalid action class: " + name);
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
