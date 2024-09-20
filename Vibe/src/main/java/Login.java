

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class Login
 */
@SuppressWarnings("unused")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String pass=request.getParameter("pw");
		
		//out.println("<html>"+email+" "+pass+"<br>");
		
		try {
			Connection con;
			Statement stmt;

            Class.forName("com.mysql.cj.jdbc.Driver");

            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vibenexa","root","");
            
            

            stmt=con.createStatement();
           
            ResultSet rs=stmt.executeQuery("select * from user where email='" + email + "' and password='" + pass + "'");
            String str="NO";
            int id=0;
            if(rs.next())
            {
            	id=rs.getInt(1);
            	str="loginSuccessful";
            }
            else
            {
            	response.sendRedirect("login.html?error=true");
            }
            if (str=="loginSuccessful") {
                
            	
            	request.setAttribute("id", id);
                HttpSession session = request.getSession();
                session.setAttribute("id", id);
                RequestDispatcher rd=request.getRequestDispatcher("AccessDB");
                rd.forward(request, response);

                
                response.sendRedirect("home.jsp");
            } else {
                // Redirect back to the login page with an error message
                response.sendRedirect("login.html?error=true");
            }
             
		}catch(Exception e) { out.println("<p>"+e+"<p></html>");}
		
	}

}
