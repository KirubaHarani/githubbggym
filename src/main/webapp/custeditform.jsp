<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BodyGarage Gym</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link your custom CSS file -->
    <link rel="stylesheet" href="styles.css">
</head>
 <link rel="stylesheet" href="styles.css">
    <style>
    #packages
     {
 		 width: 190px; /* Set the desired width */
	 }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around; /* Adjust as per your preference */
            padding: 20px;
        }
        .container > form,
        .container > table {
            width: 100%;
            margin-bottom: 20px;
        }
        .container table {
            border-collapse: collapse;
        }
        .container th, .container td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .container th {
            background-color: #f2f2f2;
        }
        .modify-links a {
            margin-right: 5px;
        }
        h2{
        color="white";
        }
        #doj,#dob
        {
        	width: 190px;	
        }
       
    </style>

<script>
        function calculateBMI() {
            var height = parseFloat(document.getElementById('height').value);
            var weight = parseFloat(document.getElementById('weight').value);

            if (!isNaN(height) && !isNaN(weight) && height > 0 && weight > 0) {
                var height = height / 100; // Convert height from cm to m
                var bmi = weight / (height * height);
                document.getElementById('bmi').value = bmi.toFixed(2);
            } 
        }
    </script>
<script>
 function validate() {
	 
    var custname = document.getElementById("custname").value;
    var custno = document.getElementById("custno").value;
    var packages = document.getElementById("packages").value;
    var age = document.getElementById("custage").value;
    var height = document.getElementById("height").value;
    var weight = document.getElementById("weight").value;
    var phno = document.getElementById("phno").value;
    var emphno = document.getElementById("emphno").value;
    
    var numbersOnly = /^\d+$/;
    var letters = /^[A-Za-z]+$/;
    var phonePattern = /^\d{10}$/;

    if (!custno.match(numbersOnly)) {
        alert("Invalid Customer Number");
        return false;
    }
    if(!custname.match(letters))
    {
    	alert("Invalid Customer Name");
    	return false;
    }
   
    if (!age.match(numbersOnly)) {
        alert("Invalid Age");
        return false;
    }
    
    if (!height.match(numbersOnly)) {
        alert("Invalid Height");
        return false;
    }
    if (!weight.match(numbersOnly)) {
        alert("Invalid Weight");
        return false;
    }
    if (!phno.match(numbersOnly)) {
        alert("Invalid Phone Number");
        return false;
    }
    if (!phno.match(phonePattern)) {
        alert("Invalid Phone Number");
        return false;
    }
    if (!emphno.match(phonePattern)) {
        alert("Invalid Emergency Phone Number");
        return false;
    }
    if (!emphno.match(numbersOnly)) {
        alert("Invalid Emergency Phone Number");
        return false;
    }

    if (packages.trim() === "--Select Package--") {
        alert("Please Select Package");
        return false;
    }
   
    return true; // Form will submit if all validations pass
}
</script>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> <!-- Make navbar fixed -->
  <a class="navbar-brand" href="#">BodyGarage Gym</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="homepage.jsp" >Logout</a>
      </li>
    </ul>
  </div>
</nav>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");
    
    int custno = Integer.parseInt(request.getParameter("custno"));
    

    String query = "SELECT * FROM custdetails where custno=?";
    pstmt = con.prepareStatement(query);
    pstmt.setInt(1, custno); // Set the parameter value
    rs = pstmt.executeQuery();
    
    
