package tool;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
 
@WebServlet(urlPatterns={"*.action"}) // /~actionというurlが渡されたら実行される
public class FrontController extends HttpServlet {
 
              public void doPost(
                            HttpServletRequest request, HttpServletResponse response
              ) throws ServletException, IOException {
                            PrintWriter out=response.getWriter(); // レスポンスに必要な機能を生成
                            // 正常な場合の処理
                            try {
                                          // 遷移先urlを生成(先頭を大文字にして、.を/に置き換える
                                          String path=request.getServletPath().substring(1);
                                          String name=path.replace(".a", "A").replace('/', '.');
                                          // xxxActionクラスを生成してexecuteメソッドを実行する
                                          // 例：search/actionというurlが渡されたらSearch.Actionクラスを生成してexecuteメソッドを実行
                                          Action action=(Action)Class.forName(name).
                                                        getDeclaredConstructor().newInstance();
                                          String url=action.execute(request, response);
                                          request.getRequestDispatcher(url).
                                                        forward(request, response);
                            } catch (Exception e) {
                                          e.printStackTrace(out);
                            }
              }
 
              // getの時もpostと同じ処理をする
              public void doGet(
                            HttpServletRequest request, HttpServletResponse response
              ) throws ServletException, IOException {
                            doPost(request, response);
              }
}