

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mdstservlet")
public class mdstservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement stmt=null;
	public void init() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cdetails", "root", "manager");
		}catch(Exception e) {System.out.println(e);}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String old=request.getParameter("osrname");
		String newu=request.getParameter("srname");
		String newp=request.getParameter("srpass");
		PrintWriter out=response.getWriter();
		int i;
		try{
			String query="Update stdetails SET stmail= ?,stpass = ? where stmail=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1,newu);
			stmt.setString(2, newp);
			stmt.setString(3, old);
			i=stmt.executeUpdate();
			if(i>0) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Details updated successfully');");
			out.println("location='srmonitor.jsp';");
			out.println("</script>");
			}
			else {
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Error user not found!!');");
				   out.println("location='srmonitor.jsp';");
				   out.println("</script>");
			}
		}catch(Exception e){
			System.out.println(e);
	}

	}
}
