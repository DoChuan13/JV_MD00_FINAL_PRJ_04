package module04.projectmd04.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class User implements Serializable {
    private int userId;
    private String name, userName, email, password, avatar
            = "https://firebasestorage.googleapis.com/v0/b/java-full-stack-76e1c.appspot.com/o/avatar.jpeg?alt=media&token=1be277f5-54cd-4649-882b-be73e3fec844";

    private Set<Role> roleSet = new HashSet<>();
    private boolean status = false;

    public User(int userId, String name, String userName, String avatar) {
        this.userId = userId;
        this.name = name;
        this.userName = userName;
        this.avatar = avatar;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public User() {
    }

    public User(int userId, String name, String userName, String email, String password, String avatar,
                Set<Role> roleSet) {
        this.userId = userId;
        this.name = name;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        this.roleSet = roleSet;
    }

    public User(int userId, String name, String userName, String email, String avatar, Set<Role> roleSet) {
        this.userId = userId;
        this.name = name;
        this.userName = userName;
        this.email = email;
        this.avatar = avatar;
        this.roleSet = roleSet;
    }

    public User(int userId, String name, String userName, String email, String avatar, Set<Role> roleSet,
                boolean status) {
        this.userId = userId;
        this.name = name;
        this.userName = userName;
        this.email = email;
        this.avatar = avatar;
        this.roleSet = roleSet;
        this.status = status;
    }

    public User(String name, String userName, String email, String password, Set<Role> roleSet) {
        this.name = name;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.roleSet = roleSet;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Set<Role> getRoleSet() {
        return roleSet;
    }

    public void setRoleSet(Set<Role> roleSet) {
        this.roleSet = roleSet;
    }

    @Override
    public String toString() {
        return "User{" +
               "userId=" + userId +
               ", name='" + name + '\'' +
               ", userName='" + userName + '\'' +
               ", email='" + email + '\'' +
               ", password='" + password + '\'' +
               ", avatar='" + avatar + '\'' +
               ", roleSet=" + roleSet +
               ", status=" + status +
               '}';
    }
}
