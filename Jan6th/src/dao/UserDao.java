package dao;

import bean.User;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public static List<User> queryAllUser() {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> list = new ArrayList<>();
        String sql = "select * from user where state=?";
        try {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 0);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return list;
    }

    public List<User> queryUserListByState(int state) {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> list = new ArrayList<>();
        String sql = "select * from user where state=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, state);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return list;
    }

/*    public List<User> queryUserToPage(UserQuery userQuery) {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> list = new ArrayList<>();
        String sql = "select * from user where state=?";
        try {
            //不输入条件就查询所有数据再分页
            if (userQuery.getToken() == null || "".equals(userQuery.getToken().trim())) {
                sql += " limit ?, ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 0);
                ps.setInt(2, (userQuery.getPageNum() - 1) * userQuery.getPageSize());
                ps.setInt(3, userQuery.getPageSize());
            }

            if (userQuery.getToken() != null && !"".equals(userQuery.getToken().trim())) {
                sql += " and name like concat('%', ?, '%') limit ?, ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 0);
                ps.setString(2, userQuery.getToken());
                ps.setInt(3, (userQuery.getPageNum() - 1) * userQuery.getPageSize());
                ps.setInt(4, userQuery.getPageSize());
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return list;
    }

    public int queryCount(UserQuery userQuery) {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int row = 0;
        String sql = "select * from user where state=?";
        try {
            if (userQuery.getToken() != null && !"".equals(userQuery.getToken().trim())) {
                sql += " and name like ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 0);
                ps.setString(2, "%" + userQuery.getToken() + "%");
            }
            if (userQuery.getToken() == null || "".equals(userQuery.getToken().trim())) {
                ps = conn.prepareStatement(sql);
                ps.setInt(1, 0);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                row ++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return row;
    }

    public int addUser(User user) {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;
        int row = 0;
        String sql = "insert into user(name, password, email, avatar, state) value(?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAvatar());
            ps.setInt(5, user.getState());
            row = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return row;
    }

    public int deleteById(int id) {
        Connection conn = DBUtil.getConn();
        int row = 0;
        String sql = "update user set state=? where id=?";
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setInt(2, id);
            row = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return row;
    }

    public User queryById(int id) {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;
        String sql = "select * from user where id=?";
        User user = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return user;
    }

    public int updateById(User user) {
        Connection conn = DBUtil.getConn();
        PreparedStatement ps = null;
        int row = 0;
        String sql = "insert into user(name, password, email, avatar, state) value(?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAvatar());
            ps.setInt(5, user.getId());
            row = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConn(conn);
        }
        return row;
    }*/
}
