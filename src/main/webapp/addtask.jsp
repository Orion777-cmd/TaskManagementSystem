<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add/Edit Task</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%
	    String user_id = request.getParameter("user_id");
	    // Now, userId contains the user_id passed from the profile.jsp page
	%>
	
    <div class="bg-success container h-50 mx-auto mt-5 text-center p-5">
        <h1>Add/Edit Task</h1>

        <!-- Task Form -->
        <form action="AddTaskServlet?user_id=<%= user_id %>" method="post">
            <div class="form-group">
                <label for="task_itle">Task Title:</label>
                <input type="text" class="form-control" id="task_title" name="task_title" placeholder="Enter task title">
            </div>
            <div class="form-group">
                <label for="description">Task Description:</label>
                <textarea class="form-control" id="description" name="description" placeholder="Enter task description"></textarea>
            </div>
            <div class="form-group">
                <label for="due_date">Due Date:</label>
                <input type="date" class="form-control" id="due_date" name="due_date">
            </div>
            <div class="form-group">
                <label for="priority">Priority:</label>
                <select class="form-control" id="priority" name="priority">
                    <option value="High">High</option>
                    <option value="Medium">Medium</option>
                    <option value="Low">Low</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" value="AddTaskServlet">Save Task</button>
        </form>
    </div>
</body>
</html>
