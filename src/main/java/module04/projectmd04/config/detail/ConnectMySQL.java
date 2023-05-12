package module04.projectmd04.config.detail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class ConnectMySQL {
    public static Connection getConnection(String user, String password, String database) {
        Connection connection;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(database, user, password);
            System.out.println("Connect Success");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Connect Error");
            throw new RuntimeException(e);
        }
        return connection;
    }
}