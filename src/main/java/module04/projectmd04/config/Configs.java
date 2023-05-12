package module04.projectmd04.config;


import module04.projectmd04.config.detail.ConnectMySQL;

import java.sql.Connection;

public final class Configs {
    private static final String USER = System.getenv("USER");
    private static final String PASSWORD = System.getenv("PASSWORD");
    private static final String DATABASE = System.getenv("DATABASE");
    private static Configs instance;
    private final Connection connectMySQL = ConnectMySQL.getConnection(USER, PASSWORD, DATABASE);

    public Configs() {
    }

    public Connection getConnectMySQL() {
        return connectMySQL;
    }

    public static synchronized Configs getInstance() {
        if (instance == null) instance = new Configs();
        return instance;
    }
}