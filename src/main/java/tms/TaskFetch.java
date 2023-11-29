package tms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class TaskFetch {
    public List<Task> fetchTasksForUser(int userId) {
        List<Task> tasks = new ArrayList<>();

        try {
            Connection conn = JDBConnection.getConnection();
            String sql = "SELECT * FROM user_tasks WHERE user_id = ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setInt(1, userId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("task_id");
                        String title = resultSet.getString("task_title");
                        String description = resultSet.getString("description");
                        Date dueDate = resultSet.getDate("due_date");
                        String priority = resultSet.getString("priority");

                        Task task = new Task(id, title, description, dueDate, priority);
                        tasks.add(task);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }

    public List<Task> fetchTasksByTitle(int userId, String title) {
        List<Task> tasks = new ArrayList<>();

        try (Connection conn = JDBConnection.getConnection()) {
            String sql = "SELECT * FROM user_tasks WHERE user_id = ? AND task_title LIKE ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setInt(1, userId);
                statement.setString(2, "%" + title + "%");

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("task_id");
                        String taskTitle = resultSet.getString("task_title");
                        String description = resultSet.getString("description");
                        Date dueDate = resultSet.getDate("due_date");
                        String priority = resultSet.getString("priority");

                        Task task = new Task(id, taskTitle, description, dueDate, priority);
                        tasks.add(task);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }

    // Existing method to fetch tasks by due date
    public List<Task> fetchTasksByDueDate(int userId, String dueDate) {
        List<Task> tasks = new ArrayList<>();

        try (Connection conn = JDBConnection.getConnection()) {
            String sql = "SELECT * FROM user_tasks WHERE user_id = ? AND due_date = ?";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setInt(1, userId);
                statement.setString(2, dueDate);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("task_id");
                        String taskTitle = resultSet.getString("task_title");
                        String description = resultSet.getString("description");
                        Date taskDueDate = resultSet.getDate("due_date");
                        String priority = resultSet.getString("priority");

                        Task task = new Task(id, taskTitle, description, taskDueDate, priority);
                        tasks.add(task);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }
    
 
    public List<Task> fetchTasksSortedByDueDate(int userId) {
        List<Task> tasks = fetchTasksForUser(userId);
        Collections.sort(tasks, Comparator.comparing(Task::getDueDate));
        return tasks;
    }

    public List<Task> fetchTasksSortedByPriority(int userId) {
        List<Task> tasks = fetchTasksForUser(userId);
        

        Comparator<Task> priorityComparator = Comparator.comparingInt(task -> {
            switch (task.getPriority()) {
                case "High":
                    return 3;
                case "Medium":
                    return 2;
                case "Low":
                    return 1;
                default:
                    return 0; 
            }
        });

       
        Collections.sort(tasks, priorityComparator.reversed());

        return tasks;
    }
    
    public void deleteTask(int taskId) {
        try (Connection conn = JDBConnection.getConnection()) {
            String query = "DELETE FROM tasks WHERE id = ?";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, taskId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }



}
