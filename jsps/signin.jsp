<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>E-Diary SignIn</title>
    <style>
        body{
            background-image: url("bg.jpg");
        }
        a:hover{
            text-decoration: none;
        }
        .navbar{
            padding: 1% 5% 1% 5%;
        }
        .form{
            width:30%;
            background-color: white;
            margin-left: 37%;
            padding: 10px 10px 20px 10px;
            margin-top: 10%;
            margin-right: 40%;
            border-radius: 10px;
        }
        .buttons{
            margin-top: 5px;
            width: 100%;
        }
        .lead{
            align-content: center;
        }
    </style>
</head>
<body class="">
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.html">E-Diary</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
        <li class="nav-item active">
          <a class="nav-link" href="signin.jsp">Sign In</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup.jsp">Sign Up</a>
        </li>
      </ul>
    </div>
  </nav>
      <div  class="form">
          <div class="text-center" style="margin:5px 0px 10px 0px;">
            <h3 class="text-center">Sign In</h3>
          </div>
        <form action="signin" method="post">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Username</span>
                </div>
                <input type="text" class="form-control" name="username" required>
              </div>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Password</span>
                </div>
                <input type="password" class="form-control" name="passwd" required>
              </div>
              <button class="btn btn-outline-success buttons" type="submit">Sign In</button>
              <br>
              <input class="btn btn-outline-warning buttons" type="reset" value="Clear">
              <div class="text-center">
            <small style="text-transform: uppercase;">New to E-Diary? <a href="signup.jsp">Sign Up for free</a></small>
              </div>
              
        </form>
      </div>
    
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  
</body>
</html>