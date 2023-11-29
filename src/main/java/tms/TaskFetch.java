package tms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaskFetch {
    public List<Task> fetchTasksForUser(int userId) {
        List<Task> tasks = new ArrayList<>();

        try {
            Connection conn = JDBConnection.getConnection();
            String sql = "SELECT * FROM user_tasks WHERE user_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, userId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("task_id");
                String title = resultSet.getString("task_title");
                String description = resultSet.getString("description");
                Date dueDate = resultSet.getDate("due_date");
                String priority = resultSet.getString("priority");

                Task task = new Task(id, title, description, dueDate, priority);
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }
}
