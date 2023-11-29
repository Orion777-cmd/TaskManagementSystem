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
    <div class="bg-success container h-50 mx-auto mt-5 text-center p-5">
        <h1>Add/Edit Task</h1>

        <!-- Task Form -->
        <form action="addtask" method="post">
            <div class="form-group">
                <label for="taskTitle">Task Title:</label>
                <input type="text" class="form-control" id="taskTitle" name="taskTitle" placeholder="Enter task title">
            </div>
            <div class="form-group">
                <label for="taskDescription">Task Description:</label>
                <textarea class="form-control" id="taskDescription" name="taskDescription" placeholder="Enter task description"></textarea>
            </div>
            <div class="form-group">
                <label for="dueDate">Due Date:</label>
                <input type="date" class="form-control" id="dueDate" name="dueDate">
            </div>
            <div class="form-group">
                <label for="priority">Priority:</label>
                <select class="form-control" id="priority" name="priority">
                    <option value="High">High</option>
                    <option value="Medium">Medium</option>
                    <option value="Low">Low</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Save Task</button>
        </form>
    </div>
</body>
</html>
