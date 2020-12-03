import java.io.*; 
import javax.servlet.*; 
import javax.servlet.http.*;
import java.sql.*; 
  
public class diary extends HttpServlet { 
  
    public void init()throws ServletException{

    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) 
        throws ServletException, IOException
    { 
  
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username="",content,dt;
        username = request.getParameter("username");
        content=request.getParameter("content");
        dt=request.getParameter("dt");

            Connection con = null;
            try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://SG-ediary-3482-master.servers.mongodirector.com:3306/ediary?useSSL=true&verifyServerCertificate=false","advjava", "AdvanceJava@123");
        try {

            java.sql.Statement stmt=con.createStatement();  
            int res = stmt.executeUpdate("insert into dcontent values('"+dt+"','"+username+"','"+request.getParameter("content")+"');");
            RequestDispatcher rd = request.getRequestDispatcher("/diary.jsp");
            rd.forward(request, response);
    
            } catch (Exception e) {
            
            // TODO: handle exception
            }
        finally {
            con.close();
        }
            }
            catch (Exception e) {
            out.println("Error<br>" + e );
            //   out.println("hello"+ e );

        } 
            

        //   
      
    } 

    public void destroy(){

    }
}