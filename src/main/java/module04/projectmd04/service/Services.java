package module04.projectmd04.service;

import module04.projectmd04.service.chat.ChatServiceIMPL;
import module04.projectmd04.service.chat.IChatService;
import module04.projectmd04.service.friend.FriendServiceIMPL;
import module04.projectmd04.service.friend.IFriendService;
import module04.projectmd04.service.post.IPostService;
import module04.projectmd04.service.post.PostServiceIMPL;
import module04.projectmd04.service.role.IRoleService;
import module04.projectmd04.service.role.RoleServiceIMPL;
import module04.projectmd04.service.user.IUserService;
import module04.projectmd04.service.user.UserServiceIMPL;

public final class Services {
    private static Services instance;
    private static final IRoleService roleService = new RoleServiceIMPL();
    private static final IUserService userService = new UserServiceIMPL();
    private static final IPostService postService = new PostServiceIMPL();
    private static final IChatService chatService = new ChatServiceIMPL();
    private static final IFriendService friendService = new FriendServiceIMPL();

    public Services() {
    }

    public IRoleService getRoleService() {
        return roleService;
    }

    public IUserService getUserService() {
        return userService;
    }

    public IPostService getPostService() {
        return postService;
    }

    public IChatService getChatService() {
        return chatService;
    }

    public IFriendService getFriendService() {
        return friendService;
    }

    public static synchronized Services getInstance() {
        if (instance == null) instance = new Services();
        return instance;
    }
}