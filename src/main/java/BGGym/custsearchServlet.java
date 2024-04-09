package BGGym;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class custsearchServlet
 */
public class custsearchServlet extends HttpServlet 
{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	        

	       
	        
	        Connection con = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");
	            String custname = request.getParameter("srcustname");
		        System.out.println(custname);
	            String query = "SELECT * FROM custdetails WHERE custname=?";

	           PreparedStatement pst = con.prepareStatement(query);
	           pst.setString(1, custname);
	           ResultSet rs = pst.executeQuery();
	           if(rs.next()) 
		        {
		        	response.sendRedirect("custdetailsform.jsp");
		        	
		        	
		        }      
		        
	            
	        } 
	        catch (SQLException | ClassNotFoundException e) {
		        e.printStackTrace();
		        // Handle the error gracefully, e.g., forward to an error page
		        // out.println("Error: " + e.getMessage());
		    }
	    }
	}

