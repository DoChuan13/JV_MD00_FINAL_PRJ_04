package module04.projectmd04.service.role;


import module04.projectmd04.model.Role;
import module04.projectmd04.model.RoleName;

public interface IRoleService {
    Role findByRoleName(RoleName name);
}
