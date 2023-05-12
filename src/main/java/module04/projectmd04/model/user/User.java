package module04.projectmd04.model.user;

import module04.projectmd04.model.role.Role;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class User implements Serializable {
    private int userId;
    private String name, userName, email, password, avatar;

    private Set<Role> roleSet = new HashSet<>();

    public User() {
    }

    public User(
            int userId, String name, String userName, String email, String password, String avatar, Set<Role> roleSet) {
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
}
