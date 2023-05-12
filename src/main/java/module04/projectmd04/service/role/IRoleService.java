package module04.projectmd04.service.role;


import module04.projectmd04.model.role.Role;
import module04.projectmd04.model.role.RoleName;

public interface IRoleService {
    Role findByRoleName(RoleName name);
}
