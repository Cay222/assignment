package servlet;

import bean.User;
import com.google.gson.Gson;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user2")
public class UserServlet2 extends HttpServlet {
    private UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String stateStr = req.getParameter("state");
        int state = 0;
        // 转成 int 类型
        if (stateStr != null && !"".equals(stateStr.trim())) {
            state = Integer.parseInt(stateStr);
        }
        List<User> userList = userService.queryUserListByState(state);
        // json类型的数据，K-V
        Gson gson = new Gson();
        String jsonStr = gson.toJson(userList);
        System.out.println(jsonStr);
        // 响应发送的请求，将 json 串写回去
        // json 串本质上是 list 集合
        resp.getWriter().write(jsonStr);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
