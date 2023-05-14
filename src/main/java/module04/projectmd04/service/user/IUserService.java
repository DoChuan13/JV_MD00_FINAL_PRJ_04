package module04.projectmd04.service.user;


import module04.projectmd04.model.Role;
import module04.projectmd04.model.User;
import module04.projectmd04.service.generic.IGenericService;

import java.util.Set;

public interface IUserService extends IGenericService<User> {
    boolean existedByUserName(String userName);

    boolean existByEmail(String email);

    User userLogin(String userName, String password);

    Set<Role> findRoleByUserId(int userId);

    void updateAvatar(String avatar, int id);
}
