<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ar.BlogData.Blogdto"%>
    <%@page import="com.ar.BlogData.Blogdao"%>
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
            <a class="nav-link" href="AdminPanal2.jsp">Artifacts
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Blog</a>
            <span class="sr-only">(current)</span>
          </li>
          <
          
        </ul>
      </div>
    </div>
  </nav>
  <%
    Blogdao blogdao=new Blogdao();
	List <Blogdto> list=blogdao.getData();
  %>
  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-10">

        <h1 class="my-4">Blogs
          <small></small>
        </h1>
        <table border="2">
    <tr><th>Blog id</th><th>Blog Name</th><th>Blog BY</th><th>Blog Date</th><th></th></tr>
        <% for(int i=0;i<list.size();i++){ 
              Blogdto bd=list.get(i);
              int bid=bd.getBid();
              String bname=bd.getBname();
              String bby=bd.getBby();
              Date bdate=bd.getBdate();
           %>
    
    <tr><td><%=bid %></td><td><%=bname %></td><td><%=bby %></td><td><%=bdate %></td><td><a href="deleteblg?bid=<%=bid %>">Delete</a></td></tr>
   
  
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