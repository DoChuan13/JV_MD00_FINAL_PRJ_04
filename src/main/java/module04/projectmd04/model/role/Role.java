package module04.projectmd04.model.role;

import java.io.Serializable;

public class Role implements Serializable {
    private int id;
    private RoleName name = RoleName.USER;

    public Role() {
    }

    public Role(int id, RoleName name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public RoleName getName() {
        return name;
    }

    public void setName(RoleName name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" +
               "id=" + id +
               ", name=" + name +
               '}';
    }
}
