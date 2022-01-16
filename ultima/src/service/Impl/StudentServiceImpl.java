package service.Impl;
import java.util.List;
import java.util.Map;

import dao.Impl.StudentDaoImpl;
import model.MessageModel;
import model.PageBean;
import model.Student;
import service.StudentService;

public class StudentServiceImpl implements StudentService{

    MessageModel messageModel = new MessageModel();
    private StudentDaoImpl studentDaoImpl=new StudentDaoImpl();

    public int addStu(Student student) {

        int rs=studentDaoImpl.addStu(student);
        return rs;
    }

    public MessageModel addStuBackMessage(Student student) {
        if (student.getStuNum() == null || "".equals(student.getStuNum().trim())) {
            messageModel.setCode(100);
            // 与用户账号相同不设置
            // 还是要设置，两个都不等于200后返回学生的方法
            // 不行，用户表里有密码
            messageModel.setMessage("学号不能为空");
            return messageModel;
        }
        if (student.getStuName() == null || "".equals(student.getStuName().trim())) {
            messageModel.setCode(100);
            // 与用户名相同不设置
            messageModel.setMessage("学生姓名不能为空");
            return messageModel;
        }
        // 性别是单选框必须，不为空
/*        if (student.getStuSex() == null || "".equals(student.getStuSex().trim())) {
            messageModel.setCode(100);
            messageModel.setMessage("性别不为空");
            return messageModel;
        }*/
/*        if (student.getStuAge() < 18 && student.getStuAge() > 25) {
            messageModel.setCode(100);
            messageModel.setMessage("年龄应在18到25之间");
            return messageModel;
        }
        设置了input的type为number */
        if (student.getStuClass() == null || "".equals(student.getStuClass())) {
            messageModel.setCode(100);
            messageModel.setMessage("班级不能为空");
            return messageModel;
        }
        if (student.getMajor() == null || "".equals(student.getMajor())) {
            messageModel.setCode(100);
            messageModel.setMessage("专业不能为空");
            return messageModel;
        }
        if (student.getDepartment() ==null || "".equals(student.getDepartment())) {
            messageModel.setCode(100);
            messageModel.setMessage("学院不能为空");
            return messageModel;
        }
        int rs = studentDaoImpl.addStu(student);
        if (rs < 1) {
            messageModel.setCode(100);
            messageModel.setMessage("操作失败");
            return messageModel;
        }
        return messageModel;
    }

    public int deleteStu(String stuNum) {

        int rs=studentDaoImpl.deleteStu(stuNum);
        return rs;
    }

    public int editStu(Student student) {

        int rs=studentDaoImpl.editStu(student);
        return rs;
    }

    public List findAll() {

        List rs=studentDaoImpl.findAll();
        return rs;
    }

    public List findOne(String userNum) {

        List rs=studentDaoImpl.findOne(userNum);
        return rs;
    }

    public PageBean stuListPage(int pageNo, int pageCount) {

        PageBean rs=studentDaoImpl.stuListPage(pageNo, pageCount);
        return rs;
    }

}
