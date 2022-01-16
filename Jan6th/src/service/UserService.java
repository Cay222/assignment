package service;

import bean.User;
import dao.UserDao;

import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();

    public List<User> queryAllUser() {
        return UserDao.queryAllUser();
    }

    public List<User> queryUserListByState(int state) {
        return userDao.queryUserListByState(state);
    }
}
