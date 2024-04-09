<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<body>
<br>
<br>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> <!-- Make navbar fixed -->
  <a class="navbar-brand" href="#">BodyGarage Gym</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="bghome.jsp"> Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-item active" href="#">  About Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> Services</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#adminLoginModal"> Admin Login</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Admin Login Modal -->
<div class="modal fade" id="adminLoginModal" tabindex="-1" role="dialog" aria-labelledby="adminLoginModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="adminLoginModalLabel">Admin Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Admin login form -->
        <form action="LoginServlet" method="post">
          <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          </div>
          <button type="submit" class="btn btn-primary">Login</button>
        </form>
      </div>
    </div>
  </div>
</div>
<br>
<br>
<div class="container">
    <h2>Welcome to BodyGarage Gym</h2>
    "Gym services offer individuals a dedicated space equipped with various fitness machines and equipment for workouts. They provide a range of options including cardio machines like treadmills and stationary bikes, strength training equipment such as free weights and weight machines, and often group exercise classes. Gyms are places where people can work on their physical health, improve strength, flexibility, and cardiovascular fitness under the guidance of trained professionals or independently.

Gyms offer:
<br><br>
<h6>Personal Training:</h6>
 One-on-one sessions with fitness experts who tailor workouts to individual needs, providing personalized guidance and motivation.<br>

<h6>Competition Training:</h6><br> Specialized programs for athletes preparing for competitions, whether in sports, bodybuilding, or other competitive events.
<br>
<h6>Stress Relief:</h6><br> Gyms serve as spaces for stress relief through exercise, with activities like yoga, Pilates, or meditation classes promoting mental well-being.
<br>
<h6>Body Shaping:</h6><br> Programs designed to help individuals achieve specific body shaping goals, whether it's toning, muscle building, or weight loss.
<br>
These additional services cater to diverse fitness goals, offering a comprehensive approach to health and wellness within a supportive gym community."</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 BodyGarage Gym. All rights reserved.</p>
</footer>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
