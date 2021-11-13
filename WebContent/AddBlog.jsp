<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html>
<html>
<head>
<title>Add Blog</title>
<style>
form {
  margin: 0 auto;
  width: 400px;
  padding: 1em;
  border: 1px solid #CCC;
  border-radius: 1em;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

form li + li {
  margin-top: 1em;
}

label {
  display: inline-block;
  width: 90px;
  text-align: right;
}

input, 
textarea {
  font: 1em sans-serif;
  width: 300px;
  box-sizing: border-box;
  border: 1px solid #999;
}

input:focus, 
textarea:focus {
  border-color: #000;
}

textarea {
  vertical-align: top;
  height: 20em;
}

.button {
  padding-left: 90px;
}

button {
  margin-left: .5em;
}
</style>
</head>
<body>
<form action="AddB" method="post"> 
 <ul>
  <li>
    <label>Blog Name:</label>
    <input type="text"  name="bname" />
  </li>
  <li>
    <label>Blog Category:</label>
    <input type="text"  name="bcat" />
  </li>
  <li>
    <label>Blog :</label>
    <textarea name="binfo"></textarea>
  </li>
   <li>
    <label>Add Image:</label>
    <input type="file" size="100" name="image"/>
  </li>
  <li><center>
    <input type="submit" name="Add" value="Add"/>
  </li>
  <li><center>
<button class="btn btn-primary" type="button" name="back" onclick="history.back()">back</button>
  </li>
</ul>
</form>
</body>
</html>