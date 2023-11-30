package tms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserFetch {
	public User fetchUserById(int userId) {
        User user = null;

        try {
            Connection conn = JDBConnection.getConnection();
            String sql = "SELECT * FROM users WHERE id = ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setInt(1, userId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String name = resultSet.getString("name");
                        String password = resultSet.getString("password");

                        user = new User(userId, name, password);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public void editUser(User updatedUser) {
        try (Connection conn = JDBConnection.getConnection()) {
            String query = "UPDATE users SET name = ?, password = ? WHERE id = ?";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, updatedUser.getName());
                statement.setString(2, updatedUser.getPassword());
                statement.setInt(3, updatedUser.getId()); 
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
