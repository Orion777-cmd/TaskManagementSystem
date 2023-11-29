<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<div class="bg-success container h-50 mx-auto mt-5 text-center p-5">
        <h1 class="">Login Page</h1>
        <form action="LoginServlet" method="post" class="mt-4">
         

            <!-- Email Input -->
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Email" required>
            </div>

            <!-- Password Input -->
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary" value="LoginServlet">Login</button>
        </form>
    </div>
</body>
</html>