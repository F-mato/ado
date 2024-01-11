

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





/**
 * Servlet implementation class Regform
 */
@WebServlet("/Regform")
public class Regform extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append("Served at:/cinema/Regform").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String userId = request.getParameter("userId");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String kana = request.getParameter("kana");
		String tel = request.getParameter("tel");
		String mail = request.getParameter("mail");
		String address = request.getParameter("address");
		String postNum = request.getParameter("postNum");
		String gender = request.getParameter("gender");
		
		try 
		{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/classic", "postgres", "admin");
			
			PreparedStatement ps = con.prepareStatement("insert into membertable(userid, pass, name, kana, tel, mail, address, postnum, gender) values(?, ?, ?, ?, ?, ?, ?, ?, ?)") ;
			ps.setString(1, userId);
			ps.setString(2, pass);
			ps.setString(3, name);
			ps.setString(4, kana);
			ps.setString(5, tel);
			ps.setString(6, mail);
			ps.setString(7, address);
			ps.setString(8, postNum);
			ps.setString(9, gender);
			
			int count = ps.executeUpdate();
			if(count > 0)
			{
				response.setContentType("text/html");
				out.print("<h3 style='color:green'> User register successfully </h3>");
				
				HttpSession session = request.getSession();
				session.setAttribute("session_name", request.getParameter("name"));
				
				RequestDispatcher rd = request.getRequestDispatcher("/welcome.jsp");
				rd.include(request, response);
			}
			else
			{
				response.setContentType("text/html");
				out.print("<h3 style='color:red'> User register error </h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
				rd.include(request, response);
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
			response.setContentType("text/html");
			out.print("<h3 style='color:red'> Exception Occured"+e.getMessage()+" </h3>");
			
			RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
			rd.include(request, response);
		}
		
	}

}
