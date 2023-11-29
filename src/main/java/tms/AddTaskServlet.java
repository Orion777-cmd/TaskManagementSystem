package tms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class AddTaskServlet
 */
@WebServlet("/addTask")  // Specify the URL mapping for this servlet
public class AddTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTaskServlet() {
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
        String task_title = request.getParameter("task_title");
        String description = request.getParameter("description");
        String due_date = request.getParameter("due_date");
        String priority = request.getParameter("priority");
        Integer user_id = null;
        String userIdString = request.getParameter("user_id");
        if (userIdString != null && !userIdString.isEmpty()) {
            user_id = Integer.parseInt(userIdString);
        }
        
        System.out.println("here "+ user_id);
        try {
            Connection  conn = JDBConnection.getConnection();
            String query = "INSERT INTO tasks (user_id, task_title, description, due_date, priority) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, user_id);
            pstmt.setString(2, task_title);
            pstmt.setString(3, description);
            
            // Convert String to Date
            
            java.util.Date utilDate = new SimpleDateFormat("MM-dd-yyyy").parse(due_date);
            Date sqlDate = new Date(utilDate.getTime());
            pstmt.setDate(4, sqlDate);
            
            pstmt.setString(5, priority);
            System.out.println(task_title+ description+ due_date + priority);
            pstmt.executeUpdate();
            response.sendRedirect("profile.jsp");
        } catch(SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
    }
}
