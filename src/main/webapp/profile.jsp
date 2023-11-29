<%@ page import="tms.TaskFetch, tms.Task" %>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
		int user_id = (Integer) session.getAttribute("user_id");
		System.out.println(user_id);
		TaskFetch taskFetch = new TaskFetch();
	    List<Task> tasks = taskFetch.fetchTasksForUser(user_id);
	%>
    <div class="bg-success container mt-5 p-5">
        <!-- Edit Profile Button -->
        <a href="editprofile.jsp" class="btn btn-primary float-right">Edit Profile</a>

        <h1 class="text-center mb-4">User Profile</h1>
        
        <!-- User Tasks Section -->
        <div class="row">
            <div class="col-md-10 mx-auto">
                <h2>Your Tasks</h2>
                <!-- Display tasks fetched dynamically -->
                <div class="row">
                    <%-- Java code to fetch tasks and populate cards --%>
                    <% 
                        for (Task task : tasks) {
                    %>
                        <div class="col-lg-6 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%= task.getTitle() %></h5>
                                    <p class="card-text"><%= task.getDescription() %></p>
                                    <p class="card-text">Due Date: <%= task.getDueDate() %></p>
                                    <p class="card-text">Priority: <%= task.getPriority() %></p>
                                    <!-- Add buttons for completing, editing, and deleting tasks -->
                                    <button type="button" class="btn btn-success">Completed</button>
                                    <button type="button" class="btn btn-primary">Edit Task</button>
                                    <button type="button" class="btn btn-danger">Delete Task</button>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
                
                <div class="text-center">
				    <a href="addtask.jsp?user_id=<%= user_id %>" type="button" class="btn btn-warning mt-5">Add Task</a>
				</div>

            </div>
        </div>
    </div>

</body>
</html>
