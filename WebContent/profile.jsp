<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<% 
HttpSession s=request.getSession();
String un=s.getAttribute("uid").toString();
%>
<script type="text/javascript">
function edit(){
	window.location="passe.jsp";
}
function medit(){
	window.location="mobe.jsp";
}
</script>
<style>
.fa-edit:hover {
	
    color: red;
}
</style>
<body>
 <div class="header">
    <nav class="navbar navbar-light bg-light navbar-expand-md sticky-top">
        <a href="logc.jsp" class="nav-link"><i style="font-size:50px;" class="fa fa-arrow-circle-left"></i></a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapse_target">
        <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link text-info active h2" href="profile.jsp"><i class="fa fa-user"></i> My profile</a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-primary h5" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-user-circle" style="font-size:20px;"></i> <%= un%>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item text-primary h6" href="profile.jsp">View profile</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item text-primary h6" href="logout.jsp"><i class="fa fa-sign-out" style="font-size:20px;"></i> Logout</a>
        </div>
      </li>
    </ul>
</div>
</nav>
</div>
<%
Connection con=null;
Statement stmt=null;
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cdetails","root","manager");   	
}catch(Exception e){ System.out.println(e);}
stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT cmail,cpass,cphn from cldetails WHERE cmail='"+un+"'");
%>
<%
String cma="";
String cpa="";
String cph="";
while(rs.next()){
	cma=rs.getString("cmail");
	cpa=rs.getString("cpass");
	cph=rs.getString("cphn");
}
%>
<div class="container-fluid">
<div class="table-responsive">          
  <table class="table table-striped">
    <thead>
      <tr class="h5 bg-info text-white">
        <th>Mail</th>
        <th>Password</th>
        <th>Mobile</th>
      </tr>
    </thead>
    <tbody>
      <tr class="h6">
        <td><%= cma%></td>
        <td><%= cpa%>&emsp;<span onclick="edit()"><i style="font-size:20px;" class="fa fa-edit"></i></span></td>
        <td><%= cph%>&emsp;<span onclick="medit()"><i style="font-size:20px;" class="fa fa-edit"></i></span></td>
      </tr>
    </tbody>
  </table>
  </div>
</div>
</body>
</html>