<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome</title>
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
<body>
<div class="header">
    <nav class="navbar navbar-light bg-light navbar-expand-md sticky-top">
        <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapse_target">
        <ul class="navbar-nav">
        
        <li class="nav-item">
            <a class="nav-link active h5" href="#"><i class="fa fa-calendar fa-2x text-gray-300"></i> Earnings-Description</a>
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
<%
Connection con=null;
Statement stmt=null;
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cdetails","root","manager");   	
}catch(Exception e){ System.out.println(e);}
stmt=con.createStatement();
%>
<%
int c=0;
String qf1="select sum(price) from bspacesf1";
stmt=con.prepareStatement(qf1);
ResultSet p1=stmt.executeQuery(qf1);
while(p1.next()){
	c=Integer.parseInt(p1.getString("sum(price)"));
}
%>
<%
int c1=0;
String qf2="select sum(price) from bspacesf2";
stmt=con.prepareStatement(qf1);
ResultSet p2=stmt.executeQuery(qf1);
while(p2.next()){
	c1=Integer.parseInt(p2.getString("sum(price)"));
}
%>
<%
int c2=0;
String qf3="select sum(price) from bspacesf3";
stmt=con.prepareStatement(qf3);
ResultSet p3=stmt.executeQuery(qf3);
while(p3.next()){
	c2=Integer.parseInt(p3.getString("sum(price)"));
}
%>
<%
int c3=0;
String qf4="select sum(price) from bspacesf4";
stmt=con.prepareStatement(qf4);
ResultSet p4=stmt.executeQuery(qf4);
while(p4.next()){
	c3=Integer.parseInt(p4.getString("sum(price)"));
}
%>
<%
int c4=0;
String qf5="select sum(price) from bspacesf5";
stmt=con.prepareStatement(qf5);
ResultSet p5=stmt.executeQuery(qf5);
while(p5.next()){
	c4=Integer.parseInt(p5.getString("sum(price)"));
}
%>
<%
int c5=0;
String qf6="select sum(price) from bspacesf6";
stmt=con.prepareStatement(qf1);
ResultSet p6=stmt.executeQuery(qf1);
while(p6.next()){
	c5=Integer.parseInt(p6.getString("sum(price)"));
}
%>
<div class="container-fluid">
<p class="h3 text-primary text-center">Earnings Description</p>
<div class="table-responsive">        
  <table class="table table-striped">
<tr class="text-primary bg-white h5">
		<th>Floor Number</th>
        <th>Earnings</th>
      </tr>
<tr class="text-muted h5">
<td>Floor 1</td>
<td><%= c%></td>
</tr>
<tr class="text-muted h5">
<td>Floor 2</td>
<td><%= c1%></td>
</tr>
<tr class="text-muted h5">
<td>Floor 3</td>
<td><%= c2%></td>
</tr>
<tr class="text-muted h5">
<td>Floor 4</td>
<td><%= c3%></td>
</tr>
<tr class="text-muted h5">
<td>Floor 5</td>
<td><%= c4%></td>
</tr>
<tr class="text-muted h5">
<td>Floor 6</td>
<td><%= c5%></td>
</tr>
<tr class="text-primary h5">
<td>Total</td>
<td><%= c+c1+c2+c3+c4+c5%></td>
</tr>
      </table>
      </div>
      </div>
</body>
</html>