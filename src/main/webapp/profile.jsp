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
    <style>
        .completed-card {
            text-decoration: line-through;
            color: #d3d3d3; 
        }
    </style>
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		int user_id; 
		Object userIdFromSession = session.getAttribute("user_id");
		if (userIdFromSession != null) {
		    user_id = (Integer) userIdFromSession;
		} else {
		    String userIdParam = request.getParameter("user_id");
		    
		    user_id = Integer.parseInt(userIdParam);
		   
		}
		TaskFetch taskFetch = new TaskFetch();
		String searchTitle = request.getParameter("searchTitle");
        String searchDueDate = request.getParameter("searchDueDate");
        String sortBy = request.getParameter("sortBy");
        List<Task> tasks;

        if (searchTitle != null && !searchTitle.isEmpty()) {
            
            tasks = taskFetch.fetchTasksByTitle(user_id, searchTitle);
        } else if (searchDueDate != null && !searchDueDate.isEmpty()) {
            
            tasks = taskFetch.fetchTasksByDueDate(user_id, searchDueDate);
        } else {
        	if ("dueDate".equals(sortBy)) {
                tasks = taskFetch.fetchTasksSortedByDueDate(user_id);
            } else if ("priority".equals(sortBy)) {
                tasks = taskFetch.fetchTasksSortedByPriority(user_id);
            } else {
                tasks = taskFetch.fetchTasksForUser(user_id);
            }
        }
	%>
    <div class="bg-success container mt-5 p-5 d-flex-col">
        <!-- Edit Profile Button -->
        <form action="editprofile.jsp" method="get" >
        
        	<input type="hidden" name="name" value="<%= username %>">
        	<input type="hidden" name="password" value="<%= password %>">
        	<input type="hidden" name="user_id" value="<%= user_id %>">
        	<button type="submit" value="editprofile.jsp" class="btn btn-primary float-right">Edit Profile</button>
        </form>
        

        <h1 class="text-center mb-4"><%= username %></h1>
        
        
        <form action="profile.jsp?user_id=<%= user_id %>" method="get" class="mb-3 d-flex justify-content-center">
		    <div class="form-row">
		        <div class="col">
		            <input type="text" class="form-control" name="searchTitle" placeholder="Search by Title">
		        </div>
		        <div class="col">
		            <input type="text" class="form-control" name="searchDueDate" placeholder="Search by Due Date">
		        </div>
		        <div class="col">
                    <select name="sortBy" class="form-control">
                        <option value="default" <%=(sortBy == null || "default".equals(sortBy)) ? "selected" : ""%>>Default</option>
                        <option value="dueDate" <%="dueDate".equals(sortBy) ? "selected" : ""%>>Due Date</option>
                        <option value="priority" <%="priority".equals(sortBy) ? "selected" : ""%>>Priority</option>
                    </select>
                  </div>
		        <div class="col">
		            <button type="submit" class="btn btn-primary">Search</button>
		        </div>
		    	
		    </div>
		</form>

        <!-- User Tasks Section -->
        <div class="row">
        <div class="col-md-10 mx-auto">
            <h2>Your Tasks</h2>
            <!-- Display tasks fetched dynamically -->
            <div class="row">
                <% 
                    for (Task task : tasks) {
                %>
                    <div class="col-lg-6 mb-3">
                        <div class="card <%= (task.isCompleted()) ? "completed-card" : "" %>">
                            <div class="card-body">
                                <h5 class="card-title"><%= task.getTitle() %></h5>
                                <p class="card-text"><%= task.getDescription() %></p>
                                <p class="card-text">Due Date: <%= task.getDueDate() %></p>
                                <p class="card-text">Priority: <%= task.getPriority() %></p>
                                
                                <form action="edittask.jsp" method="get">
								    <input type="hidden" name="id" value="<%= task.getId() %>">
								    <input type="hidden" name="task_title" value="<%= task.getTitle() %>">
								    <input type="hidden" name="description" value="<%= task.getDescription() %>">
								    <input type="hidden" name="due_date" value="<%= task.getDueDate() %>">
								    <input type="hidden" name="priority" value="<%= task.getPriority() %>">
								    <input type="hidden" name="user_id" value="<%= user_id %>">
								    <button type="submit" class="btn btn-warning">Edit Task</button>
								</form>
                                <form action="CompleteTaskServlet" method="post">
                                    <input type="hidden" name="taskId" value="<%= task.getId() %>">
                                    <button type="submit" class="btn btn-success <%=(task.isCompleted()) ? "disabled" : ""%>">
                                        <%= (task.isCompleted()) ? "Completed" : "Complete" %>
                                    </button>
                                </form>

                                <form action="DeleteTaskServlet" method="post">
                                    <input type="hidden" name="taskId" value="<%= task.getId() %>">
                                    <button type="submit" class="btn btn-danger">Delete Task</button>
                                </form>
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
