import java.io.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;

public class signin extends HttpServlet { 
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    { 
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String passwd = request.getParameter("passwd");

        try {
            out.println("<html><body>");
            out.println("<p>Trying to login...</p>");  
    		Connection con = null;
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://SG-ediary-3482-master.servers.mongodirector.com:3306/ediary?useSSL=true&verifyServerCertificate=false","advjava", "AdvanceJava@123");
            out.println("<p>Trying to login...123</p>");
            try {
                String u = "";
                String p = "";
                boolean flag = false;
        		java.sql.Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from login where username = '"+username+"';");
                while(rs.next()){
                    u = rs.getString(1);
                    p = rs.getString(2);
                    if(u.equals(username) && p.equals(passwd)){
                        out.println("<p>Logged In as "+username+"</p>");
                        flag = true;
                        break;
                    }
                    else{
                        if(u.equals(username)){
                            if(!p.equals(passwd)){
                                flag = false;
                                RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
                                rd.forward(request, response);
                                break;
                            }
                        }
                    }
                }
                if(flag){
                    RequestDispatcher rd = request.getRequestDispatcher("/diary.jsp");
                    rd.forward(request, response);
                }
                
                
        			
			} catch (Exception e) {
                // TODO: handle exception
                    RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
                    rd.forward(request, response);
			}
    		finally {
                out.println("</body></html>");
				con.close();
			}
		} catch (Exception e) {
            // TODO: handle exception
            RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
            rd.forward(request, response);
		}
    }               
}