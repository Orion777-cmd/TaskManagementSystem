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
    <div class="bg-success container mt-5 p-5">
        <!-- Edit Profile Button -->
        <a href="editprofile.jsp" class="btn btn-primary float-right">Edit Profile</a>

        <h1 class="text-center mb-4">User Profile</h1>
        
        <!-- User Tasks Section -->
        <div class="row">
            <div class="col-md-10 mx-auto">
                <h2>Your Tasks</h2>
                <!-- Display tasks here, you can use a loop or other logic -->
                
                <!-- Search Feature -->
                <div class="my-4">
                    <h2>Search Tasks</h2>
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search by Title or Due Date">
                        </div>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </div>

                <!-- Task Cards in a Grid -->
                <div class="row">
                    <!-- Example Task 1 -->
                    <div class="col-lg-6 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Task Title 1</h5>
                                <p class="card-text">Task Description 1</p>
                                <p class="card-text">Due Date: 2023-01-01</p>
                                <p class="card-text">Priority: High</p>
                                <!-- Add buttons for completing, editing, and deleting tasks -->
                                <button type="button" class="btn btn-success">Completed</button>
                                <button type="button" class="btn btn-primary">Edit Task</button>
                                <button type="button" class="btn btn-danger">Delete Task</button>
                            </div>
                        </div>
                    </div>
                    <!-- End of Example Task 1 -->

                    <!-- Example Task 2 -->
                    <div class="col-lg-6 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Task Title 2</h5>
                                <p class="card-text">Task Description 2</p>
                                <p class="card-text">Due Date: 2023-01-02</p>
                                <p class="card-text">Priority: Medium</p>
                                <!-- Add buttons for completing, editing, and deleting tasks -->
                                <button type="button" class="btn btn-success">Completed</button>
                                <button type="button" class="btn btn-primary">Edit Task</button>
                                <button type="button" class="btn btn-danger">Delete Task</button>
                            </div>
                        </div>
                    </div>
                    <!-- End of Example Task 2 -->

                    <!-- Continue adding tasks as needed -->
                </div>
                
                <div class="text-center">
				    <a href="addtask.jsp" type="button" class="btn btn-warning mt-5">Add Task</a>
				</div>


            </div>
        </div>
    </div>

</body>
</html>
