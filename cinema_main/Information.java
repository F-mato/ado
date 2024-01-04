

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
 * Servlet implementation class information
 */
@WebServlet("/Information")
public class Information extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append("Served at:/cinema/Information").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String kana = request.getParameter("kana");
		Object memberId =  session.getAttribute("session_memberId");
		String pass = request.getParameter("pass");
		String tel = request.getParameter("tel");
		String mail = request.getParameter("mail");
		String address = request.getParameter("address");
		String postNum = request.getParameter("postNum");
		
		
		try 
		{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/reserve", "postgres", "pass67");
			
			System.out.println(memberId);
			
			PreparedStatement ps = con.prepareStatement("update membertable set name = ?, kana = ?, pass = ?, tel = ?, mail = ?, address = ?, postnum = ? where memberId = ? ") ;

			ps.setString(1, name);
			ps.setString(2, kana);
			ps.setString(3, pass);
			ps.setString(4, tel);
			ps.setString(5, mail);
			ps.setString(6, address);
			ps.setString(7, postNum);
			ps.setObject(8, memberId);

			
			int count = ps.executeUpdate();
			if(count > 0)
			{
				response.setContentType("text/html");
				out.print("<h3 style='color:green'> User register successfully </h3>");
				
				
				session.setAttribute("session_name", request.getParameter("name"));
				
				RequestDispatcher rd = request.getRequestDispatcher("/mypage.jsp");
				rd.include(request, response);
			}
			else
			{
				response.setContentType("text/html");
				out.print("<h3 style='color:red'> Cannot complete changes </h3>");
				
				RequestDispatcher rd = request.getRequestDispatcher("/mypage.jsp");
				rd.include(request, response);
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
			response.setContentType("text/html");
			out.print("<h3 style='color:red'> Error </h3>");
			System.out.println(" Exception Occured"+e.getMessage());
			
			RequestDispatcher rd = request.getRequestDispatcher("/mypage.jsp");
			rd.include(request, response);
		}
		
	}

}

