package module04.projectmd04.service.role;

import module04.projectmd04.config.Configs;
import module04.projectmd04.model.Role;
import module04.projectmd04.model.RoleName;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleServiceIMPL implements IRoleService {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();
    String SELECT_ROLE_NAME = "select * from role where roleName = ?;";

    @Override
    public Role findByRoleName(RoleName roleName) {
        Role role = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROLE_NAME);
            preparedStatement.setString(1, String.valueOf(roleName));

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int roleId = Integer.parseInt(resultSet.getString("roleId"));
                role = new Role(roleId, roleName);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return role;
    }
}
