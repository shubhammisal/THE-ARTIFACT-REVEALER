<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
   <link href="css/modern-business.css" rel="stylesheet">
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
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LoginBlog.jsp">Blog</a>
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
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('Images/pic2.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h1>Artifact Revealer</h1>
            <p>Learn interesting facts about Artifact Explore Search Upload</p>
          </div>
        </div>  
      </div>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">

    <h1 class="my-4" align="center">What is Archaeology</h1>
    <p>Archaeology is the study of human activity through the recovery and analysis of material culture. The archaeological record consists of artifacts, architecture, biofacts or ecofacts and cultural landscapes. </p>


         <div class="row mt-5 card-section">
    <div class="col-4 col-one">
      <div class="card" >
  <img src="Images/col1.PNG" class="card-img-top" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Stone Spheres</h5>
    <p class="card-text">Stone Spheres known as Las Bolas (The Balls) are scattered throughout the Diquis Delta of southern Costa Rica. They were the works of a pre-Columbian civilization, and are mostly made from a rock that forms from molten magma.</p>
  
  </div>
</div>
    </div><!-- Col 1 ends -->
    <div class="col-4 col-two">
      <div class="card" >
  <img src="Images/col2.PNG" class="card-img-top" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Ancient Light Bulb</h5>
    <p class="card-text">Beneath the Temple of Hathor at Dendera, Egypt is a sculpture depicting figures standing around a large, light-bulb like object. Erich Von Daniken, author of Chariot of the Gods created a working model of the bulb.</p>
    
  </div>
</div>
    </div><!-- Col 2 ends -->
    <div class="col-4  col-three">
      <div class="card">
  <img src="Images/col3.PNG" class="card-img-top" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Bird Shaped Artifact </h5>
    <p class="card-text">In 1898, a bird-shaped artifact made of sycamore wood was discovered during the excavation of the Pa-di-Imen tomb in Saqqara, Egypt.  It dates back to somewhere around 200 BC, and weighs just under 40 grams.</p>
   
  </div>
</div>
    </div>
  </div>
     
   </div>
    <!-- /.row -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"></p>
    </div>
    <!-- /.container -->
  </footer>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>