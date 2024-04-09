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


public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Connection con=null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");
	        
	        String username=request.getParameter("username");
	        String pwd=request.getParameter("password");
	        String query="Select * from adminlogin where username=? and password =? ";
	        
	        PreparedStatement pst=con.prepareStatement(query);
	        
	        pst.setString(1, username);
	        pst.setString(2, pwd);
	        
	        ResultSet rs=pst.executeQuery();
	       
	        if(rs.next()) 
	        {
	        	response.sendRedirect("custdetailsform.jsp?username="+ username);
	        	//response.sendRedirect("custdetailsform.jsp?username=" + username);
	        	
	        }
	        else
	        {
	        	response.sendRedirect("Loginform.jsp");
	        }
	        
	        
		
		}
		catch(Exception e)
		{
			
			
		}
		
	}

	

}
