<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BodyGarage Gym</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
     <link rel="stylesheet" href="styles.css">
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 2px;
        }
        .container > form,
        .container > table {
            width: 100%;
            margin-bottom: 5px;
        }
        .container table {
            border-collapse: collapse;
            height: 200px;
            overflow-y: auto;
        }
        .container th, .container td {
            border: 1px solid black;
            padding: 2px;
            text-align: left;
        }
        .container th {
            background-color: #f2f2f2;
            text-align: center;
        }
        .modify-links a {
            margin-right: 10px;
        }
        body {
            margin-bottom: 90px; /* Adjust as needed */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">BodyGarage Gym</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="homepage.jsp">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<br>
<br>
<br>

<div class="container" align="center">
    <% Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bodygarage?user=root&password=root");

        String registeredby = request.getParameter("username");
        String str = "SELECT * FROM custdetails WHERE registeredby = ?";
        PreparedStatement pst = con.prepareStatement(str);
        pst.setString(1, registeredby);
        ResultSet rs = pst.executeQuery();
    %>

    <form action="Customerentryform.jsp?registeredby=<%= registeredby %>" method="post">
        <input type="submit" class="submit-btn" value="New customer registration">
    </form>
    <br>
    <br>
    <table id="customerTable" class="display">
        <thead>
            <tr>
                <th>N0</th>
                <th>Name</th>
                <th>Gender</th>
                <th>DOJ</th>
                <th>Age</th>
                <th>Package</th>
                <th>Height</th>
                <th>Weight</th>
                <th>BMI</th>
                <th>Ph No</th>
                <th>Reg By</th>
                <th>Modify</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><a href="custfulldetails.jsp?custno=<%= rs.getInt("custno") %>"><%= rs.getString("custno") %></a></td>
                    <td><%= rs.getString("custname") %></td>
                    <td><%= rs.getString("gender") %></td>
                    <td><%= rs.getString("doj") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("packages") %></td>
                    <td><%= rs.getInt("height") %></td>
                    <td><%= rs.getInt("weight") %></td>
                    <td><%= rs.getDouble("bmi") %></td>
                    <td><%= rs.getLong("phno") %></td>
                    <td><%= rs.getString("registeredby") %></td>
                    <td class="modify-links">
                        <a href="custeditform.jsp?custno=<%= rs.getInt("custno") %>" >Edit</a>
                        <a href="custdeleteServlet?custno=<%= rs.getInt("custno") %>&registeredby=<%=rs.getString("registeredby") %>">Delete</a>
                    </td>
                </tr>
            <% }
            rs.close();
        } catch (Exception e) {
            // Handle exceptions here
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        %>
    </tbody>
</table>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script>
    $(document).ready(function() {
        $('#customerTable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true
        });
    });
</script>

</body>
<!-- Footer -->
<footer>
    <p>&copy; 2024 BodyGarage Gym. All rights reserved.</p>
</footer>
</html>
