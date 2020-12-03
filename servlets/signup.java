import java.io.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;


public class signup extends HttpServlet { 

    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    { 
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
try {
    String username = request.getParameter("username");
    String passwd = request.getParameter("passwd");
    String cpasswd = request.getParameter("cpasswd");
    String dname = request.getParameter("dname");
    out.println(username+"\n"+passwd+"\n"+dname+"\n"+cpasswd);
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://SG-ediary-3482-master.servers.mongodirector.com/ediary?useSSL=true&verifyServerCertificate=false","advjava", "AdvanceJava@123");
    try {
        if (passwd.equals(cpasswd) ){
            java.sql.Statement stmt=con.createStatement();  
            int a=stmt.executeUpdate("insert into login values('"+username+"' , '"+passwd+ "' , '" +dname+ "'); ");
            RequestDispatcher rd = request.getRequestDispatcher("/diary.jsp");
            rd.forward(request, response);
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
            rd.forward(request, response);
        }
    } catch (Exception e) {
        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
        rd.forward(request, response);
        // TODO: handle exception
    }
    finally {
        con.close();
    }
} catch (Exception e) {
    RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
    rd.forward(request, response);
    // TODO: handle exception
}   
        
    }
}