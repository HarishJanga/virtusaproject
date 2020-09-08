<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Complaints</title>
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
<%
Connection con=null;
Statement stmt=null;
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cdetails","root","manager");   	
}catch(Exception e){ System.out.println(e);}
stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * from complaints");
%>
<body>
<div class="header">
    <nav class="navbar navbar-light bg-light navbar-expand-md sticky-top">
        <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapse_target">
        <ul class="navbar-nav">
        
        <li class="nav-item">
            <a class="nav-link active h5" href="contact.html"><i class="fa fa-comments fa-2x text-gray-300"></i> Complaint-requests</a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
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
<div class="container-fluid">
<p class="h3 text-primary text-center">Requests list</p>
<div class="table-responsive">        
  <table class="table table-striped">
<tr class="text-primary bg-white h5">
		<th>Customer mail</th>
        <th>Shop type</th>
        <th>Complaint</th>
      </tr>
<%
while (rs.next()) {
%>
<tr class="text-muted h5" style="font-size:20px;">
<td><%= rs.getString("cmail") %></td>
<td><%= rs.getString("shoptype")%></td>
<td><%= rs.getString("complaint")%></td>
</tr>
<% } %>
</table>
</div>
</div>
</body>
</html>