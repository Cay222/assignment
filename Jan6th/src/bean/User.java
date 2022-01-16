package bean;

public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    //头像路径
    private String avatar;
    //0或1，1为删除
    private int state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public User() {
        super();
    }

    //查询用户
    public User(int id, String name, String password, String email, String avatar, int state) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.avatar = avatar;
        this.state = state;
    }

    //添加用户，id设为自动增
    public User(String name, String password, String email, String avatar, int state) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.avatar = avatar;
        this.state = state;
    }

    //根据id更新用户
    public User(int id, String name, String password, String email, String avatar) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.avatar = avatar;
    }
}
