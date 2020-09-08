<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add-supervisor</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
i:hover {
    color: red;
}
.card{
background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
}
</style>
<script>
  function myfunction(){
    var p=document.getElementById("pwd").value;
    var cp=document.getElementById("cpwd").value;
    if(p==cp){
      document.getElementById("msg").style.color="green";
      document.getElementById("msg").innerHTML="passwords matched";
      }
    else{
    	document.getElementById("msg").style.color="red";
    	document.getElementById("msg").innerHTML="passwords must  match";
    	}
  }
</script>
<% 
HttpSession s=request.getSession();
String un=s.getAttribute("uid").toString();
%>
<body>
<div class="header">
    <nav class="navbar navbar-light bg-light navbar-expand-md sticky-top">
        <a href="srmonitor.jsp" class="navbar-brand h5 text-dark"><i class="fa fa-home"></i> Supervisor-Home</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapse_target">
        <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link text-muted h5" href="asupervisor.jsp"><i class="fa fa-plus"></i> Add new Supervisor</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active h5" href="astaff.jsp"><i class="fa fa-plus"></i> Add new Staff-Modify</a>
        </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-info h5" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <%= un%>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item text-info h6" href="stprofile.jsp"><i class="fa fa-user-circle" style="font-size:20px;"></i> View profile</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item text-info h6" href="logout.jsp"><i class="fa fa-sign-out" style="font-size:20px;"></i> Logout</a>
        </div>
      </li>
    </ul>
</div>
</nav>
</div>
<div class="container-fluid">
<br><br>&emsp;
<a class="btn border border-primary" data-toggle="collapse" href="#cmplt"><i class="fa fa-eye"></i>&emsp;Show current users</a>
<a class="btn border border-primary" data-toggle="collapse" href="#cmplt1"><i class="fa fa-edit"></i>&emsp;Update current users</a>
<a class="btn border border-primary" data-toggle="collapse" href="#cmplt2"><i class="fa fa-trash"></i>&emsp;Delete current users</a>     
   <div class="form-group collapse" id="cmplt">
   <fieldset class="jumbotron bg-transparent" style="border: 5px solid grey;">
<legend>Staff details</legend>
<%
Connection con=null;
Statement stmt=null;
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cdetails","root","manager");   	
}catch(Exception e){ System.out.println(e);}
stmt=con.createStatement();%>
<%
ResultSet rsb1=stmt.executeQuery("SELECT * from stdetails");
 if (rsb1.next() == false) {%>
<p class="h3 text-warning">No registered users found</p>
<% } else{%>
<p class="h5 text-primary">Registered user Details</p>
<table class="table table-striped table-responsive" id="tableMain">
<tr class="text-secondary bg-white h5">
		<th>User Name</th>
		<th>Password</th>
      </tr>
<% do{%>
<tr class="text-muted h5">
<td><%= rsb1.getString("stmail") %></td>
<td><%= rsb1.getString("stpass") %></td>
</tr>
<% }while(rsb1.next()); %>
</table>
 <%} %>   
</fieldset>
</div>
<div class="form-group collapse" id="cmplt1">
   <fieldset class="jumbotron bg-transparent" style="border: 5px solid grey;">
  <legend class="h4 text-primary">Update staff users</legend>
    <div class="alert alert-primary alert-dismissible fade show sticky-top" role="alert">
 Please check existing user details in the show current users tab!!
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
  <form action="./mdstservlet" method="post" class="jumbotron bg-transparent" style="border:1px solid blue;border-radius:20px;">
    <div class="col-sm-6 mb-3 mb-sm-0">
      <label class="h5 text-primary" for="email">Old Email Address:</label>
      <input name="osrname" type="email" autocomplete="off" placeholder="old e-mail" class="form-control" id="email" required>
    </div><br>
    <div class="col-sm-6 mb-3 mb-sm-0">
      <label class="h5 text-primary" for="email">New Email Address:</label>
      <input name="srname" type="email" autocomplete="off" placeholder="e-mail" class="form-control" id="email" required>
    </div><br>
    <div class="col-sm-6 mb-3 mb-sm-0">
      <label class="h5 text-primary" for="pwd">New Password:</label>
      <input name="srpass" type="password" autocomplete="off" placeholder="password" class="form-control" id="pwd" required>
    </div><br>
    <div class="col-sm-6 mb-3 mb-sm-0">
      <label class="h5 text-primary" for="cpwd">Confirm New Password:</label>
      <input oninput="myfunction()" type="password" autocomplete="off" placeholder="confirm password" class="form-control c_password" id="cpwd" required>
    </div><br>
    <p class="h5" id="msg"></p><br>
    <button id="sbt" type="submit" class="btn btn-primary col-sm-3 mb-5 mb-sm-0" style="padding: 15px;">Update</button> 
    <button type="reset" class="btn btn-danger col-sm-3 mb-5 mb-sm-0" style="padding: 15px;">Clear</button>
  </form>
</fieldset>
   </div>
   <div class="form-group collapse" id="cmplt2">
   <br>
   <form action="./dstservlet" method="post" class="jumbotron bg-transparent" style="border:1px solid blue;border-radius:20px;">
    <div class="col-sm-6 mb-3 mb-sm-0">
      <label class="h5 text-primary" for="email">User Email Address:</label>
      <input name="dsrname" type="email" autocomplete="off" placeholder="old e-mail" class="form-control" id="email" required>
    </div><br>
    <button id="sbt" type="submit" class="btn btn-primary col-sm-3 mb-5 mb-sm-0" style="padding: 15px;">Delete</button> 
    <button type="reset" class="btn btn-danger col-sm-3 mb-5 mb-sm-0" style="padding: 15px;">Clear</button>
    </form>
   </div>
</div>
</body>
</html>