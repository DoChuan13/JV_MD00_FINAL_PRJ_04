package module04.projectmd04.config.detail;

public final class SQLQuery {
    public static final String SELECT_USER_FROM_USER = "select userName from user;";
    public static final String SELECT_EMAIL_FROM_USER = "select email from user;";
    public static final String SELECT_USER_LIST = "select * from user;";
    public static final String SELECT_ROLE_NAME = "select * from role where name = ?;";
    public static final String INSERT_INTO_USER = "insert into user (name, userName, email, password, avatar) " +
                                                  "values (?, ?, ?, ?, ?);";
    public static final String INSERT_INTO_USER_ROLE = "insert into user_role (userId, roleId) values (?, ?);";
    public static final String SELECT_ROLE_BY_USER_ID = "select r.id, r.name from role r " +
                                                        "join user_role ur on r.id = ur.roleId " + "where r.id = ?;";
}
