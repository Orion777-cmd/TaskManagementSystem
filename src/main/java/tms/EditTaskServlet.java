package tms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class EditTaskServlet
 */
public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String taskIdStr = request.getParameter("id");
        String task_title = request.getParameter("task_title");
        String description = request.getParameter("description");
        String dueDateStr = request.getParameter("due_date");
        String priority = request.getParameter("priority");

        try {
            // Convert string representations to appropriate data types
            int taskId = Integer.parseInt(taskIdStr);
            java.util.Date utilDate = new SimpleDateFormat("MM-dd-yyyy").parse(dueDateStr);
            Date due_date = new Date(utilDate.getTime());
            System.out.println("first here");
            // Fetch the existing task using TaskFetch class
            TaskFetch taskFetch = new TaskFetch();
            Task existingTask = taskFetch.fetchTaskById(taskId);
            
            System.out.println("second here");
            // Update the existing task with new values
            existingTask.setTitle(task_title);
            existingTask.setDescription(description);
            existingTask.setDueDate(due_date);
            existingTask.setPriority(priority);
            System.out.println(existingTask.getTitle());
            // Use TaskFetch to update the task in the database
            taskFetch.editTask(existingTask);
            System.out.println("third here");
            System.out.println(existingTask.getTitle());
            // Redirect back to the profile page or any other appropriate page
            response.sendRedirect("profile.jsp?user_id=" + request.getParameter("user_id"));

        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
            // Handle parsing exceptions or other errors appropriately
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid task ID or date format.");
        }
    }
}
