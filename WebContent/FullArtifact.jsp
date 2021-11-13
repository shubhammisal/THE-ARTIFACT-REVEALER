<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ar.GetCon.*"%>
      <%@page import="java.util.*"%>
      <%@page import="java.sql.*"%>
      <%@page import="java.lang.*"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>The Artifact Revealer!</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

</head>
<body>
     <%
     String ano =request.getParameter("ar");
		  int n=Integer.parseInt(ano.trim());
    String get="select arno,arname,arcat,arby,ardesc from artifact where arno=?";
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	con=DbConnection.getConnection();
	 ps=con.prepareStatement(get);
	 ps.setInt(1,n);
	 rs=ps.executeQuery();
	 while(rs.next()){
		 String name=rs.getString(2);
	     String cat=rs.getString(3);
	     String by=rs.getString(4);
	     String desc=rs.getString(5);
	 
     %>
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Post Content Column -->
      <div>

        <!-- Title -->
        <h1 class="mt-4"><%=name %></h1>

        <!-- Author -->
        <p class="lead">
          written by <%=by %>
        </p>

        <hr>

        <!-- Date/Time -->
        <p> <%=cat %></p>

        <hr>

        <!-- Preview Image -->
        <img class="img-fluid" src="./aimg?id=<%=ano %>" alt="">

        <hr>

        <!-- Post Content -->
        <p class="lead">
        <%=desc %>
        </p>

        <hr>
        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
           <button class="btn btn-primary" type="button" name="back" onclick="history.back()">back</button>
          </li>
        </ul>
        </div>
        
    </div>
    <!-- /.row -->
  <%} %>
  </div>
  <!-- /.container -->
   
</body>
</html>