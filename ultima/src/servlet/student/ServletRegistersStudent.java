package servlet.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MessageModel;
import service.Impl.StudentServiceImpl;
import service.Impl.UserServiceImpl;

import model.Student;
import model.User;
import servlet.PageServlet;

public class ServletRegistersStudent extends HttpServlet {

    private User user;
    private Student student;
    private UserServiceImpl userServiceImpl = new UserServiceImpl();
    private StudentServiceImpl studentServiceImpl = new StudentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String stuNum = request.getParameter("stuNum");
        String stuName = request.getParameter("stuName");
        // 密码
        String password = request.getParameter("password");
        // 确认密码
        String pwd = request.getParameter("pwd");
        MessageModel messageModel3 = new MessageModel();
        if (pwd != password) {
            messageModel3.setCode(100);
            messageModel3.setMessage("两次密码不一致");
        }
        String stuSex = request.getParameter("stuSex");
        String stringAge = request.getParameter("stuAge");
        int stuAge = 0;
        if (stringAge != null && !"".equals(stringAge.trim())) {
            stuAge = Integer.parseInt(request.getParameter("stuAge"));
        }
        String stuClass = request.getParameter("stuClass");
        String major = request.getParameter("major");
        String department = request.getParameter("department");
        String phone = request.getParameter("phone");
        // role隐藏域名称，固定值为0（学生）
        int roleID = Integer.parseInt(request.getParameter("role"));
        user = new User(stuNum, stuName, pwd, phone, roleID);
        System.out.println(user);
        student = new Student(stuNum, stuName, stuSex, stuAge, stuClass, major,
                department);
        System.out.println(student);

/*        int rsUser = userServiceImpl.addUser(user);
        int rsStu = studentServiceImpl.addStu(student);*/

        MessageModel messageModel1 = userServiceImpl.addUserBackMessage(user);
        MessageModel messageModel2 = studentServiceImpl.addStuBackMessage(student);
        if (messageModel1.getCode() == 200 && messageModel2.getCode() == 200) {
            if (messageModel3.getCode() == 200) {
                request.setAttribute("msg", "注册成功");
                request.getRequestDispatcher("login/login.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "两次密码不一致");
                request.getRequestDispatcher("register/register.jsp").forward(request, response);
            }
        } else if (messageModel1.getCode() != 200 && messageModel2.getCode() == 200) {
            if (messageModel3.getCode() != 200) {
                request.setAttribute("msg1", messageModel3.getMessage());
            }
            request.setAttribute("msg", messageModel1.getMessage());
            request.getRequestDispatcher("register/register.jsp").forward(request, response);
        } else if (messageModel1.getCode() == 200 && messageModel2.getCode() != 200) {
            if (messageModel3.getCode() != 200) {
                request.setAttribute("msg1", messageModel3.getMessage());
            }
            request.setAttribute("msg", messageModel2.getMessage());
            request.getRequestDispatcher("register/register.jsp").forward(request, response);
        } else {
            if (messageModel3.getCode() != 200) {
                request.setAttribute("msg1", messageModel3.getMessage());
            }
            request.setAttribute("msg", messageModel1.getMessage());
            request.getRequestDispatcher("register/register.jsp").forward(request, response);
        }



/*        if (rsStu > 0 && rsUser > 0) {
            request.setAttribute("massage", "注册成功！！");
            request.getRequestDispatcher("login/login.jsp").forward(request, response);

        } else {
            request.setAttribute("msg", "注册失败！！");
            request.getRequestDispatcher("register/register.jsp").forward(request, response);
        }*/
    }

}



