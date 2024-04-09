package BGGym;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class custdetailsServlet extends HttpServlet
{
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    PrintWriter out = response.getWriter();

	    try {
	        int custno = Integer.parseInt(request.getParameter("custno"));
	        String custname = request.getParameter("custname");
	        String gender = request.getParameter("gender");
	        String strdoj = request.getParameter("doj");
	        String strdob = request.getParameter("dob");

	        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	        Date doj = dateFormatter.parse(strdoj);
	        Date dob = dateFormatter.parse(strdob);

	        int age = Integer.parseInt(request.getParameter("custage"));
	        String packages = request.getParameter("packages");
	        String occupation = request.getParameter("occupation");
	        String bloodgrp = request.getParameter("bloodgrp");
	        int height = Integer.parseInt(request.getParameter("height"));
	        int weight = Integer.parseInt(request.getParameter("weight"));
	       // int bmi = Integer.parseInt(request.getParameter("bmi"));
	        double bmi = Double.parseDouble(request.getParameter("bmi"));
 
	        //String strbmi = request.getParameter("bmi");
	        //System.out.println(strbmi);
	        //Double bmi = Double.parseDouble(strbmi);
	        long phno = Long.parseLong(request.getParameter("phno"));
	        long emphno = Long.parseLong(request.getParameter("emphno"));
	        String address = request.getParameter("address");
	        String registeredby=request.getParameter("registeredby");

	        // JDBC connection
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");

	        // Insert query
	        String query = "INSERT INTO custdetails (custno,custname,gender,doj,dob,age,packages,occupation,bloodgrp,height,weight,bmi,phno,emphno,address,registeredby) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	        pstmt = con.prepareStatement(query);
	        pstmt.setInt(1, custno);
	        pstmt.setString(2,custname);
	        pstmt.setString(3, gender);
	        pstmt.setString(4, dateFormatter.format(doj));
	        pstmt.setString(5, dateFormatter.format(dob));
	        pstmt.setInt(6, age);
	        pstmt.setString(7, packages);
	        pstmt.setString(8, occupation);
	        pstmt.setString(9, bloodgrp);
	        pstmt.setInt(10, height);
	        pstmt.setInt(11, weight);
	        
	        pstmt.setDouble(12, bmi);
	      
	        
	        
	      //  pstmt.setInt(12, bmi);
	        pstmt.setLong(13, phno);
	        pstmt.setLong(14, emphno);
	        pstmt.setString(15, address);
	        pstmt.setString(16, registeredby);

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	        	//response.sendRedirect("custdetailsform.jsp");
	        	 response.sendRedirect("custdetailsform.jsp?username=" + registeredby);
	        } else {
	            response.sendRedirect("Customerentryform.jsp");
	        }
	    } catch (SQLException | ClassNotFoundException | ParseException e) {
	        e.printStackTrace();
	        // Handle the error gracefully, e.g., forward to an error page
	        // out.println("Error: " + e.getMessage());
	    } finally {
	        // Close resources in a finally block to ensure they're closed regardless of exceptions
	        try {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle the error gracefully
	        }
	    }
	}

	}


