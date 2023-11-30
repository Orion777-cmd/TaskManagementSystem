<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Task</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<div class="bg-success container h-50 mx-auto mt-5 text-center p-5">
		<h2>Edit Task</h2>

        <form action="EditTaskServlet" method="post">
            <div class="form-group">
                <label for="taskTitle">Task Title:</label>
                <input type="text" class="form-control" id="taskTitle" name="task_title" value="<%= request.getParameter("task_title") %>">
            </div>

            <div class="form-group">
                <label for="taskDescription">Task Description:</label>
                <textarea class="form-control" id="taskDescription" name="description"><%= request.getParameter("description") %></textarea>
            </div>

            <div class="form-group">
                <label for="taskDueDate">Due Date:</label>
                <input type="date" class="form-control" id="taskDueDate" name="due_date" value="<%= request.getParameter("due_date") %>">
            </div>

            <div class="form-group">
			    <label for="taskPriority">Priority:</label>
			    <select class="form-control" id="taskPriority" name="priority">
			        <option value="High" <%= "High".equals(request.getParameter("priority")) ? "selected" : "" %>>High</option>
			        <option value="Medium" <%= "Medium".equals(request.getParameter("priority")) ? "selected" : "" %>>Medium</option>
			        <option value="Low" <%= "Low".equals(request.getParameter("priority")) ? "selected" : "" %>>Low</option>
			    </select>
			</div>

            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
			<input type="hidden" name="user_id" value="<%= request.getParameter("user_id") %> ">
            <button type="submit" class="btn btn-primary" value="EditTaskServlet">Update Task</button>
        </form>
	</div>
</body>
</html>