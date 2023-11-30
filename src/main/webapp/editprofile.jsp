<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Profile</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
    <!-- User Profile Section -->
    <div class="bg-success container h-50 mx-auto mt-5 text-center p-5">
        <h2>Edit Your Profile</h2>
        <form action="EditProfileServlet" method="post">

            <div class="form-group">
                <label for="username">User Name</label>
                
                <input type="text" class="form-control" id="username" name="name" value="<%= request.getParameter("name") %>" placeholder="Enter your username">
            </div>

            <div class="form-group">
                <label for="newpassword">Password</label>
                
                <input type="password" class="form-control" id="newpassword" name="password" value="<%= request.getParameter("password") %>" placeholder="Enter your password">
            </div>
            <input type="hidden" class="form-control" name="user_id" value="<%= request.getParameter("user_id") %>">

            <button type="submit" class="btn btn-primary" value="EditProfileServlet">Save Changes</button>
        </form>
    </div>
</body>
</html>
