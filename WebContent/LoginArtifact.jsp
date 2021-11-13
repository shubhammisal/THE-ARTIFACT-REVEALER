<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ar.ArtifactData.*"%>
      <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>The Artifact Revealer!</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

</head>
<body><% session = request.getSession(); %>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand">The Artifact Revealer!</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item act!ive">
            <a class="nav-link" href="LoginHome.jsp">Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LoginBlog.jsp">Blog</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Artifacts</a>
            <span class="sr-only">(current)</span>
          </li>
         <li class="nav-item">
            <a class="nav-link" href="AddBlog.jsp">Write a Blog</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="AddArtifact.jsp">Write about Artifact</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Logout">Log Out</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" ><%=session.getAttribute("fname") %></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
    <%
    Artifactdao ardao=new Artifactdao();
	List <Artifactdto> list=ardao.getData();
  %>
  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
      <h1 class="my-4">Artifacts...
      </h1>
  <%
  for(int i=list.size()-1;i>=0;i--){ 
     Artifactdto dt=list.get(i);
     int ano=dt.getAno();
     String aname=dt.getArname();
     String arcat=dt.getArcat();
     String arby=dt.getArby();
     String ardesc=dt.getArdesc();
  %>
  <!-- Project One -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="./aimg?id=<%=ano %>" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3><%=aname %></h3>
          <p><%=ardesc %></p>
          <a class="btn btn-primary" href="./FullArtifact.jsp?ar=<%=ano %>">View Full</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>
  <%} %>
   </div>
    <!-- /.container -->
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"></p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>