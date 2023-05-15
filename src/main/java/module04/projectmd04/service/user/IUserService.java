package module04.projectmd04.service.user;


import module04.projectmd04.model.Role;
import module04.projectmd04.model.RoleName;
import module04.projectmd04.model.User;
import module04.projectmd04.service.generic.IGenericService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

public interface IUserService extends IGenericService<User> {
    boolean existedByUserName(String userName);

    boolean existByEmail(String email);

    User userLogin(String userName, String password);

    Set<Role> findRoleByUserId(int userId);

    void updateAvatar(String avatar, int id);

    User getCurrentUser(HttpServletRequest request);

    RoleName redirectAction(User user, HttpServletResponse response);
}
