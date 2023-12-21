package tms;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import java.io.IOException;
import java.util.regex.Pattern;

/**
 * Servlet Filter implementation class RegistrationFilter
 */
public class RegistrationFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public RegistrationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
			// pass the request along the filter chain
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Perform validation (add your validation logic here)
        if (isValidInput(name, email, password)) {
            // Input is valid, proceed to the servlet
            chain.doFilter(request, response);
        } else {
            // Input is invalid, you may redirect or handle it as needed
            response.getWriter().write("Invalid input parameters");
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	 private boolean isValidInput(String name, String email, String password) {
	        // Validate name, email, and password
	        return isNotEmpty(name) && isValidEmail(email) && isValidPassword(password);
	    }

	    private boolean isNotEmpty(String value) {
	        return value != null && !value.isEmpty();
	    }

	    private boolean isValidEmail(String email) {
	        // Regular expression for a simple email format validation
	        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
	        return isNotEmpty(email) && Pattern.matches(emailRegex, email);
	    }

	    private boolean isValidPassword(String password) {
	        // Password should be at least 6 characters long and contain both letters and numbers
	        return isNotEmpty(password) && password.length() >= 6 && containsLetterAndNumber(password);
	    }

	    private boolean containsLetterAndNumber(String password) {
	        // Check if the password contains both letters and numbers
	        boolean containsLetter = false;
	        boolean containsNumber = false;

	        for (char c : password.toCharArray()) {
	            if (Character.isLetter(c)) {
	                containsLetter = true;
	            } else if (Character.isDigit(c)) {
	                containsNumber = true;
	            }

	            if (containsLetter && containsNumber) {
	                return true;
	            }
	        }

	        return false;
	    }

}
