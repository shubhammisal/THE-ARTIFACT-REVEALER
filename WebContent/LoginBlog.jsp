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
            <a class="nav-link" href="#">Blog</a>
            <span class="sr-only">(current)</span>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LoginArtifact.jsp">Artifacts</a>
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
        <% for(int i=list.size()-1;i>=0;i--){ 
              Blogdto bd=list.get(i);
              int bid=bd.getBid();
              String bname=bd.getBname();
              String bby=bd.getBby();
              Date bdate=bd.getBdate();
              String bcat=bd.getBcat();
              String bdesc=bd.getBdesc(); 
           %>
    <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="./bimg?id=<%=bid%>" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title"><%=bname %></h2>
            <p class="card-text"><%=bdesc %></p>
          </div>
          <div class="card-footer text-muted">
            Posted on <%=bdate %> by <%=bby %>
          </div>
        </div>
     <% } %>
   </div>
  
  </div>
    <!-- /.row -->
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