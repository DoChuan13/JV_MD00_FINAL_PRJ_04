package module04.projectmd04.service;

import module04.projectmd04.service.role.IRoleService;
import module04.projectmd04.service.role.RoleServiceIMPL;
import module04.projectmd04.service.user.IUserService;
import module04.projectmd04.service.user.UserServiceIMPL;

public final class Services {
    private static Services instance;
    private static final IRoleService roleService = new RoleServiceIMPL();
    private static final IUserService userService = new UserServiceIMPL();

    public Services() {
    }

    public static IRoleService getRoleService() {
        return roleService;
    }

    public static IUserService getUserService() {
        return userService;
    }

    public static synchronized Services getInstance() {
        if (instance == null) instance = new Services();
        return instance;
    }
}