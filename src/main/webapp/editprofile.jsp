<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit user Profile</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	 <!-- User Profile Section -->
        <div class="bg-success container h-50 mx-auto mt-5 text-center p-5">
            <h2>Edit Your Profile</h2>
            <form>
                <div class="form-group" action="EditTaskServlet" method="post">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Enter your username">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter your password">
                </div>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </form>
        </div>
</body>
</html>