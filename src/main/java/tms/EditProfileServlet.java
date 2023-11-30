package tms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EditProfileServlet
 */
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
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
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		int id = Integer.parseInt(request.getParameter("user_id"));
		System.out.println(name);
		try {
            
            UserFetch userFetch = new UserFetch();
            User existingUser = userFetch.fetchUserById(id);

            System.out.println(existingUser.getName());
            existingUser.setName(name);
            existingUser.setPassword(password);

            System.out.println(existingUser.getName());
            userFetch.editUser(existingUser);
            System.out.println("finished ");
            
            response.sendRedirect("profile.jsp?user_id=" + id);
        } catch (NumberFormatException e) {
            e.printStackTrace();

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID format.");
        }
		
	}

}
