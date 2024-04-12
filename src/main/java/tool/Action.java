package tool;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public abstract class Action {
    // 共通処理を行ったうえで適切なサーブレットを実行する抽象メソッド
    public abstract String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
