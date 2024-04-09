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


public class custeditServlet extends HttpServlet
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
	        double bmi = Double.parseDouble(request.getParameter("bmi"));
	        long phno = Long.parseLong(request.getParameter("phno"));
	        long emphno = Long.parseLong(request.getParameter("emphno"));
	        String address = request.getParameter("address");
	        String registeredby = request.getParameter("registeredby");

	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");

	        String query = "UPDATE custdetails SET custname=?,gender=?,doj=?,dob=?,age=?,packages=?,occupation=?,bloodgrp=?,height=?,weight=?,bmi=?,phno=?,emphno=?,address=? WHERE custno=?";
	        pstmt = con.prepareStatement(query);

	        pstmt.setString(1, custname);
	        pstmt.setString(2, gender);
	        pstmt.setDate(3, new java.sql.Date(doj.getTime()));
	        pstmt.setDate(4, new java.sql.Date(dob.getTime()));
	        pstmt.setInt(5, age);
	        pstmt.setString(6, packages);
	        pstmt.setString(7, occupation);
	        pstmt.setString(8, bloodgrp);
	        pstmt.setInt(9, height);
	        pstmt.setInt(10, weight);
	        pstmt.setDouble(11, bmi);
	        pstmt.setLong(12, phno);
	        pstmt.setLong(13, emphno);
	        pstmt.setString(14, address);
	        pstmt.setInt(15, custno);

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            response.sendRedirect("custdetailsform.jsp?username=" + registeredby);
	        }
	    } catch (SQLException | ClassNotFoundException | NumberFormatException | ParseException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) {
	                pstmt.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	}


