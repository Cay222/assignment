package service.Impl;

import java.util.List;

import dao.Impl.UserDaoImpl;
import model.MessageModel;
import model.User;
import service.UserService;

public class UserServiceImpl implements UserService {

    private UserDaoImpl userDaoImpl = new UserDaoImpl();
    MessageModel messageModel = new MessageModel();

    public User login(User user) {

        User rs = userDaoImpl.login(user);
        System.out.println(rs);
        return rs;
    }

    public int editPwd(User user) {

        int rs = userDaoImpl.editPwd(user);
        return rs;
    }

    public int addUser(User user) {

        int rs = userDaoImpl.addUser(user);
        return rs;
    }

    public List findAll() {

        List rs = userDaoImpl.findAll();
        return rs;
    }

    public List selectOneUser(int userID) {

        List rs = userDaoImpl.selectOneUser(userID);
        return rs;
    }

    public int editUser(User user) {

        int rs = userDaoImpl.editUser(user);
        return rs;
    }

    public MessageModel addUserBackMessage(User user) {
        if (user.getUserNum() == null || "".equals(user.getUserNum().trim())) {
            messageModel.setCode(100);
            messageModel.setMessage("学号不能为空");
            return messageModel;
        }
        if (user.getUserName() == null || "".equals(user.getUserName().trim())){
            messageModel.setCode(100);
            messageModel.setMessage("姓名不能为空");
            return messageModel;
        }
        if (user.getPassword() == null || "".equals(user.getPassword().trim())) {
            messageModel.setCode(100);
            messageModel.setMessage("密码不能为空");
            return messageModel;
        }
        if (user.getPassword().length() < 6) {
            messageModel.setCode(100);
            messageModel.setMessage("密码必须大于等于6位");
            return messageModel;
        }
        if (user.getPhone() == null || "".equals(user.getPhone().trim())) {
            messageModel.setCode(100);
            messageModel.setMessage("手机号不能为空");
            return messageModel;
        }
        int i = userDaoImpl.addUser(user);
        if (i < 1) {
            messageModel.setCode(100);
            messageModel.setMessage("注册失败");
            return messageModel;
        }
        return messageModel;
    }
}
