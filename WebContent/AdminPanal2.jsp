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

  <title>Admin Panal</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

</head>
<body>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand">Admin Panal</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item act!ive">
            <a class="nav-link" href="#">Artifacts
            <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Adminpanal1.jsp">Blog</a>
            <span class="sr-only">(current)</span>
          </li>
          <
          
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

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-10">

        <h1 class="my-4">Artifacts
          <small></small>
        </h1>
        <table border="2">
    <tr><th>Artifact id</th><th>Artifact Name</th><th>Artifact BY</th><th></th></tr>
        <% for(int i=0;i<list.size();i++){ 
            Artifactdto dt=list.get(i);
            int ano=dt.getAno();
            String aname=dt.getArname();
            String arcat=dt.getArcat();
            String arby=dt.getArby();
            String ardesc=dt.getArdesc();
           %>
    
    <tr><td><%=ano %></td><td><%=aname %></td><td><%=arby %></td><td><a href="deleteArtifact?bid=<%=ano%>">Delete</a></td></tr>
   
  
  <%} %>
  </table><br><br>
  </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
  </div>
  
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"></p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>