if (rs.next()) {
     
    
%>
<br><br><br>
	<div align="center">
	<h3>Edit Customer Entry Form</h3>
	<h3></h3>
	</div>
	<div align="center">
		    <form  onsubmit="return validate()" action="custeditServlet" method="post">
      
            <table>
            <tr>
                <td>Customer Number&nbsp;&nbsp;&nbsp; </td>
                <td><input type="text" name="custno" id="custno" value="<%=rs.getInt("custno") %>" readonly required></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                
                <td>  Blood Group&nbsp;&nbsp;&nbsp;</td>
                <td><input type="text" name="bloodgrp" id="bloodgrp" value="<%=rs.getString("bloodgrp") %>" required></td>
               
            </tr>
            <tr>
                <td>Customer Name</td>
                <td><input type="text" name="custname" id="custname" value="<%=rs.getString("custname") %>"  required></td>
                <td></td>
                
                <td>Height</td>
				<td><input type="number" name="height" id="height" value="<%=rs.getInt("height") %>" step="0.01" oninput="calculateBMI()" required></td>
      </tr>
            <tr>
                <td>Gender</td>
                <td colspan="2">
                    <label for="male">Male:</label>
                    <input type="radio" id="male" name="gender" value="male" <%= rs.getString("gender").equals("male") ? "checked" : "" %> required>

                    <label for="female">Female:</label>
                    <input type="radio" id="female" name="gender" value="female" <%= rs.getString("gender").equals("female") ? "checked" : "" %> required>

                </td>
                
                <td>Weight</td>
				<td><input type="number" name="weight" id="weight" value="<%=rs.getInt("weight") %>"  step="0.01" oninput="calculateBMI()" required></td>
  </tr>
            <tr>
                <td>Date Of Joining</td>
                <td><input type="date" id="doj" name="doj" value="<%=rs.getString("doj") %>" required></td>
                <td></td>
                 <td>BMI</td>
                <td><input type="text" name="bmi" id="bmi" value="<%=rs.getDouble("bmi") %>" readonly required></td>
            </tr>
            <tr>
                <td>Date Of Birth</td>
                <td><input type="date" id="dob" name="dob" value="<%=rs.getString("dob") %>" required></td>
                <td></td>
                 <td>Phone Number</td>
                <td><input type="text" name="phno" id="phno" value="<%=rs.getLong("phno") %>"  required></td>
            </tr>
            <tr>
                <td>Age</td>
                <td><input type="text" name="custage" id="custage" value="<%=rs.getInt("age") %>"></td>
                <td></td>
                <td>Emergency Phone Number&nbsp;&nbsp;&nbsp;</td>
                <td><input type="text" name="emphno" id="emphno" value="<%=rs.getLong("emphno") %>" required></td>
            </tr>
            <tr>
                <td>Package</td>
                <td colspan="2">             
                   <select id="packages" name="packages"   >
                	 
                    <option value="1month" <%= rs.getString("packages").equals("1 Month") ? "selected" : "" %>>1 Month</option>
                    <option value="3month" <%= rs.getString("packages").equals("3 Month") ? "selected" : "" %>>3 Month</option>
                    <option value="6month" <%= rs.getString("packages").equals("6 Month") ? "selected" : "" %>>6 Month</option>
                    <option value="1year" <%= rs.getString("packages").equals("1 Year") ? "selected" : "" %>>1 Year</option>
                </select>
                </td>
                
                <td>Registered By</td>
                <td><input type="text" value= "<%= rs.getString("registeredby") %>"name="registeredby" id="registeredby" readonly required></td>
                 
            </tr>
            <tr>
                <td>Occupation</td>
                <td><input type="text" name="occupation" id="occupation" value="<%=rs.getString("occupation") %>"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td colspan="4"><textarea id="address" name="address" rows="3" cols="23"  required><%= rs.getString("address") %></textarea></td>
            </tr>
            <tr>
            <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td colspan="5"><input type="submit" value="UPDATE"></td>
            </tr>
            </table>
        </form>
	</div>
	 <footer>
    <p>&copy; 2024 BodyGarage Gym. All rights reserved.</p>
</footer>
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<%
}
} catch (SQLException e) {
	    e.printStackTrace(); // Handle the exception appropriately
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	} finally {
	    // Close resources in finally block
	    try {
	        if (rs != null) {
	            rs.close();
	        }
	        if (pstmt != null) {
	            pstmt.close();
	        }
	        if (con != null) {
	            con.close();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}	%>
</body>
</html>