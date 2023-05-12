package module04.projectmd04.service.role;

import module04.projectmd04.config.Configs;
import module04.projectmd04.model.role.Role;
import module04.projectmd04.model.role.RoleName;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleServiceIMPL implements IRoleService {
    Connection connection = Configs.getInstance().getConnectMySQL();

    @Override
    public Role findByRoleName(RoleName name) {
        Role role = null;
        try {
            String SELECT_ROLE_NAME = "select * from role where name = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROLE_NAME);
            preparedStatement.setString(1, String.valueOf(name));
            preparedStatement.executeUpdate();

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = Integer.parseInt(resultSet.getString("id"));
                role = new Role(id, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return role;
    }
}
