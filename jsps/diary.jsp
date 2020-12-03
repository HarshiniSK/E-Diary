<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Today's Diary</title>
    
    <style>
        body{
            background-image: url("bg2.jpg");
            background-size: cover;
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
            margin-top: 5%;
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
        .maincontent {
        padding-left: 20%;
        padding-right: 20%;
        padding-top: 5%;
      }
      .card {
        margin-bottom: 5%;
        width: 100%;
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
        <li class="nav-item">
          <a class="nav-link" href="index.html">Sign Out</a>    
        </li>
      </ul>
    </div>
  </nav>
      <div  class="form">
          <div class="text-center" style="margin:5px 0px 10px 0px;">
            <h3 class="text-center">Today</h3>
            
          </div>
        <form action="diary" method="post">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Date</span>
                </div>
                <input type="text" class="form-control" name="dt" required>
              </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Content</span>
                </div>
                <textarea name="content" class="form-control" rows="10" cols="10" required></textarea>
              </div>
     
              <button class="btn btn-outline-success buttons" type="submit">Done for the day</button>
              <input class="btn btn-outline-warning buttons" type="reset" value="Clear">
              <div class="text-center">
            <small style="text-transform: uppercase;">scroll down to view previous</small>
              </div>
              
        <%@ page import = "java.sql.*" %>
        <%@ page import = "javax.http.*" %>
        <%@ page import = "javax.http.servlet.*" %>
        <%
        
        String username="",content,dt;
        username = request.getParameter("username");
              out.println("<input type='text' name='username' hidden value="+username+">");
                out.println("</form></div>");
                out.println("<div class='row maincontent'>");
                Connection con = null;
                Connection con2 = null;
                Connection con3 = null;
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://SG-ediary-3482-master.servers.mongodirector.com:3306/ediary?useSSL=true&verifyServerCertificate=false","advjava", "AdvanceJava@123");
                try{
                    java.sql.Statement stmt=con.createStatement();  
                    String q = "select count(*) from dcontent where username = "+'"'+username+'"'+";";
                    ResultSet rs = stmt.executeQuery(q);
                    int count = 0;
                    while(rs.next()){
                        count = rs.getInt(1);
                    }

                    String dates[] = new String[count];
                    String contents[] = new String[count];
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con2 = DriverManager.getConnection("jdbc:mysql://SG-ediary-3482-master.servers.mongodirector.com:3306/ediary?useSSL=true&verifyServerCertificate=false","advjava", "AdvanceJava@123");
                    java.sql.Statement stmt2=con2.createStatement();
                    String q2 = "select dt,content from dcontent where username = "+'"'+username+'"'+";";
                    ResultSet rs2=stmt2.executeQuery(q2);
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con3 = DriverManager.getConnection("jdbc:mysql://SG-ediary-3482-master.servers.mongodirector.com:3306/ediary?useSSL=true&verifyServerCertificate=false","advjava", "AdvanceJava@123");
                    java.sql.Statement stmt3 = con3.createStatement();
                    String q3 = "select dname from login where username = "+'"'+username+'"'+";";
                    ResultSet rs3 = stmt3.executeQuery(q3);
                    String dname = "";
                    while(rs3.next()){
                        dname = rs3.getString(1);
                    }
                    int i = 0;
                    while(rs2.next()){
                        dates[i] = rs2.getString(1);
                        contents[i] = rs2.getString(2);
                        i++;
                    }
                    if(count == 0){
                        out.println("<div style='padding: 5% 5% 5% 2%'>"+"<p style='color: aliceblue;' class='display-4'>You are yet to start!</p>"+"</div>");
                    }
                    else{
                        if(count == 1 && dates[0].equals("null") && contents[0].equals("null")){
                          out.println("<div style='padding: 5% 5% 5% 2%'>"+"<p style='color: aliceblue;' class='display-4'>You are yet to start!</p>"+"</div>");
                        }
                        else{
                        for(i = count-1; i >= 0; i--){
                            if(dates[i].equals("null") && contents[i].equals("null")){}
                            else{
                            out.println("<div class='col-sm-12'>");
                            out.println("<div class='card'>");
                            out.println("<div class='card-body'>");
                            out.println("<h5 class='card-title'>"+dates[i]+"</h5>");
                            out.println("<h6 class='card-subtitle mb-2 text-muted'>Dear "+dname+"</h6>");
                            out.println("<p class='card-text'>"+contents[i]+"</p>");
                            out.println("</div></div></div>");
                        }  } } 
                    }

                }catch(Exception e){
                  RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
                  rd.forward(request, response);
                }finally{
                    // con.close();
                    out.println("</div>");
                }


            }catch (Exception e){
              RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
              rd.forward(request, response);
            }
            finally{
                // con.close();
            }

        %>
      
      


      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  
</body>
</html>
