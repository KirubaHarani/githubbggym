package BGGym;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class custdeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			Connection con=null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");
	        int custno = Integer.parseInt(request.getParameter("custno"));
	        String registeredby = request.getParameter("registeredby");

		 System.out.println("Customer Number: " + custno);
			
	        
	       String query="DELETE FROM custdetails WHERE custno = ?";
	        
	       PreparedStatement pst = con.prepareStatement(query);
	        
	        pst.setInt(1, custno);
	       
	        
	        int rowaffected=pst.executeUpdate();
	        
	        if(rowaffected>0) 
	        {
	        	 response.sendRedirect("custdetailsform.jsp?username=" + registeredby);        	
	        }
	       
	        
		
		}
		catch (SQLException e) {
		    e.printStackTrace(); // Handle the exception appropriately
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

