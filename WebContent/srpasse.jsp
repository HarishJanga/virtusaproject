<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdatePassword</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
body{
background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
}
form{
background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
}
.header{
font-size:20px;
}
</style>
<% 
HttpSession s=request.getSession();
String un=s.getAttribute("uid").toString();
%>
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
<body>
<div class="header">
    <nav class="navbar navbar-light bg-light navbar-expand-md sticky-top">
        <a href="#" class="navbar-brand h5 text-dark"><i class="fa fa-home"></i> Supervisor-Home</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapse_target">
        <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link text-muted h5" href="asupervisor.jsp"><i class="fa fa-plus"></i> Add new Supervisor</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-muted h5" href="astaff.jsp"><i class="fa fa-plus"></i> Add new Staff</a>
        </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-info h5" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <%= un%>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item text-info h6" href="srprofile.jsp"><i class="fa fa-user-circle" style="font-size:20px;"></i> View profile</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item text-info h6" href="logout.jsp"><i class="fa fa-sign-out" style="font-size:20px;"></i> Logout</a>
        </div>
      </li>
    </ul>
</div>
</nav>
</div>
<a href="srprofile.jsp" class="nav-link"><i style="font-size:50px;" class="fa fa-arrow-circle-left"></i></a>
<fieldset class="jumbotron bg-transparent" style="border: 4px solid grey;">
  <legend class="h4 text-primary">Update password</legend>
  <form action="./srpasseservlet" method="post" class="jumbotron bg-transparent border-primary" style="border-radius:20px;">
    <div class="form-group w-50">
      <label class="h5" for="pwd">New Password:</label>
      <input name="nupass" type="password" autocomplete="off" class="form-control" id="pwd" required>
    </div>
    <div class="form-group w-50">
      <label class="h5" for="cpwd">Confirm New Password:</label>
      <input oninput="myfunction()" name="cnupass" type="password" autocomplete="off" class="form-control c_password" id="cpwd" required>
    </div>
    <p class="h6" id="msg"></p>
    <button id="sbt" type="submit" class="btn btn-primary col-md-3" style="padding: 15px;">Update</button> 
    <button type="reset" class="btn btn-danger col-md-3" style="padding: 15px;">Clear</button>
  </form>
</fieldset>
</body>
</html>